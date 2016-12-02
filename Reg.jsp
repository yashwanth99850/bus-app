<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script src='https://www.google.com/recaptcha/api.js'></script>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Basic Form</title>

	<link rel="stylesheet" href="assets/demo.css">
	<link rel="stylesheet" href="assets/form-basic.css">
<script>  
function validateform(){  
var name=document.b.username.value;  
var password=document.b.password.value;  
var firstpassword=document.b.password.value;  
var secondpassword=document.b.repassword.value;  
  var x=document.b.email.value;  
var atposition=x.indexOf("@");  
var dotposition=x.lastIndexOf(".");  
if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
  alert("Please enter a valid e-mail address \n atpostion:"+atposition+"\n dotposition:"+dotposition);  
  return false;  
  }  
if (name==null || name==""){  
  alert("Name can't be blank");  
  return false;  
}else if(password.length<6){  
  alert("Password must be at least 6 characters long.");  
  return false;  
  }  
  else{
  
if(firstpassword==secondpassword){  
return true;  
}  
else{  
alert("password must be same!");  
return false;  
}  
}
}  
function waitPreloadPage() { //DOM
if (document.getElementById){
document.getElementById('siteLoader').style.visibility='hidden';
}else{
if (document.getElementById){ //NS4
document.getElementById('container').style.visibility='block';
}
}
}

// End -->
</script>  
</head>

<body bgcolor="lightblue" onLoad="waitPreloadPage();">
<div id='siteLoader'> 
        <div id='siteDetailLoader'> 
        <img src='images/75.gif' border='0'> 
        Please wait while the page loads...<br /> <br /> 
        </div> 
      </div>
<div id="container" style="display:none">

</div>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->

        <form  name="b" class="form-basic" method="get" action="Registration" onsubmit="return validateform()">

            <div class="form-title-row">
                <h1>Registration page</h1>
            </div>

            <div class="form-row">
                <label>
                    <span>User Name</span>
                    <input type="text" name="username">
                </label>
            </div>
          <div class="form-row">
                <label>
                    <span>Email</span>
                    <input type="text" name="email">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>Password</span>
                    <input type="password" name="password">
                </label>
            </div>

           <div class="form-row">
                <label>
                    <span>Re-Enter Password</span>
                    <input type="password" name="repassword">
                </label>
            </div>
<div class="form-row">
                <label>
                    <span>security Question</span>
                    <select name="ques">
					<option>Security Question</option>
                        <option>What is name of your pet?</option>
                        <option>What is your Maiden name?</option>
                        
                    </select>
                </label>
            </div>    
			<div class="form-row">
                <label>
                    <span>Answer</span>
                    <input type="text" name="answ">
                </label>
            </div>
			
		<div class="g-recaptcha" data-sitekey="6Lf-BCoTAAAAABnUqFg3dB96jqJ5khYd7WBRKNyU"></div>
            <div class="form-row">
                <button type="submit">Submit </button>
            </div>
			<div class="form-row" align="center">
			<label >
           <a href="login.html"><input type="button" value="LOGIN"></a>
		   <a href="forgetpw.html"><input type="button" value="FORGET PASSWORD"></a>
		   </label>
		   </div>
        </form>

    </div>

</body>

</html>
