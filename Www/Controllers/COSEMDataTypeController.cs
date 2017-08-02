using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class CosemDataTypeController : PersonalizedController
    {
        private ICosemDataTypeRepository _cosemDataTypeRepository;

        private void SetRepository(ICosemDataTypeRepository r, GlovisMasterBaseEntities e)
        {
            _cosemDataTypeRepository = r;
            _cosemDataTypeRepository.SetEntities(e);
        }

        public CosemDataTypeController() 
        {
            SetRepository(new CosemDataTypeRepository(), Entities);
        }

        public CosemDataTypeController(ICosemDataTypeRepository r)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(r, null);
        }

        public ViewResult Index()
        {
            try
            {
                var viewcosemdatatype = _cosemDataTypeRepository.GetCosemDataTypeList(GetUserId());
                return View(viewcosemdatatype);
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
                var viewcosemdatatype = _cosemDataTypeRepository.GetCosemDataType(id, GetUserId());
                return View(viewcosemdatatype);
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
                ViewBag.AncestorTypeID = _cosemDataTypeRepository.GetCosemDataTypes(GetUserId(), 0);
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        } 

        [HttpPost]
        public ActionResult Create(ViewCOSEMDataType viewcosemdatatype)
        {
            try
            {
                if (viewcosemdatatype != null)
                {
                    if (ModelState.IsValid)
                    {
                        _cosemDataTypeRepository.AddCosemDataType(viewcosemdatatype, GetUserId());
                        return RedirectToAction("Index");
                    }
                    ViewBag.AncestorTypeID = _cosemDataTypeRepository.GetCosemDataTypes(GetUserId(), 
                        viewcosemdatatype.AncestorTypeID != null ? (Int64)viewcosemdatatype.AncestorTypeID : 0);
                }
                return View(viewcosemdatatype);
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
                var viewcosemdatatype = _cosemDataTypeRepository.GetCosemDataType(id, GetUserId());
                ViewBag.AncestorTypeID = _cosemDataTypeRepository.GetCosemDataTypes(GetUserId(), 
                    viewcosemdatatype.AncestorTypeID != null ? (Int64)viewcosemdatatype.AncestorTypeID : 0);
                return View(viewcosemdatatype);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(ViewCOSEMDataType viewcosemdatatype)
        {
            try
            {
                if (viewcosemdatatype != null)
                {
                    if (ModelState.IsValid)
                    {
                        _cosemDataTypeRepository.UpdateCosemDataType(viewcosemdatatype, GetUserId());
                        return RedirectToAction("Index");
                    }
                    ViewBag.AncestorTypeID = _cosemDataTypeRepository.GetCosemDataTypes(GetUserId(),
                        viewcosemdatatype.AncestorTypeID != null ? (Int64)viewcosemdatatype.AncestorTypeID : 0);
                }
                return View(viewcosemdatatype);
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
                var viewcosemdatatype = _cosemDataTypeRepository.GetCosemDataType(id, GetUserId());
                return View(viewcosemdatatype);
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
                _cosemDataTypeRepository.DeleteCosemDataType(id, GetUserId());
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