var projectPlanningTable;

function initializePlanningTable(){
  projectPlanningTable =  $('#projectPlanningTable').DataTable({
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
	     "url": "planning.json",
	     "type": "GET",
	     "dataSrc": ''
	   },"columns": [
	                 { "data": "jiraIssue" },
	                 { "data": "projectName" },
	                 { "data": "activity" },
	                 { "data": "assignee" },
	                 { "data": "description" },
	                 { "data": "remark" },
	                 { "data": "week" },
	                 { "data": "excpectedHours" },
	                 {"data": "priority"}
	                 ],
	                 "columnDefs": [
	                                {
	                                    "targets": [ 3 ],
	                                    "visible": false,
	                                    "searchable": true
	                                },
	                                {
	                                    "targets": [ 5 ],
	                                    "visible": false
	                                }
	                            ],
   });

 $('#searchText').on( 'keyup', function () {
	 projectPlanningTable.search( this.value ).draw();
	} );
 }
//select user event
function userSelected(){
	$( "#select_user" ).change(function () {
	    var str = "";
	    $( "select option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	    });
	    console.log(str.length);
	    if(str.length > 1){
	    	var first_name = str.split(".")[0];
		    var last_name = str.split(".")[1];
		    str = first_name.charAt(0)+last_name.charAt(0);
		    
		    projectPlanningTable.columns( 3 ).search( str.toUpperCase() ).draw();
	    }
	    
	  })
	  .change();
}
function dateRangeprojectPlanningPicker(){

	$('#daterange-projectPlanning').daterangepicker(
			  
            {
            	
              linkedCalendars : false,
  			  autoUpdateInput : false,
  			  showCustomRangeLabel : false,  
  			  
              ranges: {
            	  'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(30, 'days'), moment()]
              },
              startDate: moment(),
              endDate: moment(),
            },
            function (start, end , label) {
              $('#daterange-projectPlanning span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

              //var periode = moment().diff(start, 'days');
              
              //var chosenId = label.replace(/ /g,"_").trim();
              console.log("start:"+start+"&end:"+end);
              var fromDate = start.format('YYYY-MM-DD');
              var toDate = end.format('YYYY-MM-DD');
              var weekNumber = "W"+moment(start).isoWeek();
              projectPlanningTable.columns(6).search(weekNumber).draw();

             /* var existing_table = $("#loggingTable").dataTable();
              if (existing_table != undefined)
              {
                  existing_table.fnClearTable();
                  existing_table.fnDestroy();
              }
          
              reloadLoggingTable(fromDate,toDate);*/
            

            }
        );

	$("#NextWeek").click(function(){
		
		var periode = $("#daterange-projectPlanning").text().trim();
		console.log("periode:"+periode);
		
		if(periode.indexOf('Date') !== -1){
			var currentWeekStartdate = moment().weekday(0).format('DD MMM'); 
			var currentWeekEnddate = moment().weekday(6).format('DD MMM ,YYYY'); 
			$("#daterange-projectPlanning").text("Current Week ("+currentWeekStartdate+" - "+currentWeekEnddate+")");
			var weekNumber = "W"+moment().weekday(0).isoWeek();
			
			projectPlanningTable.columns(6).search(weekNumber).draw();
		}else{
			periode = periode.replace("Current Week (","");
			periode = periode.replace(")","");
			periode = periode.replace(" - ","-");
			var dateFrom = periode.split("-")[0];
			var dateTo = periode.split("-")[1];
			
			var nextWeekStartdate = moment(dateFrom, 'DD MMM').weekday(7).format('DD MMM'); 
			var nextWeekEnddate = moment(dateTo, 'DD MMM ,YYYY').weekday(13).format('DD MMM ,YYYY'); 
			
			$("#daterange-projectPlanning").text("Next Week ("+nextWeekStartdate+" - "+nextWeekEnddate+")");	
			var weekNumber = "W"+moment(dateFrom, 'DD MMM').weekday(7).isoWeek();
			
			projectPlanningTable.columns(6).search(weekNumber).draw();
			
			
		}


	});
	$("#Previous").click(function(){

		var periode = $("#daterange-projectPlanning").text().trim();
		console.log("periode:"+periode);
		
		if(periode.indexOf('Date') !== -1){
			var currentWeekStartdate = moment().weekday(0).format('DD MMM'); 
			var currentWeekEnddate = moment().weekday(6).format('DD MMM ,YYYY'); 
			$("#daterange-projectPlanning").text("Current Week ("+currentWeekStartdate+" - "+currentWeekEnddate+")");
			var weekNumber = "W"+moment().weekday(0).isoWeek();
			
			projectPlanningTable.columns(6).search(weekNumber).draw();
		}else{
			periode = periode.replace("Previous Week (","");
			periode = periode.replace(")","");
			periode = periode.replace(" - ","-");
			var dateFrom = periode.split("-")[0];
			var dateTo = periode.split("-")[1];
			
			var prevWeekStartdate = moment(dateFrom, 'DD MMM').weekday(-7).format('DD MMM'); 
			var prevWeekEnddate = moment(dateTo, 'DD MMM ,YYYY').weekday(-1).format('DD MMM ,YYYY'); 
			
			var weekNumber = "W"+moment(dateFrom, 'DD MMM').weekday(-7).isoWeek();
			
			projectPlanningTable.columns(6).search(weekNumber).draw();
			$("#daterange-projectPlanning").text("Previous Week ("+prevWeekStartdate+" - "+prevWeekEnddate+")");
		}
		
	})
 
}



var currentWeekStart = moment().weekday(0).format('DD MMM');
var currentWeekEnd = moment().weekday(6).format('DD MMM ,YYYY');

//$("#DateRangePopS").text("Current Week ("+currentWeekStart+" - "+currentWeekEnd+")");



 /**
  * upload process
  * 
  */
 //import

 $( 'input[type="file"]' ).change(function() {
	  //var file = this[0].files;
	  var files = $('input[type="file"]')[0].files;

	 createFileUploadPresentation(files);
});
 $( "#planningFileUpload" ).submit(function( event ) {
	 
	  event.preventDefault();
	  var url= $( this ).attr('action');
	  processUpload(url);
	});

 function processUpload(url)
 {
	 var oMyForm = new FormData();
	 var progressbar = $('.progress-bar');
	 oMyForm.append("file", file.files[0]);
       $.ajax({
    	   
    	   dataType : 'json',
           url : url,
           data : oMyForm,
           type : "POST",
           enctype: 'multipart/form-data',
           processData: false, 
           contentType:false,
           
           xhr: function () {
               var xhr = new window.XMLHttpRequest();
               //Download progress
               xhr.addEventListener("progress", function (evt) {
                   if (evt.lengthComputable) {
                       var percentComplete = evt.loaded / evt.total;
                       var percent = Math.round(percentComplete * 100) + "%";
                       progressbar.css("width",percent);
                   }
               }, false);
               return xhr;
           },
           beforeSend: function () {
              // $('#loading').show();
        	   progressbar.css("width","0%");
           },
           complete: function () {
              // $("#loading").hide();
        	   progressbar.css("width","100%");
           },
           success : function(response) {

        	   if (response.message.toString() == "SUCCES"){
                   console.log("SUCCESS...");
                   $('#projectPlanningTable').DataTable().ajax.reload();
               } else if (response.message.toString() == "FAIL"){
                   console.log("FAIL...");
               }
           },
           error : function(response){
               console.log("response:"+response.message);
               //oMyForm
               
           }
       });
 }
 
 function createFileUploadPresentation(files){
	 
	 var table =$('<table class="table table-striped" role="presentation"><tbody class="files">');
	 
	 for (var i = 0, file; file = files[i]; i++) {
	
		 var iSize = (file.size / 1024); 
		 iSize = (Math.round(iSize * 100) / 100)
		 
	 var row = $('\
			 	  <tr class="template-upload fade in">\
			 		<td><span class="preview"></span></td>\
			 	<td>\
         	<p class="name">'+file.name+'</p>\
          </td>\
          <td>\
          	<p class="size">'+iSize+'&nbsp;KB</p>\
          	<div aria-valuenow="0" aria-valuemax="100" aria-valuemin="0" id="progressbar" role="progressbar" class="progress progress-striped active">\
          	   <div style="width:0%;" class="progress-bar progress-bar-success"></div>\
          	</div>\
           </td>\
           <td>\
             <button class="btn btn-primary start" type="submit">\
                 <i class="glyphicon glyphicon-upload"></i>\
                 <span>Start</span>\
             </button>\
           <button class="btn btn-warning cancel" type="reset">\
                 <i class="glyphicon glyphicon-ban-circle"></i>\
                 <span>Cancel</span>\
             </button>\
          	<button class="btn btn-danger delete" type="button">\
             <i class="glyphicon glyphicon-trash"></i>\
             <span>Delete</span>\
         </button>\
           </td>\
           </tr>');
	 		
	 	table.append(row);
	 }
	 table.append('</tbody></table>');
	 $("#notifications").html(table);
	 
 }
 
 $(document).ready(function() {
	 initializePlanningTable();
	 userSelected();
	 dateRangeprojectPlanningPicker();
 });	
 
  