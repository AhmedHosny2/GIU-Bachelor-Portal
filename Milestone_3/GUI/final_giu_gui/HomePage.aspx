<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="final_giu_gui.HomePage" %>

<!DOCTYPE html>

<style>

    .label{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .link{
        display: flex;
        justify-content: center;
        align-items: center;
    }


    #ytLink{
        font-size: 20px;
    }
    #fbLink{
        font-size: 20px;
    }
    #twLink{
        font-size: 20px;
    }
    #liLink{
        font-size: 20px;
    }
    #ytLink:hover{
        color: red;
        font-size: 23px;
    }
    #fbLink:hover{
        color: dodgerblue;
        font-size: 23px;
    }
    #twLink:hover{
        color: deepskyblue;
        font-size: 23px;
    }
    #liLink:hover{
        color: #0026ff;
        font-size: 23px;
    }
    
    .social{
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 10vh;
    }
    .social a{
        
    }
    /*
    ul{
        position: relative;
        display: flex;
        gap: 25px;
    }
    ul li{
        position: relative;
        list-style: none;
        width: 60px;
        height: 60px;
        display: flex;
        border-bottom-left-radius: 15px;
        border-bottom-right-radius: 15px;
        justify-content: center;
        align-items: center;
        background: #fff;
        box-shadow: 0 15px 15px rgba(0,0,0,0.1);
        cursor: pointer;
    }
    ul li .fa{
        font-size: 3em;
        -webkit-text-stroke: 2px var(--clr);
        color: transparent;
    }
    ul li::before {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 0;
        overflow: hidden;
        border-bottom: 4px solid #808080;
        transition: 0.5s ease-in-out;
        font-family: fontAwesome;
        text-align: center;
        line-height: 120px;
        font-size: 3em;
        color: var(--clr);
    }
    
    ul li:hover::before{
        height: 100%;
    }
    ul li:nth-child(1):before{
        content: '\f099';
    }
    ul li:nth-child(2):before{
        content: '\f16d';
    }
    ul li:nth-child(3):before{
        content: '\f09a';
    }
    ul li:nth-child(4):before{
        content: '\f16a';
    }
    ul li:nth-child(5):before{
        content: '\f232';
    }
    ul li:nth-child(6):before{
        content: '\f0e1';
    }
    */
</style>

<!--
    ul li .fa-twitter::before {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 0;
        border-bottom: 4px solid deepskyblue;
        transition: 0.5s ease-in-out;
        font-family: fontAwesome;
    }
    ul li .fa-instagram::before {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 0;
        border-bottom: 4px solid #f306ee;
        transition: 0.5s ease-in-out;
        font-family: fontAwesome;
    }
    ul li .fa-facebook::before {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 0;
        border-bottom: 4px solid #072cde;
        transition: 0.5s ease-in-out;
        font-family: fontAwesome;
    }
    ul li .fa-youtube-play::before {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 0;
        border-bottom: 4px solid red;
        transition: 0.5s ease-in-out;
        font-family: fontAwesome;
    }
    ul li .fa-whatsapp::before {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 0;
        border-bottom: 4px solid #5af314;
        transition: 0.5s ease-in-out;
        font-family: fontAwesome;
    }
    ul li .fa-linkedin::before {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 0;
        border-bottom: 4px solid #072cde;
        transition: 0.5s ease-in-out;
        font-family: fontAwesome;
    }
-->



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- css file -->
  <link rel="stylesheet" href="HomePageStyle.css">

  <!-- google fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@100;300;400;500;700;800&display=swap"
    rel="stylesheet">

  <!-- Font Awesome Library -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
    integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
        integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <title>giu</title>
</head>

