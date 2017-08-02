
using System;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Threading;
using Google.YouTube;
using Google.GData.YouTube;
using Google.GData.Client;
using Google.GData.Extensions.MediaRss;
using Google.GData.Extensions.Location;
using LibDataUploader;
using LibVideoFragmentManifest;
using System.Web;

namespace YouTubeUploader
{
    internal class Applicaton
    {
        private static string _incomingFolderName;
        private static int _fileSeqNum = 0;

        /// <summary>
        /// Uploads fragment on YouTube.
        /// </summary>
        /// <param name="fileName">Manifest file name.</param>
        /// <param name="watchPage">URL to uploaded video.</param>
        private static void UploadFile(string fileName, out string watchPage)
        {
            watchPage = null;

            try
            {
                var serializer = new VideoFragmentManifestSerializer();
                var manifest = serializer.Deserialize(fileName);
                manifest.YouTubeManifest.UploadingSuccessful = false;
                //  Extracts fragment file name from manifest file name.
                var fragmentFileName = Path.ChangeExtension(fileName, "mp4");

                try
                {
                    if (manifest.EventDetectorManifest.EventList == null ||
                        manifest.EventDetectorManifest.EventList.Length == 0)
                        throw new Exception("No events were detected, therefore the fragment was not uploaded.");

                    YouTubeRequestSettings settings = new YouTubeRequestSettings("Oonze",
                                                                                 manifest.YouTubeManifest
                                                                                         .DeveloperKey,
                                                                                 manifest.YouTubeManifest
                                                                                         .UserName,
                                                                                 manifest.YouTubeManifest
                                                                                         .UserPass);

                    YouTubeRequest request = new YouTubeRequest(settings);

                    Video newVideo = new Video();

                    newVideo.Title = manifest.YouTubeManifest.Title;
                    newVideo.Tags.Add(new MediaCategory(manifest.YouTubeManifest.Category,
                                                        YouTubeNameTable.CategorySchema));
                    newVideo.Keywords = manifest.YouTubeManifest.Keywords;
                    newVideo.YouTubeEntry.Private = true;
                    newVideo.Tags.Add(new MediaCategory(manifest.YouTubeManifest.Tags,
                                                        YouTubeNameTable.DeveloperTagSchema));
                    newVideo.YouTubeEntry.Location = new GeoRssWhere(manifest.YouTubeManifest.Latitude,
                                                                     manifest.YouTubeManifest.Longitude);
                    newVideo.YouTubeEntry.MediaSource = new MediaFileSource(fragmentFileName, "video/mpeg");

                    //  Replace description with event statistics.
                    manifest.YouTubeManifest.Description = String.Empty;

                    foreach (var e in manifest.EventDetectorManifest.EventList)
                    {
                        manifest.YouTubeManifest.Description += e.Type + " ( " +
                                                                e.Count.ToString(CultureInfo.InvariantCulture) +
                                                                " from " +
                                                                e.DateRangeFrom.ToString(
                                                                    CultureInfo.InvariantCulture) + " to " +
                                                                e.DateRangeTo.ToString(
                                                                    CultureInfo.InvariantCulture) + " )" +
                                                                Environment.NewLine;
                    }
                    newVideo.Description = manifest.YouTubeManifest.Description;

                    Video createdVideo = request.Upload(newVideo);

                    manifest.YouTubeManifest.UploadingSuccessful = true;
                    manifest.YouTubeManifest.WatchPage = createdVideo.WatchPage.AbsoluteUri;
                    watchPage = manifest.YouTubeManifest.WatchPage;
                    Console.WriteLine("{2} Uploaded \n{0}. \nWatch page at \"{1}\".\n", fragmentFileName, manifest.YouTubeManifest.WatchPage, _fileSeqNum.ToString("D6"));
                }
                catch (Exception e)
                {
                    manifest.YouTubeManifest.UploadingSuccessful = false;
                    manifest.YouTubeManifest.ErrorMessage = e.InnerException != null
                                                                ? e.InnerException.Message
                                                                : e.Message;
                    throw;
                }
            }
            catch(Exception e)
            {
                //  All exceptions must be handled, because manifest and fragment files
                //  must be deleted every time when possible.
                Console.WriteLine("{2} Exception in \n{0}. \nWith message: {1}\n", fileName, e.Message, _fileSeqNum.ToString("D6"));
            }
        }

        static void Main(string[] args)
        {
            if (args.Length < 3)
            {
                Console.WriteLine("Usage:\n" +
                                  "The first parameter must be the name of a folder to scan for files.\n\t" +
                                  "The second parameter must be the name of device template file.\n\t" +
                                  "The third parameter must be the domain name of web application.");
                Console.WriteLine("");
                Console.WriteLine("Press any key to exit.");
                Console.ReadKey();
                return;
            }

            _incomingFolderName = args[0];
            var dataUploader = new DataUploader(args[1], "filled_template.temporary.xml", args[2]);

            bool createdNew;
            using (var mutex = new Mutex(false, "VideoFragmentProcessingMutex", out createdNew))
            {
                do
                {
                    try
                    {
                        Debug.WriteLine("Scanning thread does work.");

                        string[] files = null;
                        try
                        {
                            mutex.WaitOne();
                            files = Directory.GetFiles(_incomingFolderName, "*.xml");
                        }
                        finally
                        {
                            mutex.ReleaseMutex();
                        }

                        if (files.Length != 0)
                        {
                            foreach (var manifestFileName in files)
                            {
                                try
                                {
                                    string watchPage;

                                    Console.WriteLine("{2} Uploading of \n{0} \n\tstarted at {1}.\n", manifestFileName,
                                                      DateTime.Now, _fileSeqNum.ToString("D6"));
                                    UploadFile(manifestFileName, out watchPage);
                                    if (watchPage != null) dataUploader.Upload(HttpUtility.UrlEncode(watchPage));
                                }
                                finally
                                {
                                    //  Deletes manifest and fragment file because 
                                    //  this process is last in the processing chain.
                                    //  The files must be deleted in any case to avoid exhaust of disk space.
                                    Console.WriteLine("{2} Deleting of \n{0} \n\tperformed at {1}.\n", manifestFileName,
                                                      DateTime.Now, _fileSeqNum.ToString("D6"));

                                    File.Delete(manifestFileName);
                                    
                                    var fragmentFileName = Path.ChangeExtension(manifestFileName, "mp4");
                                    File.Delete(fragmentFileName);

                                    _fileSeqNum++;
                                }
                            }
                        }
                        Thread.Sleep(1000);
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("Exception \n{0}\n", e.Message);
                    }
                } while (true);
            }
        }
    }
}
