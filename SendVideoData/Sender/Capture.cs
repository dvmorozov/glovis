/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Runtime.InteropServices;
using System.Threading;
using System.Diagnostics;

using DirectShowLib;


namespace SendData
{
    /// <summary> Summary description for MainForm. </summary>
    internal class Capture : ISampleGrabberCB, IDisposable
    {
        #region Member variables

        /// <summary> graph builder interface. </summary>
        private IFilterGraph2 _mFilterGraph;
        private IMediaControl _mMediaCtrl;

        /// <summary> so we can wait for the async job to finish </summary>
        private ManualResetEvent _mPictureReady;

        /// <summary> Set by async routine when it captures an image </summary>
        private volatile bool _mBGotOne;

        /// <summary> Indicates the status of the graph </summary>
        private bool _mBRunning;

        /// <summary> Dimensions of the image, calculated once in constructor. </summary>
        private IntPtr _mHandle = IntPtr.Zero;
        private int _mVideoWidth;
        private int _mVideoHeight;
        private int _mStride;
        public int MDropped = 0;

        #endregion

        #region API

        [DllImport("Kernel32.dll", EntryPoint="RtlMoveMemory")]
        private static extern void CopyMemory(IntPtr destination, IntPtr source, int length);

        #endregion

        /// <summary> Use capture device zero, default frame rate and size</summary>
        public Capture()
        {
            _Capture(0, 0, 0, 0);
        }
        /// <summary> Use specified capture device, default frame rate and size</summary>
        public Capture(int iDeviceNum)
        {
            _Capture(iDeviceNum, 0, 0, 0);
        }
        /// <summary> Use specified capture device, specified frame rate and default size</summary>
        public Capture(int iDeviceNum, int iFrameRate)
        {
            _Capture(iDeviceNum, iFrameRate, 0, 0);
        }
        /// <summary> Use specified capture device, specified frame rate and size</summary>
        public Capture(int iDeviceNum, int iFrameRate, int iWidth, int iHeight)
        {
            _Capture(iDeviceNum, iFrameRate, iWidth, iHeight);
        }
        /// <summary> release everything. </summary>
        public void Dispose()
        {
            CloseInterfaces();
            if (_mPictureReady != null)
            {
                _mPictureReady.Close();
                _mPictureReady = null;
            }
        }
        // Destructor
        ~Capture()
        {
            Dispose();
        }

        public int Width
        {
            get
            {
                return _mVideoWidth;
            }
        }
        public int Height
        {
            get
            {
                return _mVideoHeight;
            }
        }
        public int Stride
        {
            get
            {
                return _mStride;
            }
        }
        /// <summary> capture the next image </summary>
        public IntPtr GetBitMap()
        {
            _mHandle = Marshal.AllocCoTaskMem(_mStride * _mVideoHeight);

            try
            {
                // get ready to wait for new image
                _mPictureReady.Reset();
                _mBGotOne = false;

                // If the graph hasn't been started, start it.
                Start();

                // Start waiting
                if ( ! _mPictureReady.WaitOne(5000, false) )
                {
                    throw new Exception("Timeout waiting to get picture");
                }
            }
            catch
            {
                Marshal.FreeCoTaskMem(_mHandle);
                throw;
            }

            // Got one
            return _mHandle;
        }
        // Start the capture graph
        public void Start()
        {
            if (_mBRunning) return;

            var hr = _mMediaCtrl.Run();
            DsError.ThrowExceptionForHR( hr );

            _mBRunning = true;
        }
        // Pause the capture graph.
        // Running the graph takes up a lot of resources.  Pause it when it
        // isn't needed.
        public void Pause()
        {
            if (!_mBRunning) return;

            var hr = _mMediaCtrl.Pause();
            DsError.ThrowExceptionForHR( hr );

            _mBRunning = false;
        }


