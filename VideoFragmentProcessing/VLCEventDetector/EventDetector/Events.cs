using System;
using System.Linq;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Diagnostics;
using VideoFragmentData;
using System.Collections.Generic;
using LibVLC.NET;

namespace LibEventDetector
{
    public abstract class ImageContainer : ICloneable
    {
        protected const int Numerator = 4;

        public abstract object Clone();
        /// <summary>
        /// Compares two images.
        /// </summary>
        /// <param name="with">The object to compare with.</param>
        /// <returns>The number of inequal pixels.</returns>
        public abstract int CompareWith(ImageContainer with);
        /// <summary>
        /// Copies image from give source.
        /// </summary>
        /// <param name="from">The object to copy from.</param>
        public abstract void CopyFrom(ImageContainer from);

        protected abstract void BinarizeImage();

        public abstract int Width {get;}
        public abstract int Height {get;}
    }

    /// <summary>
    /// Class for optimized binarized bitmap operations.
    /// </summary>
    public class BitArrayContainer : ImageContainer
    {
        private byte[] _imageBits;
        private byte[] _buffer;
        private int _width;
        private int _height;
        private int _stride;
        /// <summary>
        /// Index - byte value,
        /// value - number of 1.
        /// </summary>
        public static byte[] bitNumbers = new byte[256];

        static BitArrayContainer()
        {
            for (var i = 0; i < bitNumbers.Length; i++)
            { 
                var mask = 1;
                byte ones = 0;
                for (var j = 0; j < 8; j++)
                {
                    if((mask & i) != 0) ones++;
                    mask <<= 1;
                }
                bitNumbers[i] = ones; 
            }
        }

        public byte[] ImageBits
        {
            get { return _imageBits; }
        }

        /// <summary>
        /// Constructor receives parameters as simple objects to simplify unit-testing.
        /// </summary>
        /// <param name="buffer">Image data as an array of pixel RGB-colors.</param>
        /// <param name="width">Image pixel width.</param>
        /// <param name="height">Image pixel height.</param>
        /// <param name="stride">Image row length in bytes.</param>
        public BitArrayContainer(byte[] buffer, int width, int height, int stride)
        {
            _buffer = buffer;
            _width = width;
            _height = height;
            _stride = stride;

            BinarizeImage();
        }

        public override object Clone()
        {
            throw new NotImplementedException("Not implemented yet.");
        }

        /// <summary>
        /// Creates _imageBits and saves binarized image.
        /// </summary>
        protected override void BinarizeImage()
        { 
            var width = _width;
            var height = _height;

            //  Width is assumed to be multiple of 8.
            //  If not, residual bits are dropped.
            _imageBits = new byte[width / 8 * height];
            byte mask = 0;
            byte maskPos = 0;
            int imagePos = 0;

            for (var j = 0; j < height; j++)
            {
                //  New line.
                mask = 0;
                maskPos = 0;

                for (var i = 0; i < width - width % 8; i++)
                {
                    var offset = j * _stride + i * 4;
                    int cImage = _buffer[offset] | (_buffer[offset + 1] << 8) | (_buffer[offset + 2] << 16);
                    //int cImage = _buffer[offset + 1] | (_buffer[offset + 1] << 8) | (_buffer[offset] << 16);
                    //  Multiplied brightness.
                    int br = cImage << 3;

                    //  Comparison with full range (with ratio Numerator / 8).
                    if (br > 0x00ffffff * Numerator)
                    {
                        //  White - sets 1 in corresponding position.
                        //  Order of bits does not matter until binarized image is rendered.
                        mask |= (byte)(1 << maskPos);
                    }
                    else
                    {
                        //  Black - does nothing.
                    }

                    maskPos++;
                    if (maskPos == 8)
                    {
                        maskPos = 0;
                        _imageBits[imagePos++] = mask;
                        mask = 0;
                    }
                }
            }
        }

        /// <summary>
        /// Not modified width of source image.
        /// </summary>
        public override int Width
        {
            get { return _width; }
        }

        /// <summary>
        /// Not modified height of source image.
        /// </summary>
        public override int Height
        {
            get { return _height; }
        }

        public override int CompareWith(ImageContainer with)
        {
            Debug.Assert(with.Width == Width);
            Debug.Assert(with.Height == Height);
            Debug.Assert(with as BitArrayContainer != null);

            int inequalPixelNumber = 0;
            var withBits = (with as BitArrayContainer).ImageBits;
            Debug.Assert(_imageBits.Length == _imageBits.Length);

            for (var i = 0; i < withBits.Length; i++)
            { 
                //  Compares two bytes and adds the number of different bits.
                inequalPixelNumber += bitNumbers[_imageBits[i] ^ withBits[i]];
            }
            return inequalPixelNumber;
        }

        public override void CopyFrom(ImageContainer from)
        {
            (from as BitArrayContainer).ImageBits.CopyTo(_imageBits, 0);
        }
    }

