<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
    <head>
    	<!-- header fragment -->
    	<jsp:include page="../WEB-INF/header.jspf" />
    </head>
    <body class="skin-blue">
        <!-- navigation top fragment -->
        <jsp:include page="../WEB-INF/navigation-top.jspf" />
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
        	<!-- navigation left fragment -->
        	<jsp:include page="../WEB-INF/navigation-left.jspf" />	
        	
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@TITLE & BREADCRUMB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                    <h1>
                        User Profile
                       
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@START MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                   <div class="row">
                   <div class="col-md-4">
                            <!-- Info box -->
                            <div class="box box-solid box-info">
                                <div class="box-header">
                                    <h3 class="box-title">First Name</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        
                                    </div>
                                </div>
                                <div class="box-body">
                                    
                                    <p>
                          		${userprofile.firstName }
                                    </p>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                         <div class="col-md-4">
                            <!-- Primary box -->
                            <div class="box box-solid box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Profile Picture</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                      
                                    </div>
                                </div>
                                <div class="box-body">
                                   
                                    <p>
                               	<img src="
            	<c:choose>
    				<c:when test="${empty userprofile.facebookId}">
        				${pageContext.servletContext.contextPath}/img/avatar3.png
    				</c:when>
				    <c:otherwise>
				         https://graph.facebook.com/${userprofile.facebookId}/picture
				    </c:otherwise>
				</c:choose>
            " class="img-circle" alt="User Image" />
                                    </p>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                        </div>
                        <div class="row">
                        <div class="col-md-4">
                            <!-- Primary box -->
                            <div class="box box-solid box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Last Name</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                      
                                    </div>
                                </div>
                                <div class="box-body">
                                   
                                    <p>
                               	${userprofile.lastName }
                                    </p>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                   </div>
                   <div class="row">
                       <div class="col-md-4">
                            <!-- Info box -->
                            <div class="box box-solid box-info">
                                <div class="box-header">
                                    <h3 class="box-title">Email</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        
                                    </div>
                                </div>
                                <div class="box-body">
                                    
                                    <p>
                                    ${userprofile.email }    
                                    </p>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                   </div>
                   <div class="row">
                       <div class="col-md-4">
                            <!-- Primary box -->
                            <div class="box box-solid box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Handphone Number</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        
                                    </div>
                                </div>
                                <div class="box-body">
                                   
                                    <p>
                                        ${userprofile.handphoneNo }
                                    </p>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                   </div>
                   
                   
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->
        
		<!-- javscript fragment -->
    	<jsp:include page="../WEB-INF/javascript.jspf" />
    </body>
</html>