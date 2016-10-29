function initializeOrderListTable(){
	var fromDate = moment().format('YYYY-MM-DD');
	var toDate = moment().format('YYYY-MM-DD');
	order_listTable = reloadOrderListTable(fromDate,toDate);	
}
function updateOrderStatusOverviewByOrderDate(fromDate,toDate,periode){
	
	var getUrl ="statistics/OrderStatusOverviewByOrderDate.json?fromDate="+fromDate+"&toDate="+toDate;
	var jqxhr = $.getJSON( getUrl, function() {
		  
		})
		  .done(function(data ) {
		    console.log( "second success:"+data.totalOrders );
		    $(".info-box.bg-green .info-box-number").text(data.totalOrdersSucceed);
		    $(".info-box.bg-green .progress .progress-bar").attr("style" ,"width:"+data.progressOrdersSucceed+"");
		    $(".info-box.bg-green .progress-description").text(data.progressOrdersSucceed+" Increase in "+periode+" Days");
		    
		    $(".info-box.bg-red .info-box-number").text(data.totalOrdersFailled);
		    $(".info-box.bg-red .progress .progress-bar").attr("style" ,"width:"+data.progressOrdersFailled+"");
		    $(".info-box.bg-red .progress-description").text(data.progressOrdersFailled+" Increase in "+periode+" Days");
		    
		    
		    $(".info-box.bg-yellow .info-box-number").text(data.totalOrdersPending);
		    $(".info-box.bg-yellow .progress .progress-bar").attr("style" ,"width:"+data.progressOrdersPending+"");
		    $(".info-box.bg-yellow .progress-description").text(data.progressOrdersPending+" Increase in "+periode+" Days");
		    
		    $(".info-box.bg-desactive .info-box-number").text(data.totalOrdersCancelled);
		    $(".info-box.bg-desactive .progress .progress-bar").attr("style" ,"width:"+data.progressOrdersCancelled+"");
		    $(".info-box.bg-desactive .progress-description").text(data.progressOrdersCancelled+" Increase in "+periode+" Days");
		    
		    
		  })
		  .fail(function(data) {
		    console.log( "error: "+data );
		  })
		  .always(function(data) {
		    console.log( "complete: "+data );
		  });
		 
		// Perform other work here ...
		 
		// Set another completion function for the request above
		jqxhr.complete(function(data) {
		  //console.log( "second complete:"+data );
		});
}
function getSalesOrganizationByCode(code){
	
	var description;
	 var data = $.parseJSON($("#salesOrganizations").html());
	 $.each(data, function(index, organization) {
		 if(organization.code == code){
			 description = organization.description;
			 return false;
		 }
	} );
	
	 return description;
}
function downloadOrderXml(){
	var orderxml= $("#orderxml").text();
	var orderNumber = $("#orderxml").attr("orderNumber");
	var file_name= orderNumber+".xml";
	download(orderxml, file_name, "text/xml");
}

