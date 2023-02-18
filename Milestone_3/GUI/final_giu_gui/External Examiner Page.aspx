<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="External Examiner Page.aspx.cs" Inherits="final_giu_gui.External_Examiner_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

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

    <title>Student Page</title>
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
                    <h3>Grade</h3>
                    <div class="but">
                        <asp:Button class="button_group" ID="EE_Grade_Thesis" runat="server" Text="Thesis" OnClick="EE_Grade_Thesis_Click" />
                        <asp:Button class="button_group" ID="EE_Grade_Defense" runat="server" Text="Defense" OnClick="EE_Grade_Defense_Click" />
                    </div>
                </div>

            </div>
        </div>
        <!-- end form -->

        <!-- start footer -->
        <!-- <div class="footer">&copy; 2023 <span>GIU AAMY</span> All Right Reserved</div> -->
        <!-- end footer -->
    </form>
 
        
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
        </div>
    
    <div class="WraP">
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
        </div>

        <form id="form_grade_thesis" runat="server" visible="false">
            <h2>Grade Thesis</h2>
            

            <asp:TextBox type="number" ID="SID" required="required" placeholder="Enter Student ID" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>


            <asp:TextBox type="text" ID="TITLE" required="required" placeholder="Enter THESIS TITLE" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>



            <asp:TextBox Type="number" min="0" step="0.1" max="100" ID="grade1" required="required" placeholder="Enter grade" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>

            <asp:Label ID="error_grade_thesis" runat="server" Text=""></asp:Label>

            <asp:Button ID="grade_thesis" class="buttonG" runat="server" Text="Grade" OnClick="Grade_thesis"></asp:Button>
        </form>

    </div>



    <div class="WraP">
        <form id="form_grade_defense" runat="server" visible="false">
            <h2>Grade Defense</h2>
            

            <asp:TextBox type="number" ID="sid_defense" required="required" placeholder="Enter Student ID" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>


            <asp:TextBox type="text" ID="location" required="required" placeholder="Enter Defense location" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>



            <asp:TextBox ID="grade_defense" Type="number" min="0" step="0.1" max="100" required="required" placeholder="Enter grade" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>

            <asp:Label ID="error_grade_defense" runat="server" Text=""></asp:Label>

            <asp:Button ID="grade_defense_but" class="buttonG" runat="server" Text="Grade" OnClick="Grade_defense"></asp:Button>
        </form>

    </div>

</body>

</html>