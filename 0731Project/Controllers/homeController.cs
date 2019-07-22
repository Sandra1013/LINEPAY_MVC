using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using _0731Project.Models;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System.IO;
using System.Threading;
using QRCoder;
using System.Drawing;
using System.Drawing.Imaging;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;





namespace _0731Project.Controllers
{
    public class homeController : Controller
    {

        WiseMachineEntities db = new WiseMachineEntities();
        // GET: home
        public ActionResult Index()
        {

            if (Session["Member"] == null)
            {
                return RedirectToAction("Login");
            }
            var query = from objE in db.EmpDbs
                        from objM in db.MachineDbs
                        where objE.MachineId == objM.MachineId
                        select objE;

            return View(query.ToList());
        }

        //登入
        [HttpGet]
        public ActionResult Login()
        {
            Session.RemoveAll();
            return View();

        }
        [HttpPost]
        public ActionResult Login(string useracc, string userpw)
        {
            Session.RemoveAll();
            var member = db.EmpDbs.Where(m => m.Account == useracc && m.PassWord == userpw).FirstOrDefault();
            if (member == null)
            {
                ViewBag.msg = "無此帳號或密碼錯誤,請聯絡管理員.";
                return View();
            }
            Session["Welcome"] = "歡迎回來, " + member.UserName;
            Session["Member"] = member;
            return RedirectToAction("Index");

        }

        //員工狀態
        public ActionResult EmployeeCondition()
        {
            if (Session["Member"] == null)
            {
                return RedirectToAction("Login");
            }
            var query = from obj in db.EmpDbs
                        select obj;
            return View(query.ToList());
        }

        //員工狀態修改
        [HttpPost]
        public ActionResult EmployeeCondition(string ename ,string eassi, string emach, string eacc)
        {
            var query = from obj in db.EmpDbs
                        select obj;
            //卡登入
            if (Session["Member"] == null)
            {
                return RedirectToAction("Login");
            }
            //卡上班狀態
            if (eassi == "上班")
            {
                eassi = "1";
            }
            else if (eassi == "請假" || eassi == "0")
            {
                eassi = "0";
                emach = "0";
            }
            
            EmpDb emp = new EmpDb
            {
                UserName = ename,
                Assignment = Convert.ToInt32(eassi),
                MachineId = emach,
                Account = eacc
            };
            
            db.Entry(emp).State = EntityState.Modified;
            db.Entry(emp).Property(m => m.PassWord).IsModified = false;
            db.Entry(emp).Property(m => m.PhoneNum).IsModified = false;
            db.Entry(emp).Property(m => m.Sex).IsModified = false;
            db.Entry(emp).Property(m => m.Email).IsModified = false;
            db.Entry(emp).Property(m => m.Address).IsModified = false;
            db.Entry(emp).Property(m => m.AddDate).IsModified = false;
            db.Entry(emp).Property(m => m.Birthday).IsModified = false;
            db.Entry(emp).Property(m => m.UpdateTime).IsModified = false;
            db.Entry(emp).Property(m => m.Permission).IsModified = false;
            db.SaveChanges();
            return View(query.ToList());
        }

        //員工任務編輯
        public ActionResult EmployeeConditionEdit()
        {
            var query = from obj in db.EmpDbs
                        select obj;
            return View(query.ToList());
            //IQueryable<EmpDb> empM = empMethod();

        }

        [HttpPost]
        public ActionResult EmployeeConditionEdit(string ename, string eassi, string emach)
        {
            var query = from obj in db.EmpDbs
                        select obj;
            return View(query.ToList());
            //IQueryable<EmpDb> empM = empMethod();

        }


