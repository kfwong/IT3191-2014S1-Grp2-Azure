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
		  <div class="modal-dialog">
		    <div class="modal-content">
				<form role="form" method="post" action="StudyGroupServlet">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel">Event details</h4>
			      </div>
			      <div class="modal-body">
					<div class="form-group">
					  <label for="title">Title</label>
					  <input type="text" class="form-control title" id="title" name = "title" required autofocus>
					</div>
					<!-- <div class="form-group">
					  <label for="contact">Contact</label>
					  	<select class="form-control contact" id="contact" name="contact">
	
						</select>
					</div>
					-->
					<div class="checkbox">
					    <label class="allDay">
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
			     	<button type="button" class="btn btn-default pull-left delete-button">Delete</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			        <button type="submit" class="btn btn-primary confirm-edit-button">Save</button>
			      </div>
			      <input type="hidden" name="action" value="edit"/>
			      <input type="hidden" class="id" name="id" value=""/>
				</form>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!-- Modal-create -->
		<div class="modal create-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
				<form role="form" method="post" action="StudyGroupServlet">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel">Create event</h4>
			      </div>
			      <div class="modal-body">
					<div class="form-group">
					  <label for="title">Title</label>
					  <input type="text" class="form-control title" id="title" name = "title" required autofocus>
					</div>
					<!-- 
					<div class="form-group">
					  <label for="contact">Contact</label>
					  	<select class="form-control contact" id="contact" name="contact">
						</select>
					</div>
					 -->
					<div class="checkbox">
					    <label class="allDay">
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
		    	<form role="form" method="post" action="CalendarFoodDriveServlet">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel">Delete events</h4>
			      </div>
			      <div class="modal-body">
			         <p>Are you sure you want to delete the event?</p>
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
                    
                    events: "StudyGroupServlet?action=getCalendar",

                    dayClick: function(date, jsEvent, view) {
        				
        		        $(".create-modal").modal();
        		        $(".start-date").val(date.format("YYYY-MM-DD"));
        		        $(".start").val(date.format("YYYY-MM-DD HH:mm:ss"));
        		        $(".end").val(date.add('days', 1).format("YYYY-MM-DD HH:mm:ss"));
        		    },
        		    
        		    eventClick: function(calEvent, jsEvent, view) {
        		    	$.ajax({
        		    		type: "GET",
        		    		url: "StudyGroupServlet?action=view&id=" + calEvent.id,
        		    		success: function(json){
        						$(".view-modal").modal();
        						$(".id").val(json.id);
        						$(".title").val(json.title);
        						$(".start-date").val(moment(json.start).format("YYYY-MM-DD"));
        						$(".start").val(json.start);
        						$(".end").val(json.end);
        						
        						$('.contact option[value="' + json.volunteer.id + '"]').attr("selected", true);
        						$('.contact').trigger("chosen:updated");
        						
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
        		    		}
        		    	});
        		    }, 
        		    eventDrop: function(event, revertFunc) {
        		    	$.ajax({
        		    		type: "POST",
        		    		url: "StudyGroupServlet",
        		    		data: {
        		    			action:"edit",
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
				
				$('.start-date').daterangepicker({
					singleDatePicker: 1,
					timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A',            
		        }); 
				
				$('.start, .end').daterangepicker({
					singleDatePicker: 1,
					timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A',
		        });  
				
				$(".allDay").on("click", function(){
				  	$(".date, .date-time").toggleClass("hide");
				});
			});     
        </script>
    </body>
</html>