<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
    <head>
    	<!-- header fragment -->
    	<jsp:include page="WEB-INF/header.jspf" />
    </head>
    <body class="skin-blue">
        <!-- navigation top fragment -->
        <jsp:include page="WEB-INF/navigation-top.jspf" />
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
        	<!-- navigation left fragment -->
        	<jsp:include page="WEB-INF/navigation-left.jspf" />	
        	
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
                        <div class="col-md-3">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h4 class="box-title">Draggable Events</h4>
                                </div>
                                <div class="box-body">
                                    <!-- the events -->
                                    <div id='external-events'>                                        
                                        <div class='external-event bg-green'>Lunch</div>
                                        <div class='external-event bg-red'>Go home</div>
                                        <div class='external-event bg-aqua'>Do homework</div>
                                        <div class='external-event bg-yellow'>Work on UI design</div>
                                        <div class='external-event bg-navy'>Sleep tight</div>
                                        <p>
                                            <input type='checkbox' id='drop-remove' /> <label for='drop-remove'>remove after drop</label>
                                        </p>
                                    </div>
                                </div><!-- /.box-body -->
                            </div><!-- /. box -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Create Event</h3>
                                </div>
                                <div class="box-body">
                                    <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                                        <button type="button" id="color-chooser-btn" class="btn btn-danger btn-block btn-sm dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>
                                        <ul class="dropdown-menu" id="color-chooser">
                                            <li><a class="text-green" href="#"><i class="fa fa-square"></i> Green</a></li>
                                            <li><a class="text-blue" href="#"><i class="fa fa-square"></i> Blue</a></li>                                            
                                            <li><a class="text-navy" href="#"><i class="fa fa-square"></i> Navy</a></li>                                            
                                            <li><a class="text-yellow" href="#"><i class="fa fa-square"></i> Yellow</a></li>
                                            <li><a class="text-orange" href="#"><i class="fa fa-square"></i> Orange</a></li>
                                            <li><a class="text-aqua" href="#"><i class="fa fa-square"></i> Aqua</a></li>
                                            <li><a class="text-red" href="#"><i class="fa fa-square"></i> Red</a></li>
                                            <li><a class="text-fuchsia" href="#"><i class="fa fa-square"></i> Fuchsia</a></li>
                                            <li><a class="text-purple" href="#"><i class="fa fa-square"></i> Purple</a></li>
                                        </ul>
                                    </div><!-- /btn-group -->
                                    <div class="input-group">                                          
                                        <input id="new-event" type="text" class="form-control" placeholder="Event Title">
                                        <div class="input-group-btn">
                                            <button id="add-new-event" type="button" class="btn btn-default btn-flat">Add</button>
                                        </div><!-- /btn-group -->
                                    </div><!-- /input-group -->
                                </div>
                            </div>
                        </div><!-- /.col -->
                        <div class="col-md-9">
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
				<form role="form" method="post" action="CalendarFoodDriveServlet">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel">Event details</h4>
			      </div>
			      <div class="modal-body">
					<div class="form-group">
					  <label for="title">Title</label>
					  <input type="text" class="form-control title" id="title" name = "title" required autofocus>
					</div>
					<div class="form-group">
					  <label for="contact">Contact</label>
					  	<select class="form-control contact" id="contact" name="contact">
	
						</select>
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
				<form role="form" method="post" action="CalendarFoodDriveServlet">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel">Create event</h4>
			      </div>
			      <div class="modal-body">
					<div class="form-group">
					  <label for="title">Title</label>
					  <input type="text" class="form-control title" id="title" name = "title" required autofocus>
					</div>
					<div class="form-group">
					  <label for="contact">Contact</label>
					  	<select class="form-control contact" id="contact" name="contact">
	
						</select>
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
    	<jsp:include page="WEB-INF/javascript.jspf" />
    	
    	<!-- Page specific script -->
        <script type="text/javascript">
			$(document).ready(function(){
				$("#calendar").fullCalendar({
					header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
				});
				
				//change the button icons to match theme
				$(".fc-icon.fc-icon-left-single-arrow").removeClass().addClass("fa fa-caret-left");
				$(".fc-icon.fc-icon-right-single-arrow").removeClass().addClass("fa fa-caret-right");
			});     
        </script>
    </body>
</html>