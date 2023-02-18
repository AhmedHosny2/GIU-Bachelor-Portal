using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.Common;
using System.Web.UI.WebControls.WebParts;

namespace final_giu_gui
{
    public partial class Main_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("ana el logo wadeny lle home page posor3aaaa 😭 ");
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
            mainForm.Visible = false;
           viewProfile(sender, e);
        }
        protected void openBachelor(object sender, EventArgs e)
        {
            form_BP_details.Visible = true;
            mainForm.Visible = false;
            // ViewBachelor(sender, e);
        }
        protected void openMainProfile(object sender, EventArgs e)
        {
            Profileee.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainBachelor(object sender, EventArgs e)
        {
            form_BP_details.Visible = false;
            mainForm.Visible = true;
        }
        protected void createProj(object sender, EventArgs e)//f1
        {
            String res = "";
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            string lecID = Session["user_id"].ToString();
            String projCode = f1ProjCode.Text;
            String title = f1Title.Text;
            String desc = f1Desc.Text;
            String majCode = f1MajorCode.Text;

            if (projCode != "" && title != "" && desc != "" && majCode != "")
            {
                SqlCommand proc = new SqlCommand("LecturerCreateLocalProject", connection);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@Lecturer_id", lecID));
                proc.Parameters.Add(new SqlParameter("@proj_code", projCode));
                proc.Parameters.Add(new SqlParameter("@title", title));
                proc.Parameters.Add(new SqlParameter("@description", desc));
                proc.Parameters.Add(new SqlParameter("@major_code", majCode));

                connection.Open();

                connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
                {
                    res = e1.Message.ToString();
                };
                using (var reader = proc.ExecuteReader())
                {
                }

                connection.Close();
                m1.InnerText = res;
                if (res == "")
                {
                    r1.Visible = true;
                    r1.Text = "Created Project with Code " + projCode;
                }
            }
            else
            {
                m1.InnerText = "Please fill in all parameters!";
            }
        }
        protected void superviseProc(object sender, EventArgs e)//f2
        {
            String res = "";
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            string lecID = Session["user_id"].ToString();
            String projCode = f2ProjCode.Text;

            if (projCode != "")
            {
                SqlCommand proc = new SqlCommand("SuperviseIndustrial", connection);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@Lecturer_id", lecID));
                proc.Parameters.Add(new SqlParameter("@proj_code", projCode));

                connection.Open();
                connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
                {
                    res = e1.Message.ToString();
                };
                using (var reader = proc.ExecuteReader())
                {
                }

                connection.Close();
                m2.InnerText = res;
                if (res == "")
                {
                    r2.Visible = true;
                    r2.Text = "Supervising Project " + projCode;
                }
            }
            else
            {
                m2.InnerText = "Please fill in all parameters!";
            }
        }
        protected void specifyThesisDeadlineProc(object sender, EventArgs e)//f3
        {
            String res = "";
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            String deadLine = f3Deadline.Text;

            if (deadLine != "")
            {
                SqlCommand proc = new SqlCommand("SpecifyThesisDeadline", connection);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@deadline", deadLine));

                connection.Open();
                connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
                {
                    res = e1.Message.ToString();
                };
                using (var reader = proc.ExecuteReader())
                {
                }

                connection.Close();
                m3.InnerText = res;
                if (res == "")
                {
                    r3.Visible = true;
                    r3.Text = "Specified Thesis Deadline " + deadLine;
                }
            }
            else
            {
                m3.InnerText = "Please fill in all parameters!";
            }
        }
        protected void GradeThesisPro(object sender, EventArgs e)//f4
        {
            String res = "";
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            string lecID = Session["user_id"].ToString();
            String sid = f4SID.Text;
            String title = f4Title.Text;
            String grade = f4Grade.Text;

            if (sid != "" && title != "" && grade != "")
            {
                SqlCommand proc = new SqlCommand("LecGradeThesis", connection);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@Lecturer_id", lecID));
                proc.Parameters.Add(new SqlParameter("@sid", sid));
                proc.Parameters.Add(new SqlParameter("@thesis_title", title));
                proc.Parameters.Add(new SqlParameter("@Lecturer_grade", grade));

                connection.Open();
                connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
                {
                    res = e1.Message.ToString();
                };
                using (var reader = proc.ExecuteReader())
                {
                }

                connection.Close();
                m4.InnerText = res;
                if (res == "")
                {
                    r4.Visible = true;
                    r4.Text = "Graded Thesis " + title + " for Student " + sid;
                }
            }
            else
            {
                m4.InnerText = "Please fill in all parameters!";
            }
        }
        protected void CreateProgressReportProc(object sender, EventArgs e)//f5
        {
            String res = "";
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            string lecID = Session["user_id"].ToString();
            String SID = f5SID.Text;
            String date = f5Date.Text;
            String content = f5Content.Text;

            if (SID != "" && date != "" && content != "")
            {
                SqlCommand proc = new SqlCommand("LecCreatePR", connection);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@Lecturer_id", lecID));
                proc.Parameters.Add(new SqlParameter("@sid", SID));
                proc.Parameters.Add(new SqlParameter("@date", date));
                proc.Parameters.Add(new SqlParameter("@content", content));

                connection.Open();
                connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
                {
                    res = e1.Message.ToString();
                };
                using (var reader = proc.ExecuteReader())
                {
                }

                connection.Close();
                m5.InnerText = res;
                if (res == "")
                {
                    r5.Visible = true;
                    r5.Text = "Created Progress Report for student " + SID;
                }
            }
            else
            {
                m5.InnerText = "Please fill in all parameters!";
            }
        }
        protected void GradeProgressReportProc(object sender, EventArgs e)//f6
        {
            String res = "";
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            string lecID = Session["user_id"].ToString();
            String SID = f6SID.Text;
            String date = f6Date.Text;
            String LectuererGrade = f6Grade.Text;

            if (SID != "" && date != "" && LectuererGrade != "")
            {
                SqlCommand proc = new SqlCommand("LecGradePR", connection);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@Lecturer_id", lecID));
                proc.Parameters.Add(new SqlParameter("@sid", SID));
                proc.Parameters.Add(new SqlParameter("@date", date));
                proc.Parameters.Add(new SqlParameter("@Lecturer_grade", LectuererGrade));

                connection.Open();
                connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
                {
                    res = e1.Message.ToString();
                };
                using (var reader = proc.ExecuteReader())
                {
                }

                connection.Close();
                m6.InnerText = res;
                if (res == "")
                {
                    r6.Visible = true;
                    r6.Text = "Graded Project for student " + SID;
                }
            }
            else
            {
                m6.InnerText = "Please fill in all parameters!";
            }
        }
        protected void GradeDefenseProc(object sender, EventArgs e)//f7
        {
            String res = "";
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            string lecID = Session["user_id"].ToString();
            String SID = f7SID.Text;
            String defenseLoc = f7DefenseLoc.Text;
            String LectuererGrade = f7Grade.Text;

            if (SID != "" && defenseLoc != "" && LectuererGrade != "")
            {
                SqlCommand proc = new SqlCommand("LecGradedefense", connection);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@Lecturer_id", lecID));
                proc.Parameters.Add(new SqlParameter("@sid", SID));
                proc.Parameters.Add(new SqlParameter("@defense_location", defenseLoc));
                proc.Parameters.Add(new SqlParameter("@Lecturer_grade", LectuererGrade));

                connection.Open();
                connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
                {
                    res = e1.Message.ToString();
                };
                using (var reader = proc.ExecuteReader())
                {
                }

                connection.Close();
                m7.InnerText = res;
                if (res == "")
                {
                    r7.Visible = true;
                    r7.Text = "Graded Defense for student " + SID;
                }
            }
            else
            {
                m7.InnerText = "Please fill in all parameters!";
            }
        }
        protected void CreateMeetingProc(object sender, EventArgs e)//f8
        {
            String res = "";
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            string lecID = Session["user_id"].ToString();
            String STime = f8STime.Text;
            String ETime = f8ETime.Text;
            String date = f8Date.Text;
            String meetingPoint = f8MeetingPoint.Text;

            if (STime != "" && ETime != "" && date != "" && meetingPoint != "")
            {
                SqlCommand proc = new SqlCommand("CreateMeeting", connection);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@Lecturer_id", lecID));
                proc.Parameters.Add(new SqlParameter("@start_time", STime));
                proc.Parameters.Add(new SqlParameter("@end_time", ETime));
                proc.Parameters.Add(new SqlParameter("@date", date));
                proc.Parameters.Add(new SqlParameter("@meeting_point", meetingPoint));

                connection.Open();
                connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
                {
                    res = e1.Message.ToString();
                };
                using (var reader = proc.ExecuteReader())
                {
                }

                connection.Close();
                m8.InnerText = res;
                if (res == "")
                {
                    r8.Visible = true;
                    r8.Text = "Created Meeting at " + meetingPoint;
                }
            }
            else
            {
                m8.InnerText = "Please fill in all parameters!";
            }
        }
        protected void AddToDoListProc(object sender, EventArgs e)//f9
        {
            String res = "";
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            String meetingID = f9MeetingID.Text;
            String ToDoList = f9ToDoList.Text;

            if (meetingID != "" && ToDoList != "")
            {
                SqlCommand proc = new SqlCommand("LecturerAddToDo", connection);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.Add(new SqlParameter("@meeting_id", meetingID));
                proc.Parameters.Add(new SqlParameter("@to_do_list", ToDoList));

                connection.Open();
                connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
                {
                    res = e1.Message.ToString();
                };
                using (var reader = proc.ExecuteReader())
                {
                }

                connection.Close();
                m9.InnerText = res;
                if (res == "")
                {
                    r9.Visible = true;
                    r9.Text = "Added to the To-Do List of meeting " + meetingID;
                }
            }
            else
            {
                m9.InnerText = "Please fill in all parameters!";
            }
        }

        protected void viewMyMeetings(object sender, EventArgs e)//f10
        {
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            string lecID = Session["user_id"].ToString();
            String meetingID = f10MeetingID.Text;

            SqlCommand proc = new SqlCommand("ViewMeetingLecturer", connection);
            proc.CommandType = CommandType.StoredProcedure;
            proc.Parameters.Add(new SqlParameter("@Lecturer_id", lecID));
            proc.Parameters.Add(new SqlParameter("@meeting_id", meetingID));

            connection.Open();
            DataTable dt = new DataTable();

            dt.Columns.AddRange(new DataColumn[7] {new DataColumn("Meeting ID"), new DataColumn("Lectuerer ID"),
                new DataColumn("Start Time"), new DataColumn("End Time"), new DataColumn("Duration"),
             new DataColumn("Date"), new DataColumn("Meeting Point")});

            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["Meeting_ID"], reader["L_id"], reader["STime"], reader["ETime"], reader["Duration"], reader["Date"], reader["Meeting_Point"]);
                }
            }
            //Response.Write(success.Value.ToString());

            G10.DataSource = dt;
            G10.DataBind();
        }
        protected void ViewUnrecommendedEEs(object sender, EventArgs e)//f11
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            SqlCommand proc = new SqlCommand("ViewEE", connection);
            proc.CommandType = CommandType.StoredProcedure;

            connection.Open();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[2] { new DataColumn("EE id"), new DataColumn("Schedule") });
            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["EE_id"], reader["Schedule"]);
                }
            }
            G11.DataSource = dt;
            G11.DataBind();
            connection.Close();
        }
        protected void RecommendEE(object sender, EventArgs e)//f12
        {
            String res = "";
            string connectionString = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            string lecID = Session["user_id"].ToString();
            String projectCode = f12ProjCode.Text;
            String EEId = f12EEId.Text;

            if (projectCode != "" && EEId != "")
            {
                SqlCommand proc = new SqlCommand("RecommendEE", connection);
                proc.CommandType = CommandType.StoredProcedure;

                proc.Parameters.Add(new SqlParameter("@Lecturer_id", lecID));
                proc.Parameters.Add(new SqlParameter("@proj_code", projectCode));
                proc.Parameters.Add(new SqlParameter("@EE_id", EEId));

                connection.Open();
                connection.InfoMessage += delegate (object sender1, SqlInfoMessageEventArgs e1)
                {
                    res = e1.Message.ToString();
                };
                using (var reader = proc.ExecuteReader())
                {
                }

                connection.Close();
                m12.InnerText = res;
                if (res == "")
                {
                    r12.Visible = true;
                    r12.Text = "Recommended External Examiner " + f12EEId.Text;
                }
            }
            else
            {
                m12.InnerText = "Please fill in all parameters!";
            }
        }

        protected void openMainf1(object sender, EventArgs e)
        {
            f1.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf2(object sender, EventArgs e)
        {
            f2.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf3(object sender, EventArgs e)
        {
            f3.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf4(object sender, EventArgs e)
        {
            f4.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf5(object sender, EventArgs e)
        {
            f5.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf6(object sender, EventArgs e)
        {
            f6.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf7(object sender, EventArgs e)
        {
            f7.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf8(object sender, EventArgs e)
        {
            f8.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf9(object sender, EventArgs e)
        {
            f9.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf10(object sender, EventArgs e)
        {
            f10.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf11(object sender, EventArgs e)
        {
            f11.Visible = false;
            mainForm.Visible = true;
        }
        protected void openMainf12(object sender, EventArgs e)
        {
            f12.Visible = false;
            mainForm.Visible = true;
        }
        protected void openf1(object sender, EventArgs e)
        {
            f1.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf2(object sender, EventArgs e)
        {
            f2.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf3(object sender, EventArgs e)
        {
            f3.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf4(object sender, EventArgs e)
        {
            f4.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf5(object sender, EventArgs e)
        {
            f5.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf6(object sender, EventArgs e)
        {
            f6.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf7(object sender, EventArgs e)
        {
            f7.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf8(object sender, EventArgs e)
        {
            f8.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf9(object sender, EventArgs e)
        {
            f9.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf10(object sender, EventArgs e)
        {
            f10.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf11(object sender, EventArgs e)
        {
            f11.Visible = true;
            mainForm.Visible = false;
        }
        protected void openf12(object sender, EventArgs e)
        {
            f12.Visible = true;
            mainForm.Visible = false;
        }
        protected void Button3_Click(object sender, EventArgs e)
        {

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}