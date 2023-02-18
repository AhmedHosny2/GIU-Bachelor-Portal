using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_giu_gui
{
    public partial class Login_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void loginButton(object sender, EventArgs e)
        {
            if (empCheck.Checked)
            {
                EmpLoginButton(sender, e);
            }
            else
            {
                UserLoginButton(sender, e);
            }
        }
        protected void UserLoginButton(object sender, EventArgs e)
        {
            //add this 2 lines at the start of any function in c#
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            //here we declare variables  to store inputء
            string theEmail = email.Text;
            string thePassword = pass.Text;

            // means get the procedure  called UserRegister from connection use data base
            SqlCommand loginProc = new SqlCommand("UserLogin", connection);
            loginProc.CommandType = CommandType.StoredProcedure;


            //-------------put the input to proc-----------------
            // always has to be there
            loginProc.Parameters.Add(new SqlParameter("@email", theEmail));
            loginProc.Parameters.Add(new SqlParameter("@password", thePassword));

            // the output part
            // adding the outputs to the proc
            SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Bit);
            SqlParameter user_id = loginProc.Parameters.Add("@user_id", SqlDbType.Int);

            success.Direction = ParameterDirection.Output;
            user_id.Direction = ParameterDirection.Output;



            //execute the proc
            connection.Open();
            loginProc.ExecuteNonQuery();
            connection.Close();


            error1.Text = "";
            error2.Text = "";

            if (user_id.Value.ToString() == "-2")
            {
                error1.Text = "Invalid Email!";
            }
            else if (user_id.Value.ToString() == "-3")
            {
                error2.Text = "Invalid Password!";
            }
            else if (user_id.Value.ToString() == "-4")
            {
                error1.Text = "Invalid Email!";
                error2.Text = "Invalid Password!";
            }
            else
            {
                Session["user_id"] = user_id.Value.ToString();
                SqlCommand getType = new SqlCommand("GetUserType", connection);
                getType.CommandType = CommandType.StoredProcedure;

                string userID = Session["user_id"].ToString();
                getType.Parameters.Add(new SqlParameter("@user_id", userID));

                SqlParameter type = getType.Parameters.Add("@userType", SqlDbType.VarChar, 20);
                type.Direction = ParameterDirection.Output;

                //REDIRECT TO THE USER's PAGE!!!
                //error1.Text = "WORKED!";
                connection.Open();
                getType.ExecuteNonQuery();
                connection.Close();
                Session["user_type"] = type;
                if(type.Value.ToString() == "Students") {
                    Response.Redirect("Student_page.aspx");
                }
                else if (type.Value.ToString() == "Companies")
                {
                    Response.Redirect("Company_Page.aspx");
                }
                else if (type.Value.ToString() == "Lecturers")
                {
                    Response.Redirect("Lecturer_Page.aspx");
                }
                else if (type.Value.ToString() == "Teaching assistants")
                {
                    Response.Redirect("TA Page.aspx");
                }
                else if (type.Value.ToString() == "External examiners")
                {
                    Response.Redirect("External Examiner Page.aspx");
                }
                else if (type.Value.ToString() == "Coordinators")
                {
                    Response.Redirect("Coordniator Page.aspx");
                }
                System.Diagnostics.Debug.WriteLine(type.Value.ToString());
                //GET THE USER TYPE!!!
            }
        }

        protected void EmpLoginButton(object sender, EventArgs e)
        {
            //add this 2 lines at the start of any function in c#
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            //here we declare variables  to store input
            string theEmail = email.Text;
            string thePassword = pass.Text;

            // means get the procedure  called UserRegister from connection use data base
            SqlCommand loginProc = new SqlCommand("EmployeeLogin", connection);
            loginProc.CommandType = CommandType.StoredProcedure;


            //-------------put the input to proc-----------------
            // always has to be there
            loginProc.Parameters.Add(new SqlParameter("@email", theEmail));
            loginProc.Parameters.Add(new SqlParameter("@password", thePassword));

            // the output part
            // adding the outputs to the proc
            SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter user_id = loginProc.Parameters.Add("@user_id", SqlDbType.Int);

            success.Direction = ParameterDirection.Output;
            user_id.Direction = ParameterDirection.Output;



            //execute the proc
            connection.Open();
            loginProc.ExecuteNonQuery();
            connection.Close();


            error1.Text = "";
            error2.Text = "";

            if (user_id.Value.ToString() == "-2")
            {
                error1.Text = "Invalid Email!";
            }
            else if (user_id.Value.ToString() == "-3")
            {
                error2.Text = "Invalid Password!";
            }
            else if (user_id.Value.ToString() == "-4")
            {
                error1.Text = "Invalid Email!";
                error2.Text = "Invalid Password!";
            }
            else
            {
                //REDIRECT TO THE USER's PAGE!!!
                //error1.Text = "WORKED!";
                Session["user_id"] = user_id.Value.ToString();
                Response.Redirect("Employee_Page.aspx");

                Session["user_type"] = "Employee";
            }
        }









    }
}