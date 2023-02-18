using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using SendGrid.Helpers.Mail;
using SendGrid;
using System.Net;
using System.Reflection.Emit;
using System.Xml.Linq;

namespace final_giu_gui
{
    public partial class Company_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

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

            SqlCommand proc = new SqlCommand("ViewProfile", connection);
            proc.CommandType = CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@user_id", lecID));

            connection.Open();
            DataTable userData = new DataTable();

            userData.Columns.AddRange(new DataColumn[6] {new DataColumn("users_id"), new DataColumn("Username"),
                new DataColumn("Password"), new DataColumn("Email"), new DataColumn("Phone_number"),
             new DataColumn("User_type")});

            DataTable studentData = new DataTable();

            studentData.Columns.AddRange(new DataColumn[11] {new DataColumn("sid"), new DataColumn("first_name"),
                new DataColumn("last_name"), new DataColumn("Major_code"), new DataColumn("Date_Of_Birth"),
             new DataColumn("Adress"), new DataColumn("Age"), new DataColumn("Semester"), new DataColumn("GPA")
            , new DataColumn("TotalBachelorGrade"), new DataColumn("Assigned_Project_code")});

            DataTable companyData = new DataTable();

            companyData.Columns.AddRange(new DataColumn[5] {new DataColumn("Company_id"), new DataColumn("Name"),
                new DataColumn("Representative_name"), new DataColumn("Representative_Email"), new DataColumn("Location")});

            DataTable lecAndTAData = new DataTable();