<body>
  <!-- start header -->
  <div class="header">
    <div class="container">
      <div class="logo">
        <img src="../images/giu_smol.jpg" alt="">
      </div>
      <div class="links">
        <span class="icon">
          <span></span>
          <span></span>
          <span></span>
        </span>
        <ul>
          <li><a onclick ="fire1()" href="#login">Login</a></li>
          <hr>
          <li><a onclick ="fire2()" href="#register">Register</a></>
          <hr>
          <li><a href="#services">Services</a></li>
          <hr>
          <li><a href="#portfolio">Portfolio</a></li>
          <hr>
          <li><a href="#about">About</a></li>
          <hr>
          <li><a href="#contact">Contact</a></li>
          
          <script type="text/javascript">
              function fire1() {
                  window.location.assign("Login_Page.aspx");
              }
              function fire2() {
                  window.location.assign("User_Register.aspx");
              }
          </script>
        </ul>
      </div>
    </div>
  </div>
  <!-- end header -->

  <!-- start landing -->
  <div class="landing">
    <div class="intro-text">
      <a href="https://usecheck.com/" class="btn-shine" target="_blank"><span>G</span><span>I</span><span>U</span></a>
    </div>
  </div>
  </div>
  <!-- end landing -->

  <!-- start features -->
  <!-- here you can change the text in here to any thing you want -->
  <h2 class="special-heading">What they say</h2>
  <p>-The only fence against the world is a <br/> thorough knowledge of it-</p>
  <div class="features">
    <div class="container">
      <div class="box quality">
        <div class="img-holder">
          <img src="images/books.jpg" alt="" />
        </div>
        <h2>Quality</h2>
        <p>
            On October 3rd, two top high-level delegations were received at
            the German International University in an effort to foster ties and
            discuss future developments with German partners.
        </p>
      </div>
      <div class="box time">
        <div class="img-holder">
          <img src="images/features-02.jpg" alt="" />
        </div>
        <h2>Time</h2>
        <p>
          The university is aiming to be accessible to all talented students
            from all over the globe who seek excellent education in the offered fields
            of study through a very balanced scholarship program.
        </p>
      </div>
      <div class="box passion">
        <div class="img-holder">
          <img src="images/passion.jpg" alt="" />
        </div>
        <h2>Passion</h2>
        <p>
          GIU has a creative, market-focused approach to its teaching,
            research and management activities. Its performance will be measured by
            indicators of customer satisfaction.
        </p>
      </div>
    </div>
  </div>
  <!-- end features -->

  <!-- start about -->
  <div class="about">
    <div class="container">
      <h2 class="special-heading">about us</h2>
      <p>a powerful combination of <br/>#discipline and #intuition</p>
      <div class="about-content">
        <div class="image">
          <img src="/images/805624.jpg" alt="">
        </div>
        <div class="text">
          <p>
            The Former German Ambassador to Egypt Values the Egyptian-German
            Relations
          </p>
          <hr />
          <p>
            The former German Ambassador to Egypt Dr. Cyrill Nunn said in a press conference held at the GIU, located at
            the New
            Administrative Capital, that Egypt and Germany enjoy special and distinguished basic and higher education
            relations.
            Nunn added that the presence of the German University in Cairo (GUC) and German International University
            (GIU), located
            in the heat of the new Administrative Capital in Egypt is a prominent result of this relationship.
          </p>
        </div>
      </div>
    </div>
  </div>
  <!-- end about -->

  <!-- start contact -->
  <div class="contact">
    <%--<div class="container">--%>
      <h2 class="special-heading">contact</h2>
      <p>we are born to create</p>
      <div class="info">
        <p class="label">Feel free to drop us a line at:</p>
        <a href="" class="link">AAJM@student.giu-uni.de</a>
        <div class="social">
          <p>Find Us On Social Networks:</p>
          &nbsp &nbsp <a href="https://www.youtube.com/@germaninternationalunivers4844"
              id="ytLink" class="fab fa-youtube"></a>&nbsp &nbsp
          <a href="https://www.facebook.com/GIU.Official.Page/"
              id="fbLink" class="fab fa-facebook-f"></a>&nbsp &nbsp 
          <a href="https://twitter.com/gucstudent"
              id="twLink" class="fab fa-twitter"></a>&nbsp &nbsp 
          <a href="https://eg.linkedin.com/school/giu-as/"
              id="liLink" class="fa fa-linkedin"></a>&nbsp &nbsp 
        </div>
      </div>
    </div>
    <!-- end contact -->

    <!-- start footer -->
    <div class="footer">&copy; 2023 <span>mesh db</span> All Right Reserved</div>
    <!-- end footer -->
</body>

</html>
</body>
</html>

<!--
<div class="social">
          <p>Find Us On Social Networks:</p>
          <a href="https://www.youtube.com/@germaninternationalunivers4844"
              id="ytLink" class="fab fa-youtube"></a>
          <a href="https://www.facebook.com/GIU.Official.Page/"
              id="fbLink" class="fab fa-facebook-f"></a>
          <a href="https://twitter.com/gucstudent"
              id="twLink" class="fab fa-twitter"></a>
          <a href="https://twitter.com/gucstudent"
              id="Link" class="fab fa-"></a>
        </div>



    <div class="social">
          <p>Find Us On Social Networks:</p>
          <a><i style="--clr:deepskyblue" class="fa fa-twitter" aria-hidden="false"></i></a>
          <a><i style="--clr:dodgerblue" class="fa fa-instagram" aria-hidden="false"></i></a>
          <a><i style="--clr:red" class="fa fa-youtube-play" aria-hidden="false"></i></a>
          <a><i style="--clr:#5af314" class="fa fa-whatsapp" aria-hidden="false"></i></a>
          <a><i style="--clr:#072cde" class="fa fa-linkedin" aria-hidden="false"></i></a>
        </div>






    <div class="contact">
    <%--<div class="container">--%>
      <h2 class="special-heading">contact</h2>
      <p>we are born to create</p>
      <div class="info">
        <p class="label">Feel free to drop us a line at:</p>
        <a href="" class="link">AAJM@student.giu-uni.de</a>
        <div class="social">
            <p>Find Us On Social Networks:</p>
            <ul>
              <li><i id="faT" style="--clr:deepskyblue" class="fa fa-twitter" aria-hidden="true"
                  href="https://twitter.com/gucstudent"></i></li>
              <li><i id="faI" style="--clr:#f306ee" class="fa fa-instagram" aria-hidden="true"
                  href="https://www.instagram.com/giuas_official/"></i></li>
              <li><i id="faF" style="--clr:#072cde" class="fa fa-facebook" aria-hidden="true"
                  href="https://www.facebook.com/GIU.Official.Page/"></i></li>
              <li><i id="faY" style="--clr:red" class="fa fa-youtube-play" aria-hidden="true"
                  href="https://www.youtube.com/@germaninternationalunivers4844"></i></li>
              <li><i id="faW" style="--clr:#5af314" class="fa fa-whatsapp" aria-hidden="true"
                  href="https://www.guc.edu.eg/en/continuing_education/contact_us.aspx"></i></li>
              <li><i id="faL" style="--clr:#072cde" class="fa fa-linkedin" aria-hidden="true"
                  href="https://eg.linkedin.com/school/giu-as/"></i></li>
            </ul>
        </div>
      </div>
    </div>

-->