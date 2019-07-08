using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Session["id_member"] = null;
            FillCapctha();
        }
    }

    protected void enter_btn_Click(object sender, EventArgs e)
    {
        if (Session["captcha"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('کد وارد شده نامعتبر است');", true);
            FillCapctha();
            return;
        }
        if (Session["captcha"].ToString().ToLower() != txtCaptcha.Text.ToLower())
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('کد وارد شده نامعتبر است');", true);
            FillCapctha();
            return;
        }
        
        DataClassesDataContext db = new DataClassesDataContext();
        var mem = db.members.SingleOrDefault(n => n.Email == username.Text);
        if (mem == null)
        {
            warning.Text = " نام کاربری وارد شده در سامانه ثبت نشده است";
            return;
        }
        if (mem.password != pass.Text)
        {
            warning.Text = "پسورد وارد شده صحیح نیست";
            return;
        }
        if (mem.Activate != true)
        {
            warning.Text = "(عضویت شما هنوز فعال نشد است. لطفا از طریق لینک فعالسازی که برای شما ایمیل شده است استفاده کنید (پوشه اسپم را کنترل کنید";
            return;
        }
        Session["id_member"] = mem.id_member.ToString();
        Response.Redirect("members/Default.aspx");
    }

    protected void register_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }
    void FillCapctha()
    {
        try
        {
            Random random = new Random();
            string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            StringBuilder captcha = new StringBuilder();
            for (int i = 0; i < 4; i++)
                captcha.Append(combination[random.Next(combination.Length)]);
            Session["captcha"] = captcha.ToString();
            imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
        }
        catch
        {
            throw;
        }

    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        FillCapctha();
    }
}