using System.Diagnostics;
using System.IO;
using System.Linq;
using Microsoft.Win32;

namespace LibVLC.NET
{
    /// <summary>
    /// Provides searching and launching of VLC executables.
    /// </summary>
    public class VlcExec
    {
        private static string _vlcPath = string.Empty;
        private static Process _process;

        /// <summary>
        /// Executes VLC with given command line parameters. Throws exception if failed.
        /// </summary>
        /// <param name="path">Path to VLC.</param>
        /// <param name="command">Command line parameters.</param>
        private static void ExecVlc(string path, string command)
        {
            var vlcExecFile = Path.Combine(path, "vlc.exe");

            var procStIfo = new ProcessStartInfo(vlcExecFile, command)
                {
                    RedirectStandardOutput = true,
                    UseShellExecute = false,
                    CreateNoWindow = true
                };

            _process = new Process { StartInfo = procStIfo };
            _process.Start();
            //  Doesn't improve quality.
            //proc.PriorityClass = ProcessPriorityClass.RealTime;
        }

        /// <summary>
        /// Returns a path of given file obtained from PATH environment variable.
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static string FindPath(string fileName)
        {
            const string keyName = @"SYSTEM\CurrentControlSet\Control\Session Manager\Environment\";
            var openSubKey = Registry.LocalMachine.OpenSubKey(keyName);
            if (openSubKey != null)
            {
                var existingPathFolderVariable =
                    (string)openSubKey.GetValue("PATH", "", RegistryValueOptions.None);
                //  Gets paths list.
                var l = existingPathFolderVariable.Split(';');
                foreach (var s in from s in l let fn = Path.Combine(s, fileName) where File.Exists(fn) select s)
                {
                    return s;
                }
            }
            return string.Empty;
        }

        /// <summary>
        /// Stops the process.
        /// evernote:///view/14501366/s132/40065847-19a8-48d7-85fd-a0500a6009be/40065847-19a8-48d7-85fd-a0500a6009be/
        /// </summary>
        public static void Kill()
        {
            if (_process == null || _process.HasExited) return;

            _process.Kill();
            _process.WaitForExit();
            _process = null;
        }

        /// <summary>
        /// Returns termination status of the process.
        /// evernote:///view/14501366/s132/40065847-19a8-48d7-85fd-a0500a6009be/40065847-19a8-48d7-85fd-a0500a6009be/
        /// </summary>
        /// <returns></returns>
        public static bool HasExited()
        {
            return (_process == null || _process.HasExited);
        }

        /// <summary>
        /// https://www.evernote.com/shard/s132/nl/14501366/5ed0116f-3958-41a6-9dd7-b355919fd5d1
        /// </summary>
        public static void WaitForExit()
        {
            if (_process != null)
                _process.WaitForExit();
        }

        /// <summary>
        /// Executes VLC with command line parameters.
        /// The binaries can be installed into non standard folder. 
        /// So, the methods scans the PATH variable.
        /// </summary>
        public static void ExecVlcCommand(string command)
        {
            //  Examples of alternative searches of standard folders.
            //Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFilesX86), "VideoLAN", "VLC");
            //Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles), "VideoLAN", "VLC");

            //  Gets the path for the first time.
            if (_vlcPath == string.Empty)
            {
                _vlcPath = FindPath("vlc.exe");
                //  Tries to execute.
                if(_vlcPath != string.Empty) ExecVlc(_vlcPath, command);
            }
            else
            {
                ExecVlc(_vlcPath, command);
            }
        }
    }
}
