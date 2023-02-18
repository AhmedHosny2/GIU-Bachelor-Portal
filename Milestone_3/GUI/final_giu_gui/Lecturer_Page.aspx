<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lecturer_Page.aspx.cs" Inherits="final_giu_gui.Main_Page" %>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css file -->
    <link rel="stylesheet" href="User_Pages_Style.css">
    <link rel="stylesheet" href="formStyle.css">
    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@100;300;400;500;700;800&display=swap"
        rel="stylesheet">

    <!-- Font Awesome Library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>Lectuerer Page</title>
</head>

<body>

<style>
    

            .title1 {
                background-color: teal;
                border-radius: 15px;
                padding: 8px 0px 8px 0px;
                border: 5px solid black;
            }

                .title1 p {
                    padding: 0 0 0 10px;
                    display: block;
                    width: fit-content;
                    font-size: 25px;
                    font-weight: bold;
                    text-transform: capitalize;
                    margin: auto;
                }
</style>
    <form id="mainForm" class="form index" runat="server">
        <div class="header">
            <div class="form container">

                 <asp:ImageButton class="logo" ID="ImageButton1" runat="server" ImageUrl="images/Giu_logo.png" OnClick="ImageButton1_Click1" />

                <div class="links">
                    <span class="icon">
                        <span></span>
                        <span></span>
                        <span></span>
                    </span>
                    <ul>
                        <li><a href="https://localhost:44337/HomePage.aspx">Home Page</a></li>
                        <hr>
                        <li><a href="https://localhost:44337/Login_Page.aspx">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>

         <div class="form">
            <div class="container">

                      <div class="box">
                           <h3>Hello</h3>
                          <div class="but">
        <asp:Button OnClick="openProfile" runat="server" Class="button_group" ID="Button28" Text="View Profile"></asp:Button>
        <asp:Button OnClick="openBachelor" runat="server" Class="button_group" ID="Button29" Text="View Bachelor Projects"></asp:Button>
                              </div>
                              </div>



            <div class="box">
                <h3>bachelor Project</h3>
                <div class="but">
                    <asp:Button OnClick="openf1" runat="server" Class="button_group" ID="b1" Text="Create Bachelor Project"></asp:Button>
                    <asp:Button OnClick="openf2" runat="server" Class="button_group" ID="b2" Text="Supervise Industrial Project"></asp:Button>
                </div>
            </div>
            <div class="box">
                <h3>thesis</h3>
                <div class="but">
                    <asp:Button OnClick="openf3" runat="server" Class="button_group" ID="b3" Text="Set Thesis Deadline"></asp:Button>
                    <asp:Button OnClick="openf4" runat="server" Class="button_group" ID="b4" Text="Grade Thesis"></asp:Button>
                </div>
            </div>
            <div class="box">
                <h3>progress report</h3>
                <div class="but">
                    <asp:Button OnClick="openf5" runat="server" Class="button_group" ID="b5" Text="Create Progress Report"></asp:Button>
                    <asp:Button OnClick="openf6" runat="server" Class="button_group" ID="b6" Text="Grade Progress Report"></asp:Button>
                </div>
            </div>
            <div class="box">
                <h3>defense</h3>
                <div class="but">
                    <asp:Button OnClick="openf7" runat="server" Class="button_group" ID="b7" Text="Grade Defense"></asp:Button>
                </div>
            </div>
            <div class="box">
                <h3>meeting</h3>
                <div class="but">
                    <asp:Button OnClick="openf8" runat="server" Class="button_group" ID="b8" Text="Create Meeting"></asp:Button>
                    <asp:Button OnClick="openf9" runat="server" Class="button_group" ID="b9" Text="Add to To-Do List"></asp:Button>
                    <asp:Button OnClick="openf10" runat="server" Class="button_group" ID="b10" Text="View Meeting"></asp:Button>
                </div>
            </div>
            <div class="box">
                <h3>External Examiners</h3>
                <div class="but">
                    <asp:Button OnClick="openf11" runat="server" Class="button_group" ID="b11" Text="View Unrecommended EEs"></asp:Button>
                    <asp:Button OnClick="openf12" runat="server" Class="button_group" ID="b12" Text="Recommend EEs"></asp:Button>
                </div>
            </div>
        </div>
             </div>
    </form>

    <div class="WraP">

        <form id="f1" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>Create Bachelor Project</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf1" class="BackButtons" ID="ButtonBack1" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Project Code:"></asp:Label>
                            <asp:TextBox ID="f1ProjCode" placeholder="Project code" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Title:"></asp:Label>
                            <asp:TextBox ID="f1Title" placeholder="Title" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Description:"></asp:Label>
                            <asp:TextBox ID="f1Desc" placeholder="Description" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Major Code:"></asp:Label>
                            <asp:TextBox ID="f1MajorCode" placeholder="Major Code" runat="server"></asp:TextBox>
                        <asp:Label ID="r1" runat="server" Text="Created Project with code ..." Visible="false"></asp:Label>
                        <label id="m1" runat="server"></label>
                    <asp:Button OnClick="createProj" class="buttonG" ID="Button2" runat="server" Text="Create"></asp:Button>
            </div>
        </form>

        <form id="f2" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>Super Vise Industrial Project</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf2" class="BackButtons" ID="Button1" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Project Code:"></asp:Label>
                            <asp:TextBox ID="f2ProjCode" AutoCompleteType="DisplayName" placeholder="Project code" runat="server"></asp:TextBox> 
                        <asp:Label ID="r2" runat="server" Text="Supervising project ..." Visible="false"></asp:Label>
                        <label id="m2" runat="server"></label>
                    <asp:Button OnClick="superviseProc" class="buttonG" ID="Button3" runat="server" Text="Supervise"></asp:Button>
            </div>
        </form>

        <form id="f3" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>Specify Thesis Deadline</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf3" class="BackButtons" ID="Button16" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Deadline:"></asp:Label>
                            <asp:TextBox ID="f3Deadline" type="Date" runat="server"></asp:TextBox>
                        <asp:Label ID="r3" runat="server" Text="Specified Thesis Deadline" Visible="false"></asp:Label>
                        <label id="m3" runat="server"></label>
                    <asp:Button OnClick="specifyThesisDeadlineProc" class="buttonG" ID="Button17" runat="server" Text="Update"></asp:Button>
            </div>
        </form>

        <form id="f4" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>Grade Thesis</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf4" class="BackButtons" ID="Button4" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Student ID:"></asp:Label>
                            <asp:TextBox ID="f4SID" placeholder="Student ID" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Thesis Title:"></asp:Label>
                            <asp:TextBox ID="f4Title" placeholder="Title" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Grade:"></asp:Label>
                            <asp:TextBox ID="f4Grade" placeholder="Grade" runat="server"></asp:TextBox>
                        <asp:Label ID="r4" runat="server" Text="Graded Thesis ... for Student ..." Visible="false"></asp:Label>
                        <label id="m4" runat="server"></label>
                    <asp:Button OnClick="GradeThesisPro" class="buttonG" ID="Button5" runat="server" Text="Update"></asp:Button>
            </div>
        </form>

        <form id="f5" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>Create Progress Report</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf5" class="BackButtons" ID="Button6" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Student ID:"></asp:Label>
                            <asp:TextBox ID="f5SID" placeholder="Student ID" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Date:"></asp:Label>
                            <asp:TextBox ID="f5Date" type="Date" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Content:"></asp:Label>
                            <asp:TextBox ID="f5Content" placeholder="Content" runat="server"></asp:TextBox>
                        <asp:Label ID="r5" runat="server" Text="Created Progress Report for Student ..." Visible="false"></asp:Label>
                        <label id="m5" runat="server"></label>
                    <asp:Button OnClick="CreateProgressReportProc" class="buttonG" ID="Button7" runat="server" Text="Update"></asp:Button>
            </div>
        </form>

        <form id="f6" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>Grade Progress Report</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf6" class="BackButtons" ID="Button8" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Student ID:"></asp:Label>
                            <asp:TextBox ID="f6SID" placeholder="Student ID" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Date:"></asp:Label>
                            <asp:TextBox ID="f6Date" type="Date" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Grade:"></asp:Label>
                            <asp:TextBox ID="f6Grade" placeholder="Grade" runat="server"></asp:TextBox>
                        <asp:Label ID="r6" runat="server" Text="Graded Progress Report ... for Student ..." Visible="false"></asp:Label>
                        <label id="m6" runat="server"></label>
                    <asp:Button OnClick="GradeProgressReportProc" class="buttonG" ID="Button9" runat="server" Text="Update"></asp:Button>
            </div>
        </form>

        <form id="f7" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>Grade Defense</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf7" class="BackButtons" ID="Button10" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Student ID:"></asp:Label>
                            <asp:TextBox ID="f7SID" placeholder="Student ID" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Defense Location:"></asp:Label>
                            <asp:TextBox ID="f7DefenseLoc" placeholder="Defense Location" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Grade:"></asp:Label>
                            <asp:TextBox ID="f7Grade" placeholder="Grade" runat="server"></asp:TextBox>
                        <asp:Label ID="r7" runat="server" Text="Graded Defense ... for Student ..." Visible="false"></asp:Label>
                        <label id="m7" runat="server"></label>
                    <asp:Button OnClick="GradeDefenseProc" class="buttonG" ID="Button11" runat="server" Text="Grade"></asp:Button>
            </div>
        </form>

        <form id="f8" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>Create Meeting</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf8" class="BackButtons" ID="Button12" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Start Time:"></asp:Label>
                            <asp:TextBox ID="f8STime" type="Time" placeholder="Start Time" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="End Time:"></asp:Label>
                            <asp:TextBox ID="f8ETime" type="Time" placeholder="End Time" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Date:"></asp:Label>
                            <asp:TextBox ID="f8Date" type="Date" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="Meeting Point:"></asp:Label>
                            <asp:TextBox ID="f8MeetingPoint" placeholder="Meeting Point" runat="server"></asp:TextBox>
                        <asp:Label ID="r8" runat="server" Text="Created Meeting ..." Visible="false"></asp:Label>
                        <label id="m8" runat="server"></label>
                    <asp:Button OnClick="CreateMeetingProc" class="buttonG" ID="Button13" runat="server" Text="Create"></asp:Button>
            </div>
        </form>

        <form id="f9" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>Add To-Do List</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf9" class="BackButtons" ID="Button18" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Meeting ID:"></asp:Label>
                            <asp:TextBox ID="f9MeetingID" placeholder="Meeting ID" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="To-Do List:"></asp:Label>
                            <asp:TextBox ID="f9ToDoList" placeholder="To-Do List" runat="server"></asp:TextBox>
                        <asp:Label ID="r9" runat="server" Text="Added To-Do List ... to Meeting ..." Visible="false"></asp:Label>
                        <label id="m9" runat="server"></label>
                    <asp:Button OnClick="AddToDoListProc" class="buttonG" ID="Button19" runat="server" Text="Add"></asp:Button>
            </div>
        </form>

        <form id="f10" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>View Meetings</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf10" class="BackButtons" ID="Button14" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Meeting id:"></asp:Label>
                            <asp:TextBox ID="f10MeetingID" placeholder="Meeting Id" runat="server"></asp:TextBox>
                        <asp:GridView ID="G10" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <label id="m10" runat="server"></label>
                    <asp:Button OnClick="viewMyMeetings" class="buttonG" ID="Button15" runat="server" Text="View"></asp:Button>
            </div>
        </form>

        <form id="f11" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>View Unrecommended EEs</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf11" class="BackButtons" ID="Button22" runat="server" Text="< Go Back"></asp:Button>
                            <asp:GridView ID="G11" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        <asp:Button OnClick="ViewUnrecommendedEEs" class="buttonG" ID="Button23" runat="server" Text="View"></asp:Button>
            </div>
        </form>

        <form id="f12" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>Create Meeting</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainf12" class="BackButtons" ID="Button24" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="Project Code:"></asp:Label>
                            <asp:TextBox ID="f12ProjCode" placeholder="Project Code" runat="server"></asp:TextBox>
                            <asp:Label runat="server" Text="EE Id:"></asp:Label>
                            <asp:TextBox ID="f12EEId" placeholder="EE Id" runat="server"></asp:TextBox>
                        <asp:Label ID="r12" runat="server" Text="Recommended EE ..." Visible="false"></asp:Label>
                        <label id="m12" runat="server"></label>
                    <asp:Button OnClick="RecommendEE" class="buttonG" ID="Button25" runat="server" Text="Recommend"></asp:Button>
            </div>
        </form>

        <form id="Profileee" class="form1" runat="server" visible="false">
            <div class="title1">
                <p>My Profile</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainProfile" class="BackButtons" ID="Button21" runat="server" Text="< Go Back"></asp:Button>
                            <asp:Label runat="server" Text="User ID:"></asp:Label>
                            <asp:Label ID="PUserID" runat="server" Text=""></asp:Label>
                            <asp:Label runat="server" Text="Username:"></asp:Label>
                            <asp:Label ID="PUsername" runat="server" Text=""></asp:Label>
                            <asp:Label runat="server" Text="Password:"></asp:Label>
                            <asp:Label ID="PPassword" runat="server" Text=""></asp:Label>
                            <asp:Label runat="server" Text="Email:"></asp:Label>
                            <asp:Label ID="PEmail" runat="server" Text=""></asp:Label>
                            <asp:Label runat="server" Text="Phonenumber:"></asp:Label>
                            <asp:Label ID="PPhonenumber" runat="server" Text=""></asp:Label>
                            <asp:Label runat="server" Text="User Type:"></asp:Label>
                            <asp:Label ID="PUsertype" runat="server" Text=""></asp:Label>
                        </div>
                        <asp:Panel ID="PStudent" runat="server" Visible="false">
                                <asp:Label runat="server" Text="First Name:"></asp:Label>
                                <asp:Label ID="PFName" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Lase Name:"></asp:Label>
                                <asp:Label ID="PLName" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Major Code:"></asp:Label>
                                <asp:Label ID="PMCode" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Date Of Birth:"></asp:Label>
                                <asp:Label ID="PDOB" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Address:"></asp:Label>
                                <asp:Label ID="PAddress" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Age:"></asp:Label>
                                <asp:Label ID="PPAge" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Semester:"></asp:Label>
                                <asp:Label ID="PSemester" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="GPA:"></asp:Label>
                                <asp:Label ID="PGPA" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Total Bachelor Grade:"></asp:Label>
                                <asp:Label ID="PTotalBachelorGrade" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Assigned Project Code:"></asp:Label>
                                <asp:Label ID="PAssignedProjCode" runat="server" Text=""></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="PCompany" runat="server" Visible="false">
                                <asp:Label runat="server" Text="Name:"></asp:Label>
                                <asp:Label ID="CName" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Representative Name:"></asp:Label>
                                <asp:Label ID="CRepName" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Representative_Email:"></asp:Label>
                                <asp:Label ID="CRepEmail" runat="server" Text=""></asp:Label>
                                <asp:Label runat="server" Text="Location:"></asp:Label>
                                <asp:Label ID="CLocation" runat="server" Text=""></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="PLecTa" runat="server" Visible="false">
                                <asp:Label runat="server" Text="Schedule:"></asp:Label>
                                <asp:Label ID="PSchedule" runat="server" Text=""></asp:Label>
                        </asp:Panel>
                    </div>

            </div>
            </form>


        <form id="form_BP_details" runat="server" class="form1" visible="false">
            <div class="title1">
                <p>View Bachelor Projects</p>
            </div>
            <div class="box">
                        <asp:Button OnClick="openMainBachelor" class="BackButtons" ID="Button26" runat="server" Text="< Go Back"></asp:Button>
                    <asp:DropDownList ID="Project_type_list" runat="server">
                        <asp:ListItem Selected="True">all</asp:ListItem>
                        <asp:ListItem>Academic</asp:ListItem>
                        <asp:ListItem>Industrial</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="BachelorsUser_ID" type="number" placeholder="Enter user id" runat="server"></asp:TextBox>
                <asp:Label ID="gridErrors" runat="server" Text="Label"></asp:Label>
                    <asp:Button ID="proj" class="buttonG" runat="server" Text="submit_proj_type" OnClick="ViewBachelor"></asp:Button>

                        <asp:GridView ID="grid_BP_details" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
            </div>
        </form>
    </div>

</body>

</html>
