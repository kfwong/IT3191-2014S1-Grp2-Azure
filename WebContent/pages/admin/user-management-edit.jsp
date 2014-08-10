<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
    <head>
    	<!-- header fragment -->
    	<jsp:include page="../../WEB-INF/header.jspf" />
    	<link href="${pageContext.servletContext.contextPath}/css/user-management.css" rel="stylesheet" type="text/css" />
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
                                <div class="box-body">
                                    <!-- THE INTERACTIVE TABLE -->
                                    <form method="post" action="user-management-edit">                                    
	                                    <div class="table-above form-button-group">
											<div class="form-group">	
												<button type="button" class="pull-left btn btn-default form-button discard-button">Discard</button>
												<button type="button" class="pull-left btn btn-default form-button reset-button">Reset</button>
												<button type="submit" class="pull-right btn btn-default">Save</button>
											</div>
											
											<span class="pull-left alert alert-info row-selected-count">No changes detected</span>
											<span class="pull-left alert alert-info row-added-count hide"></span>
											<div class="clearfix"></div>
										</div>	                                    
	                                    <table id="users" class="participants table table-hover table-bordered" width="100%">
											<thead>
												<tr>
													<th>ID</th>
													<th>Role</th>
													<th>First Name</th>
													<th>Last Name</th>
													<th>Email</th>
													<th>Email Verified</th>
												</tr>
											</thead>
									    </table>				    			            
								        <!-- Modal-delete -->
										<div class="modal delete-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										        <h4 class="modal-title" id="myModalLabel">Delete contacts</h4>
										      </div>
										      <div class="modal-body">
										         <p>Are you sure you want to delete the records?</p>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
										        <button type="button" class="btn btn-primary confirm-delete-button">Confirm</button>
										      </div>
										    </div><!-- /.modal-content -->
										  </div><!-- /.modal-dialog -->
										</div><!-- /.modal -->
								    </form>
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
        		var table = $("#users").DataTable({
					destroy: true,
					"language": {
					      "emptyTable": "There are no users currently"
					},
					"ajax": {
						"url": "user-management?action=getUsers",
			            "dataSrc": ""
			        },
			        "columnDefs": [	                    
	                    {
	                    	"targets": [0],
	                    	"visible": false                   	                        
	                    },
	                    {
	                    	"targets": [1],
	                    	"render": function(data, type, row) {
	                    		if(data == "REGULAR"){
	                    			return	'<select name = "role" class="form-control">' + 
	                    			  			'<option selected value="REGULAR">REGULAR</option>' +
	                    			 			'<option value="ADMIN">ADMIN</option>' + 
	                    					'</select>';
	                    		}
	                    		else if (data == "ADMIN"){
	                    			return	'<select name = "role" class="form-control">' + 
			            			  			'<option value="REGULAR">REGULAR</option>' +
			            			 			'<option selected value="ADMIN">ADMIN</option>' + 
			            					'</select>';
	                    		}
	                    	}
	                    },
	                    {
	                    	"targets": [2],
	                    	"render": function ( data, type, row ) {
	                    		return '<input required type="text" class="form-control" name="firstName" value="' + data + '"/>'; 
	                    	}
	                    },
	                    {
	                    	"targets": [3],
	                    	"render": function ( data, type, row ) {
	                    		return '<input required type="text" class="form-control" name="lastName" value="' + data + '"/>'; 
	                    	}
	                    },
	                    {
	                    	"targets": [4],
	                    	"render": function ( data, type, row ) {
	                    		return '<input required type="text" class="form-control" name="email" value="' + data + '"/>'; 
	                    	}
	                    },
	                    {
	                    	"targets": [5],
	                        "render": function ( data, type, row ) {
	                        	if(data == true) {
	                                return '<input type="checkbox" checked value="' + data + '">';
	                            } 
	                        	else{
	                                return '<input type="checkbox" value="' + data + '">';
	                            }
	                        }	                 
	                    }
					],
					"columns": [
						{"data": "id"},
			            {"data": "role"},
			            {"data": "firstName"},
			            {"data": "lastName"},
			            {"data": "email","width":"30%"},
			            {"data": "isVerified","width":"10%"},
					],			  
			        "initComplete": function(settings, json) {
		        		addInteractiveRows();
			    	}
				});
        		
        		function addInteractiveRows(){
        			$("#users tbody tr").addClass("table-row");
        			
        			var rowSelectedCount = 0;
        			var rowAddedCount = 0;
        			
        			$(".reset-button").on("click", function(){
        				location.reload();
        			});
        			
        			$(".discard-button").on("click", function(){
        				window.location.href = 'user-management';	
        			});
        			
        			$(".new-contact-button").on("click", function(){
        				$(".table-new-contact").prepend(
        					'<tr>'+
        					'<td class="table-column-name"><input type="text" class="form-control" name="name" required></td>'+
        					'<td class="table-column-address"><input type="text" class="form-control" name="address" required></td>'+
        					'<td class="table-column-number"><input type="text" class="form-control" name="number" required></td>' +
        					'<td class="table-column-email"><input type="text" class="form-control" name="email" required></td>' +
        					'<input class="id" type="hidden" name="id" value="-1">' +
        					'<input type="hidden" name="organization" value="individual"/>' +
        					'<input type="hidden" name="type" value="individual"/>' +
        					'</tr>'
        				);
        				
        				rowAddedCount++;
        				$(".row-added-count").removeClass("hide");
        				$(".row-added-count").text(rowAddedCount + " records added");
        			});
        			
        			$(".table-row input, .table-row select").on("change", function(event){
        				var elementSelected = event.target;
        				var rowSelected = $(elementSelected).parents("tr");
        				
        				if($(rowSelected).hasClass("warning selected")){

        				}
        				else{
        					$(rowSelected).addClass("warning selected");
        					rowSelectedCount++;
        				}	
        				
        				$(".row-selected-count").text(rowSelectedCount + " records changed");
        				console.log(rowSelectedCount);
        			});
        			
        			$("#users tbody tr").each(function(){
        				var id = table.row(this).data().id;
    					$(this).append('<input class="id selectedId" type="hidden" name="id" value="' + id + '">');
        			});
        		}; 	
        	});
        </script>
    </body>
</html>