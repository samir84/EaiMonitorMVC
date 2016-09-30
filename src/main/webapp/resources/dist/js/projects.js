$(document).ready(function () {

	var projectPlanningTable =  $('#projectsTable').DataTable({
		"responsive": true,
	     "ordering": true,
	     "info": true,
	     "autoWidth": true
	});
	/*var projectPlanningTable =  $('#projectsTable').DataTable({
		 "responsive": true,
		 "paging": true,
	     "lengthChange": false,
	     "searching": true,
	     "ordering": true,
	     "info": true,
	     "autoWidth": false
	     /*"ajax": {
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
		                'sDom': ''
	   });*/
	 $('#projectsTable_filter input').on( 'keyup', function () {
		 projectPlanningTable.search( $(this).val() ).draw();
		 
		 $( ".p-team #assigneeImage" ).each(function( index ) {
			 var assignee =$( this ).attr("alt");
			 $( this ).attr("src",LetterAvatar (assignee, 60));
			});
		 
		 
		} );
});
 