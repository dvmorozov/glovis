using System;
using System.Diagnostics;
using System.IO;
using LibStarterModel.Models;

namespace LibExeCache
{
    public class ExeCache
    {
        private readonly ExeRepository _repository = new ExeRepository();

        /// <summary>
        /// Scans PATH and tries to find given executable.
        /// </summary>
        /// <param name="exe">Executable name.</param>
        /// <returns>Full path to the executable.</returns>
        private string ScanPath(string exe)
        {
            var path = Environment.GetEnvironmentVariable("PATH");
            if (path == null)
                throw new Exception("The environment variable \"PATH\" not found.");
            var l = path.Split(';');
            foreach (var s in l)
            {
                var fn = Path.Combine(s, exe);
                if (File.Exists(fn))
                {
                    //  Returns the first occurence of executable.
                    return fn;
                }
            }
            return null;
        }

        /// <summary>
        /// Finds full path to the executable and executes it with given parameters.
        /// </summary>
        /// <param name="exe">Executable name.</param>
        /// <param name="par">Executable parameters.</param>
        public Process FindPathAndExecute(string exe, string par)
        {
            //  Gets a path from cache (database).
            var fullExeName = _repository.GetFullExeName(exe);

            //  Scans PATH if executable was not found in the cache.
            if (fullExeName == null || !File.Exists(fullExeName))
            {
                //  Deletes a possible invalid entry from the DB.
                _repository.DeleteExeName(exe);

                //  Rescan environment.
                fullExeName = ScanPath(exe);

                if (fullExeName != null)
                {
                    //  Updates cache if necessary.
                    _repository.AddFullExeName(exe, fullExeName);
                }
                else
                {
                    throw new Exception("Executable \"" + exe + "\" not found.");
                }
            }
            return Process.Start(fullExeName.Trim(), par);
        }
    }
}