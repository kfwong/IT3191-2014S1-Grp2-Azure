<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                	<div class="row">
                		<div class="col-md-12">
                			<a class="btn btn-default btn-block" href="ActivityDemo?type=1">Create "Looking for tutor" Activity</a>
		                	<button class="btn btn-default btn-block" disabled>Create "Formed a study group" Activity</button>
		                	<button class="btn btn-default btn-block" disabled>Create "Shared a project" Activity</button>
		                	<button class="btn btn-default btn-block" disabled>Create "Shared a written assignment" Activity</button>
		                	<br/>
		                	<div class="box box-solid">
                                <div class="box-header">
                                    <h3 class="box-title">Share a study note</h3>
                                </div>
                                <div class="box-body">
									<p><span id="dropbox-chooser-btn-container"></span>&nbsp;<i id="dropbox-chooser-chosen-file"></i></p>
				                	<a id="dropbox-chooser-public-url" class="btn btn-default btn-block" href="#">Create "Shared a study note" Activity</a>
                                </div>
                            </div>
                		</div>
                	</div>
                	<hr/>
                	<div class="row">
                		<div class="col-md-12">                	
                			<ul class="timeline">
                				<c:forEach items="${activities}" var="activity">
                					<c:choose>
									    <c:when test="${activity.type == 1}">
									       <!-- timeline time label -->
					                        <li class="time-label">
					                            <span class="bg-red">
					                                10 Feb. 2014
					                            </span>
					                        </li>
					                        <!-- /.timeline-label -->
					                        <!-- timeline item -->
					                        <li>
					                            <i class="fa fa-envelope bg-blue"></i>
					                            <div class="timeline-item">
					                                <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
					                                <h3 class="timeline-header">${activity.user.firstName} is looking for a tutor!</h3>
					                                <div class="timeline-body">${activity.content}</div>
					                                <div class='timeline-footer'>
					                                    <a class="btn btn-default btn-xs" href="#">Read more</a>
					                                    <a class="btn btn-success btn-xs" href="#">Be the tutor</a>
					                                </div>
					                            </div>
					                        </li>
				                       		<!-- END timeline item -->
									    </c:when>
									    <c:when test="${activity.type == 5}">
									        <!-- timeline time label -->
					                        <li class="time-label">
					                            <span class="bg-red">
					                                10 Feb. 2014
					                            </span>
					                        </li>
					                        <!-- /.timeline-label -->
					                        <!-- timeline item -->
					                        <li>
					                            <i class="fa fa-envelope bg-blue"></i>
					                            <div class="timeline-item">
					                                <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
					                                <h3 class="timeline-header">${activity.user.firstName} is sharing a study note!</h3>
					                                <div class="timeline-body">${activity.content}</div>
					                                <div class='timeline-footer'>
					                                    <a class="btn btn-default btn-xs" href="#">Read more</a>
					                                    <a class="btn btn-default btn-xs" href="${activity.dropboxPublicUrl}">Direct Download</a>
					                                    <a class="btn btn-xs dropbox-saver" href="${activity.dropboxPublicUrl}"><i class="fa fa-dropbox"></i> Save to Dropbox</a>
					                                </div>
					                            </div>
					                        </li>
				                       		<!-- END timeline item -->
									    </c:when>
									    <c:otherwise>
									        Not of any type...?
									    </c:otherwise>
									</c:choose>
		                       	</c:forEach>
		                    </ul>
                		</div>
                	</div>
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->
        
		<!-- javscript fragment -->
    	<jsp:include page="../WEB-INF/javascript.jspf" />
    	<script type="text/javascript" src="https://www.dropbox.com/static/api/2/dropins.js" id="dropboxjs" data-app-key="mt3jcgn5fd1vnvo"></script>
    	<script type="text/javascript">
    	var options = {

   		    // Required. Called when a user selects an item in the Chooser.
   		    success: function(files) {
   		    	$('#dropbox-chooser-chosen-file').text(files[0].link);
   		    	$('#dropbox-chooser-public-url').attr('href','ActivityDemo?type=5&dropboxPublicUrl='+files[0].link);
   		    },

   		    // Optional. Called when the user closes the dialog without selecting a file
   		    // and does not include any parameters.
   		    cancel: function() {

   		    },

   		    // Optional. "preview" (default) is a preview link to the document for sharing,
   		    // "direct" is an expiring link to download the contents of the file. For more
   		    // information about link types, see Link types below.
   		    linkType: "preview", // or "direct"

   		    // Optional. A value of false (default) limits selection to a single file, while
   		    // true enables multiple file selection.
   		    multiselect: false, // or true

   		    // Optional. This is a list of file extensions. If specified, the user will
   		    // only be able to select files with these extensions. You may also specify
   		    // file types, such as "video" or "images" in the list. For more information,
   		    // see File types below. By default, all extensions are allowed.
   		    extensions: ['.pdf', '.doc', '.docx'],
   		};
    	var button = Dropbox.createChooseButton(options);
    	document.getElementById("dropbox-chooser-btn-container").appendChild(button);
    	</script>
    </body>
</html>