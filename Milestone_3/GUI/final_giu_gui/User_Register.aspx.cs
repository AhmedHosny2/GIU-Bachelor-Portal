using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;
using Microsoft.SqlServer.Server;
using System.Reflection.Emit;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Security.Principal;
using System.Net.Mail;

using System.Net;
using System.Net.Mail;
using SendGrid.Helpers.Mail;
using SendGrid;
using System.Threading.Tasks;

namespace final_giu_gui
{
    public partial class User_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Register(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            String Username = user_name.Text;
            String Email = email.Text;
            String Type = user_type.Value;
            String Phone = phone_number.Text;

            if (Username != "" && Email != "" && Type != "" && Phone != "")
            {
                switch (Type)
                {
                    case "Student": //add this 2 lines at the start of any function in c#
                                    //here we declare variables  to store input 
                        string First_name = first_name.Text;
                        string Last_name = last_name.Text;
                        string Major_code = major_code.Text;
                        string Address = addr1.Text;
                        int Semester = Convert.ToInt32(semester.Text);
                        decimal Gpa = Convert.ToDecimal(gpa.Text);
                        DateTime Date = Convert.ToDateTime(date.Text); // may be wrong*/
                                                                       // means get the procedure  called UserRegister from connection use data base
                        SqlCommand loginproc = new SqlCommand("UserRegister", connection);
                        loginproc.CommandType = CommandType.StoredProcedure;
                        //put the input into the procd 
                        //USELESS FOR DEBUGIN ONLY !!!!!!!!!!!
                        //start 

                        loginproc.Parameters.Add(new SqlParameter("@usertype", "Students"));
                        loginproc.Parameters.Add(new SqlParameter("@userName", Username));
                        loginproc.Parameters.Add(new SqlParameter("@email", Email));
                        loginproc.Parameters.Add(new SqlParameter("@phone_number", Phone));

                        loginproc.Parameters.Add(new SqlParameter("@first_name", First_name));
                        loginproc.Parameters.Add(new SqlParameter("@last_name", Last_name));
                        loginproc.Parameters.Add(new SqlParameter("@birth_date", Date));
                        loginproc.Parameters.Add(new SqlParameter("@GPA", Gpa));
                        loginproc.Parameters.Add(new SqlParameter("@semester", Semester));
                        loginproc.Parameters.Add(new SqlParameter("@address", Address));
                        loginproc.Parameters.Add(new SqlParameter("@faculty_code", ""));
                        loginproc.Parameters.Add(new SqlParameter("@major_code", Major_code));
                        loginproc.Parameters.Add(new SqlParameter("@company_name", ""));
                        loginproc.Parameters.Add(new SqlParameter("@representative_name", ""));
                        loginproc.Parameters.Add(new SqlParameter("@representative_email", ""));
                        // always has to be there

                        loginproc.Parameters.Add(new SqlParameter("@country_of_residence", ""));
                        // the output part 
                        SqlParameter user_id = loginproc.Parameters.Add("@users_id", SqlDbType.Int);    //adding output to proc
                        SqlParameter password = loginproc.Parameters.Add("@password", SqlDbType.VarChar, 20);
                        user_id.Direction = ParameterDirection.Output;
                        password.Direction = ParameterDirection.Output;
                        //execute proc
                        connection.Open();
                        loginproc.ExecuteNonQuery();
                        connection.Close();
                        //  if (users_id.Value.ToString() != "-1") // we need to chcek if the student register successfully 
                        // after the ? mark to pass paramter to the next page , credit : <https://social.msdn.microsoft.com/Forums/en-US/e54229d7-a8fc-4329-963f-d411d6bdf07c/responseredirect-in-c-for-page-to-page-parameter-passing?forum=aspwebforms>
                        // Response.Redirect(".aspx?id=user____id");
                        if (password.Value.Equals("-1"))
                        {
                            Label2.InnerText = "Please enter another Mail/Username, " + Email + "/" + Username + " already exists!";
                        }
                        else
                        {
                            form1.Visible = false;
                            form2.Visible = true;
                            IDVal.InnerText = "" + user_id.Value;
                            PassVal.InnerText = "" + password.Value;
                            Execute(Email, user_id.Value.ToString(), password.Value.ToString());
                        }
                        break;
                    case "Company":
                        //here we declare variables  to store input
                        string companyName = compName.Text;
                        string repName = rep_name.Text;
                        string repEmail = rep_email.Text;
                        string address = addr.Text;
                        // means get the procedure  called UserRegister from connection use data base
                        SqlCommand registerProc = new SqlCommand("UserRegister", connection);
                        registerProc.CommandType = CommandType.StoredProcedure;
                        //-------------put the input to proc-----------------
                        // always has to be there
                        registerProc.Parameters.Add(new SqlParameter("@usertype", "Companies"));
                        registerProc.Parameters.Add(new SqlParameter("@userName", Username));
                        registerProc.Parameters.Add(new SqlParameter("@email", Email));

                        registerProc.Parameters.Add(new SqlParameter("@first_name", ""));
                        registerProc.Parameters.Add(new SqlParameter("@last_name", ""));
                        registerProc.Parameters.Add(new SqlParameter("@birth_date", ""));
                        registerProc.Parameters.Add(new SqlParameter("@GPA", 1));
                        registerProc.Parameters.Add(new SqlParameter("@semester", 1));
                        registerProc.Parameters.Add(new SqlParameter("@address", address));
                        registerProc.Parameters.Add(new SqlParameter("@faculty_code", ""));
                        registerProc.Parameters.Add(new SqlParameter("@major_code", ""));
                        registerProc.Parameters.Add(new SqlParameter("@company_name", companyName));
                        registerProc.Parameters.Add(new SqlParameter("@representative_name", repName));
                        registerProc.Parameters.Add(new SqlParameter("@representative_email", repEmail));
                        // always has to be there
                        registerProc.Parameters.Add(new SqlParameter("@phone_number", Phone));

                        registerProc.Parameters.Add(new SqlParameter("@country_of_residence", ""));
                        /*loginproc.Parameters.Add(new SqlParameter("@company_name", "compNameTest"));
                        loginproc.Parameters.Add(new SqlParameter("@representative_name", "repnameTest"));
                        loginproc.Parameters.Add(new SqlParameter("@representative_email", "repEmailTest"));
                        loginproc.Parameters.Add(new SqlParameter("@address", "addrTest"));*/
                        // the output part
                        // adding the outputs to the proc
                        SqlParameter user_id1 = registerProc.Parameters.Add("@users_id", SqlDbType.Int);
                        SqlParameter password1 = registerProc.Parameters.Add("@password", SqlDbType.VarChar, 20);
                        user_id1.Direction = ParameterDirection.Output;
                        password1.Direction = ParameterDirection.Output;

                        //Response.Write("succeded");
                        //Console.WriteLine("\n\nUser id is: "+user_id+"\n\npassword is: "+password);

                        //execute the proc
                        connection.Open();
                        registerProc.ExecuteNonQuery();
                        connection.Close();

                        if (password1.Value.Equals("-1"))
                        {
                            Label2.InnerText = "Please enter another Mail/Username, " + Email + "/" + Username + " already exists!";
                        }
                        else
                        {
                            form1.Visible = false;
                            form2.Visible = true;
                            IDVal.InnerText = "" + user_id1.Value;
                            PassVal.InnerText = "" + password1.Value;
                            Execute(Email, user_id1.Value.ToString(), password1.Value.ToString());
                        }

                        /*Response.Write("succeded");
                        // after the ? mark to pass paramter to the next page , credit : <https://social.msdn.microsoft.com/Forums/en-US/e54229d7-a8fc-4329-963f-d411d6bdf07c/responseredirect-in-c-for-page-to-page-parameter-passing?forum=aspwebforms>
                        // Response.Redirect(".aspx?id=user____id");
                        Session["sid"] = user_id.Value;
                        var idd = (user_id.Value);
                        Response.Write(idd + " " + user_id + " " + user_id.Value + " " + password.Value);
                        Response.Redirect("Student.aspx");*/
                        break;
                    default:
                        SqlCommand regProc = new SqlCommand("UserRegister", connection);
                        regProc.CommandType = CommandType.StoredProcedure;

                        regProc.Parameters.Add(new SqlParameter("@userName", Username));
                        regProc.Parameters.Add(new SqlParameter("@email", Email));
                        regProc.Parameters.Add(new SqlParameter("@usertype", Type));
                        regProc.Parameters.Add(new SqlParameter("@phone_number", Phone));

                        regProc.Parameters.Add(new SqlParameter("@first_name", ""));
                        regProc.Parameters.Add(new SqlParameter("@last_name", ""));
                        regProc.Parameters.Add(new SqlParameter("@birth_date", ""));
                        regProc.Parameters.Add(new SqlParameter("@GPA", 1));
                        regProc.Parameters.Add(new SqlParameter("@semester", 1));
                        regProc.Parameters.Add(new SqlParameter("@address", ""));
                        regProc.Parameters.Add(new SqlParameter("@faculty_code", 1));
                        regProc.Parameters.Add(new SqlParameter("@major_code", 1));
                        regProc.Parameters.Add(new SqlParameter("@company_name", ""));
                        regProc.Parameters.Add(new SqlParameter("@representative_name", ""));
                        regProc.Parameters.Add(new SqlParameter("@representative_email", ""));
                        regProc.Parameters.Add(new SqlParameter("@country_of_residence", ""));

                        SqlParameter userID = regProc.Parameters.Add("@users_id", SqlDbType.Int);
                        SqlParameter Password = regProc.Parameters.Add("@password", SqlDbType.VarChar, 20);

                        userID.Direction = ParameterDirection.Output;
                        Password.Direction = ParameterDirection.Output;

                        connection.Open();
                        regProc.ExecuteNonQuery();
                        connection.Close();
                        if (Password.Value.Equals("-1"))
                        {
                            Label2.InnerText = "Please enter another Mail/Username, " + Email + "/" + Username + " already exists!";
                        }
                        else
                        {
                            form1.Visible = false;
                            form2.Visible = true;
                            IDVal.InnerText = "" + userID.Value;
                            PassVal.InnerText = "" + Password.Value;
                            Execute(Email, userID.Value.ToString(), Password.Value.ToString());
                        }
                        break;
                }
            }
            else
            {
                Label2.InnerText = "Please fill in all parameters!";
            }
        }

        protected void Continue(object sender, EventArgs e)
        {
            Response.Redirect("Login_Page.aspx");
        }

        static void Execute(string email, string userID, string password)
        {
            var apiKey = "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";
            var client = new SendGridClient(apiKey);
            var from = new EmailAddress("youfiarg@gmail.com", "Example User");
            var subject = "EMAIL VERIFICATION containing your 'EMAIL', 'USER-ID' and 'PASSWORD'";
            var to = new EmailAddress(email, "Example User");
            var plainTextContent = "and easy to do anywhere, even with C#";
            var htmlContent =   "Hello newly registered User: " + userID + "<br/><br/><br/>" +
                               "Weclome to the GIU!" + "<br/>" +
                               "Please find your User Details below." + "<br/><br/>" +
                                "Email: " + email + "<br/>" +
                                "User_ID: " + userID + "<br/>" +
                                "Password: " + password + "<br/>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = client.SendEmailAsync(msg);
        }


    }
}