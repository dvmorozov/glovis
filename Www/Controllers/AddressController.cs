using System;
using System.Web.Mvc;
using web.Models;

namespace web.Controllers
{
    [Authorize(Roles = "Administrator, User")]
    public class AddressController : PersonalizedController
    {
        private IAddressRepository _addressRepository;

        private void SetRepository(IAddressRepository r, GlovisMasterBaseEntities e)
        {
            _addressRepository = r;
            r.SetEntities(e);
        }

        public AddressController()
        {
            SetRepository(new AddressRepository(), Entities);
        }

        public AddressController(AddressRepository r)
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
                ViewBag.ReturnTo = "Address/Index";
                return View(_addressRepository.GetAddressList(GetUserId()));
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ViewResult Details(long id, String returnTo)
        {
            try
            {
                var viewaddress = _addressRepository.GetAddress(id, GetUserId());
                ViewBag.ReturnTo = returnTo;
                return View(viewaddress);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult CreateApartament(long id/*building identifier*/, long streetId, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                ViewBag.ReturnTo = returnTo;
                ViewBag.CountryID = countryId;
                ViewBag.StateID = stateId;
                ViewBag.CityID = cityId;
                ViewBag.StreetID = streetId;
                ViewBag.BuildingID = id;
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult CreateApartament(ViewAddress viewaddress, long buildingId, long streetId, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _addressRepository.AddApartament(viewaddress, GetUserId());
                    return RedirectToAction("SelectApartament", new { id = buildingId, streetID = streetId, cityID = cityId, stateID = stateId, countryID = countryId, returnTo });
                }
                return View(viewaddress);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult CreateBuilding(long id/*street identifier*/, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                ViewBag.ReturnTo = returnTo;
                ViewBag.CountryID = countryId;
                ViewBag.StateID = stateId;
                ViewBag.CityID = cityId;
                ViewBag.StreetID = id;
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult CreateBuilding(ViewAddress viewaddress, long streetId, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _addressRepository.AddBuilding(viewaddress, GetUserId());
                    return RedirectToAction("SelectBuilding", new { id = streetId, cityID = cityId, stateID = stateId, countryID = countryId, returnTo });
                }
                return View(viewaddress);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult CreateStreet(long id/*city identifier*/, long stateId, long countryId, String returnTo)
        {
            try
            {
                ViewBag.ReturnTo = returnTo;
                ViewBag.CityID = id;
                ViewBag.StateID = stateId;
                ViewBag.CountryID = countryId;
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult CreateStreet(ViewAddress viewaddress, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _addressRepository.AddStreet(viewaddress, GetUserId());
                    return RedirectToAction("SelectStreet", new { id = cityId, stateID = stateId, countryID = countryId, returnTo });
                }
                return View(viewaddress);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult CreateCity(long id/*state identifier*/, long countryId, String returnTo)
        {
            try
            {
                ViewBag.ReturnTo = returnTo;
                ViewBag.StateID = id;
                ViewBag.CountryID = countryId;
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult CreateCity(ViewAddress viewaddress, long stateId, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _addressRepository.AddCity(viewaddress, GetUserId());
                    return RedirectToAction("SelectCity", new { id = stateId, countryID = countryId, returnTo });
                }
                return View(viewaddress);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult CreateState(long id/*country identifier*/, String returnTo)
        {
            try
            {
                ViewBag.ReturnTo = returnTo;
                ViewBag.CountryID = id;
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult CreateState(ViewAddress viewaddress, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _addressRepository.AddState(viewaddress, GetUserId());
                    return RedirectToAction("SelectState", new { id = countryId, returnTo });
                }
                return View(viewaddress);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult CreateCountry(String returnTo)
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
        public ActionResult CreateCountry(ViewAddress viewaddress, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _addressRepository.AddCountry(viewaddress, GetUserId());
                    return RedirectToAction("SelectCountry", new { returnTo });
                }
                return View(viewaddress);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult CreateZipCode(long id/*apartament identifier*/, long buildingId, long streetId, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                ViewBag.ReturnTo = returnTo;
                ViewBag.ApartamentID = id;
                ViewBag.BuildingID = buildingId;
                ViewBag.StreetID = streetId;
                ViewBag.CityID = cityId;
                ViewBag.StateID = stateId;
                ViewBag.CountryID = countryId;
                return View();
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult CreateZipCode(ViewAddress viewaddress, long apartamentId, long buildingId, long streetId, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _addressRepository.AddZipCode(viewaddress, GetUserId());
                    return RedirectToAction("SelectZipCode", new { id = apartamentId, buildingID = buildingId, streetID = streetId, cityID = cityId, stateID = stateId, countryID = countryId, returnTo });
                }
                return View(viewaddress);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Select(String returnTo)
        {
            try
            {
                //return View();
                return RedirectToAction("SelectCountry", new { returnTo });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult SelectState(long id/*country identifier*/, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ViewBag.ReturnTo = returnTo;
                    ViewBag.CountryID = id;
                    return View(_addressRepository.GetStateList(id, GetUserId()));
                }

                return RedirectToAction("SelectCountry", new { returnTo });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
        
        public ActionResult SelectCity(long id/*state identifier*/, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ViewBag.ReturnTo = returnTo;
                    ViewBag.StateID = id;
                    ViewBag.CountryID = countryId;
                    return View(_addressRepository.GetCityList(id, countryId, GetUserId()));
                }

                return RedirectToAction("SelectState", new { id = countryId, returnTo });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult SelectStreet(long id/*city identifier*/, long stateId, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ViewBag.ReturnTo = returnTo;
                    ViewBag.CityID = id;
                    ViewBag.StateID = stateId;
                    ViewBag.CountryID = countryId;
                    return View(_addressRepository.GetStreetList(id, stateId, countryId, GetUserId()));
                }

                return RedirectToAction("SelectCity", new { id = stateId, countryID = countryId, returnTo });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult SelectBuilding(long id/*street identifier*/, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ViewBag.ReturnTo = returnTo;
                    ViewBag.StreetID = id;
                    ViewBag.CityID = cityId;
                    ViewBag.StateID = stateId;
                    ViewBag.CountryID = countryId;
                    return View(_addressRepository.GetBuildingList(id, cityId, stateId, countryId, GetUserId()));
                }

                return RedirectToAction("SelectStreet", new { id = cityId, stateID = stateId, countryID = countryId, returnTo });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult SelectApartament(long id/*building identifier*/, long streetId, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ViewBag.ReturnTo = returnTo;
                    ViewBag.BuildingID = id;
                    ViewBag.StreetID = streetId;
                    ViewBag.CityID = cityId;
                    ViewBag.StateID = stateId;
                    ViewBag.CountryID = countryId;
                    return View(_addressRepository.GetApartamentList(id, streetId, cityId, stateId, countryId, GetUserId()));
                }

                return RedirectToAction("SelectBuilding", new { id = streetId, cityID = cityId, stateID = stateId, countryID = countryId, returnTo });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        /*all parameters are necessary because this form is last in the form chain*/
        public ActionResult SelectZipCode(long id/*apartament identifier*/, long buildingId, long streetId, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ViewBag.ReturnTo = returnTo;
                    ViewBag.ApartamentID = id;
                    ViewBag.BuildingID = buildingId;
                    ViewBag.StreetID = streetId;
                    ViewBag.CityID = cityId;
                    ViewBag.StateID = stateId;
                    ViewBag.CountryID = countryId;
                    return View(_addressRepository.GetZipCodeList(countryId, GetUserId()));
                }

                return RedirectToAction("SelectApartament", new { id = buildingId, streetID = streetId, cityID = cityId, stateID = stateId, countryID = countryId, returnTo });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }
        
        public ActionResult SelectCountry(String returnTo)
        {
            try
            {
                /*the beginning of address selection sequence*/
                ViewBag.ReturnTo = returnTo;
                return View(_addressRepository.GetCountryList(GetUserId()));
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult SelectAddress(long id/*zip code id.*/, long apartamentId, long buildingId, long streetId, long cityId, long stateId, long countryId, String returnTo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var v = new ViewAddress
                        {
                            ApartamentID = apartamentId,
                            BuildingID = buildingId,
                            StreetID = streetId,
                            CityID = cityId,
                            StateID = stateId,
                            CountryID = countryId,
                            ZipCodeID = id
                        };
                    long? addrId = null;
                    if (ModelState.IsValid)
                    {
                        addrId = _addressRepository.AddAddressSet(v, GetUserId());
                    }
                    //  method returns to standard method of given controller (may be this) to complete address setup
                    return null != addrId ? RedirectToAction(""/*action result is empty because returnTo contains whole URL*/, returnTo, new { addressID = (Int64)addrId }) : RedirectToAction("", returnTo);
                }
                
                return RedirectToAction("SelectApartament", new { id = buildingId, streetID = streetId, cityID = cityId, stateID = stateId, countryID = countryId, returnTo });
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult SetAddress(long zipCodeId, long apartamentId, long buildingId, long streetId, long cityId, long stateId, long countryId)
        {
            try
            {
                return RedirectToAction("Index");
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
                var viewaddress = _addressRepository.GetAddress(id, GetUserId());
                return View(viewaddress);
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
                _addressRepository.DeleteAddress(id, GetUserId());
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