    /// <summary>
    /// Auxiliary class used in images comparison.
    /// </summary>
    public class WriteableBitmapContainer : ImageContainer
    {
        private readonly WriteableBitmap _writeableBitmap;
        public WriteableBitmap Bitmap { get { return _writeableBitmap; } }

        public WriteableBitmapContainer(WriteableBitmap bitmap) 
        { 
            _writeableBitmap = bitmap;
            BinarizeImage();
        }

        /// <summary>
        /// Disables bitmap updating.
        /// </summary>
        private void Lock() 
        {
            // Reserve the back buffer for updates.
            _writeableBitmap.Lock();
        }

        /// <summary>
        /// Enables bitmap updating.
        /// </summary>
        private void Unlock()
        {
            // Set up all surface for refreshing.
            _writeableBitmap.AddDirtyRect(new Int32Rect(0, 0, Width, Height));
            // Release the back buffer and make it available for display.
            _writeableBitmap.Unlock();
        }
        
        /// <summary>
        /// Gets color of pixel directly from the cashed bitmap buffer.
        /// </summary>
        /// <param name="x">Pixel X.</param>
        /// <param name="y">Pixel Y.</param>
        /// <param name="pBackBuffer">Cashed pointer to the back buffer.</param>
        /// <param name="backBufferStride">Cashed buffer stride.</param>
        /// <returns>Pixel color.</returns>
        public static int GetPixel(int x, int y, int pBackBuffer, int backBufferStride)
        {
            int color;
            unsafe
            {
                Debug.Assert(pBackBuffer != 0);
                // Finds the address of the pixel to draw.
                pBackBuffer += y * backBufferStride;
                pBackBuffer += x * 4;

                // Extract the pixel's color.
                color = *((int*)pBackBuffer);
            }
            return color;
        }

        private int _xForIteration;
        private int _yForIteration;
        private int _widthForIteration;
        private int _heightForIteration;
        private int _offsetForIteration;
        private IntPtr _ptrForIteration;

        public void StartPixelIteration()
        {
            _xForIteration = 0;
            _yForIteration = 0;
            _widthForIteration = _writeableBitmap.PixelWidth;
            _heightForIteration = _writeableBitmap.PixelHeight;
            _offsetForIteration = 0;
            _ptrForIteration = _writeableBitmap.BackBuffer;
        }

        /// <summary>
        /// Returns color of the pixel in iteration process.
        /// </summary>
        /// <returns>Returns -1 when the buffer overruns. Masks the resulted color!</returns>
        public int GetPixel()
        {
            int color;
            
            if (_yForIteration >= _heightForIteration) return -1;
            unsafe
            {
                // Find the address of the pixel to draw.
                // Extract the pixel's color.
                // The mask is necessary to avoid return of "-1".
                color = *((int*)((int)_ptrForIteration + _offsetForIteration)) & 0x00ffffff;
            }
            return color;
        }

        public void SetPixel(int color)
        {
            if (_yForIteration >= _heightForIteration) return;
            unsafe
            {
                *((int*)(_ptrForIteration + _offsetForIteration)) = color;
            }
        }

        public void MoveToNextPixel()
        {
            if (_yForIteration >= _heightForIteration) return;

            _xForIteration++;
            _offsetForIteration += 4;
            
            if (_xForIteration >= _widthForIteration)
            {
                _yForIteration++;
                _xForIteration = 0;
                _offsetForIteration = _yForIteration * _writeableBitmap.BackBufferStride;
            }
        }

        /// <summary>
        /// Sets color of pixel directly to cashed bitmap buffer.
        /// </summary>
        /// <param name="x">Pixel X.</param>
        /// <param name="y">Pixel Y.</param>
        /// <param name="color">New color of the pixel.</param>
        /// <param name="pBackBuffer">Cashed pointer to the back buffer.</param>
        /// <param name="backBufferStride">Cashed buffer stride.</param>
        public static void SetPixel(int x, int y, int color, int pBackBuffer, int backBufferStride) 
        {
            unsafe
            {
                Debug.Assert(pBackBuffer != 0);

                // Find the address of the pixel to draw.
                pBackBuffer += y * backBufferStride;
                pBackBuffer += x * 4;

                // Assign the color data to the pixel.
                *((int*)pBackBuffer) = color;
            }
        }

        public override int Width { get { return _writeableBitmap.PixelWidth; } }
        public override int Height { get { return _writeableBitmap.PixelHeight; } }

        public override object Clone()
        {
            return new WriteableBitmapContainer(_writeableBitmap.Clone());
        }

        /// <summary>
        /// Copies bitmap data from another bitmap.
        /// </summary>
        /// <param name="from"></param>
        public override void CopyFrom(ImageContainer from)
        {
            Lock();
            
            unsafe
            {
                // Gets a pointer to the back buffer for efficient access.
                int pBackBuffer = (int)Bitmap.BackBuffer;
                int backBufferStride = Bitmap.BackBufferStride;

                int pFromBackBuffer = (int)((WriteableBitmapContainer)from).Bitmap.BackBuffer;
                int fromBufferStride = ((WriteableBitmapContainer)from).Bitmap.BackBufferStride;

                for (int i = 0; i < ((WriteableBitmapContainer)from).Width; i++)
                    for (int j = 0; j < ((WriteableBitmapContainer)from).Height; j++)
                    {
                        int cImage = GetPixel(i, j, pFromBackBuffer, fromBufferStride);
                        SetPixel(i, j, cImage, pBackBuffer, backBufferStride);
                    }
            }
            
            Unlock();
        }

