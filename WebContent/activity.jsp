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
					<ul class="timeline">
					    <!-- timeline time label -->
					    <li class="time-label">
					        <span class="bg-red">
					            10 Feb. 2014
					        </span>
					    </li>
					    <!-- /.timeline-label -->
					
					    <!-- timeline item -->
					    <li>
					        <!-- timeline icon -->
					        <i class="fa fa-envelope bg-blue"></i>
					        <div class="timeline-item">
					            <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
					
					            <h3 class="timeline-header"><a href="#">Support Team</a> ...</h3>
					
					            <div class="timeline-body">
					                ...
					                Content goes here
					            </div>
					
					            <div class='timeline-footer'>
					                <a class="btn btn-primary btn-xs">...</a>
					            </div>
					        </div>
					    </li>
					    <!-- END timeline item -->
					</ul>
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->
        
		<!-- javscript fragment -->
    	<jsp:include page="WEB-INF/javascript.jspf" />
    </body>
</html>