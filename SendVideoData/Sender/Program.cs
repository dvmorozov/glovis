using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Threading;
using CommandLine;
using CommandLine.Text;

/*
 * For command line parsing the library from https://commandline.codeplex.com/ is used.
 */

namespace SendData
{
    public class RationalCityPostExample
    {
// ReSharper disable FieldCanBeMadeReadOnly.Local
        private static Options _options = new Options();
// ReSharper restore FieldCanBeMadeReadOnly.Local
        private const String XmlFileName = "test.xml";

        private static WebClient _cl;
        private static Bitmap _image;
        private static Bitmap _prevImage;

        private static void InitWebClient()
        {
            _cl = new WebClient {Proxy = WebRequest.DefaultWebProxy};
            //  this is to proxy pass through
            _cl.Proxy.Credentials = CredentialCache.DefaultCredentials;
        }

        private static void SendRequest()
        {
            /*
            // Create a request using a URL that can receive a post. 
            WebRequest request = WebRequest.Create("http://localhost:2374/Data/Upload");
            // Set the Method property of the request to POST.
            request.Method = "POST";
            // Create POST data and convert it to a byte array.
            string postData = "This is a test that posts this string to a Web server.";
            byte[] byteArray = Encoding.UTF8.GetBytes(postData);
            // Set the ContentType property of the WebRequest.
            request.ContentType = "multipart/form-data";
            // Set the ContentLength property of the WebRequest.
            request.ContentLength = byteArray.Length;
            // Get the request stream.
            Stream dataStream = request.GetRequestStream();
            // Write the data to the request stream.
            dataStream.Write(byteArray, 0, byteArray.Length);
            // Close the Stream object.
            dataStream.Close();
            // Get the response.
            WebResponse response = request.GetResponse();
            // Display the status.
            Console.WriteLine(((HttpWebResponse)response).StatusDescription);
            // Get the stream containing content returned by the server.
            dataStream = response.GetResponseStream();
            // Open the stream using a StreamReader for easy access.
            StreamReader reader = new StreamReader(dataStream);
            // Read the content.
            string responseFromServer = reader.ReadToEnd();
            // Display the content.
            Console.WriteLine(responseFromServer);
            // Clean up the streams.
            reader.Close();
            dataStream.Close();
            response.Close();
             */
            //Byte[] result = 
            _cl.UploadFile("http://" + _options.DestinationUrl + "/Data/Upload", XmlFileName);
            //Console.WriteLine( System.Text.Encoding.UTF8.GetString(result));
        }

        // Find the appropriate encoder
        private static ImageCodecInfo GetEncoderInfo(String mimeType)
        {
            int j;
            var encoders = ImageCodecInfo.GetImageEncoders();
            for (j = 0; j < encoders.Length; ++j)
            {
                if (encoders[j].MimeType == mimeType)
                    return encoders[j];
            }
            return null;
        }

