using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.SqlServer.Server;

namespace final_giu_gui
{
    public partial class Student_page : System.Web.UI.Page
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
            //ViewBachelor(sender, e);
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
        protected void unbooked_meetings_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            form_View_UnBooked_Meeting.Visible = true;
        }

        protected void booked_meeting_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            form_View_Booked_Meetings.Visible = true;
        }

        protected void todo_list_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            TODOLIST.Visible = true;
        }

        protected void update_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            Update_Defense.Visible = true;

        }

        protected void view_their_defense_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            form_View_Defense.Visible = true;
        }

        protected void show_progress_report_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            form_View_Progress_Report.Visible = true;

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            form_submit_Thesis.Visible = true;
        }

        protected void view_thesis_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            form_View_Thesis.Visible = true;


        }

        protected void make_preferences_Click(object sender, EventArgs e)

        {
            form1.Visible = false;
            form_Make_Preference.Visible = true;

        }
        protected void book_meeting_with_lecturer_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            BMWL.Visible = true;
        }

        protected void check_bachelor_project_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            form_View_Bachelor_Project.Visible = true;
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void View_Thesis(object sender, EventArgs e)
        {

            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            SqlCommand proc = new SqlCommand("ViewMyThesis", connection);
            proc.CommandType = CommandType.StoredProcedure;
            //int student_id = Convert.ToInt32(sid_View_Thesis.Text);
            int student_id = Convert.ToInt32(Session["user_id"]);

            string TITLE = Title_View_Thesis.Text;
            proc.Parameters.Add(new SqlParameter("@sid", student_id));
            proc.Parameters.Add(new SqlParameter("@title", TITLE));


            SqlParameter success = proc.Parameters.Add("@Error_Flag", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            connection.Open();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Student Id"), new DataColumn("Title"), new DataColumn("EDeadlinemail"), new DataColumn("PDF_doc"), new DataColumn("Total_grade") });
            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["sid"], reader["Title"], reader["Deadline"], reader["PDF_doc"], reader["Total_grade"]);

                }
            }
            //Response.Write(success.Value.ToString());
            if (success.Value.ToString() == "-1")
                error_form_View_Thesis.Text = "Student ID not Found";
            else if (success.Value.ToString() == "-2")
                error_form_View_Thesis.Text = "Title of Thesis Not Found";
            else
            {
                form_View_Thesis.Visible = false;
                Forma.Visible = true;
                Grid_View_Thesis.Visible = true;
                Grid_View_Thesis.Height = 100;
                Grid_View_Thesis.DataSource = dt;
                Grid_View_Thesis.DataBind();

            }

        }

        protected void View_Progress_Report(object sender, EventArgs e)
        {


            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            SqlCommand proc = new SqlCommand("ViewMyProgressReports", connection);
            proc.CommandType = CommandType.StoredProcedure;
            int student_id = Convert.ToInt32(Session["user_id"]);
          

            DateTime DATE = Convert.ToDateTime(date_View_Progress_Report.Text);
          
         
            // if user id = -1 means get all users  if user type =all user mean get all users  
            proc.Parameters.Add(new SqlParameter("@sid", student_id));
            proc.Parameters.Add(new SqlParameter("@date", DATE));


            SqlParameter success = proc.Parameters.Add("@Error_Flag", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            connection.Open();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[6] { new DataColumn("Student Id"), new DataColumn("Date"), new DataColumn("Content"), new DataColumn("Grade"), new DataColumn("UpdatingUser_id"), new DataColumn("ComulativeProgressReportGrade") });
            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["sid"], reader["Date"], reader["Content"], reader["Grade"], reader["UpdatingUser_id"], reader["ComulativeProgressReportGrade"]);

                }
            }
            //Response.Write(success.Value.ToString());
            if (success.Value.ToString() == "0")
                Error_from_Progress_Report.Text = "No Such Progress_Report!";
            else
            {
                form_View_Progress_Report.Visible = false;
                Forma2.Visible = true;
                Grid_View_Progress_Report.Visible = true;
                Grid_View_Progress_Report.Height = 100;
                Grid_View_Progress_Report.DataSource = dt;
                Grid_View_Progress_Report.DataBind();

            }

        }

        protected void View_Defense(object sender, EventArgs e)
        {

            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            SqlCommand proc = new SqlCommand("ViewMyDefense", connection);
            proc.CommandType = CommandType.StoredProcedure;
            int student_id = Convert.ToInt32(Session["user_id"]);
            proc.Parameters.Add(new SqlParameter("@sid", student_id));
            SqlParameter success = proc.Parameters.Add("@Error_Flag", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            connection.Open();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[6] { new DataColumn("Student Id"), new DataColumn("Location"), new DataColumn("Content"), new DataColumn("Time"), new DataColumn("Date"), new DataColumn("Total_Grade") });
            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["sid"], reader["Location"], reader["Content"], reader["Time"], reader["Date"], reader["Total_Grade"]);

                }
            }
         ;
            if (success.Value.ToString() == "1")
                error_from_View_Defense.Text = "No Defense Found";
            else
            {
                form_View_Defense.Visible = false;
                Forma3.Visible = true;
                Grid_View_Defense.Visible = true;
                Grid_View_Defense.Height = 100;
                Grid_View_Defense.DataSource = dt;
                Grid_View_Defense.DataBind();

            }


        }

        protected void View_Bachelor_Project(object sender, EventArgs e)
        {
            string res = "";
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            SqlCommand proc = new SqlCommand("ViewBachelorProjects", connection);
            proc.CommandType = CommandType.StoredProcedure;
            int student_id = Convert.ToInt32(Session["user_id"]);
            string PType = Project_Type.Text;
            proc.Parameters.Add(new SqlParameter("@ProjectType", PType));
            proc.Parameters.Add(new SqlParameter("@User_id", student_id));
     
     
            connection.Open();
            connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
            {
                res = e1.Message.ToString();
            };

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[4] { new DataColumn("Code"), new DataColumn("Name"), new DataColumn("Submitted_Materials"), new DataColumn("Description") });
            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["code"], reader["Name"], reader["Submitted_Materials"], reader["Description"]);
                }
            };
         
            if (res!= "")
                error_from_view_bachpro.Text =res;
            else
            {
                error_from_view_bachpro.Text = "Done with Success!";
                form_View_Bachelor_Project.Visible = false;
                Forma4.Visible = true;
                Grid_View_Bachelor_Project.Visible = true;
                Grid_View_Bachelor_Project.Height = 100;
                Grid_View_Bachelor_Project.DataSource = dt;
                Grid_View_Bachelor_Project.DataBind();

            }

        }

        protected void View_Meetings(object sender, EventArgs e)
        {

            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            SqlCommand proc = new SqlCommand("ViewMeeting", connection);
            proc.CommandType = CommandType.StoredProcedure;
            int M_id = Convert.ToInt32(Meeting_ID.Text);
            int S_id = Convert.ToInt32(Session["user_id"]);
            // if user id = -1 means get all users  if user type =all user mean get all users  
            proc.Parameters.Add(new SqlParameter("@meeting_id", M_id));
            proc.Parameters.Add(new SqlParameter("@sid", S_id));

            SqlParameter success = proc.Parameters.Add("@Error_Flag", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            connection.Open();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[7] { new DataColumn("Meeting_ID"), new DataColumn("Lecturer_ID"), new DataColumn("Start Time"), new DataColumn("End Time"), new DataColumn("Duration"), new DataColumn("Date"), new DataColumn("Meeting Point") });
            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["Meeting_ID"], reader["L_id"], reader["STime"], reader["ETime"], reader["Duration"], reader["Date"], reader["Meeting_Point"]);

                }
            }
            //Response.Write(success.Value.ToString());
            if (success.Value.ToString() == "0")
                error_form_View_Booked_Meetings.Text = "Meeting ID not Found";
            else
            {
                form_View_Booked_Meetings.Visible = false;
                Forma5.Visible = true;
                Grid_View_Booked_Meetings.Visible = true;
                Grid_View_Booked_Meetings.Height = 100;
                Grid_View_Booked_Meetings.DataSource = dt;
                Grid_View_Booked_Meetings.DataBind();
            }


        }

        protected void View_UBM(object sender, EventArgs e)
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            SqlCommand proc = new SqlCommand("ViewNotBookedMeeting", connection);
            proc.CommandType = CommandType.StoredProcedure;
            int S_id = Convert.ToInt32(Session["user_id"]);
            proc.Parameters.Add(new SqlParameter("@sid", S_id));

            SqlParameter success = proc.Parameters.Add("@Error_Flag", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            connection.Open();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[7] { new DataColumn("Meeting_ID"), new DataColumn("Lecturer_ID"), new DataColumn("Start Time"), new DataColumn("End Time"), new DataColumn("Duration"), new DataColumn("Date"), new DataColumn("Meeting Point") });
            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["Meeting_ID"], reader["L_id"], reader["STime"], reader["ETime"], reader["Duration"], reader["Date"], reader["Meeting_Point"]);

                }
            }
            //Response.Write(success.Value.ToString());
            if (success.Value.ToString() == "0")
                Error_UBM.Text = "No Meetings Found";
            else
            {
                form_View_UnBooked_Meeting.Visible = false;
                Forma6.Visible = true;
                GridView_UBM.Visible = true;
                GridView_UBM.Height = 100;
                GridView_UBM.DataSource = dt;
                GridView_UBM.DataBind();
            }
        }

        protected void make_preference(object sender, EventArgs e)
        {
            Error_Make_Prefrence.Text = "";
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            int Sid = Convert.ToInt32(Session["user_id"]);
            string B_Code = bachelor_code_pref.Text;
            int Pref_Num = Convert.ToInt32(Prefrence_Number.Text);

            SqlCommand MAKEPreferencesLocalProject = new SqlCommand("MakePreferencesLocalProject", connection);
            MAKEPreferencesLocalProject.CommandType = CommandType.StoredProcedure;

            MAKEPreferencesLocalProject.Parameters.Add(new SqlParameter("@sid", Sid));
            MAKEPreferencesLocalProject.Parameters.Add(new SqlParameter("@bachelor_code", B_Code));
            MAKEPreferencesLocalProject.Parameters.Add(new SqlParameter("@preference_number", Pref_Num));

            SqlParameter success = MAKEPreferencesLocalProject.Parameters.Add("@Error_Flag", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            connection.Open();
            MAKEPreferencesLocalProject.ExecuteNonQuery();
            connection.Close();


            if (success.Value.ToString() == "1")
            {
                Error_Make_Prefrence.Text = "Invalid ID";
            }
            else if (success.Value.ToString() == "2")
            {
                Error_Make_Prefrence.Text = "Choose a project from your Major";
            }
            else if (success.Value.ToString() == "3")
            {
                Error_Make_Prefrence.Text = "Invalid Preference Number";
            }
            else
            {
                Error_Make_Prefrence.Text = " Done With Success!";
            }
        }

        protected void Submit_Thesis(object sender, EventArgs e)
        {

            Error_Submit_Thesis.Text = "";
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            int Sid = Convert.ToInt32(Session["user_id"]);
            string TITLE = Title_of_Thesis.Text;
            string Doc = Thesis_Document.Text;

            SqlCommand SUBMIT = new SqlCommand("SubmitMyThesis", connection);
            SUBMIT.CommandType = CommandType.StoredProcedure;

            SUBMIT.Parameters.Add(new SqlParameter("@sid", Sid));
            SUBMIT.Parameters.Add(new SqlParameter("@title", TITLE));
            SUBMIT.Parameters.Add(new SqlParameter("@PDF_Document", Doc));

            SqlParameter success = SUBMIT.Parameters.Add("@Error_Flag", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            connection.Open();
            SUBMIT.ExecuteNonQuery();
            connection.Close();


            if (success.Value.ToString() == "1")
            {
                Error_Submit_Thesis.Text = "Invalid ID";
            }
            else if (success.Value.ToString() == "2")
            {
                Error_Submit_Thesis.Text = "You can't submit empty document";
            }
            else
            {
                Error_Submit_Thesis.Text = " Done With Success!";
            }

        }

        protected void UpdateMyDefense(object sender, EventArgs e)
        {
            Error_Updating_Defense.Text = "";
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            int Sid = Convert.ToInt32(Session["user_id"]);
            string Content = Def_Content.Text;


            SqlCommand UPDATE = new SqlCommand("UpdateMyDefense", connection);
            UPDATE.CommandType = CommandType.StoredProcedure;

            UPDATE.Parameters.Add(new SqlParameter("@sid", Sid));
            UPDATE.Parameters.Add(new SqlParameter("@defense_content", Content));


            SqlParameter success = UPDATE.Parameters.Add("@Error_Flag", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            connection.Open();
            UPDATE.ExecuteNonQuery();
            connection.Close();


            if (success.Value.ToString() == "1")
            {
                Error_Updating_Defense.Text = "Invalid ID";
            }
            else if (success.Value.ToString() == "2")
            {
                Error_Updating_Defense.Text = "Student Does Not Have a Defense!";
            }
            else
            {
                Error_Updating_Defense.Text = " Done With Success!";
            }
        }

        protected void Book_Meeting(object sender, EventArgs e)
        {
            Error_of_booking.Text = "";
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            int Sid = Convert.ToInt32(Session["user_id"]);
            int Meeting_ID = Convert.ToInt32(Meet_id_Booking.Text);
            SqlCommand BOOKING = new SqlCommand("BookMeeting", connection);
            BOOKING.CommandType = CommandType.StoredProcedure;

            BOOKING.Parameters.Add(new SqlParameter("@sid", Sid));
            BOOKING.Parameters.Add(new SqlParameter("@meeting_id", Meeting_ID));


            SqlParameter success = BOOKING.Parameters.Add("@Error_Flag", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            connection.Open();
            BOOKING.ExecuteNonQuery();
            connection.Close();


            if (success.Value.ToString() == "1")
            {
                Error_of_booking.Text = "Invalid ID";
            }
            else if (success.Value.ToString() == "2")
            {
                Error_of_booking.Text = "INVALID Meeting ID";
            }
            else if (success.Value.ToString() == "3")
            {
                Error_of_booking.Text = "You Can't book This Meeting";
            }
            else if (success.Value.ToString() == "4")
            {
                Error_of_booking.Text = "Meeting already Booked Before";
            }

            else
            {
                Error_of_booking.Text = " Done With Success!";
            }
        }

        protected void Student_Add_TODO(object sender, EventArgs e)
        {
            Error_To_Do_list.Text = "";
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            int MID = Convert.ToInt32(MID_TODO.Text);
            string TODO = TODOLL.Text;
            SqlCommand ADDING = new SqlCommand("StudentAddToDo", connection);
            ADDING.CommandType = CommandType.StoredProcedure;

            ADDING.Parameters.Add(new SqlParameter("@meeting_id", MID));
            ADDING.Parameters.Add(new SqlParameter("@to_do_list", TODO));


            SqlParameter success = ADDING.Parameters.Add("@Error_Flag", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            connection.Open();
            ADDING.ExecuteNonQuery();
            connection.Close();


            if (success.Value.ToString() == "1")
            {
                Error_To_Do_list.Text = "Invalid Meeting ID";
            }
            else
            {
                Error_To_Do_list.Text = "Done With Success";
            }

        }
    }

}