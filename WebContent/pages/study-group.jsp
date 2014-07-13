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
                                                <table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </tfoot>
 
        <tbody>
            <tr>
                <td>Tiger Nixon</td>
                <td>System Architect</td>
                <td>Edinburgh</td>
                <td>61</td>
                <td>2011/04/25</td>
                <td>$320,800</td>
            </tr>
            <tr>
                <td>Garrett Winters</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>63</td>
                <td>2011/07/25</td>
                <td>$170,750</td>
            </tr>
            <tr>
                <td>Ashton Cox</td>
                <td>Junior Technical Author</td>
                <td>San Francisco</td>
                <td>66</td>
                <td>2009/01/12</td>
                <td>$86,000</td>
            </tr>
            <tr>
                <td>Cedric Kelly</td>
                <td>Senior Javascript Developer</td>
                <td>Edinburgh</td>
                <td>22</td>
                <td>2012/03/29</td>
                <td>$433,060</td>
            </tr>
            <tr>
                <td>Airi Satou</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>33</td>
                <td>2008/11/28</td>
                <td>$162,700</td>
            </tr>
            <tr>
                <td>Brielle Williamson</td>
                <td>Integration Specialist</td>
                <td>New York</td>
                <td>61</td>
                <td>2012/12/02</td>
                <td>$372,000</td>
            </tr>
            <tr>
                <td>Herrod Chandler</td>
                <td>Sales Assistant</td>
                <td>San Francisco</td>
                <td>59</td>
                <td>2012/08/06</td>
                <td>$137,500</td>
            </tr>
            <tr>
                <td>Rhona Davidson</td>
                <td>Integration Specialist</td>
                <td>Tokyo</td>
                <td>55</td>
                <td>2010/10/14</td>
                <td>$327,900</td>
            </tr>
            <tr>
                <td>Colleen Hurst</td>
                <td>Javascript Developer</td>
                <td>San Francisco</td>
                <td>39</td>
                <td>2009/09/15</td>
                <td>$205,500</td>
            </tr>
            <tr>
                <td>Sonya Frost</td>
                <td>Software Engineer</td>
                <td>Edinburgh</td>
                <td>23</td>
                <td>2008/12/13</td>
                <td>$103,600</td>
            </tr>
            <tr>
                <td>Jena Gaines</td>
                <td>Office Manager</td>
                <td>London</td>
                <td>30</td>
                <td>2008/12/19</td>
                <td>$90,560</td>
            </tr>
            <tr>
                <td>Quinn Flynn</td>
                <td>Support Lead</td>
                <td>Edinburgh</td>
                <td>22</td>
                <td>2013/03/03</td>
                <td>$342,000</td>
            </tr>
            <tr>
                <td>Charde Marshall</td>
                <td>Regional Director</td>
                <td>San Francisco</td>
                <td>36</td>
                <td>2008/10/16</td>
                <td>$470,600</td>
            </tr>
            <tr>
                <td>Haley Kennedy</td>
                <td>Senior Marketing Designer</td>
                <td>London</td>
                <td>43</td>
                <td>2012/12/18</td>
                <td>$313,500</td>
            </tr>
            <tr>
                <td>Tatyana Fitzpatrick</td>
                <td>Regional Director</td>
                <td>London</td>
                <td>19</td>
                <td>2010/03/17</td>
                <td>$385,750</td>
            </tr>
            <tr>
                <td>Michael Silva</td>
                <td>Marketing Designer</td>
                <td>London</td>
                <td>66</td>
                <td>2012/11/27</td>
                <td>$198,500</td>
            </tr>
            <tr>
                <td>Paul Byrd</td>
                <td>Chief Financial Officer (CFO)</td>
                <td>New York</td>
                <td>64</td>
                <td>2010/06/09</td>
                <td>$725,000</td>
            </tr>
            <tr>
                <td>Gloria Little</td>
                <td>Systems Administrator</td>
                <td>New York</td>
                <td>59</td>
                <td>2009/04/10</td>
                <td>$237,500</td>
            </tr>
            <tr>
                <td>Bradley Greer</td>
                <td>Software Engineer</td>
                <td>London</td>
                <td>41</td>
                <td>2012/10/13</td>
                <td>$132,000</td>
            </tr>
            <tr>
                <td>Dai Rios</td>
                <td>Personnel Lead</td>
                <td>Edinburgh</td>
                <td>35</td>
                <td>2012/09/26</td>
                <td>$217,500</td>
            </tr>
            <tr>
                <td>Jenette Caldwell</td>
                <td>Development Lead</td>
                <td>New York</td>
                <td>30</td>
                <td>2011/09/03</td>
                <td>$345,000</td>
            </tr>
            <tr>
                <td>Yuri Berry</td>
                <td>Chief Marketing Officer (CMO)</td>
                <td>New York</td>
                <td>40</td>
                <td>2009/06/25</td>
                <td>$675,000</td>
            </tr>
            <tr>
                <td>Caesar Vance</td>
                <td>Pre-Sales Support</td>
                <td>New York</td>
                <td>21</td>
                <td>2011/12/12</td>
                <td>$106,450</td>
            </tr>
            <tr>
                <td>Doris Wilder</td>
                <td>Sales Assistant</td>
                <td>Sidney</td>
                <td>23</td>
                <td>2010/09/20</td>
                <td>$85,600</td>
            </tr>
            <tr>
                <td>Angelica Ramos</td>
                <td>Chief Executive Officer (CEO)</td>
                <td>London</td>
                <td>47</td>
                <td>2009/10/09</td>
                <td>$1,200,000</td>
            </tr>
            <tr>
                <td>Gavin Joyce</td>
                <td>Developer</td>
                <td>Edinburgh</td>
                <td>42</td>
                <td>2010/12/22</td>
                <td>$92,575</td>
            </tr>
            <tr>
                <td>Jennifer Chang</td>
                <td>Regional Director</td>
                <td>Singapore</td>
                <td>28</td>
                <td>2010/11/14</td>
                <td>$357,650</td>
            </tr>
            <tr>
                <td>Brenden Wagner</td>
                <td>Software Engineer</td>
                <td>San Francisco</td>
                <td>28</td>
                <td>2011/06/07</td>
                <td>$206,850</td>
            </tr>
            <tr>
                <td>Fiona Green</td>
                <td>Chief Operating Officer (COO)</td>
                <td>San Francisco</td>
                <td>48</td>
                <td>2010/03/11</td>
                <td>$850,000</td>
            </tr>
            <tr>
                <td>Shou Itou</td>
                <td>Regional Marketing</td>
                <td>Tokyo</td>
                <td>20</td>
                <td>2011/08/14</td>
                <td>$163,000</td>
            </tr>
            <tr>
                <td>Michelle House</td>
                <td>Integration Specialist</td>
                <td>Sidney</td>
                <td>37</td>
                <td>2011/06/02</td>
                <td>$95,400</td>
            </tr>
            <tr>
                <td>Suki Burks</td>
                <td>Developer</td>
                <td>London</td>
                <td>53</td>
                <td>2009/10/22</td>
                <td>$114,500</td>
            </tr>
            <tr>
                <td>Prescott Bartlett</td>
                <td>Technical Author</td>
                <td>London</td>
                <td>27</td>
                <td>2011/05/07</td>
                <td>$145,000</td>
            </tr>
            <tr>
                <td>Gavin Cortez</td>
                <td>Team Leader</td>
                <td>San Francisco</td>
                <td>22</td>
                <td>2008/10/26</td>
                <td>$235,500</td>
            </tr>
            <tr>
                <td>Martena Mccray</td>
                <td>Post-Sales support</td>
                <td>Edinburgh</td>
                <td>46</td>
                <td>2011/03/09</td>
                <td>$324,050</td>
            </tr>
            <tr>
                <td>Unity Butler</td>
                <td>Marketing Designer</td>
                <td>San Francisco</td>
                <td>47</td>
                <td>2009/12/09</td>
                <td>$85,675</td>
            </tr>
            <tr>
                <td>Howard Hatfield</td>
                <td>Office Manager</td>
                <td>San Francisco</td>
                <td>51</td>
                <td>2008/12/16</td>
                <td>$164,500</td>
            </tr>
            <tr>
                <td>Hope Fuentes</td>
                <td>Secretary</td>
                <td>San Francisco</td>
                <td>41</td>
                <td>2010/02/12</td>
                <td>$109,850</td>
            </tr>
            <tr>
                <td>Vivian Harrell</td>
                <td>Financial Controller</td>
                <td>San Francisco</td>
                <td>62</td>
                <td>2009/02/14</td>
                <td>$452,500</td>
            </tr>
            <tr>
                <td>Timothy Mooney</td>
                <td>Office Manager</td>
                <td>London</td>
                <td>37</td>
                <td>2008/12/11</td>
                <td>$136,200</td>
            </tr>
            <tr>
                <td>Jackson Bradshaw</td>
                <td>Director</td>
                <td>New York</td>
                <td>65</td>
                <td>2008/09/26</td>
                <td>$645,750</td>
            </tr>
            <tr>
                <td>Olivia Liang</td>
                <td>Support Engineer</td>
                <td>Singapore</td>
                <td>64</td>
                <td>2011/02/03</td>
                <td>$234,500</td>
            </tr>
            <tr>
                <td>Bruno Nash</td>
                <td>Software Engineer</td>
                <td>London</td>
                <td>38</td>
                <td>2011/05/03</td>
                <td>$163,500</td>
            </tr>
            <tr>
                <td>Sakura Yamamoto</td>
                <td>Support Engineer</td>
                <td>Tokyo</td>
                <td>37</td>
                <td>2009/08/19</td>
                <td>$139,575</td>
            </tr>
            <tr>
                <td>Thor Walton</td>
                <td>Developer</td>
                <td>New York</td>
                <td>61</td>
                <td>2013/08/11</td>
                <td>$98,540</td>
            </tr>
            <tr>
                <td>Finn Camacho</td>
                <td>Support Engineer</td>
                <td>San Francisco</td>
                <td>47</td>
                <td>2009/07/07</td>
                <td>$87,500</td>
            </tr>
            <tr>
                <td>Serge Baldwin</td>
                <td>Data Coordinator</td>
                <td>Singapore</td>
                <td>64</td>
                <td>2012/04/09</td>
                <td>$138,575</td>
            </tr>
            <tr>
                <td>Zenaida Frank</td>
                <td>Software Engineer</td>
                <td>New York</td>
                <td>63</td>
                <td>2010/01/04</td>
                <td>$125,250</td>
            </tr>
            <tr>
                <td>Zorita Serrano</td>
                <td>Software Engineer</td>
                <td>San Francisco</td>
                <td>56</td>
                <td>2012/06/01</td>
                <td>$115,000</td>
            </tr>
            <tr>
                <td>Jennifer Acosta</td>
                <td>Junior Javascript Developer</td>
                <td>Edinburgh</td>
                <td>43</td>
                <td>2013/02/01</td>
                <td>$75,650</td>
            </tr>
            <tr>
                <td>Cara Stevens</td>
                <td>Sales Assistant</td>
                <td>New York</td>
                <td>46</td>
                <td>2011/12/06</td>
                <td>$145,600</td>
            </tr>
            <tr>
                <td>Hermione Butler</td>
                <td>Regional Director</td>
                <td>London</td>
                <td>47</td>
                <td>2011/03/21</td>
                <td>$356,250</td>
            </tr>
            <tr>
                <td>Lael Greer</td>
                <td>Systems Administrator</td>
                <td>London</td>
                <td>21</td>
                <td>2009/02/27</td>
                <td>$103,500</td>
            </tr>
            <tr>
                <td>Jonas Alexander</td>
                <td>Developer</td>
                <td>San Francisco</td>
                <td>30</td>
                <td>2010/07/14</td>
                <td>$86,500</td>
            </tr>
            <tr>
                <td>Shad Decker</td>
                <td>Regional Director</td>
                <td>Edinburgh</td>
                <td>51</td>
                <td>2008/11/13</td>
                <td>$183,000</td>
            </tr>
            <tr>
                <td>Michael Bruce</td>
                <td>Javascript Developer</td>
                <td>Singapore</td>
                <td>29</td>
                <td>2011/06/27</td>
                <td>$183,000</td>
            </tr>
            <tr>
                <td>Donna Snider</td>
                <td>Customer Support</td>
                <td>New York</td>
                <td>27</td>
                <td>2011/01/25</td>
                <td>$112,000</td>
            </tr>
        </tbody>
    </table>
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
					<table class="participants" cellspacing="0" width="100%">

				    </table>
			      </div>
			      <div class="modal-footer">
			     	<button type="button" class="btn btn-default pull-left delete-button">Delete</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-default join-button" name="participant">Join</button>					  
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
							url: "StudyGroupServlet?action=getCalendar",
						},
						{
							url: "https://www.google.com/calendar/feeds/amuletxheart%40gmail.com/public/basic",
							color: "#f56954"
						}
                    ],
                    
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
        						
        						$(".participants").dataTable({
        							"data": json.participants,
        					        "columns": [
        					            { "title": "Engine" },
        					            { "title": "Browser" },
        					            { "title": "Platform" },
        					            { "title": "Version", "class": "center" },
        					            { "title": "Grade", "class": "center" }
        					        ]
        						});
        						
        						//$('.contact option[value="' + json.volunteer.id + '"]').attr("selected", true);
        						//$('.contact').trigger("chosen:updated");      						
        						
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
				
				$(".join-button").on("click", function(event){
				  	$(this).val("participant");
				});
				
				$('.start-date').datetimepicker({
		        	
		            format:'Y-m-d',
		            timepicker: false,
		        }); 
		        
		        $('.start, .end').datetimepicker({
		        	
		            format:'Y-m-d H:i:s'
		        });  
				
				$(".allDay").on("click", function(){
				  	$(".date, .date-time").toggleClass("hide");
				});
				
				$('#example').dataTable();
			});     
        </script>
    </body>
</html>