        //員工編輯
        [HttpGet]
        public ActionResult EmployeeEdit()
        {
            if (Session["Member"] == null)
            {
                return RedirectToAction("Login");
            }
            var query = from obj in db.EmpDbs
                        select obj;
            return View(query.ToList());
            //IQueryable<EmpDb> empM = empMethod();
        }
        [HttpPost]
        public ActionResult EmployeeEdit(string ename, string eacc, string epw, string epho, string edate, string esex, string ebir, string email, string eaddr, string eper)
        {
            if (Session["Member"] == null)
            {
                return RedirectToAction("Login");
            }
            var query = from obj in db.EmpDbs
                        select obj;
            //if (edate != "yyyy/MM/dd" || edate != "yyyy-MM-dd")
            //{
            //    ViewBag.msg = "日期錯誤,請重新輸入";
            //}
            //var emp = db.EmpDbs.Find(ename);


            EmpDb emp = new EmpDb
            {
                UserName = ename,
                Account = eacc,
                PassWord = epw,
                PhoneNum = epho,
                AddDate = edate.Replace('-', '/'),
                Sex = esex,
                Birthday = ebir.Replace('-', '/'),
                Email = email,
                Address = eaddr,
                UpdateTime = DateTime.Now.ToString("yyyy/MM/dd"),
                Permission = Convert.ToInt32(eper),
            };
            db.Entry(emp).State = EntityState.Modified;
            db.Entry(emp).Property(m => m.Assignment).IsModified = false;
            db.Entry(emp).Property(m => m.MachineId).IsModified = false;
            db.SaveChanges();

            return View(query.ToList());

            //IQueryable<EmpDb> empM = empMethod();
        }

        //機臺狀態
        public ActionResult MachineCondition()
        {
            if (Session["Member"] == null)
            {
                return RedirectToAction("Login");
            }
            IQueryable<MachineDb> machineM = machineMethod();
            return View(machineM.ToList());
        }

        //機臺編輯
        public ActionResult MachineEdit()
        {
            if (Session["Member"] == null)
            {
                return RedirectToAction("Login");
            }
            return View();
        }



        //===================Method========================================
        //員工
        //private IQueryable<EmpDb> empMethod()
        //{
        //    //return from objE in db.EmpDbs
        //    //       join objM in db.MachineDbs on objE.MachineId equals objM.MachineId
        //    //       where objM.MachineId == 1
        //    //       select new {
        //    //           name = objE.UserName,
        //    //           id = objM.MachineId
        //    //       };
        //}

        //機臺
        private IQueryable<MachineDb> machineMethod()
        {
            return from obj in db.MachineDbs
                   select obj;
        }




        public ActionResult Index1()
        {
            var hotItem = db.ItemDbs.Where(m => m.Slogen2.Contains("TOP")).OrderBy(m => m.Slogen2).ToList();
            return View("Index1","_Layout1",hotItem);
        }

        public ActionResult Product()
        {
            var product = db.ItemDbs.ToList();
            return View("Product", "_Layout1",product);
        }

        public ActionResult LinePay(int ItemId)
        {
            var Item = db.ItemDbs.Where(m => m.ItemId == ItemId).SingleOrDefault();
            ChromeOptions chromeBrowserOptions = new ChromeOptions();
            //需要阻擋跳出視窗時，可將下面註解移除
            chromeBrowserOptions.AddArgument("--headless");
            IWebDriver driver = new ChromeDriver(chromeBrowserOptions);
            //開啟網頁
            driver.Navigate().GoToUrl("http://fs.mis.kuas.edu.tw/~s1105137233/LINE-Pay-PHP-Tutorial-master/Example/index.php");
            //隱式等待 - 直到畫面跑出資料才往下執行
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(2);
            //輸入商家 ID
            IWebElement inputchannelId = driver.FindElement(By.Name("channelId"));
            //清除按鈕
            inputchannelId.Clear();
            inputchannelId.SendKeys("1597611346");

            //輸入商家密鑰
            IWebElement inputchannelSecret = driver.FindElement(By.Name("channelSecret"));
            inputchannelSecret.Clear();
            inputchannelSecret.SendKeys("65dc3f3d1b562a3028cbd52b5a3d57a6");

            //輸入商品名稱
            IWebElement inputproductName = driver.FindElement(By.Name("productName"));
            inputproductName.Clear();
            inputproductName.SendKeys(Item.ItemName);

            string guid = Guid.NewGuid().ToString().Substring(0, 8);
            //輸入訂單編號
            IWebElement inputorderId = driver.FindElement(By.Name("orderId"));
            inputorderId.Clear();
            inputorderId.SendKeys(guid);

            //輸入訂單照片
            IWebElement inputproductImageUrl = driver.FindElement(By.Name("productImageUrl"));
            inputproductImageUrl.Clear();
            inputproductImageUrl.SendKeys(Item.ImgUrl);

            //輸入訂單金額
            IWebElement inputamount = driver.FindElement(By.Name("amount"));
            inputamount.Clear();
            inputamount.SendKeys(Item.ItemUnitPrice.ToString());

            ////點擊執行
            IWebElement submitButton = driver.FindElement(By.XPath("//*[@id='reserveForm']/div[2]/div[2]/div[7]/div/input"));
            submitButton.Click();

            IWebElement LinkButton = driver.FindElement(By.XPath("/html/body/div[2]/div/div[2]/a"));
            string Link = driver.FindElement(By.XPath("/html/body/div[2]/div/div[2]/a")).GetAttribute("href");
            Item.PayUrl = Link;
            db.SaveChanges();
            LinkButton.Click();

            using (MemoryStream ms = new MemoryStream())
            {
                var index = Link.IndexOf("?");
                string insert = "PreLogin";
                Link = Link.Insert(index, insert);
                var qrcode = Link + "&qrLogin=Y";

                QRCodeGenerator qrGenerator = new QRCodeGenerator();
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(qrcode, QRCodeGenerator.ECCLevel.Q);
                QRCode qrCode = new QRCode(qrCodeData);
                using (Bitmap bitMap = qrCode.GetGraphic(20))
                {
                    bitMap.Save(ms, ImageFormat.Png);
                    ViewBag.QRCodeImage = "data:image/png;base64," + Convert.ToBase64String(ms.ToArray());
                }
            }

            return View("QrCode", "_Layout1");
            List<string> lstWindow = driver.WindowHandles.ToList();
            driver.SwitchTo().Window(lstWindow[1]);
            while (true)
            {
                string url = driver.Url;
                if (url.Contains("transactionId")) { driver.Quit(); break; }
            }
            return View("QrCode", "_Layout1");
        }

