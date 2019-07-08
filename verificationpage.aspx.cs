using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verificationpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["custid"].ToString() != null)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            var mem = db.members.SingleOrDefault(n => n.Activaation_code == Request.QueryString["custid"].ToString());
            if (mem != null)
            {
                mem.Activate = true;
                db.SubmitChanges();
                message.Text = "عضویت شما فعال شد";
            }
            else
            {
                message.Text = "کاربر یافت نشد";
            }
            return;
        }
    }
}