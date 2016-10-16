$(document).ready(function () {

	var projectsTable =  $('#projectsTable').DataTable({
		 
		"responsive": true,
		 "paging": true,
	     "lengthChange": false,
	     "searching": true,
	     "ordering": true,
	     "info": true,
	     "autoWidth": false,
	     //"bDestroy": true,
	     //"bJQueryUI": true,
	     //"sDom": 'lrtip',
	     "sDom": 'rtp',
	     "ajax": {
		     "url": "projects.json",
		     "type": "GET",
		     "dataSrc": ''
		   },"columns": [
		                 { "data": "id" },
		                 { "data": "projectName" },
		                 { "data": "projectCategory" },
		                 { "data": "projectKey" },
		                 { "data": "projectProgress" },
		                 { "data": "assignees" },
		                 { "data": "totalIssues" },
		                 { "data": "completedIssues" },
		                 { "data": "openIssues" }
		                 
		                 ]

	   });
	 $('#projectsTable_filter input').on( 'keyup', function () {
		 projectsTable.search( $(this).val() ).draw();
		 
		 $( ".p-team #assigneeImage" ).each(function( index ) {
			 var assignee =$( this ).attr("alt");
			 $( this ).attr("src",LetterAvatar (assignee, 60));
			});
		 
		 
		} );
});
 