<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="header">Sign In</div>
            <form action="UserLogin" method="post">
                <div class="body bg-gray">
                    <div class="form-group">
                        <input type="email" id="email" name="email" class="form-control" placeholder="Email" required/>
                    </div>
                    <div class="form-group">
                        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required/>
                    </div>          
                    <div class="form-group">
                        <input type="checkbox" name="remember_me"/> Remember me
                    </div>
                </div>
                <div class="footer">                                                               
                    <button type="submit" name="type" value="normal" class="btn bg-olive btn-block">Sign me in</button>  
                    
                    <p><a href="#">I forgot my password</a></p>
                    
                    <a href="register" class="text-center">Register a new membership</a>
                </div>
            </form>
			<form action="UserLogin" method="post">
	            <div class="margin text-center">
	                <span>Sign in using social networks</span>
	                <br/>
	                <button type="submit" name="type" value="facebook" class="btn bg-light-blue btn-circle"><i class="fa fa-facebook"></i></button>
	                <button class="btn bg-aqua btn-circle"><i class="fa fa-twitter"></i></button>
	                <button class="btn bg-red btn-circle"><i class="fa fa-google-plus"></i></button>
	            </div>
            </form>
        </div>


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>