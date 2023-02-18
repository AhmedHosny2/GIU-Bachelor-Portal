<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee_Page.aspx.cs" Inherits="final_giu_gui.Employee_Page" %>



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

.error{
    color: #e40808;
    font-weight: bold;
    width: 500px;
}
#Button21{
    width: 10%;
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

  <title>Employee Page</title>


</head>
<body>
    
    <form id="form1" runat="server" visible ="true">
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
        <h3>Defense</h3>
        <div class="but">
            <asp:Button class ="button_group" ID="Button1" runat="server" Text="Grade Defense"
             OnClick="GDClicked" />
        </div>
      </div>

      <div class="box">
        <h3>Thesis</h3>
        <div class="but">
            <asp:Button class ="button_group" ID="Button2" runat="server" Text="Grade Thesis"
             OnClick="GTClicked" />
        </div>
      </div>

      <div class="box">
        <h3>Progress Report</h3>
       <div class="but">
            <asp:Button class ="button_group" ID="Button4" runat="server" Text="Create Progress Report"
             OnClick="CPRClicked" />
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
    
     <form id="Profileee" class="form1" runat="server" visible="false">
        
            <h2>My Profile</h2>
     
                        <asp:Label runat="server" Text="Staff ID:"></asp:Label>
                        <asp:Label ID="staffID" runat="server" Text=""></asp:Label>
                        <asp:Label runat="server" Text="Company ID:"></asp:Label>
                        <asp:Label ID="compID" runat="server" Text=""></asp:Label>
                        <asp:Label runat="server" Text="Username:"></asp:Label>
                        <asp:Label ID="PUsername" runat="server" Text=""></asp:Label>
                        <asp:Label runat="server" Text="Password:"></asp:Label>
                        <asp:Label ID="PPassword" runat="server" Text=""></asp:Label>
                        <asp:Label runat="server" Text="Email:"></asp:Label>
                        <asp:Label ID="PEmail" runat="server" Text=""></asp:Label>
                        <asp:Label runat="server" Text="Field:"></asp:Label>
                        <asp:Label ID="field" runat="server" Text=""></asp:Label>
                        <asp:Label runat="server" Text="Phonenumber:"></asp:Label>
                        <asp:Label ID="PPhonenumber" runat="server" Text=""></asp:Label>
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
        

    <form id="form2" runat="server" visible ="false">
      <div class="box">
        
          <h2>Grade Defense</h2>
            
                <label>Student ID</label>
                <asp:TextBox required="" type="number" id="sid2" placeholder="Enter ID" runat="server"> </asp:TextBox>
            <div class="error"><asp:Label ID ="error2" runat="server"></asp:Label></div>
                <label>Defense Location</label>
                <asp:TextBox required="" id="location2" placeholder="Enter location" runat="server"> </asp:TextBox>
            <div class="error"><asp:Label ID ="error3" runat="server"></asp:Label></div>
            <div class="error"><asp:Label ID ="error4" runat="server"></asp:Label></div>
                <label>Grade</label>
               <asp:TextBox required="" ID="grade2"  Type="number" min="0.7" step="0.1" max="4.0" placeholder="Grade"
                   runat="server"></asp:TextBox>

      </div>
        <div class="error"><asp:Label ID ="error1" runat="server"></asp:Label></div>
          <asp:Button class ="buttonG" ID="gradeD2" runat="server" Text="Grade" OnClick="gradeDefenseButton"></asp:Button>
    </form>


    <form id="form3" runat="server" visible ="false">
      <div class="box">
        
          <h2>Create Progress Report</h2>
            
                <label>Student ID</label>
                <asp:TextBox required="" type="number" id="sid3" placeholder="Enter ID" runat="server"> </asp:TextBox>
            <div class="error"><asp:Label ID ="error6" runat="server"></asp:Label></div>
                <label>Progress Report Date</label>
                <asp:TextBox required="" id="date3" type="date" placeholder="Enter date" runat="server"> </asp:TextBox>
            <div class="error"><asp:Label ID ="error7" runat="server"></asp:Label></div>
            <div class="error"><asp:Label ID ="error8" runat="server"></asp:Label></div>
                <label>Content</label>
               <asp:TextBox required="" ID="content3" Type="text" placeholder="Enter content" runat="server"></asp:TextBox>
            
      </div>
        <div class="error"><asp:Label ID ="error5" runat="server"></asp:Label></div>
          <asp:Button class ="buttonG" ID="createB3" runat="server" Text="Create" OnClick="createPRButton"></asp:Button>
    </form>


    <form id="form4" runat="server" visible ="false">
      <div class="box">
        
          <h2>Grade Thesis</h2>
            
                <label>Student ID</label>
                <asp:TextBox required="" type="number" id="sid4" placeholder="Enter ID" runat="server"> </asp:TextBox>
            <div class="error"><asp:Label ID ="error10" runat="server"></asp:Label></div>
                <label>Thesis Title</label>
                <asp:TextBox required="" id="title4" placeholder="Enter title" runat="server"> </asp:TextBox>
            <div class="error"><asp:Label ID ="error11" runat="server"></asp:Label></div>
            <div class="error"><asp:Label ID ="error12" runat="server"></asp:Label></div>
                <label>Grade</label>
               <asp:TextBox required="" ID="grade4"  Type="number" min="0.7" step="0.1" max="4.0" placeholder="Grade"
                   runat="server"></asp:TextBox>
      </div>
        <div class="error"><asp:Label ID ="error9" runat="server"></asp:Label></div>
          <asp:Button class ="buttonG" ID="gradeT4" runat="server" Text="Grade" OnClick="gradeThesisButton"></asp:Button>
    </form>

   </div>
</body>
</html>
