<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
#ordersTable{
	text-align: left;
}
#ordersTable_paginate {
    text-align: center;
}
.dataTables_empty{
   text-align: center;
}
</style>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<c:url value="/" var="contextBase" />
		<section class="content-header">
      		<h1>
        		Dashboard
        		<small>Orders</small>
     		 </h1>
      		<ol class="breadcrumb">
        		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        		<li class="active"><i class="fa fa-cubes"></i>Orders Overview</li>
      		</ol>
    	</section>
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
			
					<div class="box">
						<div class="box-body">
						
                             <div class="row">
                               <div class="col-xs-12">
                               		<div class="col-md-3 pull-left">
                               		    <select class="form-input select2">
                               		    	<option>Production</option>
                               		    	<option>GB</option>
                               		    	<option>Dev</option>
                               		    </select>
                               		</div>
                               		<div class="col-md-4">
              							<div class="form-group">
                							<div class="input-group">
                  								<button type="button" class="btn btn-default pull-right" id="daterange-order_list">
                    								<span>
                      									<i class="fa fa-calendar"></i> Order date range
                    								</span>
                    								<i class="fa fa-caret-down"></i>
                  								</button>
                							</div>
              							</div>
            						</div>
            						<div class="col-md-3 pull-right">
            							<!-- Search box -->
										<div class="input-group input-group-sm">
											<input id="searchText" name="searchTerm" type="text" placeholder="Search" class="form-control pull-right"  />
												<div id="searchText" class="input-group-btn">
													<button class="btn btn-info" type="submit"><i class="fa fa-search"></i></button>
												</div>
										</div>
							<!-- End Search Box -->
            						</div>
                               </div>
 
 <div id="salesOrganizations" style="display:none">
	 ${salesOrganizations}
</div>                            
</div>
<div id="row_details" class="col-md-12"  style="display:none">
 <div class="nav-tabs-custom">
  <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
    <li class="active"><a href="#tab_1" data-toggle="tab">Order Status History</a></li> 
    <li><a href="#tab_2" data-toggle="tab">Order Detail</a></li>
    <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
  </ul>
  <div class="tab-content">
  <div id="tab_1" class="tab-pane active">
<div class="row" id="order_details">
<div id="notification" class="col-xs-12">
  <div class="alert alert-info alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <h4><i class="icon fa fa-info"></i> Info alert preview. This alert is dismissable!</h4>  
    </div>      
</div>
<div id ="order_status_steps" class="row smpl-step" style="border-bottom: 0px none; min-width: 500px;" transactionstatus="d.transactionStatus.code">

 
 <div id="smpl-step-step1" class="col-xs-2 smpl-step-step">
     
     <div class="progress progress-xs ">
         <div id="progress_step1" class="progress-bar " aria-valuenow="80" style="width:100%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-shopping-cart"></i></a>
     <div class="smpl-step-info text-center">
     	<a href="#" 
     		data-trigger="focus"
     		data-placement="bottom"
     		data-toggle="popover" 
     		title="Popover Header" 
     		data-content="Some content inside the popover" 
     		class="text-right text-light-blue">
     		From Oneweb
          <i class=" fa fa-info-circle"></i>
        </a>
     </div>
 </div>
 <div id="smpl-step-step2" class="col-xs-2 smpl-step-step active">           
     
     <div class="progress progress-xs active">
         <div id="progress_step2" class="progress-bar" aria-valuenow="80" style="width:0%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-cloud"></i></a>
     <div class="smpl-step-info text-center">
     	<a href="#" 
     		data-trigger="focus"
     		data-placement="bottom"
     		data-toggle="popover" 
     		title="Popover Header" 
     		data-content="Some content inside the popover" 
     		class="text-right text-light-blue">
     		 MSMQ
          <i class=" fa fa-info-circle"></i>
        </a>
     </div>
 </div>
  <div id="smpl-step-step3" class="col-xs-2 smpl-step-step active">           
     
     <div class="progress progress-xs active">
         <div id="progress_step3" class="progress-bar" aria-valuenow="80" style="width:0%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-retweet"></i></a>
     <div class="smpl-step-info text-center">
     	<a href="#" 
     		data-trigger="focus"
     		data-placement="bottom"
     		data-toggle="popover" 
     		title="Popover Header" 
     		data-content="Some content inside the popover" 
     		class="text-right text-light-blue">
     		EaiTransation
          <i class=" fa fa-info-circle"></i>
        </a>
     </div>
 </div>
  <div id="smpl-step-step4" class="col-xs-2 smpl-step-step active">           
     
     <div class="progress progress-xs active">
         <div id="progress_step4" class="progress-bar" aria-valuenow="80" style="width:0%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-database"></i></a>
     <div class="smpl-step-info text-center">
     	<a href="#" 
     		data-trigger="focus"
     		data-placement="bottom"
     		data-toggle="popover" 
     		title="Popover Header" 
     		data-content="Some content inside the popover" 
     		class="text-right text-light-blue"> 
     		ERP DIGIS
          <i class=" fa fa-info-circle"></i>
        </a>
     </div>
 </div>
 <div id="smpl-step-step5" class="col-xs-2 smpl-step-step active">        
     
     <div class="progress">
         <div id="progress_step5" class="progress-bar" aria-valuenow="80" style="width:0%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-laptop"></i></a>
      <div class="smpl-step-info text-center">
     	<a href="#" 
     		data-trigger="focus"
     		data-placement="bottom"
     		data-toggle="popover" 
     		title="Popover Header" 
     		data-content="Some content inside the popover" 
     		class="text-right text-light-blue">
          Digis
          <i class=" fa fa-info-circle"></i>
        </a>
     </div>
 </div>
</div>
</div>



</div>
  <div id="tab_2" class="tab-pane">
 hier komt de table
</div>
  
</div>
  </div>
 </div>

	         <div  id="orderTableWrapper">
	         
	            <c:url value="/order_details.html" var = "OrderDetailsUrl" />
				<table id ="order_listTable" OrderDetails_url="${OrderDetailsUrl}" class="table table-hover p-table  table-bordered table-striped">
                      <thead>
                      <tr>
                           <th></th>
                          <th>REFERENCE ID</th>
                          <th>ORDER STATUS</th>
                          <th>ORGANIZATION</th>
                          <th>BILL TO</th>
                          <th>SHIPP TO</th>
                          <th>NAME</th>
                          <th>ORDER DATE</th>
                      </tr>
                      </thead>
                      <tbody></tbody>
                  </table>

				</div>

			</div>
					</div>
				</div>
			</div>
              </section>
			</div>