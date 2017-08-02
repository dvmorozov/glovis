using System;

namespace web.Models
{
    public interface IStatRepository
    {
        void IncStatCount(string url);
        void SetEntities(GlovisMasterBaseEntities entities);
    }

    //  evernote:///view/14501366/s132/9926e2a8-1589-41cd-8179-b38843da795c/9926e2a8-1589-41cd-8179-b38843da795c/
    public class StatRepository : IStatRepository
    {
        private GlovisMasterBaseEntities _db; // = new GlovisMasterBaseEntities();

        public void SetEntities(GlovisMasterBaseEntities entities)
        {
            _db = entities;
        }

        public void IncStatCount(string url)
        {
            try
            {
                _db.IncStatCount(url);
            }
// ReSharper disable EmptyGeneralCatchClause
            catch (Exception)
// ReSharper restore EmptyGeneralCatchClause
            {
                //  evernote:///view/14501366/s132/9926e2a8-1589-41cd-8179-b38843da795c/9926e2a8-1589-41cd-8179-b38843da795c/
                //  All exceptions must be caught to prevent interruption of external method.
            }
        }
    }
}
