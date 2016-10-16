
function initializejobsTable(){
	var fromDate = moment().format('YYYY-MM-DD');
	var toDate = moment().format('YYYY-MM-DD');
	console.log("fromDate:"+fromDate);
	reloadjobsTable(fromDate,toDate);
}
function jobStatusCodeToHtml(jobStatusCode, jobStatusDescription){
	
	switch(jobStatusCode){
	
	 case "INITIAL":
		 html="<span class='label label-initial'>"+jobStatusDescription+"</span>";
		 break;
	 case "COMPLETED":
		 html="<span class='label label-success'>"+jobStatusDescription+"</span>";
		 break;
	 case "FAILED":
		 html="<span class='label label-danger'>"+jobStatusDescription+"</span>";
		 break;
	 case "PROCESSING":
		 html="<span class='label label-active'>"+jobStatusDescription+"</span>";
		 break;
	 case "CANCELLED":
		 html="<span class='label label-cancelled'>"+jobStatusDescription+"</span>";
		 break;
	 case "JOB_VALIDATED":
		 html="<span class='label label-active'>"+jobStatusDescription+"</span>";
		 break;
	 case "JOB_VALIDATION_FAILED_ERP2EAI":
		 html="<span class='label label-danger'>"+jobStatusDescription+"</span>";
		 break;
	 case "DISPATCHER_EXT_INVOKED":
		 html="<span class='label label-active'>"+jobStatusDescription+"</span>";
		 break;
	 case "DISPATCHER_EXT_FAILED":
		 html="<span class='label label-danger'>"+jobStatusDescription+"</span>";
		 break;
	 case "DATA_TRANSFER_EXT_PROCESSING":
		 html="<span class='label label-active'>"+jobStatusDescription+"</span>";
		 break;
	 case "DATA_TRANSFER_EXT_COPLETED":
		 html="<span class='label label-active'>"+jobStatusDescription+"</span>";
		 break;
	 case "DATA_TRANSFER_EXT_FAILED":
		 html="<span class='label label-danger'>"+jobStatusDescription+"</span>";
		 break;
	 case "SEND_TO_MSMQ_COMPLETED":
		 html="<span class='label label-active'>"+jobStatusDescription+"</span>";
		 break;
	 case "SEND_TO_MSMQ_FAILED":
		 html="<span class='label label-active'>"+jobStatusDescription+"</span>";
		 break;
	 case "JOB_COMPLETED":
		 html="<span class='label label-success'>"+jobStatusDescription+"</span>";
		 break;
	 case "JOB_CANCELLED":
		 html="<span class='label label-cancelled'>"+jobStatusDescription+"</span>";
		 break;
	 case "JOB_EMPTY":
		 html="<span class='label label-warning'>"+jobStatusDescription+"</span>";
		 break;
		 
	}
	return html;
}
function getRowDetailsHTML(){
	
	var rowHtml= $("#row_details").html();
	
}
function getCountryByCountryId(id){
	
	var description;
	 var data = $.parseJSON($("#countries").html());
	 $.each(data, function(index, country) {
		 if(country.id== id){
			 description = country.description;
			 return false;
		 }
	} );
	
	 return description;
}
function reloadjobsTable(fromDate,toDate){
	
	var job_details_url = $("#jobsTable").attr("job_details_url");
	
	 jobsTable =  $('#jobsTable').DataTable({
		
		 "responsive": true,
		 "paging": true,
	     "lengthChange": false,
	     "searching": true,
	     "ordering": true,
	     "info": true,
	     "autoWidth": false,
	     "sDom": 'rtp',
	     "ajax": {
		     "url": "jobs.json?fromDate="+fromDate+"&toDate="+toDate,
		     "type": "GET",
		     "dataSrc": ''
		   },
		   "language": {
			     "loadingRecords": "Please wait - loading... <i class='fa fa-refresh fa-spin'></i>"
		   },
		   "columns": [
		               	{
		               		"className": 'openRow',
		               		"orderable": false,
		               		"data":           '',
		               		"defaultContent": '<button class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button>'
		               	},
		                 
		                 { "data": "id" },
		                 { "data": "jobType.countryId" },
		                 { "data": "reference" },
		                 { "data": "timestamp" },
		                 { "data": "jobStatus.description" },
		                 { "data": "jobType.description" }
		                 
		                ],
		                "columnDefs": [
		                                {
		                                	"targets": 2,
		                                	"render": function ( data, type, row ) {
		                                		 var id = row.id;
		                                		var url = ''+job_details_url+"?id="+id+'';
		                                		var html = "<a href="+url+">"+data+"</a>";
		                                        return html;
		                                    },
		                                    
		                                },
		                                {
		                                	"targets": 1,
		                                	"render": function ( data, type, row ) {
		                                		var html;
		                                		 var id = row.jobType.countryId;
		                                		  html = getCountryByCountryId(id);
		                                        return html;
		                                    },
		                                    
		                                },
		                                {
		                                	"targets": 4,
		                                	"render": function ( data, type, row ) {
		                                		var html;
		                                		 var code = row.jobStatus.code;
		                                		 var description = row.jobStatus.description;
		                                		  html = jobStatusCodeToHtml(code,description);
		                                        return html;
		                                    },
		                                    
		                                },
		                                {
		                                	"targets": 3,
		                                	"render": function ( data, type, row ) {
		                                		var html;
		                                		 var timestamp = row.timestamp;
		                                		 var job_date = moment(timestamp).format("YYYY-MM-DD HH:mm");
		                                         html = job_date ;
		                                		 return html;
		                                    },
		                                    
		                                },
		                                { "visible": false,  "targets": [ 0 ] }
		                            ]
		     //'sDom': ''
	   });
	$('#searchText').on( 'keyup', function () {
		jobsTable.search( this.value ).draw();
	} );
	$('#jobsTable tbody').on('click', 'td.openRow', function () {
	    var tr = $(this).closest('tr');
	    var td = $(this).closest('td');
	    var row = jobsTable.row( tr );

	    if ( row.child.isShown() ) {
	        // This row is already open - close it
	        row.child.hide();
	        td.html('<button class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button>');
	    }
	    else {
	        // Open this row
	        row.child( format(row.data()) ).show();
	        td.html('<button class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-eye-close"></span></button>');
	        
	        
	    }
	} );
	}
function initializeDateRangePicker(){
	$('#daterange-jobs').daterangepicker(
            {
              ranges: {
            	'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(30, 'days'), moment()]
              },
              startDate: moment(),
              endDate: moment()
            },
            function (start, end , label) {
              $('#daterange-jobs span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

              var periode = moment().diff(start, 'days');
              console.log("periode:"+periode);
              console.log("start:"+start+"&end:"+end);
              var fromDate = start.format('YYYY-MM-DD');
              var toDate = end.format('YYYY-MM-DD');
              var weekNumber = "W"+moment(start).isoWeek();
              var existing_table = $("#jobsTable").dataTable();
              if (existing_table != undefined)
              {
                  existing_table.fnClearTable();
                  existing_table.fnDestroy();
              }
              reloadjobsTable(fromDate,toDate);
              //jobsTable.columns(7).search(start).draw();


            }
        );
}
$(document).ready(function() {
	
	 var jobsTable;
	 
     initializeDateRangePicker();
	 initializejobsTable();
	 
	
	
	
});	