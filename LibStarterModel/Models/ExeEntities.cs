using System;
using System.Linq;

namespace LibStarterModel.Models
{
    /// <summary>
    /// This class is responsible for working with the cache of paths to executables.
    /// </summary>
    public class ExeRepository : IDisposable
    {
        private readonly AppStarterBaseEntities _db = new AppStarterBaseEntities();

        public string GetFullExeName(string exeName)
        {
            //  The name could be not found, so the method must check.
            var l = _db.TableExe.Where(t => t.ExeName == exeName);
            return l.Count() != 0 ? l.First().FullExeName : null;
        }

        public void DeleteExeName(string exeName)
        {
            var  l = _db.TableExe.Where(t => t.ExeName == exeName);
            foreach(var i in l)
            {
                _db.DeleteObject(i);
            }
            _db.SaveChanges();
        }

        public void AddFullExeName(string exeName, string fullExeName)
        {
            var tableExe = new TableExe {ExeName = exeName, FullExeName = fullExeName};

            _db.TableExe.AddObject(tableExe);
            _db.SaveChanges();
        }

        public void Dispose()
        {
            if (_db != null) _db.Dispose();
        }
    }
}
