<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
    <head>
    	<!-- header fragment -->
    	<jsp:include page="../../WEB-INF/header.jspf" />
    	<link rel="stylesheet" href="//cdn.jsdelivr.net/jquery.datatables/1.10.1/plugins/bootstrap/3/dataTables.bootstrap.css">
    	<link rel="stylesheet" href="//cdn.datatables.net/responsive/1.0.0/css/dataTables.responsive.css">
    	<link rel="stylesheet" href="//cdn.jsdelivr.net/jquery.datatables/1.10.1/plugins/tabletools/css/dataTables.tableTools.min.css">
    	<link rel="stylesheet" href="//cdn.jsdelivr.net/hint.css/1.3.2/hint.min.css">
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
                        Log
                        <small>Viewer</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@START MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                	<div id="container" style="height: 500px; width: 100%; margin: 0 auto"></div>
                	<hr/>
                    <table id="example" class="table table-striped">
				        <thead>
				            <tr>
				                <th>Level</th>
				                <th>Date Logged</th>
				                <th>Action</th>
				                <th>Message</th>
				            </tr>
				        </thead>
				    </table>
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@END MODIFICATION FROM HERE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->
        
		<!-- javscript fragment -->
    	<jsp:include page="../../WEB-INF/javascript.jspf" />
    	<script src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.js"></script>
    	<script src="//cdn.jsdelivr.net/jquery.datatables/1.10.1/plugins/bootstrap/3/dataTables.bootstrap.js"></script>
    	<script src="//cdn.datatables.net/responsive/1.0.0/js/dataTables.responsive.js"></script>
		<script src="//cdn.jsdelivr.net/jquery.datatables/1.10.1/plugins/tabletools/js/dataTables.tableTools.min.js"></script>
		<script src="//code.highcharts.com/highcharts.js"></script>
		<script src="//code.highcharts.com/highcharts-more.js"></script>
		<script src="//code.highcharts.com/modules/exporting.js"></script>
    	<script type="text/javascript">
    		$('#example').dataTable(
    			{
    				"responsive": true,
    				"dom": 'T<"clear">lfrtip',
    				"bSort" : false,
    		        "tableTools": {
    		            "sSwfPath": "https://cdn.jsdelivr.net/jquery.datatables/1.10.1/plugins/tabletools/swf/copy_csv_xls_pdf.swf"
    		        },
    		        "ajax": {
	    	            "url": window.location.protocol+"//"+window.location.hostname+":"+window.location.port +"${pageContext.request.contextPath}/LogView",
	    	            "data": {
	    	            	"type": "log"
	    	            },
	    	            "dataSrc": ""
	    	        },
	    	        "columns": [
	    	            { "data": "level" },
	    	            { "data": "dateLogged" },
	    	            { "data": "action" },
	    	            { "data": "message" }
	    	        ],
	    	        "columnDefs": [
	    			    { 
	    			    	"targets": [ 0 ],
	    			    	"createdCell": function (td, cellData, rowData, row, col) {
	    			    		switch(cellData){
	    			    			case "INFO":
	    			    				$(td).html("<span class='label label-info'>"+cellData+"</span>");
	    			    			break;
	    			    			case "WARN":
	    			    				$(td).html("<span class='label label-warning'>"+cellData+"</span>");
	    			    			break;
	    			    			case "ERROR":
	    			    				$(td).html("<span class='label label-danger'>"+cellData+"</span>");
	    			    			break;
	    			    			default:
	    			    				$(td).html("<span class='label label-default'>"+cellData+"</span>");
	    			    			break;
	    			    		}
	    			    	}
	    			    },
	    			    { 
	    			    	"targets": [ 1 ],
	    			    	"createdCell": function (td, cellData, rowData, row, col) {
	    			    		// Sample original output:
	    			    		// Jul 24, 2014 11:38:34 AM
	    			    		$(td).html(moment(cellData, "MMM DD, YYYY hh:mm:ss A").fromNow()+'&nbsp;<span class="hint--right" data-hint="'+cellData+'" style="cursor:pointer;"><i class="fa fa-clock-o" ></i></span>');
	    			    	}
	    			    }
	    			]
	    		}
    		);
    		
    		$.ajax({
    		    type: "GET",
    		    url: window.location.protocol+"//"+window.location.hostname+":"+window.location.port +"${pageContext.request.contextPath}/LogView",
    		    data: {
    		    	"type": "heatMap"
    		    },
    		    dataType: "json",
    		    success: function(json){
    		    	var options = {
    		    		chart: {
   	    		            type: 'bubble',
   	    		            zoomType: 'xy',
   	    		            backgroundColor: 'none'
   	    		        },
   	    		        colors: ['#5BC0DE','#F0AD4E','#D9534F'],
   	    		        legend: {
   	    		        	enabled: false
   	    		        },
   	    		        title: {
   	    		            text: 'Event Punchcard'
   	    		        },
   	    		        tooltip: {
   	    		            shared: true,
   	    		            useHTML: true,
   	    		            headerFormat: '<strong><small>{point.key} {point.y:%b \'%y}</small></strong><table>',
   	    		            pointFormat: '<tr><td><small>Level: </small></td><td style="color: {series.color}"><small>{series.name}</small></td></tr>'+ '<tr><td><small>Total: </small></td><td><small>{point.z}</small></td></tr>',
   	    		            footerFormat: '</table>'
   	    		        },
   	    		        xAxis: {
   	    		        	min: 0,
   	    		        	max: 32,
   	    		        	tickInterval: 1,
   							tickmarkPlacement: 'on',
   							showFirstLabel: false,
   							showLastLabel: false
   	    		        },
   	    		        yAxis:{
   	    		        	min: Date.now()- 24 * 3600 * 1000 * 30 * 5,
   	    		        	max: Date.now(),
   	    		        	type: 'datetime',
   	    		        	dateTimeLabelFormats: {
   	    		                day: '%b'
   	    		            },
   	    		            title: null,
   	    		            tickInterval: 24 * 3600 * 1000 * 30,
   	    		            showFirstLabel: false,
   							showLastLabel: false
   	    		        },
   	    		        plotOptions: {
   	    		        	bubble:{
   	    		        		minSize: 10,
   		    		            maxSize: 50
   	    		        	}
   	    		        },
   	    		        series: [{},{},{}]
    		    	}
    				options.series[0].name = 'INFO';
    				options.series[0].data = json[0];
    				options.series[1].name = 'WARN';
    				options.series[1].data = json[1];
    				options.series[2].name = 'ERROR';
    				options.series[2].data = json[2];
    				
   	    		    $('#container').highcharts(options);
    		    }
    		});
    	</script>
    </body>
</html>