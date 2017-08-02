using System;
using System.Diagnostics;
using System.Linq;

namespace LibProcessLog
{
    public interface IProcessLog
    {
        //  Starts logging without limitations.
        void StartProcessLog(string exeName, string cmdLine, short pid);
        //  Starts logging with limitation.
        void StartProcessLog(string exeName, string cmdLine, short pid, int maxLogCount);
        void AddMessage(string message);
    }

    public class ProcessLog : IProcessLog, IDisposable
    {
        private readonly ProcessLogBaseContainer _db = new ProcessLogBaseContainer();
        private int _exeId;
        private int _procId;
        private int _maxLogCount = -1;  //  This means that no limitation.

        public static string GetExceptionMessage(Exception e)
        {
            return e.Message + (e.InnerException != null ? " Inner: " + e.InnerException.Message + "." : "");
        }

        //  Constructor without parameters to be used from libraries.
        public ProcessLog()
        {
            StartProcessLog(System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName, "", 0);
        }

        public ProcessLog(string exeName)
        {
            StartProcessLog(exeName, "", 0);
        }

        public void StartProcessLog(string exeName, string cmdLine, short pid)
        {
            Executable e;
            var exes = _db.ExecutableSet.Where(t => t.Name == exeName);
            if (exes.Count() != 0)
            {
                //  The executable already added.
                Debug.Assert(exes.Count() == 1);
                e = exes.First();
            }
            else
            {
                e = new Executable {Name = exeName};
                _db.ExecutableSet.AddObject(e);
                _db.SaveChanges();
            }

            _exeId = e.Id;

            var p = new Process {Pid = pid, CmdLine = cmdLine, ExecutableId = _exeId};

            _db.ProcessSet.AddObject(p);
            _db.SaveChanges();
            _procId = p.Id;
        }

        public void StartProcessLog(string exeName, string cmdLine, short pid, int maxLogCount)
        {
            _maxLogCount = maxLogCount;
            StartProcessLog(exeName, cmdLine, pid);
        }

        public void AddMessage(string message)
        {
            _db.MessageSet.AddObject(new Message { ExecutableId = _exeId, ProcessId = _procId, Text = message, Timestamp = DateTime.Now } );

            if (_maxLogCount != -1)
            {
                //  Adds 1 to take into account the new message.
                var delCount = _db.MessageSet.Count(t => t.ExecutableId == _exeId) + 1 - _maxLogCount;
                if (delCount > 0)
                {
                    //  Deletes old messages (top delCount).
                    var s =
                        (from m in _db.MessageSet
                         orderby m.Id
                         select m).Take(delCount);

                    foreach (var m in s)
                    {
                        _db.MessageSet.DeleteObject(m);
                    }
                }
            }
            _db.SaveChanges();
        }

        //  evernote:///view/14501366/s132/9d8ff0f1-04e4-49d7-9229-a958425c2087/9d8ff0f1-04e4-49d7-9229-a958425c2087/
        //  Blocks internal exceptions and tries to write in the system log of instance.
        public void AddMessageAnyway(string message, string appName)
        {
            try
            {
                AddMessage(message);
            }
            catch (Exception e)
            {
                try
                {
                    var log = new EventLog {Source = appName};
                    log.WriteEntry(message, EventLogEntryType.Error);

                    log.WriteEntry(GetExceptionMessage(e), EventLogEntryType.Error);
                }
// ReSharper disable EmptyGeneralCatchClause
                catch
// ReSharper restore EmptyGeneralCatchClause
                {
                    //  Ignores exceptions.
                }
            }
        }

        #region IDisposable Members

        public void Dispose()
        {
            if(_db != null)
                _db.Dispose();
        }

        #endregion
    }
}
