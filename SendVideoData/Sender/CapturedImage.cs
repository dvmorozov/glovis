using System;
using System.Collections.Specialized;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Net;
using System.Runtime.InteropServices;

namespace SendData
{
    public interface ICapturedImage
    {
        Bitmap GetBitmap();
        void Start();
    }

    public class CameraCapturedImage : ICapturedImage
    {
        const int VideoDevice = 1;      // zero based index of video capture device to use
        const int FrameRate = 15;       // Depends on video device caps.  Generally 4-30.
        //  !!! почему-то этот параметр не влияет
        const int VideoWidth = 640;     // Depends on video device caps
        const int VideoHeight = 480;    // Depends on video device caps
        readonly Capture _cam = new Capture(VideoDevice, FrameRate, VideoWidth, VideoHeight);

        public Bitmap GetBitmap()
        {
            var ip = _cam.GetBitMap();
            try
            {
                var result = new Bitmap(_cam.Width, _cam.Height, _cam.Stride, PixelFormat.Format24bppRgb, ip);
                result.RotateFlip(RotateFlipType.RotateNoneFlipY);
                return result;
            }
            finally
            {
                if (ip != IntPtr.Zero)
                {
                    Marshal.FreeCoTaskMem(ip);
                }
            }
        }

        public void Start()
        {
            _cam.Start();
        }
    }

    public class CookieAwareWebClient : WebClient
    {
        public CookieAwareWebClient()
        {
            CookieContainer = new CookieContainer();
        }
        public CookieContainer CookieContainer { get; private set; }

        protected override WebRequest GetWebRequest(Uri address)
        {
            var request = (HttpWebRequest)base.GetWebRequest(address);
            request.CookieContainer = CookieContainer;
            return request;
        }
    }

    public class WebCapturedImage : ICapturedImage
    {
        public string Url;
        public string Username;
        public string Password;

        public Bitmap GetBitmap()
        {
            using (var cl = new WebClient())
            {
                cl.UseDefaultCredentials = true;
                cl.Credentials = new NetworkCredential(Username, Password);

                // If the previous call succeeded we now have a valid authentication cookie
                // so we could download the protected page
                var data = cl.DownloadData(Url);
                return new Bitmap(new MemoryStream(data));
            }
        }

        public void Start()
        {
        }
    }
}
