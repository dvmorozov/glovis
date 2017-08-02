
using System;
using System.Diagnostics;
using System.IO;
using System.Threading;

namespace EventDetector
{
    public class IncomingFolderScanner
    {
        private readonly string _incomingFolderName;
        private Thread _thread;
        private bool _stop;
        private bool _pause;

        /// <summary>
        /// The property is used as flag blocking handling of recurring events.
        /// </summary>
        public bool IsPaused {
            get { return _pause; }
        }

        public delegate void FileFoundHandler(string fileName);

        public event FileFoundHandler FileFoundEvent;

        protected virtual void OnFileFoundEvent(string filename)
        {
            FileFoundHandler handler = FileFoundEvent;
            if (handler != null) handler(filename);
        }

        /// <summary>
        /// The method is called from the thread, so it must catch all exceptions.
        /// </summary>
        private void DoScan()
        {
            try
            {
                bool createdNew;
                using (var mutex = new Mutex(false, "VideoFragmentProcessingMutex", out createdNew))
                {
                    while (!_stop)
                    {
                        if (!_pause)
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

                            if (files == null || files.Length == 0)
                            {
                                Thread.Sleep(1000);
                                continue;
                            }

                            foreach (var file in files)
                            {
                                //  Tries to open files (they can be blocked by another process).
                                try
                                {
                                    //  Manifest...
                                    using (var fs = new FileStream(file, FileMode.Open))
                                    {
                                        //  Does nothing. This is just a test.
                                    }
                                    //  Video fragment...
                                    using (var fs = new FileStream(Path.ChangeExtension(file, "mp4"), FileMode.Open))
                                    {
                                        //  Does nothing. This is just a test.
                                    }
                                    OnFileFoundEvent(file);
                                }
                                catch (Exception e)
                                {
                                    Console.WriteLine("Exception in reading file: {0}. With message: {1}", file,
                                                      e.Message);
                                }
                            }
                        }
                        else Thread.Sleep(1000);
                    }
                }
            }
            catch(Exception e)
            {
                //  Write message to some place.
                Console.WriteLine("Exception in scanning thread: {0}", e.Message);
            }
        }

        public IncomingFolderScanner(string incomingFolderName)
        {
            _incomingFolderName = incomingFolderName;
        }

        /// <summary>
        /// Starts scanning.
        /// </summary>
        public void Start()
        {
            _stop = false;
            _pause = false;
            var start = new ThreadStart(DoScan);
            _thread = new Thread(start);
            _thread.Start();
        }

        /// <summary>
        /// Stops scanning.
        /// </summary>
        public void Stop()
        {
            Debug.WriteLine("Scanner is being stopped.");
            _stop = true;
            _thread.Join();
            Debug.WriteLine("Scanner stopped.");
        }

        /// <summary>
        /// Temporarily stops scanning.
        /// </summary>
        public void Pause()
        {
            Debug.WriteLine("Scanner paused.");
            _pause = true;
        }

        /// <summary>
        /// Resume scanning.
        /// </summary>
        public void Resume()
        {
            Debug.WriteLine("Scanner resumed.");
            _pause = false;
        }
    }
}