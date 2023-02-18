<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company_Page.aspx.cs" Inherits="final_giu_gui.Company_Page" %>


<style>
    ::-webkit-scrollbar {
        width: 20px;
    }

    ::-webkit-scrollbar-track {
        border-radius: 5px;
        box-shadow: inset 0 0 10px rgba(0,0,0,0.25);
        color: #4cff00;
    }

    ::-webkit-scrollbar-thumb {
        border-radius: 5px;
        background-color: #ff6c17;
    }

        ::-webkit-scrollbar-thumb:hover {
            background-color: #fcb114;
        }

    .error {
        color: #e40808;
        font-weight: bold;
        width: 500px;
    }
</style>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css file -->
    <link rel="stylesheet" href="User_Pages_Style.css">
    <link rel="stylesheet" href="formStyle.css" />
    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@100;300;400;500;700;800&display=swap"
        rel="stylesheet">

    <!-- Font Awesome Library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>Company Page</title>
</head>


</head>
<body>

    <!-- start header -->
    <form id="form1" runat="server" visible="true">
        <div class="header">
            <div class="container">

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
        <!-- end header -->

        <!-- Start form -->
        <div class="form">
            <div class="container">

                      <div class="box">
                           <h3>Hello</h3>
                          <div class="but">
        <asp:Button OnClick="openProfile" runat="server" Class="button_group" ID="Button20" Text="View Profile"></asp:Button>
        <asp:Button OnClick="openBachelor" runat="server" Class="button_group" ID="Button27" Text="View Bachelor Projects"></asp:Button>
                              </div>
                              </div>

                <div class="box">
                    <h3>Employees</h3>
                    <div class="but">
                        <asp:Button class="button_group" ID="Button1" runat="server" Text="Hire New Employee"
                            OnClick="hireEmpClicked" />
                    </div>
                </div>

                <div class="box">
                    <h3>bachelor Projects</h3>
                    <div class="but">
                        <asp:Button class="button_group" ID="Button2" runat="server" Text="Create a New Industrial Bachelor Project"
                            OnClick="CPClicked" />
                        <asp:Button class="button_group" ID="Button3" runat="server" Text="Assign an Employee as a Supervisor"
                            OnClick="AEClicked" />
                    </div>
                </div>

                <div class="box">
                    <h3>thesis</h3>
                    <div class="but">
                        <asp:Button class="button_group" ID="Button4" runat="server" Text="Grade a Thesis"
                            OnClick="GTClicked" />
                    </div>
                </div>

                <div class="box">
                    <h3>progress report</h3>
                    <div class="but">
                        <asp:Button class="button_group" ID="Button5" runat="server" Text="Grade a Progress Report"
                            OnClick="PRClicked" />
                    </div>
                </div>

                <div class="box">
                    <h3>defense</h3>
                    <div class="but">
                        <asp:Button class="button_group" ID="Button6" runat="server" Text="Grade a Defense"
                            OnClick="GDClicked" />
                    </div>
                </div>

            </div>
        </div>


        <!-- end form -->

        <!-- start footer -->
        <!-- <div class="footer">&copy; 2023 <span>GIU AAMY</span> All Right Reserved</div> -->
        <!-- end footer -->
    </form>




    <!--
<div class="WraP">

<form id="formTEST" runat="server" visible ="false">
      <h2>welcome, back</h2>
      <div class="box">
        <div class="email">
          <asp:TextBox type="text" id="Email" placeholder="Enter Email" runat="server"></asp:TextBox>
          <span class="bottom"></span>
          <span class="right"></span>
          <span class="top"></span>
          <span class="left"></span>
        </div>
        <div class="pass">
          <asp:TextBox type="text" id="Password" placeholder="Enter password" runat="server"></asp:TextBox>

          <span class="bottom"></span>
          <span class="right"></span>
          <span class="top"></span>
          <span class="left"></span>
        </div>
      </div>
          <asp:Button  class ="buttonG" runat="server" Text="Loge in" OnClick="Unnamed4_Click"></asp:Button>
         <asp:Button class ="buttonG"  runat="server" Text="Submit" OnClick="Unnamed5_Click"></asp:Button>
    </form>


     --------------TEST FORM ---------------------

    <form id="formN" runat="server" visible ="false">
      <h2>welcome, back</h2>
      <div class="box">
        


      </div>
          
    </form>

