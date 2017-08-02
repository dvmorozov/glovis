using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class CosemClassController : PersonalizedController
    {
        private ICosemClassRepository _cosemClassRepository;

        private void SetRepository(ICosemClassRepository cr, GlovisMasterBaseEntities e)
        {
            _cosemClassRepository = cr;
            _cosemClassRepository.SetEntities(e);
        }

        public CosemClassController() 
        {
            SetRepository(new CosemClassRepository(), Entities);
        }

        public CosemClassController(ICosemClassRepository cr)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(cr, null);
        }

        public ViewResult Index()
        {
            try
            {
                var v = _cosemClassRepository.GetCosemClassList(GetUserId());
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ViewResult Details(long id)
        {
            try
            {
                var viewcosemclass = _cosemClassRepository.GetCosemClass(id, GetUserId());
                return View(viewcosemclass);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Create()
        {
            try
            {
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        } 

        [HttpPost]
        public ActionResult Create(ViewCOSEMClass viewcosemclass)
        {
            try
            {
                if (viewcosemclass != null)
                {
                    if (ModelState.IsValid)
                    {
                        _cosemClassRepository.AddCosemClass(viewcosemclass, GetUserId());
                        return RedirectToAction("Index");
                    }
                }
                return View(viewcosemclass);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
        
        public ActionResult Edit(long id)
        {
            try
            {
                var viewcosemclass = _cosemClassRepository.GetCosemClass(id, GetUserId());
                return View(viewcosemclass);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(ViewCOSEMClass viewcosemclass)
        {
            try
            {
                if (viewcosemclass != null)
                {
                    if (ModelState.IsValid)
                    {
                        _cosemClassRepository.UpdateCosemClass(viewcosemclass, GetUserId());
                        return RedirectToAction("Index");
                    }
                }
                return View(viewcosemclass);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Delete(long id)
        {
            try
            {
                var viewcosemclass = _cosemClassRepository.GetCosemClass(id, GetUserId());
                return View(viewcosemclass);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {            
            try
            {
                _cosemClassRepository.DeleteCosemClass(id, GetUserId());
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}