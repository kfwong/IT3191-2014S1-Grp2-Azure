<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
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
    	<div class="form-box" style="width:100%;">
	        <section class="content" style="background: none;">
	            <div class="error-page">
	                <h2 class="headline text-info"> 403</h2>
	                <div class="error-content">
	                    <h3><i class="fa fa-warning text-yellow"></i> Oops! Forbidden.</h3>
	                    <p>
	                        You are not authorized to access this page. 
	                        Meanwhile, you may <a href='${pageContext.servletContext.contextPath}'>return to home page</a> or try using the search form.
	                    </p>
	                    <form class='search-form'>
	                        <div class='input-group'>
	                            <input type="text" name="search" class='form-control' placeholder="Search"/>
	                            <div class="input-group-btn">
	                                <button type="submit" name="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
	                            </div>
	                        </div><!-- /.input-group -->
	                    </form>
	                </div><!-- /.error-content -->
	            </div><!-- /.error-page -->
	
	        </section><!-- /.content -->
        </div>

        <!-- jQuery 2.0.2 -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>