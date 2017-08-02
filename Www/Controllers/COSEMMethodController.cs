using System;
using System.Globalization;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class CosemMethodController : PersonalizedController
    {
        private ICosemMethodRepository _cosemMethodRepository;
        private ICosemClassRepository _cosemClassRepository;

        private void SetRepository(ICosemMethodRepository r, ICosemClassRepository cr, GlovisMasterBaseEntities e)
        {
            _cosemMethodRepository = r;
            _cosemMethodRepository.SetEntities(e);
            _cosemClassRepository = cr;
            _cosemClassRepository.SetEntities(e);
        }

        public CosemMethodController()
        {
            SetRepository(new CosemMethodRepository(), new CosemClassRepository(), Entities);
        }

        public CosemMethodController(ICosemMethodRepository r, ICosemClassRepository cr)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(r, cr, null);
        }

        public ViewResult Index(long id/*COSEM-class identifier*/)
        {
            try
            {
                var userId = GetUserId();
                var v = _cosemMethodRepository.GetCosemMethodList(id, userId);

                var vcc = _cosemClassRepository.GetCosemClass(id, userId);
                ViewBag.COSEMClassID = id;
                ViewBag.COSEMClassName = vcc.ClassName.TrimEnd();
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ViewResult Details(long id/*method identifier*/)
        {
            try
            {
                var viewcosemmethod = _cosemMethodRepository.GetCosemMethod(id, GetUserId());
                ViewBag.COSEMClassID = viewcosemmethod.COSEMClassID;
                return View(viewcosemmethod);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Create(long id/*COSEM-class identifier*/)
        {
            try
            {
                var v = new ViewCOSEMMethod {COSEMClassID = id};
                return View(v);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        } 

        [HttpPost]
        public ActionResult Create(ViewCOSEMMethod viewcosemmethod)
        {
            try
            {
                if (viewcosemmethod == null) throw new Exception("object should not be null");

                if (ModelState.IsValid)
                {
                    _cosemMethodRepository.AddCosemMethod(viewcosemmethod, GetUserId());
                    return RedirectToAction("Index/" + viewcosemmethod.COSEMClassID);
                }
                ViewBag.COSEMClassID = viewcosemmethod.COSEMClassID;
                return View(viewcosemmethod);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
        
        public ActionResult Edit(long id/*method identifier*/)
        {
            try
            {
                var userId = GetUserId();
                var viewcosemmethod = _cosemMethodRepository.GetCosemMethod(id, userId);
                ViewBag.COSEMClassID = viewcosemmethod.COSEMClassID;
                return View(viewcosemmethod);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(ViewCOSEMMethod viewcosemmethod)
        {
            try
            {
                if (viewcosemmethod == null) throw new Exception("object should not be null");

                ViewBag.COSEMClassID = viewcosemmethod.COSEMClassID;
                if (ModelState.IsValid)
                {
                    var userId = GetUserId();
                    _cosemMethodRepository.UpdateCosemMethod(viewcosemmethod, userId);
                    return RedirectToAction("Index/" + viewcosemmethod.COSEMClassID);
                }
                return View(viewcosemmethod);
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
                var viewcosemmethod = _cosemMethodRepository.GetCosemMethod(id, GetUserId());
                ViewBag.COSEMClassID = viewcosemmethod.COSEMClassID;
                return View(viewcosemmethod);
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
                var viewcosemmethod = _cosemMethodRepository.GetCosemMethod(id, GetUserId());
                _cosemMethodRepository.DeleteCosemMethod(id, GetUserId());
                return RedirectToAction("Index/" + viewcosemmethod.COSEMClassID.ToString(CultureInfo.InvariantCulture));
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
    }
}