        public override int CompareWith(ImageContainer with)
        {
            int inequalPixelNumber = 0;

            Lock();

            unsafe
            {
                // Gets a pointer to the back buffer for efficient access.
                int pBackBuffer = (int)Bitmap.BackBuffer;
                int backBufferStride = Bitmap.BackBufferStride;

                int pWithBackBuffer = (int)((WriteableBitmapContainer)with).Bitmap.BackBuffer;
                int withBackBufferStride = ((WriteableBitmapContainer)with).Bitmap.BackBufferStride;

                for (int i = 0; i < Width; i++)
                    for (int j = 0; j < Height; j++)
                    {
                        int cImage = GetPixel(i, j, pBackBuffer, backBufferStride);
                        int cWith = GetPixel(i, j, pWithBackBuffer, withBackBufferStride);

                        if (cImage != cWith)
                            inequalPixelNumber++;
                    }
            }

            Unlock();

            return inequalPixelNumber;
        }

        protected override void BinarizeImage()
        {
            Lock();

            StartPixelIteration();
            while (true)
            {
                var cImage = GetPixel();

                //  The exit flag.
                if (cImage == -1) 
                    break;

                //  Multiplication by 8 to evaluate brightness.
                var br = cImage << 3;

                unchecked
                {
                    //  Comparison with full range (with ratio Numerator / 8).
                    if (br > 0x00ffffff * Numerator)
                    {
                        SetPixel((int)0xffffffff);  //  White
                    }
                    else
                    {
                        SetPixel((int)0xff000000);  //  Black
                    }
                }
                MoveToNextPixel();
            }

            Unlock();
        }
    }

    /// <summary>
    /// The base class for all event detectors.
    /// </summary>
    public abstract class BaseEventDetector
    {
        protected ImageContainer image;
        protected ImageContainer prevImage;
        protected VideoFragmentManifest manifest;

        public abstract bool EventOccured(ImageContainer img);

        public BaseEventDetector(VideoFragmentManifest _manifest, ImageContainer _prevImage)
        {
            Debug.Assert(_manifest != null);
            Debug.Assert(_prevImage != null);

            prevImage = _prevImage;
            manifest = _manifest;
            //  Cleans the event list.
            manifest.EventDetectorManifest.EventList = null;
        }
    }

    /// <summary>
    /// The motion event detector.
    /// </summary>
    public class MotionEventDetector : BaseEventDetector
    {
        private EventType _motion;
        private readonly double _sensitivity;
        //  This flag prevents comparison with an empty array (before copying).
        private bool _prevImageCopied = false;

        public double Sensitivity {
            get { return _sensitivity; }
        }
    
        public MotionEventDetector(VideoFragmentManifest manifest, ImageContainer prevImage, double sensitivity) : 
            base(manifest, prevImage)
        {
            _sensitivity = sensitivity;
        }

        public override bool EventOccured(ImageContainer img)
        {
            image = img;

            bool result = false;

            if (prevImage.Width == image.Width && prevImage.Height == image.Height && _prevImageCopied)
            {
                int inequalPixelNumber = prevImage.CompareWith(image);
                int totalPixelNumber = prevImage.Width * prevImage.Height;
                if ((double)inequalPixelNumber / (double)totalPixelNumber > Sensitivity)
                {
                    result = true;
                }
            }

            prevImage.CopyFrom(img);
            _prevImageCopied = true;

            if (result)
            {
                //  Motion event does not exist or not found yet.
                var ev = manifest.EventDetectorManifest.EventList;

                if (_motion == null)
                {
                    //  Scans event list for event of given type.
                    _motion = manifest.EventDetectorManifest.EventList != null
                                  ? (from e in manifest.EventDetectorManifest.EventList
                                     where e.Type == "motion"
                                     select e).First()
                                  : null;
                }

                if (_motion == null)
                {
                    //  Resizes event list to add new "motion".
                    manifest.EventDetectorManifest.EventList = new EventType[ev != null ? (ev.Length + 1) : 1];
                    //  Copies previous data if exist.
                    if (ev != null)
                        ev.CopyTo(manifest.EventDetectorManifest.EventList, 0);
                    //  Creates a new event.
                    _motion = new EventType() { Type = "motion", DateRangeFrom = DateTime.Now, DateRangeTo = DateTime.Now, Count = 1};
                    //  Adds event to the list.
                    manifest.EventDetectorManifest.EventList[manifest.EventDetectorManifest.EventList.Length - 1] =
                        _motion;

                }
                else
                {
                    //  Updates existing.
                    _motion.DateRangeTo = DateTime.Now;
                    _motion.Count++;
                }
            }
            return result;
        }
    }
}
