using LibEventDetector;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Windows.Media.Imaging;
using LibVLC.NET;

namespace LibEventDetectorTests
{
    
    
    /// <summary>
    ///This is a test class for BitArrayContainerTest and is intended
    ///to contain all BitArrayContainerTest Unit Tests
    ///</summary>
    [TestClass()]
    public class BitArrayContainerTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion

        private BitArrayContainer ContainerFactory(out int width, out int height, out int stride)
        {
            BitmapImage bitmap = new BitmapImage(new Uri(
                //"D:\\my\\projects\\Oonze\\VideoFragmentProcessing\\LibEventDetectorTests\\1.png", 
                "C:\\_Projects\\Oonze\\VideoFragmentProcessing\\LibEventDetectorTests\\1.png",
                UriKind.Absolute));
            WriteableBitmap writeableBitmap = new WriteableBitmap(bitmap);
            byte[] b = new byte[writeableBitmap.BackBufferStride * writeableBitmap.PixelHeight * 4];
            int p = (int)writeableBitmap.BackBuffer;

            width = writeableBitmap.PixelWidth;
            height = writeableBitmap.PixelHeight;
            stride = writeableBitmap.BackBufferStride;

            unsafe
            {
                for (var i = 0; i < b.Length; i++)
                {
                    b[i] = *((byte*)p);
                }
            }

            return new BitArrayContainer(
                b, writeableBitmap.PixelWidth, writeableBitmap.PixelHeight, writeableBitmap.BackBufferStride);
        }

        /// <summary>
        ///A test for BitArrayContainer Constructor
        ///</summary>
        [TestMethod()]
        public void BitArrayContainerConstructorTest()
        {
            int width, height, stride;
            BitArrayContainer t1 = ContainerFactory(out width, out height, out stride);
            BitArrayContainer t2 = ContainerFactory(out width, out height, out stride);

            //  Compares two binarized images obtained from the same file.
            PrivateObject param1 = new PrivateObject(t1);
            BitArrayContainer_Accessor target1 = new BitArrayContainer_Accessor(param1);

            PrivateObject param2 = new PrivateObject(t2);
            BitArrayContainer_Accessor target2 = new BitArrayContainer_Accessor(param2);

            Assert.AreEqual(target1.Width, target2.Width);
            Assert.AreEqual(target1.Height, target2.Height);

            for(var i = 0; i < target1.ImageBits.Length; i++)
                Assert.AreEqual(target1.ImageBits[i], target2.ImageBits[i]);
        }

        /// <summary>
        ///A test for BinarizeImage
        ///</summary>
        [TestMethod()]
        [DeploymentItem("VLCEventDetector.EventDetector.dll")]
        public void BinarizeImageTest()
        {
            //  Width must be even for this test.
            int width = 322, height = 240;
            int[] ia = new int[width * height];
            for(var i = 0; i < ia.Length; i++)
                if (i % 2 == 0) ia[i] = 0x00ffffff;
                else ia[i] = 0x00000000;
            byte[] b = new byte[width * height * 4];
            for(var i = 0; i < ia.Length; i++)
            {
                b[i * 4]     = (byte)(ia[i] & 0x000000ff);
                b[i * 4 + 1] = (byte)(ia[i] & 0x0000ff00 >> 8);
                b[i * 4 + 2] = (byte)(ia[i] & 0x00ff0000 >> 16);
                b[i * 4 + 3] = 0;
            }

            BitArrayContainer t = new BitArrayContainer(b, width, height, width * 4);

            Assert.AreEqual(t.Width, width);
            Assert.AreEqual(t.Height, height);

            PrivateObject param0 = new PrivateObject(t);
            BitArrayContainer_Accessor target = new BitArrayContainer_Accessor(param0);

            Assert.AreEqual(target._imageBits.Length, 320 * 240 / 8);
            for(var i = 0; i < target._imageBits.Length; i++)
                Assert.AreEqual(0x55, target._imageBits[i]);

            //  Odd and even colors are exchanged.
            //  Width is changed (must be even)!
            width = 324;
            ia = new int[width * height];
            for (var i = 0; i < ia.Length; i++)
                if (i % 2 != 0) ia[i] = 0x00ffffff;
                else ia[i] = 0x00000000;
            b = new byte[width * height * 4];
            for (var i = 0; i < ia.Length; i++)
            {
                b[i * 4]     = (byte)(ia[i] & 0x000000ff);
                b[i * 4 + 1] = (byte)(ia[i] & 0x0000ff00 >> 8);
                b[i * 4 + 2] = (byte)(ia[i] & 0x00ff0000 >> 16);
                b[i * 4 + 3] = 0;
            }

            t = new BitArrayContainer(b, width, height, width * 4);

            Assert.AreEqual(t.Width, width);
            Assert.AreEqual(t.Height, height);

            param0 = new PrivateObject(t);
            target = new BitArrayContainer_Accessor(param0);

            Assert.AreEqual(target._imageBits.Length, 320 * 240 / 8);
            for (var i = 0; i < target._imageBits.Length; i++)
                Assert.AreEqual(0xaa, target._imageBits[i]);
        }