function format ( d ) {
    // `d` is the original data object for the row
	console.log(d);
	var transactionStatusCode = d.transactionStatus.code;
	var notificationText = d.transactionStatus.description;
	var notification_alert_css;
	
	
	switch(transactionStatusCode){
	   case "RECEIVED" :
		   
		   $("#smpl-step-step1").attr("class","col-xs-2 smpl-step-step complete");
		   $("#progress_step1").attr("style","width:100%;");
		   $("#progress_step1").attr("class","progress-bar progress-bar-primary progress-bar-striped");
		   
		   $("#smpl-step-step2").attr("class","col-xs-2 smpl-step-step complete");
		   $("#progress_step2").attr("style","width:100%;");
		   $("#progress_step2").attr("class","progress-bar progress-bar-primary progress-bar-striped");
		   
		   $("#smpl-step-step3").attr("class","col-xs-2 smpl-step-step complete");
		   $("#progress_step3").attr("style","width:60%;");
		   $("#progress_step3").attr("class","progress-bar progress-bar-primary progress-bar-striped");
		   
		   notification_alert_css ="alert alert-info alert-dismissible";
		   break;
		   
	   case "IS_BEING_PROCESSED" :
		   
		   $("#smpl-step-step1").attr("class","col-xs-2 smpl-step-step complete");
		   $("#progress_step1").attr("style","width:100%;");
		   $("#progress_step1").attr("class","progress-bar progress-bar-primary progress-bar-striped");
		   
		   $("#smpl-step-step2").attr("class","col-xs-2 smpl-step-step complete");
		   $("#progress_step2").attr("style","width:100%;");
		   $("#progress_step2").attr("class","progress-bar progress-bar-primary progress-bar-striped");
		   
		   $("#smpl-step-step3").attr("class","col-xs-2 smpl-step-step complete");
		   $("#progress_step3").attr("style","width:100%;");
		   $("#progress_step3").attr("class","progress-bar progress-bar-primary progress-bar-striped");
		   
		   notification_alert_css ="alert alert-info alert-dismissible";
		   break;
		   
		   
	   case "PROCESSED" :
		   notification_alert_css ="alert alert-success alert-dismissible";
		   $("#smpl-step-step1").attr("class","col-xs-2 smpl-step-step complete");
			$("#progress_step1").attr("style","width:100%;");
			$("#progress_step1").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step2").attr("class","col-xs-2 smpl-step-step complete");
			$("#progress_step2").attr("style","width:100%;");
			$("#progress_step2").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step3").attr("class","col-xs-2 smpl-step-step complete");
			$("#progress_step3").attr("style","width:100%;");
			$("#progress_step3").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step4").attr("class","col-xs-2 smpl-step-step complete");
			$("#progress_step4").attr("style","width:100%;");
			$("#progress_step4").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step5").attr("class","col-xs-2 smpl-step-step complete");
			$("#progress_step5").attr("style","width:100%;");
			$("#progress_step5").attr("class","progress-bar progress-bar-success progress-bar-striped");
		   break;
	
	   case "MAIL_NOT_SENT" :
		   notification_alert_css ="alert alert-success alert-dismissible";
		   $("#smpl-step-step1").attr("class","col-xs-2 smpl-step-step complete");
			$("#progress_step1").attr("style","width:100%;");
			$("#progress_step1").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step2").attr("class","col-xs-2 smpl-step-step complete");
			$("#progress_step2").attr("style","width:100%;");
			$("#progress_step2").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step3").attr("class","col-xs-2 smpl-step-step complete");
			$("#progress_step3").attr("style","width:100%;");
			$("#progress_step3").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step4").attr("class","col-xs-2 smpl-step-step complete");
			$("#progress_step4").attr("style","width:100%;");
			$("#progress_step4").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step5").attr("class","col-xs-2 smpl-step-step complete");
			$("#progress_step5").attr("style","width:100%;");
			$("#progress_step5").attr("class","progress-bar progress-bar-success progress-bar-striped");
		   break;
	   
	   case "CANCELLED":
		   notification_alert_css ="alert alert-danger alert-dismissible";
		   
		   $("#smpl-step-step1").attr("class","col-xs-2 smpl-step-step disabled");
			$("#progress_step1").attr("style","width:0%;");
			$("#progress_step1").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step2").attr("class","col-xs-2 smpl-step-step disabled");
			$("#progress_step2").attr("style","width:0%;");
			$("#progress_step2").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step3").attr("class","col-xs-2 smpl-step-step disabled");
			$("#progress_step3").attr("style","width:0%;");
			$("#progress_step3").attr("class","progress-bar progress-bar-success progress-bar-striped");
			
			$("#smpl-step-step4").attr("class","col-xs-2 smpl-step-step disabled");
			$("#progress_step4").attr("style","width:0%;");
			
			$("#smpl-step-step5").attr("class","col-xs-2 smpl-step-step disabled");
			$("#progress_step5").attr("style","width:0%;");
			break;
	   default :
		   notification_alert_css ="alert alert-danger alert-dismissible";
	    $("#smpl-step-step1").attr("class","col-xs-2 smpl-step-step complete");
		$("#progress_step1").attr("style","width:100%;");
		$("#progress_step1").attr("class","progress-bar progress-bar-success progress-bar-striped");
		
		$("#smpl-step-step2").attr("class","col-xs-2 smpl-step-step complete");
		$("#progress_step2").attr("style","width:100%;");
		$("#progress_step2").attr("class","progress-bar progress-bar-success progress-bar-striped");
		
		$("#smpl-step-step3").attr("class","col-xs-2 smpl-step-step complete");
		$("#progress_step3").attr("style","width:60%;");
		$("#progress_step3").attr("class","progress-bar progress-bar-success progress-bar-striped");
		
		$("#smpl-step-step4").attr("class","col-xs-2 smpl-step-step disabled");
		$("#progress_step4").attr("style","width:0%;");
		
		$("#smpl-step-step5").attr("class","col-xs-2 smpl-step-step disabled");
		$("#progress_step5").attr("style","width:0%;");
		break;
	   	   break;
		   
	}
	
	$("#row_details #notification .alert").attr("class",notification_alert_css);
    $("#row_details #notification h4").text(notificationText);
    $('a[href=\'#tab_1\']').attr("href","#tab_1_"+d.id);
    $('a[href=\'#tab_2\']').attr("href","#tab_2_"+d.id);
    $('a[href=\'#tab_3\']').attr("href","#tab_3_"+d.id);
    $("#tab_1").attr("id","tab_1_"+d.id);
    $("#tab_2").attr("id","tab_2_"+d.id);
    $("#tab_3").attr("id","tab_3_"+d.id);
    
    $("#orderxml").html(d.messageContent);
    $("#orderxml").attr("orderNumber",d.orderNumber);
    var xmlDoc = $.parseXML( d.messageContent ); 
    var $xml = $(xmlDoc);
    var $address = $xml.find("Address");

    $address.each(function(){
        var name = $(this).find('name').text();
        var delivery_address = $(this).find('address1').text();
        var billing_address = $(this).find('address2').text();
        var telefoon = $(this).find('telefon').text();
        $("#order_detail_custom_info").append("<strong>Customer Name </strong>"+name+"<br>"+
            "<strong>Delivery Address </strong>"+delivery_address+"<br>"+
            "<strong>Billing Address </strong>"+billing_address+"<br>"+
            "<strong>Telephone Number </strong>"+telefoon+"<br>");

    });

    var $user = $xml.find("user");
    	
    $user.each(function(){
    	 var email = $(this).find('email').text();
    	 $("#order_detail_custom_info").append("<strong>Email Address </strong>&nbsp;"+email);
    });
    $("#row_details").attr("style","display:block");
	   $('html, body').animate({
	        scrollTop: $("#row_details").offset().top
	     }, 300);
    //var $row_details = $("#row_details").html();
    
	//return $row_details;
}
function getSystem(systeemId){
	var systeem ;
	
	switch(systeemId){
	case 1:
		systeem="Digis";
		break;
	case 2:
		systeem="Sap";
		break;
	case 3:
		systeem="OneWeb";
		break;
	case 4:
		systeem="INCA";
		break;
	}
	return systeem;
}


