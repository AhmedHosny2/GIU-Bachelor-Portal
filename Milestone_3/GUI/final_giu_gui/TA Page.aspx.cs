using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using SendGrid.Helpers.Mail;

namespace final_giu_gui
{
    public partial class TA_Page : System.Web.UI.Page
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

        protected void Create_progress_report_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            form_create_PR.Visible = true;
        }

        protected void Add_to_to_do_list_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            TAAddToDo.Visible = true;
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

        protected void Create_PR(object sender, EventArgs e)
        {
            error_form_create_PR.Text = "";
            create_but.Text = "creat";
            create_but.Enabled = true;
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            int TA_id = Convert.ToInt32(Session["user_id"]);
            int SID = Convert.ToInt32(sid_create_PR.Text);
            DateTime date = Convert.ToDateTime(Date.Text);
            string Content = CONTENT.Text;


            SqlCommand TACreatePR = new SqlCommand("TACreatePR", connection);
            TACreatePR.CommandType = CommandType.StoredProcedure;

            TACreatePR.Parameters.Add(new SqlParameter("@TA_id", TA_id));
            TACreatePR.Parameters.Add(new SqlParameter("@sid", SID));
            TACreatePR.Parameters.Add(new SqlParameter("@date", date));
            //  TACreatePR.Parameters.Add(new SqlParameter("@content", Content));
            TACreatePR.Parameters.AddWithValue("@content", CONTENT.Text);
            SqlParameter success = TACreatePR.Parameters.Add("@erfolg", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;


            connection.Open();
            TACreatePR.ExecuteNonQuery();
            connection.Close();


            if (success.Value.ToString() == "-1")
            {
                error_form_create_PR.Text = "Invalid TA id";
            }
            else if (success.Value.ToString() == "-2")
                error_form_create_PR.Text = "Invalid Student id";
            else
            {
                create_but.Text = "created";
                create_but.Enabled = false;
                create_but.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7F7F");

            }

            //Response.Write(time);
        }

        protected void Add_to_do_list(object sender, EventArgs e)
        {


            create_to_do_list.Enabled = true;
            create_to_do_list.Text = "Create";
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            int Metting_id = Convert.ToInt32(meeting_id.Text);
            string To_do = to_do_list.Text;


            SqlCommand TAaddToDolist = new SqlCommand("TAAddToDo", connection);
            TAaddToDolist.CommandType = CommandType.StoredProcedure;

            TAaddToDolist.Parameters.Add(new SqlParameter("@meeting_id", Metting_id));
            TAaddToDolist.Parameters.Add(new SqlParameter("@to_do_list", To_do));

            SqlParameter success = TAaddToDolist.Parameters.Add("@erfolg", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;


            connection.Open();
            TAaddToDolist.ExecuteNonQuery();
            connection.Close();


            if (success.Value.ToString() == "-1")
            {
                error_to_do_list.Text = "Invalid meetting id";
            }

            else
            {
                create_to_do_list.Text = "created";
                create_to_do_list.Enabled = false;
                error_to_do_list.Text = "";
            }

            //Response.Write(time);
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}