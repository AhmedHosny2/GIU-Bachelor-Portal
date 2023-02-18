<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Register.aspx.cs" Inherits="final_giu_gui.User_Register" %>


<style>
    #Label2{
        color: #e40808;
    }
</style>

  <!DOCTYPE html>
  <html xmlns="http://www.w3.org/1999/xhtml">

  <head runat="server">
    <link rel ="stylesheet" href ="styles.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;700&#038;display=swap" rel="stylesheet" />
    <title>Registration Form</title>
  </head>

  <body>
    <div class="container">
      <form id="form1" runat="server" visible ="true">
        <div class="title">
            <p ID="Label1" runat="server">Registeration form</p>
        </div>
         <div class="input_group double1">
          <div class="input_wrap">
            <asp:TextBox ID="user_name" AutoCompleteType="DisplayName" placeholder="Username" runat="server"
                ></asp:TextBox><br />
          </div>
          <div class="input_wrap">
            <asp:TextBox ID="email" AutoCompleteType="Email" placeholder="Email" runat="server"
                ></asp:TextBox><br />
          </div>
        </div>

        <div class="input_group">
            <div class="selection">
              <select id="user_type" onchange="change()" name="Type" runat="server">
                 <option value="Lecturers">Lectuerer</option>
                 <option value="Student">Student</option>
                 <option value="Company">Company</option>
                 <option value="Teaching assistants">Teaching Assistance</option>
                 <option value="External examiners">External Examinar</option>
                 <option value="Coordinators">Coordinator</option>
               </select>
                <script type="text/javascript">
                    function change() {
                        var selected = document.getElementById("user_type").value;
                        if (selected == "Student") {
                            var codeBlock =
                                '<div class="input_group double">' +
                                '<div class="input_wrap">' +
                                '<asp:TextBox ID="first_name" placeholder="first name" runat="server"></asp:TextBox>' + '<br />' +
                                '</div>' +
                                '<div class="input_wrap">' +
                                '<asp:TextBox ID="last_name" placeholder="last name" runat="server"></asp:TextBox>' + '<br />' +
                                '</div>' +
                                '</div>' +
                                '<div class="input_group double">' +
                                '<div class="input_wrap">' +
                                '<asp:TextBox ID="major_code" placeholder="major code" runat="server"></asp:TextBox>' + '<br />' +
                                '</div>' +
                                '<div class="input_wrap">' +
                                '<asp:TextBox ID="semester"  Type="number" min="1" step="1" max="14" placeholder="Semester" runat="server"></asp:TextBox>' + '<br />' +
                                '</div>' +
                                '</div>' +
                                '<div class="input_group double">' +
                                '<div class="input_wrap">' +
                                '<asp:TextBox ID="addr1" placeholder="Address" runat="server"></asp:TextBox>' + '<br />' +
                                '</div>' +
                                '<div class="input_wrap">' +
                                '<asp:TextBox ID="gpa"  Type="number" min="0.7" step="0.1" max="4.0" placeholder="gpa" runat="server"></asp:TextBox>' + '<br />' +
                                '</div>' +
                                '</div>' +
                                '<div class="input_group">' +
                                '<label for="date">date of birth</label>' +
                                '<asp:TextBox ID="date"  type ="date" placeholder="date" runat="server"></asp:TextBox>' +
                                '</div>';

                            // Inserting the code block to wrapper element
                            document.getElementById("extras").innerHTML = codeBlock;
                        }
                        else if (selected == "Company") {
                            var codeBlock =
                                '<div class="input_group double2">' +
                                '<div class="input_wrap">' +
                                '<asp:TextBox ID="compName" placeholder="Company Name" runat="server"></asp:TextBox>' + '<br />' +
                                '</div>' +
                                '<div class="input_wrap">' +
                                '<asp:TextBox ID="addr" placeholder="address" runat="server"></asp:TextBox>' + '<br />' +
                                '</div>' +
                                '</div>' +
                                '<div class="error"><asp:Label ID ="error1" runat="server"></asp:Label>' + '</div>' +
                                '<div class="input_group">' +
                                '<asp:TextBox ID="rep_name" placeholder="representative name" runat="server"></asp:TextBox>' + '<br />' +
                                '</div>' +
                                '<div class="error"><asp:Label id="error2" runat="server"></asp:Label>' + '</div>' +
                                '<div class="input_group">' +
                                '<asp:TextBox ID="rep_email" placeholder="representative email" runat="server"></asp:TextBox>' + '<br />' +
                                '</div>';

                            // Inserting the code block to wrapper element
                            document.getElementById("extras").innerHTML = codeBlock;
                        }
                        else {
                            document.getElementById("extras").innerHTML = '';
                        }
                    }
                </script>
            </div>
        </div>

        <div class="input_group">
           <asp:TextBox ID="phone_number" AutoCompleteType="BusinessPhone" placeholder="Phone" runat="server"></asp:TextBox><br />
        </div>

        <div id="extras" class="input_group" >
        </div>

        <div class ="message">
            <label ID="Label2" runat="server"></label>
        </div>
        <asp:Button class ="button_group" ID="Button" runat="server" OnClick="Register" Text ="Register"></asp:Button><br />

         </form>
        <form id="form2" runat="server" visible ="false">
        <div class="title">
            <label ID="Label3" runat="server">Registeration Complete!</label>
        </div>
         <div class="double Results">
            <label ID="IDLabel" runat="server">UserID:</label><br />
            <label ID="PassLabel" runat="server">Password:</label><br />
        </div>
         <div class="double Results">
            <label ID="IDVal" runat="server">....</label><br />
            <label ID="PassVal" runat="server">....</label><br />
        </div>
        <asp:Button class ="button_group" ID="Button2" runat="server" OnClick="Continue" Text ="Continue"></asp:Button><br />

         </form>
         <div class="box">
         </div>
    </div>
  </body>
  </html>
