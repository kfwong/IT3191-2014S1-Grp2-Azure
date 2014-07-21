<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
    <%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!DOCTYPE html>

<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>Companion</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-black">

        <div class="form-box" id="login-box">
        	<c:if test="${!empty param.info}">
    			<div class="alert alert-info alert-dismissable">
		            <i class="fa fa-info"></i>
		            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
		            <span>${initParam[param.info]}</span>
		        </div>
			</c:if>
            <div class="header">Please Answer the Security Question</div>
            <form id="form" action="ForgetPassword" method="post" autocomplete='off'>
                <div class="body bg-gray">
                    <div class="form-group">
                        <input type="email" id="email" name="email" class="form-control" placeholder="Email" />
                    </div>
                    <div class="form-group">
	                    <select name="securityquestion" id="securityquestion" name="securityquestion" class="form-control">
		    				<option value="1">What is the name of your childhood friend? </option>
		    				<option value="2">What is the name of your primary school?</option>
		    				<option value="3">What is your preferred musical genre? </option>
		    				<option value="4">What are the last 5 digits of your NRIC?</option>
		    				<option value="5">What was your dream job as a child?</option>
	    				</select>					
                    </div>
                    <div class="form-group">
                        <input type="text" id="answer" name="answer" class="form-control" placeholder="Answer"/>
                    </div>
                    
	                 <button type="submit"  value="normal" class="btn bg-olive btn-block">Confirm</button>
                </div>
                 <div class="footer">                    
                    <a href="login" class="text-center">Return to login</a>
                </div>
                
            </form>
         
        </div>


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/plugins/jqueryvalidation/jquery.validate.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        jQuery.validator.setDefaults({
    	    debug: false,
        });
       	$( "#form" ).validate({
       		rules: {
       			firstname: "required",
       			lastname: "required",
       			answer: "required",
       			email: {
       				required: true,
       				email: true
       			},
      	 		password: "required",
       			password2: {
       				required: true,
       				equalTo: "#password"
       			}
       		},
       		messages: {
       			password2: {
       				equalTo: "Password does not match."
       			}
       		}
       	});
        </script>

    </body>
</html>