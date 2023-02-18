<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student page.aspx.cs" Inherits="final_giu_gui.Student_page" %>

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
                    <h3>bachelor Project</h3>
                    <div class="but">
                        <asp:Button class="button_group" ID="check_bachelor_project" runat="server" Text="check bachelor project" OnClick="check_bachelor_project_Click" />

                        <asp:Button class="button_group" ID="make_preferences" runat="server" Text="make preferences" OnClick="make_preferences_Click" />
                    </div>
                </div>
                <div class="box">
                    <h3>thesis</h3>
                    <div class="but">
                        <asp:Button class="button_group" ID="view_thesis" runat="server" Text="view thesis" OnClick="view_thesis_Click" />
                        <asp:Button class="button_group" ID="submit" runat="server" Text="submit" OnClick="submit_Click" />
                    </div>
                </div>
                <div class="box">
                    <h3>progress report</h3>
                    <div class="but">
                        <asp:Button class="button_group" ID="show_progress_report" runat="server" Text="show progress report" OnClick="show_progress_report_Click" />

                    </div>
                </div>
                <div class="box">
                    <h3>defense</h3>
                    <div class="but">
                        <asp:Button class="button_group" ID="view_their_defense" runat="server" Text="view their defense" OnClick="view_their_defense_Click" />
                        <asp:Button class="button_group" ID="update" runat="server" Text="update" OnClick="update_Click" />
                    </div>
                </div>
                <div class="box">
                    <h3>meeting</h3>
                    <div class="but">
                        <asp:Button class ="button_group" ID="book_meeting_with_lecture" runat="server" Text="book meeting with lecture" OnClick="book_meeting_with_lecturer_Click" />
                        <asp:Button class="button_group" ID="unbooked_meetings" runat="server" Text="unbooked meetings" OnClick="unbooked_meetings_Click" />
                        <asp:Button class="button_group" ID="booked_meeting" runat="server" Text="booked meeting" OnClick="booked_meeting_Click" />
                        <asp:Button class="button_group" ID="todo_list" runat="server" Text="todo list" OnClick="todo_list_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!-- end form -->

        <!-- start footer -->
        <!-- <div class="footer">&copy; 2023 <span>GIU AAMY</span> All Right Reserved</div> -->
        <!-- end footer -->
    </form>
    <!--First View-->
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
       


        <form id="form_View_Thesis" runat="server" visible="false">
            

            <asp:TextBox type="text" ID="Title_View_Thesis" required="required" placeholder="Enter The Title" runat="server"></asp:TextBox>

            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>

            <asp:Label ID="error_form_View_Thesis" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="View" OnClick="View_Thesis"></asp:Button>
        </form>
    </div>
    <form id="Forma" runat="server" visible="false">

        <asp:GridView ID="Grid_View_Thesis" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Height="100%" HorizontalAlign="Center">
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


    <!--second View-->

    <div class="WraP">
        <form id="form_View_Progress_Report" runat="server" visible="false">
            

            <asp:TextBox type="date" ID="date_View_Progress_Report" required="required" placeholder="Enter The Date" runat="server"></asp:TextBox>

            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>

            <asp:Label ID="Error_from_Progress_Report" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="View" OnClick="View_Progress_Report"></asp:Button>
        </form>
    </div>
    <form id="Forma2" runat="server" visible="false">

        <asp:GridView ID="Grid_View_Progress_Report" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Height="100%" HorizontalAlign="Center">
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




    <!--third View-->

    <div class="WraP">
        <form id="form_View_Defense" runat="server" visible="false">
            
            <asp:Label ID="error_from_View_Defense" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="View" OnClick="View_Defense"></asp:Button>
        </form>
    </div>
    <form id="Forma3" runat="server" visible="false">

        <asp:GridView ID="Grid_View_Defense" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Height="100%" HorizontalAlign="Center">
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



    <!--4th View-->

    <div class="WraP">
        <form id="form_View_Bachelor_Project" runat="server" visible="false">
            
            <asp:TextBox type="text" ID="Project_Type" required="required" placeholder="Enter project_Type" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>

            <asp:Label ID="error_from_view_bachpro" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="View" OnClick="View_Bachelor_Project"></asp:Button>
        </form>
    </div>
    <form id="Forma4" runat="server" visible="false">

        <asp:GridView ID="Grid_View_Bachelor_Project" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Height="100%" HorizontalAlign="Center">
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

    <div class="WraP">
        <form id="form_View_Booked_Meetings" runat="server" visible="false">
            <asp:TextBox type="number" ID="Meeting_ID" required="required" placeholder="Enter Meeting ID" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>


            <asp:Label ID="error_form_View_Booked_Meetings" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="View" OnClick="View_Meetings"></asp:Button>
        </form>
    </div>
    <form id="Forma5" runat="server" visible="false">

        <asp:GridView ID="Grid_View_Booked_Meetings" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Height="100%" HorizontalAlign="Center">
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

        <div class="WraP">
        <form id="form_View_UnBooked_Meeting" runat="server" visible="false">
            

            <asp:Label ID="Error_UBM" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="View" OnClick="View_UBM"></asp:Button>
        </form>
    </div>
    <form id="Forma6" runat="server" visible="false">

        <asp:GridView ID="GridView_UBM" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Height="100%" HorizontalAlign="Center">
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
          <div class="WraP">
        <form id="form_Make_Preference" runat="server" visible="false">

              <asp:TextBox type="text" ID="bachelor_code_pref" required="required" placeholder="Enter Bachelor Code" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>

  <asp:TextBox type="number" ID="Prefrence_Number" required="required" placeholder="Enter  Prefrence Number" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>

            <asp:Label ID="Error_Make_Prefrence" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="submit" OnClick="make_preference"></asp:Button>
        </form>
    </div>

       <div class="WraP">
        <form id="form_submit_Thesis" runat="server" visible="false">

              <asp:TextBox type="text" ID="Title_of_Thesis" required="required" placeholder="Enter the Title" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>

  <asp:TextBox type="text" ID="Thesis_Document" required="required" placeholder="Enter Thesis_Document" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>

            <asp:Label ID="Error_Submit_Thesis" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="submit" OnClick="Submit_Thesis"></asp:Button>
        </form>
    </div>


     <div class="WraP">
        <form id="Update_Defense" runat="server" visible="false">
            
              <asp:TextBox type="text" ID="Def_Content" required="required" placeholder=" Defense Contenet" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>


            <asp:Label ID="Error_Updating_Defense" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="submit" OnClick="UpdateMyDefense"></asp:Button>
        </form>
    </div>

         <div class="WraP">
        <form id="BMWL" runat="server" visible="false">

            <asp:TextBox type="number" ID="Meet_id_Booking" required="required" placeholder=" Enter Meet ID" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>


            <asp:Label ID="Error_of_booking" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="submit" OnClick="Book_Meeting"></asp:Button>
        </form>
    </div>

        <div class="WraP">
        <form id="TODOLIST" runat="server" visible="false">
            <asp:TextBox type="number" ID="MID_TODO" required="required" placeholder="Enter Meeting ID" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>

              <asp:TextBox type="text" ID="TODOLL" required="required" placeholder=" Enter TO-Do" runat="server"></asp:TextBox>
            <span class="bottom"></span>
            <span class="right"></span>
            <span class="top"></span>
            <span class="left"></span>


            <asp:Label ID="Error_To_Do_list" runat="server" Text=""></asp:Label>

            <asp:Button class="buttonG" runat="server" Text="submit" OnClick="Student_Add_TODO"></asp:Button>
        </form>
    </div>


</body>

</html>
