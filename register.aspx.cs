using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
using System.Net;
using System.Text;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void save_btn_Click(object sender, EventArgs e)
    {
        warning.Text = "";
        success.Text = "";
        string sCode = "";

        if (email.Text.Length == 0)
        {
            warning.Text = "پست الکترونیک مشخص نشده است";
            return;
        }
        DataClassesDataContext db = new DataClassesDataContext();
        var mem_ex = db.members.SingleOrDefault(m=>m.Email==email.Text);
        if (mem_ex != null)
        {
            warning.Text = "کاربری با مشخصات فوق در سیستم ثبت نام شده است";
            if (send_email(mem_ex.Email,mem_ex.Activaation_code) == 0)
                success.Text = "خطا در ارسال ایمیل .  ";
            else
                success.Text = " جهت فعالسازی حساب ایجاد شده به آدرس ایمیل خود مراجعه نمایید .  ";

            return;
        }
        if (password.Text != repassword.Text)
        {
            warning.Text = "پسوردها مطابقت ندارند";
            return;
        }
        if (CheckingPasswordStrength(password.Text) < 3 )
        {
            warning.Text = "پسوردانتخاب شده مناسب نیست";
            return;
        }
        while (IsValid)
        {
            int iMin = (int)'a';
            int iMax = (int)'z';
            sCode = "";
            Random rnd = new Random();

            double yu, muia;
            int hjka;
            char op;
            for (int i = 0; i < 10; i++)
            {

                yu = rnd.NextDouble();
                muia = (yu * (iMax - iMin));
                hjka = (int)(muia + iMin);
                op = (char)(hjka);
                sCode = sCode + op;
            }
            var m = from n in db.members where n.Activaation_code == sCode select n;
            if (m.Count() == 0)
                break;
        }
        member mem = new member {name=name.Text,family=family.Text,Email=email.Text,id_cnt=int.Parse(mem_cnt.SelectedValue),phone=phone.Text,password=password.Text,ID_CARD="",acc_bank="",acc_num="",adrs="",Activaation_code=sCode,Activate=false };
        db.members.InsertOnSubmit(mem);
        db.SubmitChanges();

        if (send_email(email.Text, sCode) == 0)
            success.Text = "خطا در ارسال ایمیل .  ";
        else
            success.Text = "ثبت نام شماانجام شد. جهت فعالسازی حساب ایجاد شده به آدرس ایمیل خود مراجعه نمایید .  ";
    }

    public static int send_email(string email_address,string code_v)
    {
        try
        {
            SmtpClient MyMail = new SmtpClient();
            MailMessage MyMsg = new MailMessage();
            MyMail.Host = "mail.epolous.com";
            MyMsg.To.Add(new MailAddress(email_address));
            MyMsg.Subject = "درخواست تایید عضویت";
            MyMsg.IsBodyHtml = true;
            MyMsg.From = new MailAddress("info@epolous.com", "epolous");
            MyMsg.Body = "برای تایید عضویت در سایت Epolous.com <a href='http://www.epolous.com/verificationpage.aspx?custid=" + code_v + "'>اینجا کلیک کنید</a> ";
            MyMail.UseDefaultCredentials = false;
            NetworkCredential MyCredentials = new NetworkCredential("info@epolous.com", "9nt80Md_");
            MyMail.Credentials = MyCredentials;
            MyMail.Send(MyMsg);

        }
        catch
        {
            return 0;
        }
        return 1;
    }
    public static int CheckingPasswordStrength(string password)
    {
        /*
         *    
    Blank = 0,
    VeryWeak = 1,
    Weak = 2,
    Medium = 3,
    Strong = 4,
    VeryStrong = 5

         */
        int score = 1;
        if (password.Length < 1)
            return 0;
        if (password.Length < 4)
            return 1;

        if (password.Length >= 8)
            score++;
        if (password.Length >= 12)
            score++;
        if (Regex.IsMatch(password, @"[0-9]+(\.[0-9][0-9]?)?", RegexOptions.ECMAScript))   //number only //"^\d+$" if you need to match more than one digit.
            score++;
        if (Regex.IsMatch(password, @"^(?=.*[a-z])(?=.*[A-Z]).+$", RegexOptions.ECMAScript)) //both, lower and upper case
            score++;
        if (Regex.IsMatch(password, @"[!,@,#,$,%,^,&,*,?,_,~,-,£,(,)]", RegexOptions.ECMAScript)) //^[A-Z]+$
            score++;
        return score;
    }

}