using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User")]
    public class DeviceOwnerController : PersonalizedController
    {
        private IDeviceOwnerRepository _deviceOwnerRepository;

        private void SetRepository(IDeviceOwnerRepository r, GlovisMasterBaseEntities e)
        {
            _deviceOwnerRepository = r;
            _deviceOwnerRepository.SetEntities(e);
        }

        public DeviceOwnerController() 
        {
            SetRepository(new DeviceOwnerRepository(), Entities);
        }

        public DeviceOwnerController(IDeviceOwnerRepository r)
        {
            //  for tests over real database
            //  does not work...
            //db = new GlovisMasterBaseEntities("metadata=res://*/Models.SGMasterBase.csdl|res://*/Models.SGMasterBase.ssdl|res://*/Models.SGMasterBase.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=SGMasterBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework\"");
            SetRepository(r, null);
        }

        public ViewResult SetOwner(String returnTo)
        {
            try
            {
                var viewcosemdatatype = _deviceOwnerRepository.GetDeviceOwnerList(GetUserId());
                ViewBag.ReturnTo = returnTo;
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
                ViewDeviceOwner viewdeviceowner = _deviceOwnerRepository.GetDeviceOwner(id, GetUserId());
                return View(viewdeviceowner);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Create(String returnTo)
        {
            try
            {
                ViewBag.ReturnTo = returnTo;
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        } 

        [HttpPost]
        public ActionResult Create(ViewDeviceOwner viewdeviceowner, String returnTo)
        {
            try
            {
                if (viewdeviceowner != null)
                {
                    if (ModelState.IsValid)
                    {
                        var ownerId = _deviceOwnerRepository.AddDeviceOwner(viewdeviceowner, GetUserId());

                        return RedirectToAction("SelectOwner", new { id = ownerId, returnTo });
                    }
                }
                return View(viewdeviceowner);
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
                ViewDeviceOwner viewdeviceowner = _deviceOwnerRepository.GetDeviceOwner(id, GetUserId());
                return View(viewdeviceowner);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(ViewDeviceOwner viewdeviceowner)
        {
            try
            {
                if (viewdeviceowner != null)
                {
                    if (ModelState.IsValid)
                    {
                        _deviceOwnerRepository.UpdateDeviceOwner(viewdeviceowner, GetUserId());
                        return RedirectToAction("Index");
                    }
                }
                return View(viewdeviceowner);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        //
        // /DeviceOwner/SelectOwner
        //  the method finalizes the owner selection sequence
        public ActionResult SelectOwner(long id/*owner id.*/, String returnTo)
        {
            try
            {
                return RedirectToAction(""/*action result is empty because returnTo contains whole URL*/, returnTo, new { ownerID = id });
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
                var viewdeviceowner = _deviceOwnerRepository.GetDeviceOwner(id, GetUserId());
                return View(viewdeviceowner);
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
                _deviceOwnerRepository.DeleteDeviceOwner(id, GetUserId());
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Index()
        {
            throw new NotImplementedException();
        }
    }
}
