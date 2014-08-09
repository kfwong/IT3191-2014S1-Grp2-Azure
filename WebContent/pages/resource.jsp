<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" prefix="csrf" %>
<!DOCTYPE html>
<html>
    <head>
    	<!-- header fragment -->
    	<jsp:include page="../WEB-INF/header.jspf" />
    	<link rel="stylesheet" href="//cdn.jsdelivr.net/select2/3.4.8/select2.css">
    	<link rel="stylesheet" href="//cdn.jsdelivr.net/hint.css/1.3.2/hint.min.css">
    	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/select2/select2-bootstrap3.css">
    	<style>
		#columns {
			-webkit-column-count: 3;
			-webkit-column-gap: 10px;
			-moz-column-count: 3;
			-moz-column-gap: 10px;
			column-count: 3;
			column-gap: 15px;
		}
		
		.pin {
			width: 100%;
			display: inline-block;
			-webkit-column-break-inside: avoid;
			-moz-column-break-inside: avoid;
			column-break-inside: avoid;
		}
    	</style>
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
                        Resource
                        <small>Sharing</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#"><i class="fa fa-dashboard"></i> Community Hub</a></li>                    
                        <li class="active">Resource</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@START MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                	<div class="box">
                		<csrf:form role="form" action="publish" method="post">
	                        <div class="box-header">
	                            <h3 class="box-title">Showcase your study notes or useful materials with others!</h3>
	                        </div>
	                        <div class="box-body">
	                        	<div class="form-group">
                                    <input name="title" class="form-control" placeholder="Title" type="text">
                                </div>
                            	<div class="form-group">
                                    <textarea name="description" class="form-control" rows="3" placeholder="Description"></textarea>
                                </div>
                                <input id="tags" name="tags" class="form-group" style="width:100%;"></input>
	                        </div><!-- /.box-body -->
	                        <div class="box-footer">
	                        	<input id="dropbox-link" type="hidden" name="dropboxLink" value=""/>
	                            <p><input type="submit" class="btn btn-primary btn-xs" value="Publish" />&nbsp;<span id="dropbox-chooser-btn-container"></span>&nbsp;<i id="dropbox-chooser-chosen-file-link" style="color:gray;"></i></p>
	                        </div><!-- /.box-footer-->
                        </csrf:form>
                    </div>

					<div id="columns">						
						<c:forEach items="${resources}" var="resource">
							<div class="pin">
								<div class="box">
			                        <div class="box-header">
			                            <h4 class="box-title">${resource.title}&nbsp;<span class="hint--top" data-hint="${resource.tags}"><i class="fa fa-tag"></i></span></h4>
			                        </div>
			                        <div class="box-body">
			                            <p>${resource.description}</p>
			                            <p class="pull-right">
			                            	<button class="btn btn-default btn-xs comment-view-btn" data-toggle="modal" data-target="#myModal" value="${resource.id}"><i class="fa fa-comment"></i><strong>&nbsp;Comment</strong></button>
			                            	<a class="btn btn-default btn-xs" href="${resource.dropboxLink}"><i class="fa fa-download"></i><strong>&nbsp;Direct Download</strong></a>
			                            	&nbsp;
			                            	<a class="btn btn-default btn-xs dropbox-saver" href="${resource.dropboxLink}"></a>
			                            </p>
			                            <br class="clearfix" />
			                        </div><!-- /.box-body -->
			                        <div class="box-footer">
			                        	<div class="pull-left image" style="padding:5px 10px 5px 10px;">
							            	<img src="
							            		<c:choose>
								    				<c:when test="${empty resource.createdBy.facebookId}">
								        				${pageContext.servletContext.contextPath}/img/avatar3.png
								    				</c:when>
												    <c:otherwise>
												         https://graph.facebook.com/${resource.createdBy.facebookId}/picture
												    </c:otherwise>
												</c:choose>
							            	" class="img-circle" alt="User Image" style="width:35px;height:35px;">
							            	&nbsp;
							            	<small>${resource.createdBy.firstName} shared this on ${resource.createdOn}</small>
							        	</div>
							        	<br class="clearfix" />
							        	&nbsp;
			                        </div><!-- /.box-footer-->
			                    </div>
							</div>
						</c:forEach>
					</div>
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- Modal -->
		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h4>
		      </div>
		      <div class="modal-body">
	      		<input id="comment-activity-id" type="hidden" value="" />
	      		<div class="form-group">
                    <textarea id="comment-content" class="form-control" rows="3" placeholder="Comment"></textarea>
                </div>
                <button id="comment-submit-btn" class="btn btn-default btn-xs pull-right" "><strong>Submit</strong></button>
                <div class="clearfix">&nbsp;</div>
                <hr/>
		        <div class="callout callout-info">
		        	<p id="resource-description"></p>
		        	<div class="pull-left image" style="padding:5px 10px 5px 10px;">
		            	<img src="${pageContext.servletContext.contextPath}/img/avatar3.png" class="img-circle" alt="User Image" style="width:35px;height:35px;">
		        	</div>
		        	<small><span id="resource-author"></span> shared this not long ago.<br/><span class="time-label"><i class="fa fa-clock-o"></i>&nbsp;<span id="resource-date"></</span></span></small>
                </div>
                
                <div id="comments">
                </div>

		      </div>
		    </div>
		  </div>
		</div>
        
		<!-- javscript fragment -->
    	<jsp:include page="../WEB-INF/javascript.jspf" />
		<script src="//cdn.jsdelivr.net/select2/3.4.8/select2.min.js"></script>
    	<script type="text/javascript" src="https://www.dropbox.com/static/api/2/dropins.js" id="dropboxjs" data-app-key="mt3jcgn5fd1vnvo"></script>
    	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/JavaScriptServlet"></script>
    	<script type="text/javascript">
    	var options = {

   		    // Required. Called when a user selects an item in the Chooser.
   		    success: function(files) {
   		    	$('#dropbox-chooser-chosen-file-link').text(files[0].link);
   		    	$('#dropbox-link').val(files[0].link);
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
    	$('#dropbox-chooser-btn-container').append(button);
    	
    	// select2 init
        $("#tags").select2({
        	tags:["red", "green", "blue"],
        	placeholder:"Tag your post for easier discovery!"
        });
    	
    	$('#comment-submit-btn').on('click', function(e){
    		$.ajax({
	    		type: "POST",
	    		url: "${pageContext.servletContext.contextPath}/comment/publish",
	    		data: {
	    			"activity-id": $('#comment-activity-id').val(),
	    			"content": $('#comment-content').val()
	    		},
	    		success: function(comment){
					$('#comments').append(
						'<div class="callout">'+
							'<p>'+comment.content+'</p>'+
			        		'<div class="pull-left image" style="padding:5px 10px 5px 10px;">'+
			            	'<img src="${pageContext.servletContext.contextPath}/img/avatar3.png" class="img-circle" alt="User Image" style="width:35px;height:35px;">'+
			        	'</div>'+
			        	'<small>'+comment.commentedBy.firstName+ ' commented on this not long ago.<br/><span class="time-label"><i class="fa fa-clock-o"></i>&nbsp;'+comment.commentedOn+'</span></small>'
					);
	    		}
	    	});
    	});

    	$('.comment-view-btn').on('click',function(e){
    		$.ajax({
	    		type: "GET",
	    		url: "${pageContext.servletContext.contextPath}/comment/view",
	    		data: {id: $(e.target).val()},
	    		success: function(comments){
	        		$('#comment-activity-id').val($(e.target).val());
	    			$('#comments').empty();
					comments.forEach(function(comment){
						$('#comments').append(
							'<div class="callout">'+
								'<p>'+comment.content+'</p>'+
				        		'<div class="pull-left image" style="padding:5px 10px 5px 10px;">'+
				            	'<img src="${pageContext.servletContext.contextPath}/img/avatar3.png" class="img-circle" alt="User Image" style="width:35px;height:35px;">'+
				        	'</div>'+
				        	'<small>'+comment.commentedBy.firstName+ ' commented on this not long ago.<br/><span class="time-label"><i class="fa fa-clock-o"></i>&nbsp;'+comment.commentedOn+'</span></small>'
						);
					});
	    		}
	    	});
    	});
    	</script>
    </body>
</html>