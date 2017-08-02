using System.Data;
using System.Linq;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{ 
    public class YouTubeController : Controller
    {
        private readonly YouTubeEntities _db = new YouTubeEntities();

        public ViewResult Index()
        {
            var tableyoutubeattribute = _db.TableYouTubeAttribute.Include("TableDevice");
            return View(tableyoutubeattribute.ToList());
        }

        public ViewResult Details(long id)
        {
            var tableyoutubeattribute = _db.TableYouTubeAttribute.Single(t => t.ID == id);
            return View(tableyoutubeattribute);
        }

        public ActionResult Create()
        {
            ViewBag.DeviceID = new SelectList(_db.TableDevice, "ID", "Name");
            return View();
        } 

        [HttpPost]
        public ActionResult Create(TableYouTubeAttribute tableyoutubeattribute)
        {
            if (ModelState.IsValid)
            {
                _db.TableYouTubeAttribute.AddObject(tableyoutubeattribute);
                _db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.DeviceID = new SelectList(_db.TableDevice, "ID", "Name", tableyoutubeattribute.DeviceID);
            return View(tableyoutubeattribute);
        }
        
        public ActionResult Edit(long id)
        {
            var tableyoutubeattribute = _db.TableYouTubeAttribute.Single(t => t.ID == id);
            ViewBag.DeviceID = new SelectList(_db.TableDevice, "ID", "Name", tableyoutubeattribute.DeviceID);
            return View(tableyoutubeattribute);
        }

        [HttpPost]
        public ActionResult Edit(TableYouTubeAttribute tableyoutubeattribute)
        {
            if (ModelState.IsValid)
            {
                _db.TableYouTubeAttribute.Attach(tableyoutubeattribute);
                _db.ObjectStateManager.ChangeObjectState(tableyoutubeattribute, EntityState.Modified);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DeviceID = new SelectList(_db.TableDevice, "ID", "Name", tableyoutubeattribute.DeviceID);
            return View(tableyoutubeattribute);
        }

        public ActionResult Delete(long id)
        {
            var tableyoutubeattribute = _db.TableYouTubeAttribute.Single(t => t.ID == id);
            return View(tableyoutubeattribute);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {            
            var tableyoutubeattribute = _db.TableYouTubeAttribute.Single(t => t.ID == id);
            _db.TableYouTubeAttribute.DeleteObject(tableyoutubeattribute);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            _db.Dispose();
            base.Dispose(disposing);
        }
    }
}