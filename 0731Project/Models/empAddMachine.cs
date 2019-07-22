using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _0731Project.Models
{
    public class empAddMachine
    {
        public string Account { get; set; }
        public int EmployeeID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string PhoneNum { get; set; }
        public string Sex { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Birthday { get; set; }
        public string AddDate { get; set; }
        public string UpdateTime { get; set; }
        public Nullable<int> Permission { get; set; }
    }
}