        // Internal capture
        private void _Capture(int iDeviceNum, int iFrameRate, int iWidth, int iHeight)
        {
            // Get the collection of video devices
            var capDevices = DsDevice.GetDevicesOfCat( FilterCategory.VideoInputDevice );

            if (iDeviceNum + 1 > capDevices.Length)
            {
                throw new Exception("No video capture devices found at that index!");
            }

            try
            {
                // Set up the capture graph
                SetupGraph( capDevices[iDeviceNum], iFrameRate, iWidth, iHeight);

                // tell the callback to ignore new images
                _mPictureReady = new ManualResetEvent(false);
                _mBGotOne = true;
                _mBRunning = false;
            }
            catch
            {
                Dispose();
                throw;
            }
        }

        /// <summary> build the capture graph for grabber. </summary>
        private void SetupGraph(DsDevice dev, int iFrameRate, int iWidth, int iHeight)
        {
            ISampleGrabber sampGrabber = null;
            IBaseFilter capFilter = null;
            ICaptureGraphBuilder2 capGraph = null;

            // Get the graphbuilder object
            _mFilterGraph = (IFilterGraph2) new FilterGraph();
            _mMediaCtrl = _mFilterGraph as IMediaControl;
            try
            {
                // Get the ICaptureGraphBuilder2
                capGraph = (ICaptureGraphBuilder2) new CaptureGraphBuilder2();

                // Get the SampleGrabber interface
                sampGrabber = (ISampleGrabber) new SampleGrabber();

                // Start building the graph
                var hr = capGraph.SetFiltergraph( _mFilterGraph );
                DsError.ThrowExceptionForHR( hr );

                // Add the video device
                hr = _mFilterGraph.AddSourceFilterForMoniker(dev.Mon, null, "Video input", out capFilter);
                DsError.ThrowExceptionForHR( hr );

                var baseGrabFlt = (IBaseFilter)sampGrabber;
                ConfigureSampleGrabber(sampGrabber);

                // Add the frame grabber to the graph
                hr = _mFilterGraph.AddFilter( baseGrabFlt, "Ds.NET Grabber" );
                DsError.ThrowExceptionForHR( hr );

                // If any of the default config items are set
                if (iFrameRate + iHeight + iWidth > 0)
                {
                    SetConfigParms(capGraph, capFilter, iFrameRate, iWidth, iHeight);
                }

                hr = capGraph.RenderStream( PinCategory.Capture, MediaType.Video, capFilter, null, baseGrabFlt );
                DsError.ThrowExceptionForHR( hr );

                SaveSizeInfo(sampGrabber);
            }
            finally
            {
                if (capFilter != null)
                {
                    Marshal.ReleaseComObject(capFilter);
                }
                if (sampGrabber != null)
                {
                    Marshal.ReleaseComObject(sampGrabber);
                }
                if (capGraph != null)
                {
                    Marshal.ReleaseComObject(capGraph);
                }
            }
        }

        private void SaveSizeInfo(ISampleGrabber sampGrabber)
        {
            // Get the media type from the SampleGrabber
            var media = new AMMediaType();
            int hr = sampGrabber.GetConnectedMediaType( media );
            DsError.ThrowExceptionForHR( hr );

            if( (media.formatType != FormatType.VideoInfo) || (media.formatPtr == IntPtr.Zero) )
            {
                throw new NotSupportedException( "Unknown Grabber Media Format" );
            }

            // Grab the size info
            var videoInfoHeader = (VideoInfoHeader) Marshal.PtrToStructure( media.formatPtr, typeof(VideoInfoHeader) );
            _mVideoWidth = videoInfoHeader.BmiHeader.Width;
            _mVideoHeight = videoInfoHeader.BmiHeader.Height;
            _mStride = _mVideoWidth * (videoInfoHeader.BmiHeader.BitCount / 8);

            DsUtils.FreeAMMediaType(media);
        }
        private void ConfigureSampleGrabber(ISampleGrabber sampGrabber)
        {
            // Set the media type to Video/RBG24
            var media = new AMMediaType
                {
                    majorType = MediaType.Video,
                    subType = MediaSubType.RGB24,
                    formatType = FormatType.VideoInfo
                };
            var hr = sampGrabber.SetMediaType( media );
            DsError.ThrowExceptionForHR( hr );

            DsUtils.FreeAMMediaType(media);

            // Configure the samplegrabber
            hr = sampGrabber.SetCallback( this, 1 );
            DsError.ThrowExceptionForHR( hr );
        }

