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
                                    <div class="table-above form-button-group">
										<div class="form-group">
											<button type="submit" class="pull-right btn btn-default submit-button">Add / Edit</button>
											<button type="button" class="pull-right btn btn-default delete-button">Delete</button>
										</div>
														
										<span class="pull-left alert alert-info row-selected-count">No records selected</span>
										
										<div class="clearfix"></div>
									</div>
                                    
                                    <table id="users" class="participants table table-hover table-bordered" width="100%">
										<thead>
											<tr>
												<th>Role</th>
												<th>First Name</th>
												<th>Last Name</th>
												<th>Email</th>
												<th>Email Verified</th>
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
			        "columnDefs": [
	                    {
	                        // The `data` parameter refers to the data for the cell (defined by the
	                        // `data` option, which defaults to the column being worked with, in
	                        // this case `data: 0`.
	                        "render": function ( data, type, row ) {
	                        	if(data == true) {
	                                return '<input type=\"checkbox\" disabled checked value="' + data + '">';
	                            } 
	                        	else{
	                                return '<input type=\"checkbox\" disabled value="' + data + '">';
	                            }
	                        },
	                        "targets": 4
	                    }
					],
					"columns": [
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
            		$(".table-row").on("click", function(event){
            			$(".row-selected-count").removeClass("alert-danger");
            			
            			var elementSelected = event.target;
            			var rowSelected = $(elementSelected).parents("tr");
            			
            			if($(rowSelected).hasClass("warning selected")){
            				$(rowSelected).removeClass("warning selected");
            				rowSelectedCount--;
            				$(rowSelected).find("input").removeClass("selectedId");
            			}
            			else{
            				$(rowSelected).addClass("warning selected"); 
            				rowSelectedCount++;
            				$(rowSelected).find("input").addClass("selectedId");
            			}			
            		
            			if(rowSelectedCount == 0){
            				$(".row-selected-count").text("No records selected");
            			}
            			else{
            				$(".row-selected-count").text(rowSelectedCount + " records selected");
            			}
            		});	
            		
            		$(".delete-button").on("click", function(event){
            			if(rowSelectedCount <= 0){
            				$(".row-selected-count").text("No records selected");
            				$(".row-selected-count").addClass("alert-danger");
            			}
            			else{
            				$(".delete-modal").modal();
            			}
            		});
            		
            		$(".confirm-delete-button").on("click", function(){
            			location.reload(true);
            		});
            		
            		$(".submit-button").on("click", function(event){
            			event.preventDefault();
            			$(".id").not(".selectedId").remove();

            			$("form").submit();
            		});
            		
            		$(".confirm-delete-button").on("click", function(event){
            			event.preventDefault();
            			$(".id").not(".selectedId").remove();
            			$("form").append('<input type="hidden" name="delete" value="true">');
            			$("form").submit();
            		});
        		};      		    		
        	});
        </script>
    </body>
</html>