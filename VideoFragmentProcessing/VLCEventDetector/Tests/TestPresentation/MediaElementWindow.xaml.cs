////////////////////////////////////////////////////////////////////////////////
//
//  MediaElementWindow.xaml.cs - This file is part of LibVLC.NET.
//
//    Copyright (C) 2011 Boris Richter <himself@boris-richter.net>
//
//  ==========================================================================
//  
//  LibVLC.NET is free software; you can redistribute it and/or modify it 
//  under the terms of the GNU Lesser General Public License as published by 
//  the Free Software Foundation; either version 2.1 of the License, or (at 
//  your option) any later version.
//    
//  LibVLC.NET is distributed in the hope that it will be useful, but WITHOUT 
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
//  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public 
//  License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License 
//  along with LibVLC.NET; if not, see http://www.gnu.org/licenses/.
//
//  ==========================================================================
// 
//  $LastChangedRevision$
//  $LastChangedDate$
//  $LastChangedBy$
//
////////////////////////////////////////////////////////////////////////////////

using System;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Windows;
using System.Windows.Forms;
using LibVideoFragmentManifest;
using OpenFileDialog = Microsoft.Win32.OpenFileDialog;

namespace EventDetector
{
    //****************************************************************************
    public partial class MediaElementWindow
        : Window
    {
        private IncomingFolderScanner _scanner;
        private SynchronizationContext _context;

        //==========================================================================
        public MediaElementWindow()
        {
            InitializeComponent();
        }

        //==========================================================================
        private void Window_Unloaded(object sender, RoutedEventArgs e)
        {
            //MediaElement.Source = null;
        }

        //==========================================================================
        private void PlayButton_Click(object sender, RoutedEventArgs e)
        {
            MediaElement.Play();
        }

        //==========================================================================
        private void PauseButton_Click(object sender, RoutedEventArgs e)
        {
            MediaElement.Pause();
        }

        //==========================================================================
        private void StopButton_Click(object sender, RoutedEventArgs e)
        {
            MediaElement.Stop();
        }

        //==========================================================================
        private void BrowseButton_Click(object sender, RoutedEventArgs e)
        {
            var open_file_dialog = new OpenFileDialog();
            if (open_file_dialog.ShowDialog() == true)
                MediaElement.Source = new Uri(open_file_dialog.FileName);
        }

        //==========================================================================
        private void ClearCurrentVideoStreamButton_Click(object sender, RoutedEventArgs e)
        {
            MediaElement.CurrentVideoStream = null;
        }

        //==========================================================================
        private void ClearCurrentAudioStreamButton_Click(object sender, RoutedEventArgs e)
        {
            MediaElement.CurrentAudioStream = null;
        }

        //==========================================================================
        private void ClearCurrentSubtitleStreamButton_Click(object sender, RoutedEventArgs e)
        {
            MediaElement.CurrentSubtitleStream = null;
        }

        //==========================================================================
        private void ClearSourceButton_Click(object sender, RoutedEventArgs e)
        {
            MediaElement.Source = null;
        }

        //==========================================================================
        private void NextFrameButton_Click(object sender, RoutedEventArgs e)
        {
            MediaElement.NextFrame();
        }

        //==========================================================================
        private void PreviousChapterButton_Click(object sender, RoutedEventArgs e)
        {
            MediaElement.PreviousChapter();
        }

        //==========================================================================
        private void NextChapterButton_Click(object sender, RoutedEventArgs e)
        {
            MediaElement.NextChapter();
        }

        private void EndReachedHandler(object sender, RoutedEventArgs e)
        {
            //  Writes event list.
            if (App.ManifestFileName != null)
            {
                //  Extracts fragment file name from manifest file name.
                var fragmentFileName = Path.ChangeExtension(App.ManifestFileName, "mp4");

                var serializer = new VideoFragmentManifestSerializer();
                serializer.Serialize(App.ManifestFileName, MediaElement.Manifest);

                //  Moves files.
                if (App.OutgoingFolderName != null)
                {
                    try
                    {
                        App.Mutex.WaitOne();

                        //  Combining of resulting file name.
                        var destFileName = Path.Combine(App.OutgoingFolderName, Path.GetFileName(App.ManifestFileName));
                        //  Handles elementary troubles.
                        File.Delete(destFileName);
                        File.Move(App.ManifestFileName, destFileName);

                        destFileName = Path.Combine(App.OutgoingFolderName,
                                                    Path.GetFileName(fragmentFileName));
                        File.Delete(destFileName);
                        File.Move(fragmentFileName, destFileName);
                    }
                    finally
                    {
                        App.Mutex.ReleaseMutex();
                    }
                }
            }

            //  Resumes file searching.
            if (_scanner != null)
            {
                _scanner.Resume();
            }
        }

        private void FileFoundHandler(string manifestFileName)
        {
            Debug.WriteLine("File {0} found.", manifestFileName);
            if (!_scanner.IsPaused)
            {
                _scanner.Pause();

                //  Makes synchronized call.
                _context.Send(state =>
                    {
                        try
                        {
                            VideoFragmentManifestSerializer serializer = new VideoFragmentManifestSerializer();
                            App.ManifestFileName = manifestFileName;
                            MediaElement.Manifest = serializer.Deserialize(App.ManifestFileName);
                            MediaElement.PlaySource(Path.ChangeExtension(manifestFileName, "mp4"));
                            MediaElement.Rate = (float)1.2;
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine("Exception in reading manifest: {0}. With message: {1}", manifestFileName, e.Message);
                            App.ManifestFileName = null;
                            MediaElement.Manifest = null;
                            File.Delete(manifestFileName);
                            File.Delete(Path.ChangeExtension(manifestFileName, "mp4"));
                        }
                    }, null);
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            if (App.IncomingFolderName != null)
            {
                MediaElement.EndReached -= EndReachedHandler;

                if (_scanner != null)
                {
                    _scanner.Stop();
                    _scanner.FileFoundEvent -= FileFoundHandler;
                }
            }
        }

        private void Window_Initialized(object sender, EventArgs e)
        {
            if (App.Visible)
                Visibility = Visibility.Visible;
            else
                Visibility = Visibility.Hidden;

            MediaElement.RenderingEnabled = App.Visible;

            if (App.IncomingFolderName != null)
            {
                //  Starts in fragment processing mode.
                MediaElement.EndReached += EndReachedHandler;
                _context = WindowsFormsSynchronizationContext.Current;
                //  Starts working thread.
                _scanner = new IncomingFolderScanner(App.IncomingFolderName);
                _scanner.FileFoundEvent += FileFoundHandler;
                _scanner.Start();
            }
        }
    }

    // class MediaElementWindow
}