            lecAndTAData.Columns.AddRange(new DataColumn[1] { new DataColumn("Schedule") });

            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    PUserID.Text = reader["users_id"].ToString();
                    PUsername.Text = reader["Username"].ToString();
                    PPassword.Text = reader["Password"].ToString();
                    PEmail.Text = reader["Email"].ToString();
                    PPhonenumber.Text = reader["Phone_number"].ToString();
                    PUsertype.Text = reader["User_type"].ToString();
                    userData.Rows.Add(reader["users_id"], reader["Username"], reader["Password"], reader["Email"], reader["Phone_number"], reader["User_type"]);
                    if (reader["User_type"].ToString() == "Students")
                    {
                        PStudent.Visible = true;
                        studentData.Rows.Add(reader["sid"], reader["first_name"], reader["last_name"],
                            reader["Major_code"], reader["Date_Of_Birth"], reader["Adress"], reader["Age"], reader["Semester"],
                            reader["GPA"], reader["TotalBachelorGrade"], reader["Assigned_Project_code"]);
                        PFName.Text = reader["first_name"].ToString();
                        PLName.Text = reader["last_name"].ToString();
                        PMCode.Text = reader["Major_code"].ToString();
                        PDOB.Text = reader["Date_Of_Birth"].ToString();
                        PAddress.Text = reader["Adress"].ToString();
                        PPAge.Text = reader["Age"].ToString();
                        PSemester.Text = reader["Semester"].ToString();
                        PGPA.Text = reader["GPA"].ToString();
                        PTotalBachelorGrade.Text = reader["TotalBachelorGrade"].ToString();
                        PAssignedProjCode.Text = reader["Assigned_Project_code"].ToString();
                    }
                    else if (reader["User_type"].ToString() == "Companies")
                    {
                        PCompany.Visible = true;
                        companyData.Rows.Add(reader["Company_id"], reader["Name"], reader["Representative_name"],
                            reader["Representative_Email"], reader["Location"]);
                        CName.Text = reader["Name"].ToString();
                        CRepName.Text = reader["Representative_name"].ToString();
                        CRepEmail.Text = reader["Representative_Email"].ToString();
                        CLocation.Text = reader["Location"].ToString();
                    }
                    else if (reader["User_type"].ToString() == "Lecturers" || reader["User_type"].ToString() == "Teaching assistants")
                    {
                        PLecTa.Visible = true;
                        lecAndTAData.Rows.Add(reader["Schedule"]);
                        PSchedule.Text = reader["Schedule"].ToString();
                    }
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
        protected void openBachelor(object sender, EventArgs e)
        {
            form_BP_details.Visible = true;
            form1.Visible = false;
            ViewBachelor(sender, e);
        }
        protected void openMainProfile(object sender, EventArgs e)
        {
            Profileee.Visible = false;
            form1.Visible = true;
        }
        protected void openMainBachelor(object sender, EventArgs e)
        {
            form_BP_details.Visible = false;
            form1.Visible = true;
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
        protected void Unnamed2_Click(object sender, EventArgs e)
        {

        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {

        }

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            Response.Write("hhhye ");

        }

        protected void Unnamed5_Click(object sender, EventArgs e)
        {

        }

        protected void hireEmpClicked(object sender, EventArgs e)
        {
            form1.Visible = false;
            form2.Visible = true;
            hireB.Enabled = true;
            hireB.Text = "Hire";
            hireB.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");

            //compID.Text = "";
            email2.Text = "";
            name.Text = "";
            phone.Text = "";
            field.Text = "";

            //compID.Text = Session["user_id"].ToString();
            //compID.Enabled = false;
        }
        protected void closeHireEmpForm(object sender, EventArgs e)
        {
            form2.Visible = false;
            form1.Visible = true;
        }
        protected void hireButton(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            //int theID = Convert.ToInt32(compID.Text);
            int theCompID = Convert.ToInt32(Session["user_id"]);

            string theEmail = email2.Text;
            string theName = name.Text;
            string thePhone = phone.Text;
            string Field = field.Text;

            SqlCommand addEmp = new SqlCommand("AddEmployee", connection);
            addEmp.CommandType = CommandType.StoredProcedure;

            //addEmp.Parameters.Add(new SqlParameter("@ComapnyID", theID));
            addEmp.Parameters.Add(new SqlParameter("@ComapnyID", theCompID));
            addEmp.Parameters.Add(new SqlParameter("@email", theEmail));
            addEmp.Parameters.Add(new SqlParameter("@name", theName));
            addEmp.Parameters.Add(new SqlParameter("@phone_number", thePhone));
            addEmp.Parameters.Add(new SqlParameter("@field", Field));

            SqlParameter staffId = addEmp.Parameters.Add("@StaffID", SqlDbType.Int);
            SqlParameter compId = addEmp.Parameters.Add("@ComapnyID_2", SqlDbType.Int);
            SqlParameter pass = addEmp.Parameters.Add("@password", SqlDbType.VarChar, 10);

            staffId.Direction = ParameterDirection.Output;
            compId.Direction = ParameterDirection.Output;
            pass.Direction = ParameterDirection.Output;


            connection.Open();
            addEmp.ExecuteNonQuery();
            connection.Close();


            error1.Text = "";
            //error2.Text = "";

            if (staffId.Value.ToString() == "-2")
            {
                error1.Text = "(Invalid Company ID!)";
            }
            else if (staffId.Value.ToString() == "-3")
            {
                error1.Text = "(Email already in use!)";
            }
            else
            {
                // HIRED!!!
                error1.Text = "";
                //error2.Text = "";

                hireB.Enabled = false;
                hireB.Text = "HIRED";
                hireB.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7F7F");

                Execute(theEmail, theCompID.ToString(), staffId.Value.ToString(), pass.Value.ToString());
            }

        }

        
        protected void CPClicked(object sender, EventArgs e)
        {
            form1.Visible = false;
            form3.Visible = true;
            createB.Enabled = true;
            createB.Text = "Create";
            createB.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");

            //compID1.Text = "";
            code.Text = "";
            title.Text = "";
            majorC.Text = "";
            desc.Text = "";
        }
        protected void closeCP(object sender, EventArgs e)
        {
            form3.Visible = false;
            form1.Visible = true;
        }
        protected void createProjButton(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            //int theCompID = Convert.ToInt32(compID1.Text);
            int theCompID = Convert.ToInt32(Session["user_id"]);
            string theCode = code.Text;
            string theTitle = title.Text;
            string theMCode = majorC.Text;
            string descr = desc.Text;

            SqlCommand createBP = new SqlCommand("CompanyCreateLocalProject", connection);
            createBP.CommandType = CommandType.StoredProcedure;

            createBP.Parameters.Add(new SqlParameter("@company_id", theCompID));
            createBP.Parameters.Add(new SqlParameter("@proj_code", theCode));
            createBP.Parameters.Add(new SqlParameter("@title", theTitle));
            createBP.Parameters.Add(new SqlParameter("@description", descr));
            createBP.Parameters.Add(new SqlParameter("@major_code", theMCode));

            SqlParameter success = createBP.Parameters.Add("@erfolg", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;



            connection.Open();
            createBP.ExecuteNonQuery();
            connection.Close();


            error3.Text = "";
            error4.Text = "";
            error5.Text = "";

            if (success.Value.ToString() == "-2")
            {
                error3.Text = "(Invalid Company ID!)";
            }
            else if (success.Value.ToString() == "-3")
            {
                error3.Text = "(Project Code already in use!)";
            }
            else if (success.Value.ToString() == "-4")
            {
                error3.Text = "(Invalid Major Code!)";
            }
            else
            {
                // CREATED!!!
                error3.Text = "";
                error4.Text = "";
                error5.Text = "";

                createB.Enabled = false;
                createB.Text = "CREATED";
                createB.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7F7F");
            }
        }

        
        protected void AEClicked(object sender, EventArgs e)
        {
            form1.Visible = false;
            form4.Visible = true;
            assignB.Enabled = true;
            assignB.Text = "Assign";
            assignB.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");

            //compID4.Text = "";
            code4.Text = "";
            staffID4.Text = "";
        }
        protected void closeAssignEmpForm(object sender, EventArgs e)
        {
            form4.Visible = false;
            form1.Visible = true;
        }
        protected void assignButton(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            string theCode = code4.Text;
            //int theCompID = Convert.ToInt32(compID4.Text);
            int theCompID = Convert.ToInt32(Session["user_id"]);
            int theStaffID = Convert.ToInt32(staffID4.Text);

            SqlCommand assignEP = new SqlCommand("AssignEmployee", connection);
            assignEP.CommandType = CommandType.StoredProcedure;

            assignEP.Parameters.Add(new SqlParameter("@bachelor_code", theCode));
            assignEP.Parameters.Add(new SqlParameter("@staff_id", theStaffID));
            assignEP.Parameters.Add(new SqlParameter("@Company_id", theCompID));


            SqlParameter staffIDOut = assignEP.Parameters.Add("@staff_id_2", SqlDbType.Int);
            staffIDOut.Direction = ParameterDirection.Output;



            connection.Open();
            assignEP.ExecuteNonQuery();
            connection.Close();


            error6.Text = "";
            error7.Text = "";
            error8.Text = "";

            if (staffIDOut.Value.ToString() == "-2")
            {
                error6.Text = "(Invalid Company ID!)";
            }
            else if (staffIDOut.Value.ToString() == "-4")
            {
                error6.Text = "(Invalid Project Code)";
            }
            else if (staffIDOut.Value.ToString() == "-3")
            {
                error6.Text = "(Invalid Staff ID!)";
            }
            else
            {
                // ASSIGNED!!!
                error6.Text = "";
                error7.Text = "";
                error8.Text = "";

                assignB.Enabled = false;
                assignB.Text = "ASSIGNED";
                assignB.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7F7F");
            }
        }





        protected void GTClicked(object sender, EventArgs e)
        {
            form1.Visible = false;
            form5.Visible = true;
            gradeB.Enabled = true;
            gradeB.Text = "Grade";
            gradeB.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");

            //compID5.Text = "";
            sid5.Text = "";
            title5.Text = "";
            grade5.Text = "";
        }
        protected void closeGTForm(object sender, EventArgs e)
        {
            form5.Visible = false;
            form1.Visible = true;
        }
        protected void gradeThesisButton(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            //int theCompID = Convert.ToInt32(compID5.Text);
            int theCompID = Convert.ToInt32(Session["user_id"]);
            int theSID = Convert.ToInt32(sid5.Text);
            string title = title5.Text;
            double grade = Convert.ToDouble(grade5.Text);

            SqlCommand gradeT = new SqlCommand("CompanyGradeThesis", connection);
            gradeT.CommandType = CommandType.StoredProcedure;

            gradeT.Parameters.Add(new SqlParameter("@Company_id", theCompID));
            gradeT.Parameters.Add(new SqlParameter("@sid", theSID));
            gradeT.Parameters.Add(new SqlParameter("@thesis_title", title));
            gradeT.Parameters.Add(new SqlParameter("@Company_grade", grade));


            SqlParameter success = gradeT.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;



            connection.Open();
            gradeT.ExecuteNonQuery();
            connection.Close();


            error9.Text = "";
            error10.Text = "";
            error11.Text = "";
            error11_5.Text = "";

            if (success.Value.ToString() == "-2")
            {
                error9.Text = "(Invalid Company ID!)";
            }
            else if (success.Value.ToString() == "-3")
            {
                error9.Text = "(Invalid Student ID!)";
            }
            else if (success.Value.ToString() == "-4")
            {
                error9.Text = "(Invalid Thesis Title!)";
            }
            else if (success.Value.ToString() == "-5")
            {
                error9.Text = "(Invalid Student ID & Thesis Combination)";
            }
            else
            {
                // ASSIGNED!!!
                error9.Text = "";
                error10.Text = "";
                error11.Text = "";
                error11_5.Text = "";

                gradeB.Enabled = false;
                gradeB.Text = "GRADED";
                gradeB.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7F7F");
            }
        }


        protected void GDClicked(object sender, EventArgs e)
        {
            form1.Visible = false;
            form6.Visible = true;
            gradeB6.Enabled = true;
            gradeB6.Text = "Grade";
            gradeB6.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");

            //compID6.Text = "";
            sid6.Text = "";
            location6.Text = "";
            grade6.Text = "";
        }
        protected void closeGDForm(object sender, EventArgs e)
        {
            form6.Visible = false;
            form1.Visible = true;
        }
        protected void gradeDefenseButton(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            //int theCompID = Convert.ToInt32(compID6.Text);
            int theCompID = Convert.ToInt32(Session["user_id"]);
            int theSID = Convert.ToInt32(sid6.Text);
            string location = location6.Text;
            double grade = Convert.ToDouble(grade6.Text);

            SqlCommand gradeD = new SqlCommand("CompanyGradeDefense", connection);
            gradeD.CommandType = CommandType.StoredProcedure;

            gradeD.Parameters.Add(new SqlParameter("@Company_id", theCompID));
            gradeD.Parameters.Add(new SqlParameter("@sid", theSID));
            gradeD.Parameters.Add(new SqlParameter("@defense_location", location));
            gradeD.Parameters.Add(new SqlParameter("@Company_grade", grade));


            SqlParameter success = gradeD.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;



            connection.Open();
            gradeD.ExecuteNonQuery();
            connection.Close();


            error12.Text = "";
            error13.Text = "";
            error14.Text = "";
            error15.Text = "";

            if (success.Value.ToString() == "-2")
            {
                error12.Text = "(Invalid Company ID!)";
            }
            else if (success.Value.ToString() == "-3")
            {
                error12.Text = "(Invalid Student ID!)";
            }
            else if (success.Value.ToString() == "-4")
            {
                error12.Text = "(Invalid Defense Location!)";
            }
            else if (success.Value.ToString() == "-5")
            {
                error12.Text = "(Invalid Student ID & Defense Combination)";
            }
            else
            {
                // ASSIGNED!!!
                error12.Text = "";
                error13.Text = "";
                error14.Text = "";
                error15.Text = "";

                gradeB6.Enabled = false;
                gradeB6.Text = "GRADED";
                gradeB6.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7F7F");
            }
        }




        protected void PRClicked(object sender, EventArgs e)
        {
            form1.Visible = false;
            form7.Visible = true;
            gradePR7.Enabled = true;
            gradePR7.Text = "Grade";
            gradePR7.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");

            //compID7.Text = "";
            sid7.Text = "";
            date7.Text = "";
            grade7.Text = "";
        }
        protected void closeGPRForm(object sender, EventArgs e)
        {
            form7.Visible = false;
            form1.Visible = true;
        }
        protected void gradePRButton(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            //int theCompID = Convert.ToInt32(compID7.Text);
            int theCompID = Convert.ToInt32(Session["user_id"]);
            int theSID = Convert.ToInt32(sid7.Text);
            DateTime date = Convert.ToDateTime(date7.Text);
            double grade = Convert.ToDouble(grade7.Text);


            SqlCommand gradePR = new SqlCommand("CompanyGradePR", connection);
            gradePR.CommandType = CommandType.StoredProcedure;

            gradePR.Parameters.Add(new SqlParameter("@Company_id", theCompID));
            gradePR.Parameters.Add(new SqlParameter("@sid", theSID));
            gradePR.Parameters.Add(new SqlParameter("@date", date));
            gradePR.Parameters.Add(new SqlParameter("@Company_grade", grade));


            SqlParameter success = gradePR.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;



            connection.Open();
            gradePR.ExecuteNonQuery();
            connection.Close();


            error16.Text = "";
            error17.Text = "";
            error18.Text = "";
            error19.Text = "";

            if (success.Value.ToString() == "-2")
            {
                error16.Text = "(Invalid Company ID!)";
            }
            else if (success.Value.ToString() == "-3")
            {
                error16.Text = "(Invalid Student ID!)";
            }
            else if (success.Value.ToString() == "-4")
            {
                error16.Text = "(Invalid Progress Report Date!)";
            }
            else if (success.Value.ToString() == "-5")
            {
                error16.Text = "(Invalid Student ID & Progress Report Combination)";
            }
            else
            {
                // ASSIGNED!!!
                error16.Text = "";
                error17.Text = "";
                error18.Text = "";
                error19.Text = "";

                gradePR7.Enabled = false;
                gradePR7.Text = "GRADED";
                gradePR7.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7F7F");
            }
        }

        static void Execute(string email, string compID, string staffID, string password)
        {
            var apiKey = "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";
            var client = new SendGridClient(apiKey);
            var from = new EmailAddress("youfiarg@gmail.com", "Example User");
            var subject = "EMAIL VERIFICATION containing your 'EMAIL', 'Company-ID', 'Staff-ID and 'PASSWORD'";
            var to = new EmailAddress(email, "Example User");
            var plainTextContent = "and easy to do anywhere, even with C#";
            var htmlContent = "Hello newly hired Employee: " + staffID + "<br/><br/><br/>" +
                               "Weclome to the GIU!" + "<br/>" +
                               "Please find your User Details below." + "<br/><br/>" +
                                "Email: " + email + "<br/>" +
                                "Company-ID: " + compID + "<br/>" +
                                "Staff-ID: " + staffID + "<br/>" +
                                "Password: " + password + "<br/>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = client.SendEmailAsync(msg);
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}