function reloadOrderListTable(fromDate,toDate){
	
	var OrderDetails_url = $("#order_listTable").attr("OrderDetails_url");

	var order_listTable =  $('#order_listTable').DataTable({
		
		 "responsive": true,
		 "paging": true,
	     "lengthChange": false,
	     "searching": true,
	     "ordering": true,
	     "info": true,
	     "autoWidth": false,
	     "sDom": 'rtp',
	     "ajax": {
		     "url": "order_list.json?fromDate="+fromDate+"&toDate="+toDate,
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
		               	  "defaultContent": '<button class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button>'
		               	 },
		                 { "data": "orderNumber" },
		                 { "data": "transactionStatus.description" },
		                 { "data": "salesOrganizationId" },
		                 { "data": "billTo" },
		                 { "data": "shipTo" },
		                 { "data": "name" },
		                 { "data": "dateCreated" }
		                ],
		                "columnDefs": [
		                                {
		                                	"targets": 1,
		                                	"render": function ( data, type, row ) {
		                                		 var id = row.id;
		                                		var url = ''+OrderDetails_url+"?id="+id+'';
		                                		
		                                		var html = "<a href="+url+">"+data+"</a>";
		                                        return html;
		                                    },
		                                    
		                                },
		                                {
		                                	"targets": 2,
		                                	"render": function ( data, type, row ) {
		                                		var html;
		                                		 var code = row.transactionStatus.code;
		                                		 var description = row.transactionStatus.description;
		                                		 if(code =="PROCESSED"){
		                                			 html = "<span class='label label-success'>"+description+"</span>";
		                                		 }
		                                		 else if(code =="RECEIVED" || code =="IS_BEING_PROCESSED"){
		                                			 html = "<span class='label label-info'>"+description+"</span>";
		                                		 }
		                                		 else if(code =="MAIL_NOT_SENT"){
		                                			html = "<span class='label label-warning'>"+description+"</span>";
		                                		 }
		                                		 else{
		                                			 html = "<span class='label label-danger'>"+description+"</span>";
		                                		 }
		                                        return html;
		                                    },
		                                    
		                                },
		                                {
		                                	"targets": 3,
		                                	"render": function ( data, type, row ) {
		                                		var description;
		                                		 var code = row.salesOrganizationId;
		                                		 description = getSalesOrganizationByCode(code);
		                                        return description;
		                                    },
		                                    
		                                },
		                                {
		                                	"targets": 7,
		                                	"render": function ( data, type, row ) {
		                                		var html;
		                                		 var orderDate = row.dateCreated;
		                                		 html = moment(orderDate).format("YYYY-MM-DD HH:mm");
		                                		 return html;
		                                    },
		                                    
		                                }
		                                //{ "visible": false,  "targets": [ 2 ] }
		                            ]
		                
		     //'sDom': ''
	   });
	$('#searchText').on( 'keyup', function () {
		order_listTable.search( this.value ).draw();
	} );
	$('#order_listTable tbody').on('click', 'td.openRow', function () {
		
		
	    var tr = $(this).closest('tr');
	    var td = $(this).closest('td');
	    var row = order_listTable.row( tr );
	    

	    if ( row.child.isShown() ) {
	        // This row is already open - close it
	        row.child.hide();
	        td.html('<button class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button>');
	    }
	    else {
	        // Open this row
	        //row.child( format(row.data()) ).show();
	    	format(row.data());
	        td.html('<button class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-eye-close"></span></button>');
	        
	        
	    }
		//e.preventDefault();
		
	    
	});
	return order_listTable;
}

function initializeDateRangePicker(){
	$('#daterange-order_list').daterangepicker(
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
              $('#daterange-order_list span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

              var periode = moment().diff(start, 'days');
              var fromDate = start.format('YYYY-MM-DD');
              var toDate = end.format('YYYY-MM-DD');

              var existing_table = $("#order_listTable").dataTable();
              if (existing_table != undefined)
              {
                  existing_table.fnClearTable();
                  existing_table.fnDestroy();
              }
              $('#order_listTable tbody').off( 'click', 'td.openRow');
              reloadOrderListTable(fromDate,toDate);
              updateOrderStatusOverviewByOrderDate(fromDate,toDate,periode);
            }
        );
}


$(document).ready(function() {

	var order_listTable;
	
	initializeOrderListTable();
	
	initializeDateRangePicker();
	
	//$("#tabs").tabs();
	$('[data-toggle="popover"]').popover();
	

});