        // Set the Framerate, and video size
        private void SetConfigParms(ICaptureGraphBuilder2 capGraph, IBaseFilter capFilter, int iFrameRate, int iWidth, int iHeight)
        {
            object o;
            AMMediaType media;

            // Find the stream config interface
            capGraph.FindInterface(
                PinCategory.Capture, MediaType.Video, capFilter, typeof(IAMStreamConfig).GUID, out o );

            var videoStreamConfig = o as IAMStreamConfig;
            if (videoStreamConfig == null)
            {
                throw new Exception("Failed to get IAMStreamConfig");
            }

            // Get the existing format block
            var hr = videoStreamConfig.GetFormat( out media);
            DsError.ThrowExceptionForHR( hr );

            // copy out the videoinfoheader
            var v = new VideoInfoHeader();
            Marshal.PtrToStructure( media.formatPtr, v );

            // if overriding the framerate, set the frame rate
            if (iFrameRate > 0)
            {
                v.AvgTimePerFrame = 10000000 / iFrameRate;
            }

            // if overriding the width, set the width
            if (iWidth > 0)
            {
                v.BmiHeader.Width = iWidth;
            }

            // if overriding the Height, set the Height
            if (iHeight > 0)
            {
                v.BmiHeader.Height = iHeight;
            }

            // Copy the media structure back
            Marshal.StructureToPtr( v, media.formatPtr, false );

            // Set the new format
            hr = videoStreamConfig.SetFormat( media );
            DsError.ThrowExceptionForHR( hr );

            DsUtils.FreeAMMediaType(media);
        }

        /// <summary> Shut down capture </summary>
        private void CloseInterfaces()
        {
            try
            {
                if( _mMediaCtrl != null )
                {
                    // Stop the graph
                    _mMediaCtrl.Stop();
                    _mBRunning = false;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
            }

            if (_mFilterGraph == null) return;

            Marshal.ReleaseComObject(_mFilterGraph);
            _mFilterGraph = null;
        }

        /// <summary> sample callback, NOT USED. </summary>
        int ISampleGrabberCB.SampleCB( double sampleTime, IMediaSample pSample )
        {
            if (!_mBGotOne)
            {
                // Set bGotOne to prevent further calls until we
                // request a new bitmap.
                _mBGotOne = true;
                IntPtr pBuffer;

                pSample.GetPointer(out pBuffer);

                if (pSample.GetSize() > _mStride * _mVideoHeight)
                {
                    throw new Exception("Buffer is wrong size");
                }

                CopyMemory(_mHandle, pBuffer, _mStride * _mVideoHeight);

                // Picture is ready.
                _mPictureReady.Set();
            }

            Marshal.ReleaseComObject(pSample);
            return 0;
        }

        /// <summary> buffer callback, COULD BE FROM FOREIGN THREAD. </summary>
        int ISampleGrabberCB.BufferCB( double sampleTime, IntPtr pBuffer, int bufferLen )
        {
            if (!_mBGotOne)
            {
                // The buffer should be long enought
                if(bufferLen <= _mStride * _mVideoHeight)
                {
                    // Copy the frame to the buffer
                    CopyMemory(_mHandle, pBuffer, _mStride * _mVideoHeight);
                }
                else
                {
                    throw new Exception("Buffer is wrong size");
                }

                // Set bGotOne to prevent further calls until we
                // request a new bitmap.
                _mBGotOne = true;

                // Picture is ready.
                _mPictureReady.Set();
            }
            else
            {
                MDropped++;
            }
            return 0;
        }
    }
}
