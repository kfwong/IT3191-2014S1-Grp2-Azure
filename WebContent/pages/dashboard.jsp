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
                        Dashboard
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@START MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3>
                                        150
                                    </h3>
                                    <p>
                                        Resources Shared
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <a href="#" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3>
                                        53<sup style="font-size: 20px">%</sup>
                                    </h3>
                                    <p>
                                        Study Groups Formed
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-stats-bars"></i>
                                </div>
                                <a href="#" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3>
                                        44
                                    </h3>
                                    <p>
                                        Active Members
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                                <a href="#" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3>
                                        65
                                    </h3>
                                    <p>
                                        Comments
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-pie-graph"></i>
                                </div>
                                <a href="#" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                    </div><!-- /.row -->

                    <!-- top row -->
                    <div class="row">
                        <div class="col-xs-12 connectedSortable">
                            
                        </div><!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- Main row -->
                    <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-6 connectedSortable">
                        	<div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Up Coming Study Group</h3>
                                </div>
                                <div class="box-body">
                                	<div>
                                		<div class="icon pull-left">
                                			<i class="fa fa-group" style="font-size:75px;margin-right:20px;color:#AAAAAA"></i>
                                		</div>
                                		<h4>IT3191 Exam Revision</h4>
	                                    <p>
	                                       Our seniors can guide you through regular meetings or one-to-one tutorial.  You decide how long the session should be. This session is designed for Juniors and Seniors. 
	                                    </p>
	                                    <hr/>
	                                    <dl class="dl-horizontal">
	                                        <dt>Date & Time</dt>
	                                        <dd>14 September 2014, 9:00 AM</dd>
	                                        <dt>Location</dt>
	                                        <dd>NYP Library Discussion Room 2-1A</dd>
	                                        <dt>Bring Along</dt>
	                                        <dd>Past year exam paper, lecture notes, laptop and stationary.</dd>
	                                    </dl>
                                	</div>
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <i>
	                                    <img src="${pageContext.servletContext.contextPath}/img/avatar3.png" class="img-circle" alt="User Image" style="width:25px;height:25px;"><small> Susan Doe, </small>
	                                    <img src="${pageContext.servletContext.contextPath}/img/avatar.png" class="img-circle" alt="User Image" style="width:25px;height:25px;"><small> Mike Doe, </small>
	                                    <img src="${pageContext.servletContext.contextPath}/img/avatar5.png" class="img-circle" alt="User Image" style="width:25px;height:25px;"><small> John Doe </small>
	                                    <small>and 15 others are going.</small>
                                    </i>
						        	<p class="pull-right">
		                            	<a class="btn btn-success btn-xs" href="#"><i class="fa fa-plus"></i><strong>&nbsp;Join</strong></a>
		                            	&nbsp;
		                            	<a class="btn btn-default btn-xs" href="#">&nbsp;Details</a>
		                            </p>
						        	<br class="clearfix" />
						        	&nbsp;
                                </div><!-- /.box-footer-->
                            </div><!-- /.box -->
                            
                            <!-- MAILBOX BEGIN -->
		                    <div class="mailbox row">
		                        <div class="col-xs-12">
		                            <div class="box">
		                                <div class="box-body">
		                                    <div class="row">
		                                        <div class="col-md-12">
													<div class="box-header">
		                                    			<h3 class="box-title"><i class="fa fa-comments-o"></i> Your Activity</h3>
		                                    		</div>
		                                            <div class="table-responsive">
		                                                <!-- THE MESSAGES -->
		                                                <table class="table table-mailbox">
		                                                    <tr>
		                                                    	<td class="small-column"><i class="fa fa-comment"></i></td>
		                                                        <td class="subject"><a href="#">You commented on a post.</a></td>
		                                                        <td class="time">12:30 PM</td>
		                                                    </tr>
		                                                    <tr>
		                                                    	<td class="small-column"><i class="fa fa-comment"></i></td>
		                                                        <td class="subject"><a href="#">You commented on a post.</a></td>
		                                                        <td class="time">12:30 PM</td>
		                                                    </tr>
		                                                    <tr>
		                                                    	<td class="small-column"><i class="fa fa-comment"></i></td>
		                                                        <td class="subject"><a href="#">You commented on a post.</a></td>
		                                                        <td class="time">12:30 PM</td>
		                                                    </tr>
		                                                    <tr>
		                                                    	<td class="small-column"><i class="fa fa-comment"></i></td>
		                                                        <td class="subject"><a href="#">You commented on a post.</a></td>
		                                                        <td class="time">12:30 PM</td>
		                                                    </tr>
		                                                    <tr>
		                                                    	<td class="small-column"><i class="fa fa-comment"></i></td>
		                                                        <td class="subject"><a href="#">You commented on a post.</a></td>
		                                                        <td class="time">12:30 PM</td>
		                                                    </tr>
		                                                    <tr>
		                                                    	<td class="small-column"><i class="fa fa-comment"></i></td>
		                                                        <td class="subject"><a href="#">You commented on a post.</a></td>
		                                                        <td class="time">12:30 PM</td>
		                                                    </tr>
		                                                    <tr>
		                                                    	<td class="small-column"><i class="fa fa-comment"></i></td>
		                                                        <td class="subject"><a href="#">You commented on a post.</a></td>
		                                                        <td class="time">12:30 PM</td>
		                                                    </tr>
		                                                    <tr>
		                                                    	<td class="small-column"><i class="fa fa-comment"></i></td>
		                                                        <td class="subject"><a href="#">You commented on a post.</a></td>
		                                                        <td class="time">12:30 PM</td>
		                                                    </tr>
		                                                </table>
		                                            </div><!-- /.table-responsive -->
		                                        </div><!-- /.col (RIGHT) -->
		                                    </div><!-- /.row -->
		                                </div><!-- /.box-body -->
		                                <div class="box-footer clearfix">
		                                    <div class="pull-right">
		                                        <small>Showing 1-12/1,240</small>
		                                        <button class="btn btn-xs btn-primary"><i class="fa fa-caret-left"></i></button>
		                                        <button class="btn btn-xs btn-primary"><i class="fa fa-caret-right"></i></button>
		                                    </div>
		                                </div><!-- box-footer -->
		                            </div><!-- /.box -->
		                        </div><!-- /.col (MAIN) -->
		                    </div>
		                    <!-- MAILBOX END -->
                            
                        </section><!-- /.Left col -->
                        <!-- right col (We are only adding the ID to make the widgets sortable)-->
                        <section class="col-lg-6 connectedSortable">
                        	<div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Featured Resource</h3>
                                </div>
                                <div class="box-body">
                                	<div>
                                		<div class="icon pull-left">
                                			<i class="fa fa-file" style="font-size:75px;margin-right:20px;color:#AAAAAA"></i>
                                		</div>
	                                    <h4>IT3111 Practical 10 Windows Server Administration</h4>
	                                    <p>
	                                       This is the sample notes to complete the practical. Follow the instructions on the notes and you'll make it! Share it to your friends if they trouble completing the practical. 
	                                    </p>
	                                    <hr/>
	                                    <dl class="dl-horizontal">
	                                        <dt>File Type</dt>
	                                        <dd>Word Document (.docx)</dd>
	                                        <dt>Tags</dt>
	                                        <dd><small class="badge">it3111</small>&nbsp;<small class="badge">practical</small>&nbsp;<small class="badge">windows</small>&nbsp;<small class="badge">notes</small></dd>
	                                    </dl>
                                	</div>
                                    
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <div class="pull-left image" style="padding:5px 10px 5px 10px;">
						            	<img src="${pageContext.servletContext.contextPath}/img/avatar3.png" class="img-circle" alt="User Image" style="width:35px;height:35px;">
						            	&nbsp;
						            	<small>John Doe shared this on 12</small>
						        	</div>
						        	<p class="pull-right">
		                            	<a class="btn btn-default btn-xs" href="#"><i class="fa fa-download"></i><strong>&nbsp;Direct Download</strong></a>
		                            	&nbsp;
		                            	<a class="btn btn-primary btn-xs" href="#"><i class="fa fa-dropbox"></i><strong>&nbsp;Save to Dropbox</strong></a>
		                            </p>
						        	<br class="clearfix" />
						        	&nbsp;
                                </div><!-- /.box-footer-->
                            </div><!-- /.box -->

                            <!-- Chat box -->
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title"><i class="fa fa-comments-o"></i> Recent Comments</h3>
                                </div>
                                <div class="box-body chat" id="chat-box">
                                    <!-- chat item -->
                                    <div class="item">
                                        <img src="img/avatar.png" alt="user image" class="online"/>
                                        <p class="message">
                                            <a href="#" class="name">
                                                <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 2:15</small>
                                                Mike Doe
                                            </a>
                                            I would like to meet you to discuss the latest news about the project. What should be our focus?
                                        </p>
                                    </div><!-- /.item -->
                                    <!-- chat item -->
                                    <div class="item">
                                        <img src="img/avatar2.png" alt="user image" class="offline"/>
                                        <p class="message">
                                            <a href="#" class="name">
                                                <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:15</small>
                                                Jane Doe
                                            </a>
                                            Hey thanks for the study notes you shared! Help me through last written test!
                                        </p>
                                    </div><!-- /.item -->
                                    <!-- chat item -->
                                    <div class="item">
                                        <img src="img/avatar3.png" alt="user image" class="offline"/>
                                        <p class="message">
                                            <a href="#" class="name">
                                                <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:30</small>
                                                Susan Doe
                                            </a>
                                            Let's have a meet up next week? We should study for up coming exam soon!
                                        </p>
                                    </div><!-- /.item -->
                                    <!-- chat item -->
                                    <div class="item">
                                        <img src="img/avatar3.png" alt="user image" class="offline"/>
                                        <p class="message">
                                            <a href="#" class="name">
                                                <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:30</small>
                                                Susan Doe
                                            </a>
                                           	Yes I passed the exam! Love the community here!
                                        </p>
                                    </div><!-- /.item -->
                                </div><!-- /.chat -->
                            </div><!-- /.box (chat box) -->

                        </section><!-- right col -->
                    </div><!-- /.row (main row) -->
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->
        
		<!-- javscript fragment -->
    	<jsp:include page="../WEB-INF/javascript.jspf" />
    </body>
</html>