        public ActionResult QrCode()
        {
            return View("QrCode", "_Layout1");
        }

        public ActionResult PayOK()
        {
            return View("PayOK", "_Layout2");
        }

        private static Dictionary<string, object> OrderTransactions = new Dictionary<string, object>();

        public ActionResult Index3()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> Reserve(int ItemId, bool capture = true){

            var item = db.ItemDbs.Where(m => m.ItemId == ItemId).SingleOrDefault();
            var param = new
            {
                productName = item.ItemName,
                productImageUrl = item.ImgUrl,
                amount = item.ItemUnitPrice,
                currency = "TWD",
                confirmUrl = "http://localhost:50237/home/Confirm",
                orderId = $"ORDER-{DateTime.Now:yyyyMMdd_HHmmss}",
                capture = capture
            };

            // *** call RESERVE API
            var responseJson = await RequestGateway("request", param);
            dynamic responseObj = JObject.Parse(responseJson);
            ViewBag.ResponseJson = JsonConvert.SerializeObject(responseObj, Formatting.Indented);
            if (responseObj.returnCode == "0000")
            {
                OrderTransactions[responseObj.info.transactionId.ToString()] = param;
                ViewBag.PaymentUrl = responseObj.info.paymentUrl.web;
            }
            string PaymentUrl = responseObj.info.paymentUrl.web;

            return Redirect(PaymentUrl);

        }

        [HttpGet]
        public async Task<ActionResult> Confirm(string transactionId)
        {
            dynamic transaction = OrderTransactions[transactionId];

            var param = new
            {
                amount = transaction.amount,
                currency = transaction.currency
            };

            // *** call CONFIRM API
            var responseJson = await RequestGateway($"{transactionId}/confirm", param);
            dynamic responseObj = JObject.Parse(responseJson);
            ViewBag.ResponseJson = JsonConvert.SerializeObject(responseObj, Formatting.Indented);

            if (responseObj.returnCode == "0000")
            {
                ViewBag.TransactionId = transactionId;
                ViewBag.Captured = transaction.capture;
            }

            return RedirectToAction("PayOK");
        }

        private async Task<string> RequestGateway(string path, object param)
        {
            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Add("X-LINE-ChannelId", "1597611346");
                client.DefaultRequestHeaders.Add("X-LINE-ChannelSecret", "65dc3f3d1b562a3028cbd52b5a3d57a6");

                var content = new StringContent(JsonConvert.SerializeObject(param), Encoding.UTF8, "application/json");

                var response = await client.PostAsync("https://sandbox-api-pay.line.me/v2/payments/" + path, content);
                return await response.Content.ReadAsStringAsync();
            }
        }


    }

}