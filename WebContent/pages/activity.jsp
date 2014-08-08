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
                        Activity
                        <small>Timeline</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Activity</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@START MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                	<div class="row">
                		<div class="col-md-12">                	
                			<ul class="timeline">
                				<c:forEach items="${activities}" var="activity">
			                        <!-- timeline item -->
			                        <li>
			                            <i class="fa fa-user bg-blue"></i>
			                            <div class="timeline-item">
			                                <span class="time"><i class="fa fa-clock-o"></i> 
			                                	<!-- timeline time label -->
						                        <span class="time-label">
						                            ${activity.createdOn }
						                        </span>
						                        <!-- /.timeline-label -->
			                        		</span>
			                                <h3 class="timeline-header">${activity.title}</h3>
			                                <div class="timeline-body">
			                                	<div class="row">
			                                		<div class="col-md-1">
			                                			<div class="image">
												            <img src="
																 <c:choose>
												    				<c:when test="${empty activity.createdBy.facebookId}">
												        				${pageContext.servletContext.contextPath}/img/avatar3.png
												    				</c:when>
																    <c:otherwise>
																         https://graph.facebook.com/${activity.createdBy.facebookId}/picture
																    </c:otherwise>
																</c:choose>
															" class="img-circle" alt="User Image" style="margin-left:auto;margin-right:auto;display:block; width:50px; height:50px;"/>
												        </div>
												        <strong><small style="margin-left:auto;margin-right:auto;display:block;text-align:center;color:#777777">${activity.createdBy.firstName }</small></strong>
			                                		</div>
			                                		<div class="col-md-11">
			                                			Gag ipsum dolar sit amet now kiss bart father. Nerd gag impossibru students captain i see what you did there okay peter griffin movie cellphone. Too mainstream aww yeah fat right derpina all the things rainbow fuck that bitch movies dead 9000. Laptop jackie chan cuteness overload motherfucker creepy me gusta haters gonna hate monocle dog nother to do here panda. 
			                                		</div>
			                                	</div>
			                                </div>
			                            </div>
			                        </li>
		                       		<!-- END timeline item -->
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
    	
    	$(document).ready(function(){
    		$('.time-label').each(function(){
    			$(this).html(moment($(this).html(), "YYYY-MM-DD hh:mm:ss.SSS").fromNow());
    		});
    	});
    	
    	
    	var options = {

   		    // Required. Called when a user selects an item in the Chooser.
   		    success: function(files) {
   		    	$('#dropbox-chooser-chosen-file').text(files[0].link);
   		    	$('#dropbox-chooser-chosen-file-link').attr('href','ActivityDemo?type=5&dropboxLink='+files[0].link);
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