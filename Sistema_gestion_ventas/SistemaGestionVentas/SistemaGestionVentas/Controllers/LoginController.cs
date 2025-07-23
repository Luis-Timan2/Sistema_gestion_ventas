using Microsoft.AspNetCore.Mvc;

namespace SistemaGestionVentas.Controllers
{
    public class LoginController : Controller
    {
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
    }
}
