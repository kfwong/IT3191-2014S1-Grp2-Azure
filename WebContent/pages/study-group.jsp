<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
    <head>
    	<!-- header fragment -->
    	<jsp:include page="../WEB-INF/header.jspf" />
    	<link href="${pageContext.servletContext.contextPath}/css/study-group.css" rel="stylesheet" type="text/css" />
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
                        Study Group
                        <small>Find a suitable study group to join</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-dashboard"></i> Community Hub</a></li>                    
                        <li class="active">Study Group</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@START MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
               		<div class="row">
                        <div class="col-md-12">
                            <div class="box box-primary">                                
                                <div class="box-body no-padding">
                                    <!-- THE CALENDAR -->
                                    <div id="calendar"></div>
                                </div><!-- /.box-body -->
                            </div><!-- /. box -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->  
               	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- Modal-view -->
		<div class="modal view-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
				<form role="form" method="post" action="study-group">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel">Study group details</h4>
			      </div>
			      <div class="modal-body">
					<div class="form-group">
					  <label for="title">Title</label>
					  <input type="text" class="form-control title" id="title" name = "title" required autofocus>
					</div>
					<div class="form-group">
					  <label for="description">Description</label>
					  <textarea rows="3" class="form-control description" id="description" name = "description" required autofocus></textarea>
					</div>		
					<div class="checkbox">
					    <label>
					      <input class="allDay" type="checkbox" name="allDay" value="true" checked> All day event
					    </label>
					</div>
					<div class="date">
						<div class="form-group">
							<label for="start-date">Start date</label>
						  	<input type="text" class="form-control start-date" id="start-date" required>
						</div>
					</div>
					<div class="date-time hide">
						<div class="form-group">
							<label for="start">Start time</label>
						  	<input type="text" class="form-control start" id="start" name = "start" required>
						  	<span class="add-on">
							  <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
							</span>
						</div>
						<div class="form-group">
							<label for="end">End time</label>
						  	<input type="text" class="form-control end" id="end" name = "end" required>
						</div>
					</div>
					<div class="owner">
						<label for="owner">Created by</label>
						<table class="owner table table-bordered" width="100%">
							<thead>
								<tr>
									<th class="first-name">First Name</th>
									<th class="last-name">Last Name</th>
									<th class="email">Email</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="first-name-data"></td>
									<td class="last-name-data"></td>
									<td class="email-data"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<label for="participants">Participants</label><br/>
					<table class="participants table table-hover table-striped table-bordered" width="100%">
						<thead>
				            <tr>
				                <th>First Name</th>
				                <th>Last Name</th>
				                <th>Email</th>
				            </tr>
				        </thead>
				    </table>
			      </div>
			      <div class="modal-footer">
			     	<button type="button" class="btn btn-default pull-left delete-button">Delete</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="submit" class="btn join-button">Join</button>					  
			        <button type="submit" class="btn btn-primary confirm-edit-button">Save</button>
			      </div>
			      <input type="hidden" class="edit-action" name="action" value=""/>
			      <input type="hidden" class="id" name="id" value=""/>
			      <input type="hidden" class="participant" name="participant" value=""/>			      
				</form>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- Modal-create -->
		<div class="modal create-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
				<form role="form" method="post" action="study-group">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel">Create study group</h4>
			      </div>
			      <div class="modal-body">
					<div class="form-group">
					  <label for="title">Title</label>
					  <input type="text" class="form-control title" id="title" name = "title" required autofocus>
					</div>
					<div class="form-group">
					  <label for="description">Description</label>
					  <textarea rows="3" class="form-control description" id="description" name = "description" required autofocus></textarea>
					</div>
					<div class="checkbox">
					    <label>
					      <input class="allDay" type="checkbox" name="allDay" value="true" checked> All day event
					    </label>
					</div>
					<div class="date">
						<div class="form-group">
							<label for="start-date">Start date</label>
						  	<input type="text" class="form-control start-date" id="start-date" required>
						</div>
					</div>
					<div class="date-time hide">
						<div class="form-group">
							<label for="start">Start time</label>
						  	<input type="text" class="form-control start" id="start" name = "start" required>
						  	<span class="add-on">
							  <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
							</span>
						</div>
						<div class="form-group">
							<label for="end">End time</label>
						  	<input type="text" class="form-control end" id="end" name = "end" required>
						</div>
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			        <button type="submit" class="btn btn-primary confirm-create-button">Save</button>
			      </div>
			      <input type="hidden" name="action" value="create"/>
				</form>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- Modal-delete -->
		<div class="modal delete-modal bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		    	<form role="form" method="post" action="study-group">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel">Delete study group</h4>
			      </div>
			      <div class="modal-body">
			         <p>Are you sure you want to delete the study group?</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			        <button type="submit" class="btn btn-primary confirm-delete-button">Confirm</button>
			      </div>
			      <input type="hidden" name="action" value="delete"/>
			      <input class="id" type="hidden" name="id" value=""/>
		    	</form>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
        
		<!-- javscript fragment -->
    	<jsp:include page="../WEB-INF/javascript.jspf" />
    	
    	<!-- Page specific script -->
        <script type="text/javascript">
			$(document).ready(function(){
				$("#calendar").fullCalendar({
					editable: true,
					header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    
                    eventSources: [
						{
							url: "study-group?action=getCalendar",
						},
						{
							url: "https://www.google.com/calendar/feeds/amuletxheart%40gmail.com/public/basic",
							color: "#f56954"
						}
                    ],
                    
                    dayRender: function(date, cell){
                    	var today =  moment().startOf('day');
                    	if (date < today){
                    		$(cell).addClass('calendar-disabled');
                        }
                    	else{
                    	
                    	}
                    },
                    
                    dayClick: function(date, jsEvent, view) {
                    	var today =  moment().startOf('day');
                    	if (date <= today){
                            
                        }
                    	else{
                    		$(".title").val("");
                        	$(".description").val("");
                        	$(".allDay").prop("checked", true);
    						$(".date").removeClass("hide");
    						$(".date-time").addClass("hide");
    						
    						$(".title").prop("disabled", false);
							$(".description").prop("disabled", false);
							$(".allDay").prop("disabled", false);
							$(".start-date").prop("disabled", false);
    						$(".start").prop("disabled", false);
    						$(".end").prop("disabled", false);
                        	
            		        $(".create-modal").modal();
            		        $(".start-date").val(date.format("YYYY-MM-DD"));
            		        $(".start").val(date.format("YYYY-MM-DD HH:mm:ss"));
            		        $(".end").val(date.add('days', 1).format("YYYY-MM-DD HH:mm:ss"));
                    	}
        		    },
        		    
        		    eventClick: function(calEvent, jsEvent, view) {
        		    	$.ajax({
        		    		type: "GET",
        		    		dataType: "json",
        		    		url: "study-group?action=view&id=" + calEvent.id,
        		    		success: function(json){
        						$(".view-modal").modal();
        						$(".id").val(json.id);
        						$(".title").val(json.title);
        						$(".description").val(json.description);
        						$(".start-date").val(moment(json.start).format("YYYY-MM-DD"));
        						$(".start").val(json.start);
        						$(".end").val(json.end);
        						$(".first-name-data").text(json.owner.firstName);
        						$(".last-name-data").text(json.owner.lastName);
        						$(".email-data").text(json.owner.email);
        						
        						if(json.isOwner == true){
        							$(".title").prop("disabled", false);
        							$(".description").prop("disabled", false);
        							$(".allDay").prop("disabled", false);
        							$(".start-date").prop("disabled", false);
            						$(".start").prop("disabled", false);
            						$(".end").prop("disabled", false);
            						
            						$(".edit-action").val("edit");
            						$(".join-button").addClass("hide");
            						$(".delete-button").removeClass("hide");
            						$(".confirm-edit-button").removeClass("hide");
        						}
        						else{
        							$(".title").prop("disabled", true);
        							$(".description").prop("disabled", true);
        							$(".allDay").prop("disabled", true);
        							$(".start-date").prop("disabled", true);
            						$(".start").prop("disabled", true);
            						$(".end").prop("disabled", true);
            						
            						$(".edit-action").val("editParticipant");
            						$(".join-button").removeClass("hide");
            						$(".delete-button").addClass("hide");
            						$(".confirm-edit-button").addClass("hide");
        						}
        					        						
        						$(".participants").dataTable({
        							destroy: true,
        							"language": {
        							      "emptyTable": "There are no participants in this study group"
        							},
        							"data": json.participants,
        							columns: [
							            {"data": "firstName", "width": "30%"},
							            {"data": "lastName", "width": "30%"},
							            {"data": "email", "width": "40%"}
        							]
        						});						
        						
        						if(json.allDay == true){
        							$(".allDay").prop("checked", true);
        							$(".date").removeClass("hide");
        							$(".date-time").addClass("hide");
        						}
        						else{
        							$(".allDay").prop("checked", false);
        							$(".date-time").removeClass("hide");
        							$(".date").addClass("hide");
        						}
        						
        						if(json.isParticipant == true){
        							$(".participant").val("true");
        						}
        						else{
									$(".participant").val("false");
        						}
        						$(".participant").trigger("change");
        		    		}
        		    	});
        		    }, 
        		    eventDrop: function(event, revertFunc) {
        		    	$.ajax({
        		    		type: "POST",
        		    		dataType: "json",
        		    		url: "study-group",
        		    		data: {
        		    			action:"editDate",
        		    	        id: event.id,
        		    	        title: event.title,
        		    	        start: event.start.format("YYYY-MM-DD HH:mm:ss"),
        		    	        end: event.end.format("YYYY-MM-DD HH:mm:ss"),
        		    	        allDay:event.allDay,
        		    	    }
        		    	});

        		    },
				});
				
				//change the button icons to match theme
				$(".fc-icon.fc-icon-left-single-arrow").removeClass().addClass("fa fa-caret-left");
				$(".fc-icon.fc-icon-right-single-arrow").removeClass().addClass("fa fa-caret-right");
				
				$(".confirm-create-button, .confirm-edit-button").on("click", function(event){
				  	var button = event.target;
				  	var form = $(button).parents("form");
				  	var allDay = $(form).find(".allDay");
				  	var startDate = $(form).find(".start-date");
				  	var start = $(form).find(".start");
				  	var end  = $(form).find(".end");
				  	
				  	if(allDay.prop("checked")){
				  		var date = moment($(startDate).val());
				  		start.val(date.format("YYYY-MM-DD HH:mm:ss"));
				  		end.val(date.add('days', 1).format("YYYY-MM-DD HH:mm:ss"));
				  	}
				  	
				 	$(this).trigger("click");
				});
							
				$(".participant").on("change", function(event){
					if($(".participant").val() == "true") {
						$(".join-button").removeClass("btn-primary");
						$(".join-button").addClass("btn-danger");
						
						$(".join-button").text("Leave");
					}
					else{						
						$(".join-button").addClass("btn-primary");
						$(".join-button").removeClass("btn-danger");
						
						$(".join-button").text("Join");
					}	
				});
				
				$(".join-button").on("click", function(event){
					
					if($(".participant").val() == "true") {
						$(".participant").val("false");
					}
					else{
						$(".participant").val("true");
					}
				});
				
				$(".delete-button").on("click", function(){
		        	$(".delete-modal").modal();
		 
		        });
				
				$('.delete-modal').on('show.bs.modal', function() {
		        	$('.view-modal').css('filter', 'brightness(50%)');
		            $('.view-modal').css('-webkit-filter', 'brightness(50%)');
		            $('.view-modal').css('-moz-transition', 'brightness(50%)');
		            $('.view-modal').css('-ms-transition', 'brightness(50%)');
		            $('.view-modal').css('-o-transition', 'brightness(50%)');
		        });
		        
		        $('.delete-modal').on('hide.bs.modal', function() {
		        	$('.view-modal').css('filter', 'brightness(100%)');
		        	$('.view-modal').css('-webkit-filter', 'brightness(100%)');
		        	$('.view-modal').css('-moz-transition', 'brightness(100%)');
		        	$('.view-modal').css('-ms-transition', 'brightness(100%)');
		        	$('.view-modal').css('-o-transition', 'brightness(100%)');
		        });

				$('.start-date').datetimepicker({
		        	
		            format:'Y-m-d',
		            timepicker: false,
		            scrollInput: false
		        }); 
		        
		        $('.start, .end').datetimepicker({
		        	
		            format:'Y-m-d H:i:s',
		            scrollInput: false
		        });  
				
				$(".allDay").on("click", function(){
				  	$(".date, .date-time").toggleClass("hide");
				});
			});     
        </script>
    </body>
</html>