        //  metods return true in the case images are different
// ReSharper disable UnusedMember.Local
        private static bool ImagesScalarMultiple()
// ReSharper restore UnusedMember.Local
        {
            for (var i = 0; i < _image.Width; i++)
                for (var j = 0; j < _image.Height; j++)
                {
                    var cImage = _image.GetPixel(i, j);
                    var cPrevImage = _prevImage.GetPixel(i, j);
                    double r1 = cImage.R;
                    double g1 = cImage.G;
                    double b1 = cImage.B;
                    double r2 = cPrevImage.R;
                    double g2 = cPrevImage.G;
                    double b2 = cPrevImage.B;

                    var norma1 = Math.Sqrt(r1*r1 + g1*g1 + b1*b1);
                    var norma2 = Math.Sqrt(r2*r2 + g2*g2 + b2*b2);

                    r1 = r1/norma1;
                    g1 = g1/norma1;
                    b1 = b1/norma1;

                    r2 = r2/norma2;
                    g2 = g2/norma2;
                    b2 = b2/norma2;

                    var scalMult = r1*r2 + g1*g2 + b1*b2;

                    if (scalMult < 0.2)
                        return true;
                }
            return false;
        }

// ReSharper disable UnusedMember.Local
        private static bool ImagesSimpleComparison()
// ReSharper restore UnusedMember.Local
        {
            var totalPixelNumber = _image.Width*_image.Height;
            var inequalPixelNumber = 0;

            for (var i = 0; i < _image.Width; i++)
                for (var j = 0; j < _image.Height; j++)
                {
                    var cImage = _image.GetPixel(i, j);
                    var cPrevImage = _prevImage.GetPixel(i, j);

                    if (cImage != cPrevImage)
                        inequalPixelNumber++;

                    if (inequalPixelNumber/(double) totalPixelNumber > 0.005)
                        return true;
                }
            return false;
        }

// ReSharper disable UnusedMember.Local
        private static bool ImagesBlackWhiteComparison()
// ReSharper restore UnusedMember.Local
        {
            for (var i = 0; i < _image.Width; i++)
                for (var j = 0; j < _image.Height; j++)
                {
                    var cImage = _image.GetPixel(i, j);
                    var cPrevImage = _prevImage.GetPixel(i, j);

                    var m = (cImage.R + cImage.G + cImage.B)/3;
                    var mPrev = (cPrevImage.R + cPrevImage.G + cPrevImage.B)/3;

                    if (mPrev != m) return true;
                }
            return false;
        }

// ReSharper disable UnusedMember.Local
        private static void BinarizeImage()
// ReSharper restore UnusedMember.Local
        {
            for (var i = 0; i < _image.Width; i++)
                for (var j = 0; j < _image.Height; j++)
                {
                    var cImage = _image.GetPixel(i, j);
                    var br = cImage.GetBrightness();

                    _image.SetPixel(i, j, br > 0.2 ? Color.White : Color.Black);
                }
        }

        class Options
        {
            [Option('m', "outputMac", Required = true,
              HelpText = "MAC of the output interface.")]
// ReSharper disable UnusedAutoPropertyAccessor.Local
            public string PhysicalAddress { get; set; }
// ReSharper restore UnusedAutoPropertyAccessor.Local

            [Option('d', "destinationURL", Required = true,
              HelpText = "Destination domain and port.")]
// ReSharper disable UnusedAutoPropertyAccessor.Local
            public string DestinationUrl { get; set; }
// ReSharper restore UnusedAutoPropertyAccessor.Local

            [Option('i', "snapshotInterval", Required = false, DefaultValue = 10000,
              HelpText = "Snapshot capturing interval (in milliseconds).")]
// ReSharper disable UnusedAutoPropertyAccessor.Local
            public int SnaphotInterval { get; set; }
// ReSharper restore UnusedAutoPropertyAccessor.Local

            [Option('t', "templateFile", Required = false, DefaultValue = "vrtemplate.xml",
              HelpText = "Device template file.")]
// ReSharper disable UnusedAutoPropertyAccessor.Local
            public string TemplateFileName { get; set; }
// ReSharper restore UnusedAutoPropertyAccessor.Local

            [Option('f', "saveImagesIntoFiles", Required = false, DefaultValue = false,
              HelpText = "Save images into intermediate files (for control purposes).")]
// ReSharper disable UnusedAutoPropertyAccessor.Local
            public bool SaveImagesIntoFiles { get; set; }
// ReSharper restore UnusedAutoPropertyAccessor.Local

            [Option('u', "username", Required = false, DefaultValue = "",
              HelpText = "Username.")]
// ReSharper disable UnusedAutoPropertyAccessor.Local
            public string Username { get; set; }
// ReSharper restore UnusedAutoPropertyAccessor.Local

            [Option('p', "password", Required = false, DefaultValue = "",
              HelpText = "Password.")]
// ReSharper disable UnusedAutoPropertyAccessor.Local
            public string Password { get; set; }
// ReSharper restore UnusedAutoPropertyAccessor.Local

            [Option('s', "sourceURL", Required = false, DefaultValue = "",
              HelpText = "Source URL.")]
// ReSharper disable UnusedAutoPropertyAccessor.Local
            public string SourceUrl { get; set; }
// ReSharper restore UnusedAutoPropertyAccessor.Local

            [Option('v', "verbose", DefaultValue = true,
              HelpText = "Prints all messages to standard output.")]
// ReSharper disable UnusedAutoPropertyAccessor.Local
            public bool Verbose { get; set; }
// ReSharper restore UnusedAutoPropertyAccessor.Local

