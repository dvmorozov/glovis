using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class CosemComplexTypeFieldController : PersonalizedController
    {
        private ICosemComplexTypeFieldRepository _cosemComplexTypeFieldRepository;
        private ICosemDataTypeRepository _cosemDataTypeRepository;

        private void SetRepository(ICosemComplexTypeFieldRepository cr, ICosemDataTypeRepository cdt, GlovisMasterBaseEntities e)
        {
            _cosemComplexTypeFieldRepository = cr;
            _cosemComplexTypeFieldRepository.SetEntities(e);
            _cosemDataTypeRepository = cdt;
            _cosemDataTypeRepository.SetEntities(e);
        }

        public CosemComplexTypeFieldController() 
        {
            SetRepository(new CosemComplexTypeFieldRepository(), new CosemDataTypeRepository(), Entities);
        }

        public CosemComplexTypeFieldController(ICosemComplexTypeFieldRepository cr, ICosemDataTypeRepository cdt)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(cr, cdt, null);
        }

        public ViewResult Index(long id/*aggregate type identifier*/)
        {
            try
            {
                var t = _cosemComplexTypeFieldRepository.GetCosemComplexTypeFieldList(id, GetUserId());
                ViewBag.AggregateTypeID = id;
                return View(t);
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
                var viewcosemcomplextypefield = _cosemComplexTypeFieldRepository.GetCosemComplexTypeField(id, GetUserId());
                return View(viewcosemcomplextypefield);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        private void FillAuxData(Int64 selectedTypeId, Int64 selectedAggregateTypeId)
        {
            ViewBag.AggregateTypeID = selectedAggregateTypeId;
            ViewBag.TypeIDs = _cosemDataTypeRepository.GetCosemDataTypes(GetUserId(), selectedTypeId);
            ViewBag.AggregateTypeIDs = _cosemDataTypeRepository.GetCosemDataTypes(GetUserId(), selectedAggregateTypeId);
        }

        public ActionResult Create(long id/*aggregate type identifier*/)
        {
            try
            {
                FillAuxData(0, id);
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        } 

        [HttpPost]
        public ActionResult Create(ViewCOSEMComplexTypeField t)
        {
            try
            {
                if (t != null)
                {
                    if (ModelState.IsValid)
                    {
                        _cosemComplexTypeFieldRepository.AddCosemComplexTypeField(t, GetUserId());
                        return RedirectToAction("Index");
                    }

                    FillAuxData(t.TypeID, t.AggregateTypeID);
                }
                return View(t);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
        
        public ActionResult Edit(long id/*field identifier*/)
        {
            try
            {
                var viewcosemcomplextypefield = _cosemComplexTypeFieldRepository.GetCosemComplexTypeField(id, GetUserId());
                FillAuxData(viewcosemcomplextypefield.TypeID, viewcosemcomplextypefield.AggregateTypeID);
                return View(viewcosemcomplextypefield);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(ViewCOSEMComplexTypeField t)
        {
            try
            {
                if (t != null)
                {
                    if (ModelState.IsValid)
                    {
                        _cosemComplexTypeFieldRepository.UpdateCosemComplexTypeField(t, GetUserId());
                        return RedirectToAction("Index");
                    }
                    FillAuxData(t.TypeID, t.AggregateTypeID);
                }
                return View(t);
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
                var viewcosemcomplextypefield = _cosemComplexTypeFieldRepository.GetCosemComplexTypeField(id, GetUserId());
                return View(viewcosemcomplextypefield);
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
                _cosemComplexTypeFieldRepository.DeleteCosemComplexTypeField(id, GetUserId());
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