        /// <summary>
        ///A test for Clone
        ///</summary>
        [TestMethod()]
        public void CloneTest()
        {
            /*
            VideoBuffer b = null; // TODO: Initialize to an appropriate value
            BitArrayContainer target = new BitArrayContainer(b); // TODO: Initialize to an appropriate value
            object expected = null; // TODO: Initialize to an appropriate value
            object actual;
            actual = target.Clone();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
             */
        }

        /// <summary>
        ///A test for CompareWith
        ///</summary>
        [TestMethod()]
        public void CompareWithTest()
        {
            int width = 322, height = 240;
            int[] ia = new int[width * height];
            for (var i = 0; i < ia.Length; i++)
                if (i % 2 == 0) ia[i] = 0x00ffffff;
                else ia[i] = 0x00000000;
            byte[] b = new byte[width * height * 4];
            for (var i = 0; i < ia.Length; i++)
            {
                b[i * 4] = (byte)(ia[i] & 0x000000ff);
                b[i * 4 + 1] = (byte)(ia[i] & 0x0000ff00 >> 8);
                b[i * 4 + 2] = (byte)(ia[i] & 0x00ff0000 >> 16);
                b[i * 4 + 3] = 0;
            }

            var t1 = new BitArrayContainer(b, width, height, width * 4);

            //  Odd and even colors are exchanged.
            //  Width is changed!
            width = 324;
            ia = new int[width * height];
            for (var i = 0; i < ia.Length; i++)
                if (i % 2 != 0) ia[i] = 0x00ffffff;
                else ia[i] = 0x00000000;
            b = new byte[width * height * 4];
            for (var i = 0; i < ia.Length; i++)
            {
                b[i * 4] = (byte)(ia[i] & 0x000000ff);
                b[i * 4 + 1] = (byte)(ia[i] & 0x0000ff00 >> 8);
                b[i * 4 + 2] = (byte)(ia[i] & 0x00ff0000 >> 16);
                b[i * 4 + 3] = 0;
            }

            var t2 = new BitArrayContainer(b, width, height, width * 4);

            var r = t1.CompareWith(t2);
            Assert.AreEqual(r, 320 * 240);

            //  Odd and even colors are exchanged again.
            //  Width is changed!
            width = 326;
            ia = new int[width * height];
            for (var i = 0; i < ia.Length; i++)
                if (i % 2 == 0) ia[i] = 0x00ffffff;
                else ia[i] = 0x00000000;
            b = new byte[width * height * 4];
            for (var i = 0; i < ia.Length; i++)
            {
                b[i * 4] = (byte)(ia[i] & 0x000000ff);
                b[i * 4 + 1] = (byte)(ia[i] & 0x0000ff00 >> 8);
                b[i * 4 + 2] = (byte)(ia[i] & 0x00ff0000 >> 16);
                b[i * 4 + 3] = 0;
            }

            var t3 = new BitArrayContainer(b, width, height, width * 4);

            r = t1.CompareWith(t3);
            Assert.AreEqual(r, 0);
        }

        /// <summary>
        ///A test for CopyFrom
        ///</summary>
        [TestMethod()]
        public void CopyFromTest()
        {
            /*
            VideoBuffer b = null; // TODO: Initialize to an appropriate value
            BitArrayContainer target = new BitArrayContainer(b); // TODO: Initialize to an appropriate value
            ImageContainer from = null; // TODO: Initialize to an appropriate value
            target.CopyFrom(from);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
             */
        }

        /// <summary>
        ///A test for Height
        ///</summary>
        [TestMethod()]
        public void HeightTest()
        {
            /*
            VideoBuffer b = null; // TODO: Initialize to an appropriate value
            BitArrayContainer target = new BitArrayContainer(b); // TODO: Initialize to an appropriate value
            int actual;
            actual = target.Height;
            Assert.Inconclusive("Verify the correctness of this test method.");
             */
        }

        /// <summary>
        ///A test for ImageBits
        ///</summary>
        [TestMethod()]
        public void ImageBitsTest()
        {
            /*
            VideoBuffer b = null; // TODO: Initialize to an appropriate value
            BitArrayContainer target = new BitArrayContainer(b); // TODO: Initialize to an appropriate value
            byte[] actual;
            actual = target.ImageBits;
            Assert.Inconclusive("Verify the correctness of this test method.");
             */
        }

        /// <summary>
        ///A test for Width
        ///</summary>
        [TestMethod()]
        public void WidthTest()
        {
            /*
            VideoBuffer b = null; // TODO: Initialize to an appropriate value
            BitArrayContainer target = new BitArrayContainer(b); // TODO: Initialize to an appropriate value
            int actual;
            actual = target.Width;
            Assert.Inconclusive("Verify the correctness of this test method.");
             */
        }

        /// <summary>
        ///A test for static BitArrayContainer
        ///</summary>
        [TestMethod()]
        public void StaticBitArrayContainerTest()
        {
            Assert.AreEqual(BitArrayContainer.bitNumbers[0xff], 8);
            Assert.AreEqual(BitArrayContainer.bitNumbers[0x03], 2);
            Assert.AreEqual(BitArrayContainer.bitNumbers[0x80], 1);
            Assert.AreEqual(BitArrayContainer.bitNumbers[0x70], 3);
            Assert.AreEqual(BitArrayContainer.bitNumbers[0x00], 0);
        }
    }
}
