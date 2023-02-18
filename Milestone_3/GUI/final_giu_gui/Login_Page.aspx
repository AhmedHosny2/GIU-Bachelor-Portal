<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Page.aspx.cs" Inherits="final_giu_gui.Login_Page" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel ="stylesheet" href ="styles.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;700&#038;display=swap" rel="stylesheet" />
    <title>Login Form</title>
</head>
<!--    <a href="Login_Page.aspx">Login_Page.aspx</a>   -->
<body>

    <style>

        .double1 {
            display: block;
        
        }
        form{
            padding-left: 50px;
            padding-right: 50px;

        }
        .input_group {
            width: 300px;
        }
        .error{
            color: red;
        }
        loginBut{
            width: 200px;
        }
        #empCheck{
            width: 20px;
        }
        

    </style>

    <div class="container">
      <form id="form" runat="server" visible ="true">
        <div class="title">
            <p ID="login" runat="server">Welcome, Login!</p>
        </div>
        
         <div class="input_group double1">
          <div class="input_wrap">
            <asp:TextBox ID="email" placeholder="Email" required="" runat="server"
                ></asp:TextBox><br />
          </div>
             <div class="error"><asp:Label ID ="error1" runat="server"></asp:Label></div>
          <div class="input_wrap">
            <asp:TextBox ID="pass" placeholder="Password" runat="server" TextMode="Password"
                ></asp:TextBox><br />
          </div>
            <div class="error"><asp:Label ID ="error2" runat="server"></asp:Label></div>
             <div class="input_wrap">
                <asp:CheckBox ID="empCheck" Text="Employee" runat ="server"></asp:CheckBox>
          </div>
             
        </div>
            
                <!--    <asp:Button class ="button_group" ID="backButton" runat="server" Text="Back"
                   ></asp:Button><br />         -->
                <asp:Button class ="button_group" ID="loginBut" runat="server" Text="Login" OnClick="loginButton"
                   ></asp:Button><br />
           
         
       </form>
        <div class="box">
         </div>
    </div>

</body>
</html>
