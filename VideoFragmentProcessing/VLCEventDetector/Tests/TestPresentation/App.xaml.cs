////////////////////////////////////////////////////////////////////////////////
//
//  App.xaml.cs - This file is part of LibVLC.NET.
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
//  $LastChangedRevision: 11723 $
//  $LastChangedDate: 2011-10-08 13:39:48 +0600 (Сб, 08 окт 2011) $
//  $LastChangedBy: unknown $
//
////////////////////////////////////////////////////////////////////////////////

using System;
using System.Threading;
using System.Windows;
using LibVLC.NET.Presentation;

namespace EventDetector
{

  //****************************************************************************
  public partial class App 
    : Application
  {
      public static string ManifestFileName;    //  The name of manifest file of the video video fragment which is processed.
                                                //  Used as a flag that the video fragment is being processed.
      public static string IncomingFolderName;  //  The name of folder for looking for files.
                                                //  Used as a flag that the program runs in fragment processing mode.
      public static string OutgoingFolderName;  //  The name of folder for receiving of processed files.
      public static bool Visible = true;
      public static Mutex Mutex;

      private void Application_Startup(object sender, StartupEventArgs e)
      {
          if (e.Args.Length < 2)
          {
              Console.WriteLine(
                  "Mandatory (preserve order)\n: " +
                  "<incoming folder name> <outgoing folder name>\n" +
                  "Optional (all optional parameters must be given up to the last one)\n:" +
                  "[--invisible|--visible] [sensitivity (1-1000 - than more the number than less the sensitivity)]");
              Console.ReadKey();
              return;
          }

          IncomingFolderName = e.Args[0];
          OutgoingFolderName = e.Args[1];

          if (e.Args.Length > 2)
          {
              if (e.Args[2] == "--invisible")
              {
                  Visible = false;
              }
          }

          if (e.Args.Length > 3)
          {
              LibVlcPresentationConfig.Sensitivity = double.Parse(e.Args[3]) / 1000.0;
          }

          bool createdNew;
          Mutex = new Mutex(false, "VideoFragmentProcessingMutex", out createdNew);
      }

      private void App_OnExit(object sender, ExitEventArgs e)
      {
          Mutex.Dispose();
          Mutex = null;
      }
  } // class App
}
