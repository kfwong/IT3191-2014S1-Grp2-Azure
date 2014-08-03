<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
    <head>
    	<!-- header fragment -->
    	<jsp:include page="../../WEB-INF/header.jspf" />
    </head>
    <body class="skin-blue">
        <!-- navigation top fragment -->
        <jsp:include page="../../WEB-INF/navigation-top.jspf" />
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
        	<!-- navigation left fragment -->
        	<jsp:include page="../../WEB-INF/navigation-left.jspf" />	
        	
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@TITLE & BREADCRUMB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                    <h1>
                        User Management
                        <small>Manage user accounts</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-dashboard"></i> Administrative Control</a></li>
                        <li class="active">User Management</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@START MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box box-primary">                                
                                <div class="box-body no-padding">
                                    <!-- THE INTERACTIVE TABLE -->
                                    <table id="users" class="participants table table-hover table-striped table-bordered" width="100%">
										<thead>
											<tr>
												<th>Role</th>
												<th>First Name</th>
												<th>Last Name</th>
												<th>Email</th>
												<th>Handphone Number</th>
												<th>Security Question</th>
												<th>Security Number</th>
											</tr>
										</thead>
								    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /. box -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->  
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->       
		<!-- javscript fragment -->
    	<jsp:include page="../../WEB-INF/javascript.jspf" />
    	<!-- Page specific script -->
        <script type="text/javascript">
        	$(document).ready(function(){
        		$("#users").dataTable({
					destroy: true,
					"language": {
					      "emptyTable": "There are no users currently"
					},
					"ajax": {
						"url": "user-management?action=getUsers",
			            "dataSrc": ""
			        },
					"columns": [
			            {"data": "role"},
			            {"data": "firstName"},
			            {"data": "lastName"},
			            {"data": "email"},
			            {"data": "handphoneNo"},
			            {"data": "securityQuestion"},
			            {"data": "answer"},
					]
				});
        	});
        </script>
    </body>
</html>