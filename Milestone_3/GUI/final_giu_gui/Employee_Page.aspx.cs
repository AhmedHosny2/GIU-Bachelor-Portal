using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Reflection.Emit;
using System.Xml.Linq;

namespace final_giu_gui
{
    public partial class Employee_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }


        protected void ViewBachelor(object sender, EventArgs e)//viewProfile
        {
            String res = "";
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            SqlCommand proc = new SqlCommand("ViewBachelorProjects", connection);
            proc.CommandType = CommandType.StoredProcedure;
            string projtyrpe = Project_type_list.Text;
            String UserID = BachelorsUser_ID.Text;

            proc.Parameters.Add(new SqlParameter("@ProjectType", projtyrpe));
            proc.Parameters.Add(new SqlParameter("@User_id", UserID));

            connection.Open();

            DataTable bachelorProj = new DataTable();

            bachelorProj.Columns.AddRange(new DataColumn[10] {
                new DataColumn("sid"), new DataColumn("code"), new DataColumn("Name"),
                new DataColumn("Submitted_Materials"), new DataColumn("Description"), new DataColumn("L_id"),
                new DataColumn("TA_id"), new DataColumn("EE_id"), new DataColumn("C_id"),new DataColumn("E_id")});


            DataTable Academic = new DataTable();

            Academic.Columns.AddRange(new DataColumn[8] {
                new DataColumn("sid"), new DataColumn("code"), new DataColumn("Name"),
                new DataColumn("Submitted_Materials"), new DataColumn("Description"), new DataColumn("L_id2"),
                new DataColumn("TA_id"), new DataColumn("EE_id")});

            DataTable Industrial = new DataTable();

            Industrial.Columns.AddRange(new DataColumn[8] {
                new DataColumn("sid"), new DataColumn("code"), new DataColumn("Name"),
                new DataColumn("Submitted_Materials"), new DataColumn("Description"), new DataColumn("C_id"),
                new DataColumn("L_id"), new DataColumn("E_id")});

            connection.InfoMessage += new SqlInfoMessageEventHandler(connection_InfoMessage);
            void connection_InfoMessage(object sender1, SqlInfoMessageEventArgs e1)
            {//this gets the print statement from sql procedure

                res = e1.Message;
            };
            using (SqlDataReader reader = proc.ExecuteReader())
            {


                if (res == "")
                {
                    while (reader.Read())
                    {
                        System.Diagnostics.Debug.WriteLine(reader["code"]);
                        if (projtyrpe == "Industrial")
                        {
                            Industrial.Rows.Add(reader["sid"], reader["code"], reader["Name"], reader["Submitted_Materials"], reader["Description"],
                                reader["C_id"], reader["L_id"], reader["E_id"]);
                        }
                        else if (projtyrpe == "Academic")
                        {
                            Academic.Rows.Add(reader["sid"], reader["code"], reader["Name"], reader["Submitted_Materials"], reader["Description"],
                                reader["L_id2"], reader["TA_id"], reader["EE_id"]);
                        }
                        else if (projtyrpe == "all")
                        {
                            bachelorProj.Rows.Add(reader["sid"], reader["code"], reader["Name"],
                                reader["Submitted_Materials"], reader["Description"], reader["L_id"].ToString() + reader["L_id2"],
                                reader["TA_id"], reader["EE_id"], reader["C_id"], reader["E_id"]);
                        }
                    }
                }
                if (projtyrpe == "Industrial")
                {
                    grid_BP_details.DataSource = Industrial;
                    grid_BP_details.DataBind();
                }
                else if (projtyrpe == "Academic")
                {
                    grid_BP_details.DataSource = Academic;
                    grid_BP_details.DataBind();
                }
                else if (projtyrpe == "all")
                {
                    grid_BP_details.DataSource = bachelorProj;
                    grid_BP_details.DataBind();
                }
                //Response.Write(success.Value.ToString());
            }
            gridErrors.Text = res;
            connection.Close();
        }

        protected void viewProfile(object sender, EventArgs e)//viewProfile
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            string lecID = Session["user_id"].ToString();
            //"1";

            SqlCommand proc = new SqlCommand("EmpViewProfile", connection);
            proc.CommandType = CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@user_id", lecID));

            SqlParameter success = proc.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            connection.Open();
            DataTable userData = new DataTable();

            userData.Columns.AddRange(new DataColumn[7] {new DataColumn("Staff_id"), new DataColumn("Company_id"), new DataColumn("Username"),
                new DataColumn("Password"), new DataColumn("Email"), new DataColumn("Field"), new DataColumn("Phone_number")});


            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    staffID.Text = reader["Staff_id"].ToString();
                    compID.Text = reader["Company_id"].ToString();
                    PUsername.Text = reader["Username"].ToString();
                    PPassword.Text = reader["Password"].ToString();
                    PEmail.Text = reader["Email"].ToString();
                    field.Text = reader["Field"].ToString();
                    PPhonenumber.Text = reader["Phone"].ToString();

                    userData.Rows.Add(reader["Staff_id"], reader["Company_id"], reader["Username"], reader["Password"], reader["Email"], reader["Field"], reader["Phone"]);
                }
            }


            connection.Close();
        }

        protected void openProfile(object sender, EventArgs e)
        {
            Profileee.Visible = true;
            form1.Visible = false;
            viewProfile(sender, e);
        }
        protected void openMainProfile(object sender, EventArgs e)
        {
            Profileee.Visible = false;
            form1.Visible = true;
        }
        protected void openBachelor(object sender, EventArgs e)
        {
            form_BP_details.Visible = true;
            form1.Visible = false;
            ViewBachelor(sender, e);
        }
        protected void openMainBachelor(object sender, EventArgs e)
        {
            form_BP_details.Visible = false;
            form1.Visible = true;
        }
        protected void GDClicked(object sender, EventArgs e)
        {
            form1.Visible = false;
            form2.Visible = true;
            gradeD2.Enabled = true;
            gradeD2.Text = "Grade";
            gradeD2.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");

            //empID2.Text = "";
            sid2.Text = "";
            location2.Text = "";
            grade2.Text = "";
        }
        protected void closeGDForm(object sender, EventArgs e)
        {
            form2.Visible = false;
            form1.Visible = true;
        }
        protected void gradeDefenseButton(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            //int theEmpID = Convert.ToInt32(empID2.Text);
            int theEmpID = Convert.ToInt32(Session["user_id"].ToString());

            int theSID = Convert.ToInt32(sid2.Text);
            string location = location2.Text;
            double grade = Convert.ToDouble(grade2.Text);

            SqlCommand gradeD = new SqlCommand("EmployeeGradedefense", connection);
            gradeD.CommandType = CommandType.StoredProcedure;

            gradeD.Parameters.Add(new SqlParameter("@Employee_id", theEmpID));
            gradeD.Parameters.Add(new SqlParameter("@sid", theSID));
            gradeD.Parameters.Add(new SqlParameter("@defense_location", location));
            gradeD.Parameters.Add(new SqlParameter("@Employee_grade", grade));


            SqlParameter success = gradeD.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;



            connection.Open();
            gradeD.ExecuteNonQuery();
            connection.Close();


            error1.Text = "";
            error2.Text = "";
            error3.Text = "";
            error4.Text = "";

            if (success.Value.ToString() == "-2")
            {
                error1.Text = "Invalid Staff ID!";
            }
            else if (success.Value.ToString() == "-3")
            {
                error1.Text = "Invalid Student ID!";
            }
            else if (success.Value.ToString() == "-4")
            {
                error1.Text = "Invalid Defense Location!";
            }
            else if (success.Value.ToString() == "-5")
            {
                error1.Text = "Invalid Student ID & Defense Combination";
            }
            else
            {
                // ASSIGNED!!!
                error1.Text = "";
                error2.Text = "";
                error3.Text = "";
                error4.Text = "";

                gradeD2.Enabled = false;
                gradeD2.Text = "GRADED";
                gradeD2.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7F7F");
            }
        }




        protected void CPRClicked(object sender, EventArgs e)
        {
            form1.Visible = false;
            form3.Visible = true;
            createB3.Enabled = true;
            createB3.Text = "Create";
            createB3.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");

            //empID3.Text = "";
            sid3.Text = "";
            date3.Text = "";
            content3.Text = "";
        }
        protected void closeCPRForm(object sender, EventArgs e)
        {
            form3.Visible = false;
            form1.Visible = true;
        }
        protected void createPRButton(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            //int theEmpID = Convert.ToInt32(empID3.Text);
            int theEmpID = Convert.ToInt32(Session["user_id"].ToString());
            int theSID = Convert.ToInt32(sid3.Text);
            DateTime date = Convert.ToDateTime(date3.Text);
            string content = content3.Text;

            SqlCommand createPR = new SqlCommand("EmployeeCreatePR", connection);
            createPR.CommandType = CommandType.StoredProcedure;

            createPR.Parameters.Add(new SqlParameter("@Employee_id", theEmpID));
            createPR.Parameters.Add(new SqlParameter("@sid", theSID));
            createPR.Parameters.Add(new SqlParameter("@date", date));
            createPR.Parameters.Add(new SqlParameter("@content", content));


            SqlParameter success = createPR.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;



            connection.Open();
            createPR.ExecuteNonQuery();
            connection.Close();


            error5.Text = "";
            error6.Text = "";
            error7.Text = "";
            error8.Text = "";

            if (success.Value.ToString() == "-2")
            {
                error5.Text = "Invalid Staff ID!";
            }
            else if (success.Value.ToString() == "-3")
            {
                error5.Text = "Invalid Student ID!";
            }
            else if (success.Value.ToString() == "-4")
            {
                error5.Text = "You already created a PR with the specified Date!";
            }
            else
            {
                // ASSIGNED!!!
                error5.Text = "";
                error6.Text = "";
                error7.Text = "";
                error8.Text = "";

                createB3.Enabled = false;
                createB3.Text = "CREATED";
                createB3.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7F7F");
            }
        }

        protected void GTClicked(object sender, EventArgs e)
        {
            form1.Visible = false;
            form4.Visible = true;
            gradeT4.Enabled = true;
            gradeT4.Text = "Grade";
            gradeT4.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");

            //empID4.Text = "";
            sid4.Text = "";
            title4.Text = "";
            grade4.Text = "";
        }
        protected void closeGTForm(object sender, EventArgs e)
        {
            form4.Visible = false;
            form1.Visible = true;
        }
        protected void gradeThesisButton(object sender, EventArgs e)
        {

            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            //int theEmpID = Convert.ToInt32(empID4.Text);
            int theEmpID = Convert.ToInt32(Session["user_id"].ToString());
            int theSID = Convert.ToInt32(sid4.Text);
            string title = title4.Text;
            double grade = Convert.ToDouble(grade4.Text);

            SqlCommand gradeT = new SqlCommand("EmployeeGradeThesis", connection);
            gradeT.CommandType = CommandType.StoredProcedure;

            gradeT.Parameters.Add(new SqlParameter("@Employee_id", theEmpID));
            gradeT.Parameters.Add(new SqlParameter("@sid", theSID));
            gradeT.Parameters.Add(new SqlParameter("@thesis_title", title));
            gradeT.Parameters.Add(new SqlParameter("@Employee_grade", grade));


            SqlParameter success = gradeT.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            connection.Open();
            gradeT.ExecuteNonQuery();
            connection.Close();


            error9.Text = "";
            error10.Text = "";
            error11.Text = "";
            error12.Text = "";

            if (success.Value.ToString() == "-2")
            {
                error9.Text = "Invalid Staff ID!";
            }
            else if (success.Value.ToString() == "-3")
            {
                error9.Text = "Invalid Student ID!";
            }
            else if (success.Value.ToString() == "-4")
            {
                error9.Text = "Invalid Thesis Title!";
            }
            else if (success.Value.ToString() == "-5")
            {
                error9.Text = "Invalid Student ID & Thesis Combination";
            }
            else
            {
                // ASSIGNED!!!
                error9.Text = "";
                error10.Text = "";
                error11.Text = "";
                error12.Text = "";

                gradeT4.Enabled = false;
                gradeT4.Text = "GRADED";
                gradeT4.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7F7F");
            }
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {

            Response.Redirect("HomePage.aspx");
        }
    }
}