            [ParserState]
// ReSharper disable UnusedMember.Local
            public IParserState LastParserState { get; set; }
// ReSharper restore UnusedMember.Local

            [HelpOption]
            public string GetUsage()
            {
                return HelpText.AutoBuild(this,
                  current => HelpText.DefaultParsingErrorsHandler(this, current));
            }
        }

        private static void Main(string[] args)
        {
            var cycleCount = 1;
#pragma warning disable 168
            const long jpegQuality = 30;    // 1-100 or 0 for default
#pragma warning restore 168
            const int size = 64;
            var snapshotSeqNumber = 0;
            var serieId = Guid.NewGuid();
            var firstDifferentSnapshot = true;

            if (!Parser.Default.ParseArguments(args, _options))
            {
                Console.WriteLine("Usage: {0}", _options.GetUsage());
                Console.ReadKey();
                return;
            }

            // Values are available here.
            if (_options.Verbose)
            {
                Console.WriteLine("Destination URL: {0}", _options.DestinationUrl);
                Console.WriteLine("Physical address: {0}", _options.PhysicalAddress);
                Console.WriteLine("Snaphot interval: {0}", _options.SnaphotInterval);
                Console.WriteLine("Template file name: {0}", _options.TemplateFileName);
            }

            InitWebClient();

            EncoderParameters myEncoderParameters = null;

            /*???
            if (JPEGQUALITY != 0)
            {
                // If not using the default jpeg quality setting
                EncoderParameter myEncoderParameter;
                myEncoderParameter = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, JPEGQUALITY);
                myEncoderParameters = new EncoderParameters(1);
                myEncoderParameters.Param[0] = myEncoderParameter;
            }
             **/

            var captureImage = new WebCapturedImage
                {
                    Url = _options.SourceUrl,
                    Username = _options.Username,
                    Password = _options.Password
                }; // new CameraCapturedImage();

            var memoryStream = new MemoryStream(1024 * 1024);

            NetworkInterface netif = null;
            Console.WriteLine(RationalCityPostExampleVersion.ToString());

            if (!args.Any())
            {
                foreach (var n in NetworkInterface.GetAllNetworkInterfaces())
                {
                    var ph = n.GetPhysicalAddress();
                    var ipp = n.GetIPProperties();
                    var ua = ipp.UnicastAddresses;
                    Console.WriteLine(ph.ToString().ToUpper());
                    foreach (var u in ua)
                        Console.WriteLine("  Unicast Address ......................... : {0}", u.Address);
                }
            }
            else
            {
                foreach (var n in NetworkInterface.GetAllNetworkInterfaces())
                {
                    var ph = n.GetPhysicalAddress();

                    if (ph.ToString().ToUpper() != _options.PhysicalAddress.ToUpper()) continue;

                    netif = n;
                    break;
                }
            }

            var r = File.OpenText(_options.TemplateFileName);
            var xmlTemplate = r.ReadToEnd();

            captureImage.Start();

            for (;;)
            {
                if (netif != null)
                {
                    var begin = DateTime.Now;
                    // capture image
                    _image = captureImage.GetBitmap();

                    // save image into file
                    if (_options.SaveImagesIntoFiles)
                    {
                        var fileName = cycleCount.ToString("0000000") + ".jpg";
                        _image.Save(fileName, ImageFormat.Jpeg);
                    }

                    // save it to jpeg using quality options
                    memoryStream.Position = 0;
// ReSharper disable ExpressionIsAlwaysNull
                    var myImageCodecInfo = GetEncoderInfo("image/jpeg");
                    _image.Save(memoryStream, myImageCodecInfo, myEncoderParameters);
// ReSharper restore ExpressionIsAlwaysNull

                    // new image object to resize the original image
                    var imgOutput = new Bitmap(size, size);
                    imgOutput.MakeTransparent(Color.Black);
                    var newGraphics = Graphics.FromImage(imgOutput);
                    newGraphics.Clear(Color.FromArgb(0, 255, 255, 255));

                    newGraphics.CompositingQuality = CompositingQuality.HighQuality;
                    newGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                    newGraphics.DrawImage(_image, 0, 0, size, size);
                    newGraphics.Flush();

                    // dispose original image
                    _image.Dispose();
                    _image = imgOutput;

// ReSharper disable ConvertToConstant.Local
                    var imagesAreDifferent = true;
// ReSharper restore ConvertToConstant.Local
                    /*
                        BinarizeImage();
                        
                        if (prevImage != null)
                        { 
                            if(prevImage.Width == image.Width && prevImage.Height == image.Height)
                            {
                                imagesAreDifferent = ImagesSimpleComparison();
                            }
                        }
                         */

                    var now = DateTime.Now;

// ReSharper disable ConditionIsAlwaysTrueOrFalse
                    if (imagesAreDifferent)
// ReSharper restore ConditionIsAlwaysTrueOrFalse
                    {
                        if (firstDifferentSnapshot)
                        {
                            snapshotSeqNumber = 0;
                            serieId = Guid.NewGuid();
                            firstDifferentSnapshot = false; // single increment per serie
                        }

                        var result = xmlTemplate;

                        var cArr = new Char[memoryStream.Length*2];
                        var cSym = new[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

                        memoryStream.Seek(0, SeekOrigin.Begin);
                        for (var i = 0; i < memoryStream.Length; i++)
                        {
                            var b = memoryStream.ReadByte();
                            cArr[i*2] = cSym[(b & 0xf0) >> 4];
                            cArr[i*2 + 1] = cSym[b & 0x0f];
                        }
                        var sIn = new String(cArr);

                        result = result.Replace("@@VALUE_Frame@@", snapshotSeqNumber++.ToString(CultureInfo.InvariantCulture));
                        result = result.Replace("@@STRING_VALUE_Frame@@", sIn);
                        result = result.Replace("@@STATUS_Frame@@", "0");
                        result = result.Replace("@@UNITS_Frame@@", serieId.ToString());
                        result = result.Replace("@@YEAR_Frame@@", now.Year.ToString(CultureInfo.InvariantCulture));
                        result = result.Replace("@@MONTH_Frame@@", now.Month.ToString(CultureInfo.InvariantCulture));
                        result = result.Replace("@@DAY_OF_MONTH_Frame@@", now.Day.ToString(CultureInfo.InvariantCulture));
                        result = result.Replace("@@DAY_OF_WEEK_Frame@@", now.DayOfWeek.ToString());
                        result = result.Replace("@@HOUR_Frame@@", now.Hour.ToString(CultureInfo.InvariantCulture));
                        result = result.Replace("@@MINUTE_Frame@@", now.Minute.ToString(CultureInfo.InvariantCulture));
                        result = result.Replace("@@SECOND_Frame@@", now.Second.ToString(CultureInfo.InvariantCulture));
                        //  according to IEC62056-62 p.13
                        result = result.Replace("@@HUNDREDTHS_OF_SECOND_Frame@@", (now.Millisecond/10).ToString(CultureInfo.InvariantCulture));

                        File.WriteAllText(XmlFileName, result);
                        // Empty the stream
                        memoryStream.SetLength(0);

                        try
                        {
                            SendRequest();
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine("Exception: " +
                                              (e.InnerException != null ? e.InnerException.Message : e.Message));
                        }
                    }
                    else
// ReSharper disable HeuristicUnreachableCode
                    {
                        firstDifferentSnapshot = true; //  next different snapshot will be the first in new serie
                        Console.WriteLine("image does not change");
                    }
// ReSharper restore HeuristicUnreachableCode

                    Console.WriteLine("Cycle " + cycleCount.ToString("0000000") + " time: " + now.ToString(CultureInfo.InvariantCulture) + "." +
                                      now.Millisecond);
                    cycleCount++;

                    // remove the image from memory
                    if (_prevImage != null)
                    {
                        _prevImage.Dispose();
                        _prevImage = null;
                    }
                    _prevImage = _image;

                    var end = DateTime.Now;
                    var diff = end.Subtract(begin);
                    var sleepTime = _options.SnaphotInterval - (diff.Seconds*1000 + diff.Milliseconds);
                    if (sleepTime > 0)
                        Thread.Sleep(sleepTime);
                    //Console.WriteLine("Sleep time " + sleepTime.ToString()  + " diff.Seconds " + diff.Seconds.ToString());
                }
            }
        }
    }
}