-->



    <div class="WraP">
        
    <form id="Profileee"  runat="server" visible="false">
       
            <h2>My Profile</h2>
     
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
    </form>
    
    <form id="form_BP_details" runat="server" class ="form1" visible="false">
            <h2>View Bachelor Projects</h2>
                <asp:TextBox ID="BachelorsUser_ID" type="number" placeholder="Enter user id" runat="server"></asp:TextBox>

                <asp:DropDownList ID="Project_type_list" runat="server" Width="100px">
                    <asp:ListItem Selected="True">all</asp:ListItem>
                    <asp:ListItem>Academic</asp:ListItem>
                    <asp:ListItem>Industrial</asp:ListItem>
                </asp:DropDownList>

                                      <asp:Label id="gridErrors" runat="server" Text=""></asp:Label>

                <asp:Button ID="proj" class="buttonG" runat="server" Text="Submit" OnClick="ViewBachelor"></asp:Button>

                    <asp:GridView ID="grid_BP_details" runat="server" CellPadding="20" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                      <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
    </form>


        <form id="form2" runat="server" visible="false">
            <h2>Hire Employee</h2>
            <div class="box">


                <label>Employee Email</label>
                <asp:TextBox required="" ID="email2" placeholder="Enter email" runat="server"> </asp:TextBox>

                <label>Employee Name</label>
                <asp:TextBox required="" ID="name" placeholder="Enter name" runat="server"> </asp:TextBox>

                <label>Employee Phone Number</label>
                <asp:TextBox required="" ID="phone" placeholder="Enter phone number" runat="server"> </asp:TextBox>

                <label>Employee Field</label>
                <asp:TextBox required="" ID="field" placeholder="Enter field" runat="server"> </asp:TextBox>


            </div>
            <asp:Label class="error" ID="error1" runat="server"></asp:Label>
            <asp:Button class="buttonG" ID="hireB" runat="server" Text="Hire" OnClick="hireButton"></asp:Button>
        </form>



        <form id="form3" runat="server" visible="false">
            <h2>Create Project</h2>
            <div class="box">


                <div class="error">
                    <asp:Label ID="error4" runat="server"></asp:Label></div>
                <asp:Label ID="lab7" runat="server">Project Code</asp:Label>
                <asp:TextBox required="" ID="code" placeholder="Enter code" runat="server"> </asp:TextBox>

                <asp:Label ID="lab8" runat="server">project Title</asp:Label>
                <asp:TextBox required="" ID="title" placeholder="Enter title" runat="server"> </asp:TextBox>

                <div class="error">
                    <asp:Label ID="error5" runat="server"></asp:Label></div>
                <asp:Label ID="lab9" runat="server">Major Code</asp:Label>
                <asp:TextBox type="number" required="" ID="majorC" placeholder="Enter code" runat="server"> </asp:TextBox>

                <div class="form">
                    <asp:Label ID="lab10" runat="server">Description</asp:Label>
                    <asp:TextBox required="" ID="desc" placeholder="Enter description"
                        TextMode="multiline" Columns="50" Rows="5"
                        MaxLength="200" runat="server"> </asp:TextBox>

                </div>
            </div>
            <div class="error">
                <asp:Label ID="error3" runat="server"></asp:Label></div>
            <asp:Button class="buttonG" ID="createB" runat="server" Text="Create" OnClick="createProjButton"></asp:Button>
        </form>


        <form id="form4" runat="server" visible="false">
            <h2>Assign Employee</h2>
            <div class="box">

                <div class="error">
                    <asp:Label ID="error7" runat="server"></asp:Label></div>
                <asp:Label ID="lab12" runat="server">Bachelor Code</asp:Label>
                <asp:TextBox required="" ID="code4" placeholder="Enter code" runat="server"> </asp:TextBox>
                <div class="error">
                    <asp:Label ID="error8" runat="server"></asp:Label></div>

                <asp:Label ID="lab13" runat="server">Employee ID</asp:Label>
                <asp:TextBox required="" type="number" ID="staffID4" placeholder="Enter staff ID" runat="server"> </asp:TextBox>
            </div>
            <div class="error">
                <asp:Label ID="error6" runat="server"></asp:Label></div>
            <asp:Button class="buttonG" ID="assignB" runat="server" Text="Hire" OnClick="assignButton"></asp:Button>
        </form>


        <form id="form5" runat="server" visible="false">
            <h2>Grade Thesis</h2>
            <div class="box">

                <div class="error">
                    <asp:Label ID="error10" runat="server"></asp:Label></div>
                <asp:Label ID="lab15" runat="server">Student ID</asp:Label>
                <asp:TextBox required="" type="number" ID="sid5" placeholder="Enter ID" runat="server"> </asp:TextBox>
                <div class="error">
                    <asp:Label ID="error11" runat="server"></asp:Label></div>
                <div class="error">
                    <asp:Label ID="error11_5" runat="server"></asp:Label></div>
                <asp:Label ID="lab16" runat="server">Thesis Title</asp:Label>
                <asp:TextBox required="" ID="title5" placeholder="Enter title" runat="server"> </asp:TextBox>

                <asp:Label ID="lab17" runat="server">Grade</asp:Label>
                <asp:TextBox required="" ID="grade5" Type="number" min="0.7" step="0.1" max="4.0" placeholder="Grade"
                    runat="server"></asp:TextBox>
            </div>
            <div class="error">
                <asp:Label ID="error9" runat="server"></asp:Label></div>
            <asp:Button class="buttonG" ID="gradeB" runat="server" Text="Grade" OnClick="gradeThesisButton"></asp:Button>
        </form>


        <form id="form6" runat="server" visible="false">
            <h2>Grade Defense</h2>
            <div class="box">

                <div class="error">
                    <asp:Label ID="error13" runat="server"></asp:Label></div>
                <asp:Label ID="lab19" runat="server">Student ID</asp:Label>
                <asp:TextBox required="" type="number" ID="sid6" placeholder="Enter ID" runat="server"> </asp:TextBox>
                <div class="error">
                    <asp:Label ID="error14" runat="server"></asp:Label></div>
                <div class="error">
                    <asp:Label ID="error15" runat="server"></asp:Label></div>
                <asp:Label ID="lab20" runat="server">Defense Location</asp:Label>
                <asp:TextBox required="" ID="location6" placeholder="Enter location" runat="server"> </asp:TextBox>

                <asp:Label ID="lab21" runat="server">Grade</asp:Label>
                <asp:TextBox required="" ID="grade6" Type="number" min="0.7" step="0.1" max="4.0" placeholder="Grade"
                    runat="server"></asp:TextBox>


            </div>
            <div class="error">
                <asp:Label ID="error12" runat="server"></asp:Label></div>
            <asp:Button class="buttonG" ID="gradeB6" runat="server" Text="Grade" OnClick="gradeDefenseButton"></asp:Button>
        </form>


        <form id="form7" runat="server" visible="false">
            <h2>Grade Progress Report</h2>
            <div class="box">

                <div class="error">
                    <asp:Label ID="error17" runat="server"></asp:Label></div>
                <asp:Label ID="lab23" runat="server">Student ID</asp:Label>
                <asp:TextBox required="" type="number" ID="sid7" placeholder="Enter ID" runat="server"> </asp:TextBox>
                <div class="error">
                    <asp:Label ID="error18" runat="server"></asp:Label></div>
                <div class="error">
                    <asp:Label ID="error19" runat="server"></asp:Label></div>
                <asp:Label ID="lab24" runat="server">Progress Report Date</asp:Label>
                <asp:TextBox required="" ID="date7" type="date" placeholder="Enter date" runat="server"> </asp:TextBox>
                <%--  --%>
                <asp:Label ID="lab25" runat="server">Grade</asp:Label>
                <asp:TextBox required="" ID="grade7" Type="number" min="0.7" step="0.1" max="4.0" placeholder="Grade"
                    runat="server"></asp:TextBox>
            </div>
            <div class="error">
                <asp:Label ID="error16" runat="server"></asp:Label></div>
            <asp:Button class="buttonG" ID="gradePR7" runat="server" Text="Grade" OnClick="gradePRButton"></asp:Button>
        </form>



    </div>

</body>
</html>
