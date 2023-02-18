using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Reflection.Emit;

namespace final_giu_gui
{
    public partial class Coord_Page : System.Web.UI.Page
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
           // ViewBachelor(sender, e);
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
        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void Schedule_defenses_Click(object sender, EventArgs e)
        {

            form1.Visible = false;
            form_Schedule_defenses.Visible = true;
        }

        protected void Assign_TAs_to_local_bachelor_projects_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            assign_ta_form.Visible = true;

        }
        /*  protected void gradeDefenseButton(object sender, EventArgs e)
          {
              string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
              SqlConnection connection = new SqlConnection(connectionstring);

              int theCompID = Convert.ToInt32(compID6.Text);
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
                  error12.Text = "Invalid Company ID!";
              }
              else if (success.Value.ToString() == "-3")
              {
                  error13.Text = "Invalid Student ID!";
              }
              else if (success.Value.ToString() == "-4")
              {
                  error14.Text = "Invalid Defense Location!";
              }
              else if (success.Value.ToString() == "-5")
              {
                  error15.Text = "Invalid Student ID & Defense Combination";
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
              }
          }
          */
        protected void Assign_external_examiners_to_local_bachelor_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            form_AssignEE.Visible = true;
        }

        protected void students_to_their_projects_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            AssignAllStudentsToLocalProject.Visible = true;
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            SqlCommand Assign_students = new SqlCommand("AssignAllStudentsToLocalProject", connection);
            Assign_students.CommandType = CommandType.StoredProcedure;

            connection.Open();
            DataTable dt = new DataTable();

            dt.Columns.AddRange(new DataColumn[5] {new DataColumn("sid"), new DataColumn("code"),
                new DataColumn("Description"), new DataColumn("Name"), new DataColumn("Submitted_Materials")});

            System.Diagnostics.Debug.WriteLine("-------------------------------------------------");
            using (SqlDataReader reader = Assign_students.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["sid"], reader["code"], reader["Description"], reader["Name"], reader["Submitted_Materials"]);

                }
            }
            //Response.Write(success.Value.ToString());

            AssignAllStudentsToLocalProject.Visible = true;
            Grid_for_student_project.Visible = true;
            Grid_for_student_project.Height = 100;
            Grid_for_student_project.DataSource = dt;
            Grid_for_student_project.DataBind();


        }


        protected void external_examiners_that_are_recommended_by_each_Lecturer_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            Lec_rec_form.Visible = true;
        }

        protected void See_details_of_all_users_Click(object sender, EventArgs e)
        {
            form1.Visible = false;
            view_all_users1.Visible = true;


        }











   

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void filter_users(object sender, EventArgs e)
        {
            view_all_users1.Visible = true;

            view_all_users.Visible = false;
            Gridview1.Visible = false;

            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            SqlCommand proc = new SqlCommand("ViewUsers", connection);
            proc.CommandType = CommandType.StoredProcedure;
            int User_id = -1;

            if (!string.IsNullOrEmpty(user_id.Text))
            {
                User_id = Convert.ToInt32(user_id.Text);
            }

            string User_Type = User_Type_list.Text;

            // if user id = -1 means get all users  if user type =all user mean get all users  
            proc.Parameters.Add(new SqlParameter("@User_type", User_Type));
            proc.Parameters.Add(new SqlParameter("@User_id", User_id));


            SqlParameter success = proc.Parameters.Add("@erfolg", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            connection.Open();


            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("User Id"), new DataColumn("User Name"), new DataColumn("Email"), new DataColumn("Phone number"), new DataColumn("User Type") });

            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["users_id"], reader["Username"], reader["Email"], reader["Phone_number"], reader["User_type"]);

                }
            }
            if (success.Value.ToString() == "-1")
                error_view_users.Text = "Invalid user_id";
            else
            {
                view_all_users1.Visible = false;

                view_all_users.Visible = true;
                Gridview1.Visible = true;
                Gridview1.Height = 100;
                Gridview1.DataSource = dt;
                Gridview1.DataBind();

            }
        }

        protected void TA_id_TextChanged(object sender, EventArgs e)
        {

        }

        protected void assign_ta_button(object sender, EventArgs e)
        {
            error_assign_ta.Text = "";
            lol.Text = "Submit";
            lol.Enabled = true;
            lol.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            int Coordinator_id = Convert.ToInt32(Session["user_id"]);
            int TA_ID = Convert.ToInt32(TA_id.Text);
            string Project_code = proj_code.Text;

            SqlCommand Assign_TA = new SqlCommand("AssignTAs", connection);
            Assign_TA.CommandType = CommandType.StoredProcedure;

            Assign_TA.Parameters.Add(new SqlParameter("@coordinator_id", Coordinator_id));
            Assign_TA.Parameters.Add(new SqlParameter("@TA_id", TA_ID));
            Assign_TA.Parameters.Add(new SqlParameter("@proj_code", Project_code));

            SqlParameter success = Assign_TA.Parameters.Add("@erfolg", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;


            connection.Open();
            Assign_TA.ExecuteNonQuery();
            connection.Close();


            if (success.Value.ToString() == "-1")
            {
                error_assign_ta.Text = "Invalid coordinator";
            }
            else if (success.Value.ToString() == "-2")
            {
                error_assign_ta.Text = "Invalid TA";
            }
            else if (success.Value.ToString() == "-3")

            {
                error_assign_ta.Text = "Invalid project code";
            }
            else
            {
                lol.Text = "Assigned";
                lol.Enabled = false;
                lol.BackColor = System.Drawing.ColorTranslator.FromHtml("#c4161c");

            }

        }

        protected void lec_rec_submit(object sender, EventArgs e)
        {


            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            SqlCommand proc = new SqlCommand("ViewRecommendation", connection);
            proc.CommandType = CommandType.StoredProcedure;
            int Lecture__id = -1;

            if (!string.IsNullOrEmpty(lec_id.Text))
            {
                Lecture__id = Convert.ToInt32(lec_id.Text);
            }

            proc.Parameters.Add(new SqlParameter("@lecture_id", Lecture__id));


            SqlParameter success = proc.Parameters.Add("@erfolg", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            connection.Open();

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Lecture ID"), new DataColumn("EE id"), new DataColumn("Project code "), });

            using (SqlDataReader reader = proc.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["L_id"], reader["EE_id"], reader["PCode"]);

                }
            }
            //Response.Write(success.Value.ToString());
            if (success.Value.ToString() == "-1")
                error1.Text = "Invalid Lecture ID";
            else
            {
                Lec_rec_form.Visible = false;
                form_grid_for_recommendtion.Visible = true;
                lec_rec_grid.Visible = true;
                lec_rec_grid.Height = 100;
                lec_rec_grid.DataSource = dt;
                lec_rec_grid.DataBind();

            }
        }

        protected void assign_EE_button(object sender, EventArgs e)
        {
            assign_ee_but.Text = "Assign";
            assign_ee_but.Enabled = true;

            erroe_for_assign_ee.Text = "";

            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            int Coordinator_id = Convert.ToInt32(Session["user_id"]);
            int EE_ID = Convert.ToInt32(EE_ID_in_assin_EE.Text);
            string Project_code = project_code_in_assin_EE.Text;

            SqlCommand Assign_TA = new SqlCommand("AssignEE", connection);
            Assign_TA.CommandType = CommandType.StoredProcedure;

            Assign_TA.Parameters.Add(new SqlParameter("@coordinator_id", Coordinator_id));
            Assign_TA.Parameters.Add(new SqlParameter("@EE_id", EE_ID));
            Assign_TA.Parameters.Add(new SqlParameter("@proj_code", Project_code));

            SqlParameter success = Assign_TA.Parameters.Add("@erfolg", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;


            connection.Open();
            Assign_TA.ExecuteNonQuery();
            connection.Close();


            if (success.Value.ToString() == "-1")
            {
                erroe_for_assign_ee.Text = "Invalid coordinator";
            }
            else if (success.Value.ToString() == "-2")
            {
                erroe_for_assign_ee.Text = "Invalid EE";
            }
            else if (success.Value.ToString() == "-3")

            {
                erroe_for_assign_ee.Text = "Invalid project code";
            }
            else
            {
                assign_ee_but.Text = "Assigned";
                assign_ee_but.Enabled = false;
            }
        }

        protected void Schedule(object sender, EventArgs e)
        {
            error_form_Schedule_defenses.Text = "";
            schedule_defense_but.Text = "Schedule";
            schedule_defense_but.Enabled = true;
            string connectionstring = WebConfigurationManager.ConnectionStrings["GIUDataBase"].ToString();
            SqlConnection connection = new SqlConnection(connectionstring);

            int Sid = Convert.ToInt32(sid_Schedule_defenses.Text);
            DateTime date = Convert.ToDateTime(Date.Text);
            string Time = time.Text;
            //  TimeSpan Time = System.Xml.XmlConvert.ToTimeSpan(time.ToString());
            //  TimeSpan Time = TimeSpan.Parse(time.ToString());
            string Location = location.Text;

            SqlCommand Assign_TA = new SqlCommand("ScheduleDefense", connection);
            Assign_TA.CommandType = CommandType.StoredProcedure;

            Assign_TA.Parameters.Add(new SqlParameter("@sid", Sid));
            Assign_TA.Parameters.Add(new SqlParameter("@date", date));
            Assign_TA.Parameters.Add(new SqlParameter("@time", Time));
            Assign_TA.Parameters.Add(new SqlParameter("@location", Location));

            SqlParameter success = Assign_TA.Parameters.Add("@erfolg", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;


            connection.Open();
            Assign_TA.ExecuteNonQuery();
            connection.Close();


            if (success.Value.ToString() == "-1")
            {
                error_form_Schedule_defenses.Text = "Invalid Student id";
            }
            else if (success.Value.ToString() == "-10")
            {
                error_form_Schedule_defenses.Text = "Defense Schedule UPDATED!";
                schedule_defense_but.Text = "SCHEDULED";
                schedule_defense_but.Enabled = false;
            }
            else
            {
                schedule_defense_but.Text = "SCHEDULED";
                schedule_defense_but.Enabled = false;
            }
            //Response.Write(time);

        }

        protected void close_SD(object sender, EventArgs e)
        {
            Response.Redirect("Coordniator Page.aspx.cs");
        }

        protected void Unnamed2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}