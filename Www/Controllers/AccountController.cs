using System;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using web.Models;

namespace web.Controllers
{
    public class AccountController : PersonalizedController
    {
        private readonly AccountRepository _accountRepository;
        private readonly IDeviceTypeRepository _deviceTypeRepository;

        public AccountController()
        {
            _accountRepository = new AccountRepository();
            _deviceTypeRepository = new DeviceTypeRepository();
            _accountRepository.SetEntities(Entities);
            _deviceTypeRepository.SetEntities(Entities);
        }

        public ActionResult LogOn()
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
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (Membership.ValidateUser(model.UserName, model.Password))
                    {
                        FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                        if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                            && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                        {
                            return Redirect(returnUrl);
                        }
                        return RedirectToAction("Index", "Home");
                    }
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }

                // If we got this far, something failed, redisplay form
                return View(model);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult LogOff()
        {
            try
            {
                FormsAuthentication.SignOut();

                return RedirectToAction("Index", "Home");
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult Register()
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
        public ActionResult Register(RegisterModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    // Attempt to register the user
                    MembershipCreateStatus createStatus;
                    Membership.CreateUser(model.UserName, model.Password, model.Email,
                                          model.SecretQuestion, model.Answer, true, null, out createStatus);

                    if (createStatus == MembershipCreateStatus.Success)
                    {
                        Roles.AddUserToRole(model.UserName, "User");
                        FormsAuthentication.SetAuthCookie(model.UserName, false /* createPersistentCookie */);
                        //  Initializes users data.
                        //  GetUserID does not provide valid user identifier at this point yet.
                        //var userId = GetUserID();
                        var u = Membership.GetUser(model.UserName);
                        if (u != null && u.ProviderUserKey != null)
                        {
                            var userId = (Guid) u.ProviderUserKey;
                            var deviceTypeId =
                                _deviceTypeRepository.GetDeviceTypeList(userId, DeviceTypeRepository.VideoRecorder)
                                                     .First()
                                                     .ID;
                            _accountRepository.InitUserData(deviceTypeId, userId);
                        }
                        //  Redirects to start page.
                        return RedirectToAction("Index", "Home");
                    }
                    ModelState.AddModelError("", ErrorCodeToString(createStatus));
                }

                // If we got this far, something failed, redisplay form
                return View(model);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        [Authorize]
        public ActionResult ChangePassword()
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

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    // ChangePassword will throw an exception rather
                    // than return false in certain failure scenarios.
                    var changePasswordSucceeded = false;
                    try
                    {
                        var currentUser = Membership.GetUser(User.Identity.Name, true /* userIsOnline */);
                        if (currentUser != null)
                            changePasswordSucceeded = currentUser.ChangePassword(model.OldPassword, model.NewPassword);
                    }
                    catch (Exception)
                    {
                        changePasswordSucceeded = false;
                    }

                    if (changePasswordSucceeded)
                    {
                        return RedirectToAction("ChangePasswordSuccess");
                    }
                    ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
                }

                // If we got this far, something failed, redisplay form
                return View(model);
            }
            catch (Exception e)
            {
                ExceptionMessageToViewBag(e);
                return View("Error");
            }
        }

        public ActionResult ChangePasswordSuccess()
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

        #region Status Codes

        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return
                        "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return
                        "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return
                        "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return
                        "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }

        #endregion
    }
}