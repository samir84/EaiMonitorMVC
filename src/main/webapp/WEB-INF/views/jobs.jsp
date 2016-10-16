<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="content-wrapper">
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
		<!-- Content Header (Page header) -->
		<c:url value="/" var="contextBase" />
		<section class="content-header">
      		<h1>
        		Dashboard
        		<small>Jobs</small>
     		 </h1>
      		<ol class="breadcrumb">
        		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        		<li class="active"><i class="fa fa-cubes"></i>Jobs Overview</li>
      		</ol>
    	</section>
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<header class="panel-heading">
                      			All Jobs List
                      			<span class="pull-right">
                          			<button type="button" id="loading-btn" class="btn btn-warning btn-xs" onclick="refreshjobPage()"><i class="fa fa-refresh"></i> Refresh</button>
                      			</span>
                  			</header>
						</div>
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
                  								<button type="button" class="btn btn-default pull-right" id="daterange-jobs">
                    								<span>
                      									<i class="fa fa-calendar"></i> Jobs date range
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
                             </div>
	         <div  id="jobTableWrapper">
	         <div>${totaljobsMessage }</div>
	         
	         	<c:url value="/job_details.html" var = "jobDetailsUrl" />
	         	<div id="countries" style="display:none">
	         		${sessionScope.countries}
	         	</div>
<div id="row_details" class="row" style="display:block">
<div class="row">
  <div class="nav-tabs-custom">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab_1" data-toggle="tab">Job Status</a></li> 
    <li><a href="#tab_2" data-toggle="tab">Job Detail table</a></li>
    
    <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
  </ul>
  <div class="tab-content">
  <div id="tab_1" class="tab-pane active">
<div class="row smpl-step" style="border-bottom: 0; min-width: 500px;" transactionstatus="d.transactionStatus.code+'">
 <div id="smpl-step-step1" class="col-xs-2 smpl-step-step">
     <div class="text-center smpl-step-num">SAP</div>
     <div class="progress progress-xs ">
         <div id="progress_step1" class="progress-bar " aria-valuenow="80" style="width:100%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-desktop"></i></a>
     <div class="smpl-step-info text-center"></div>
 </div>
 <div id="smpl-step-step3" class="col-xs-2 smpl-step-step active">           
     <div class="text-center smpl-step-num">DataTransferSapCatalog</div>
     <div class="progress progress-xs active">
         <div id="progress_step2" class="progress-bar" aria-valuenow="80" style="width:0%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-code-fork"></i></a>
     <div class="smpl-step-info text-center">d.transactionStatus.description+</div>
 </div>
  <div id="smpl-step-step2" class="col-xs-2 smpl-step-step active">           
     <div class="text-center smpl-step-num">EaiJobStatusValidation</div>
     <div class="progress progress-xs active">
         <div id="progress_step2" class="progress-bar" aria-valuenow="80" style="width:0%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-thumbs-up"></i></a>
     <div class="smpl-step-info text-center">d.transactionStatus.description+</div>
 </div>
  <div id="smpl-step-step2" class="col-xs-2 smpl-step-step active">           
     <div class="text-center smpl-step-num">DataTransferExtCatalog</div>
     <div class="progress progress-xs active">
         <div id="progress_step2" class="progress-bar" aria-valuenow="80" style="width:0%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-database"></i></a>
     <div class="smpl-step-info text-center">d.transactionStatus.description+</div>
 </div>
 <div id="smpl-step-step3" class="col-xs-2 smpl-step-step active">        
     <div class="text-center smpl-step-num">MsMqGw</div>
     <div class="progress">
         <div id="progress_step3" class="progress-bar" aria-valuenow="80" style="width:0%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-cloud"></i></a>
     <div class="smpl-step-info text-center"></div>
 </div>
</div>
</div>
  <div id="tab_2" class="tab-pane">
 hier komt de table
</div>
  
</div>
  </div>
  
  
 
</div>
 </div>
				<table id ="jobsTable" class="table table-hover p-table" job_details_url="${jobDetailsUrl}">
                      <thead>
                      <tr class="my-fc-header">
                      	  <th></th>
                      	  <th>JOB ID</th>
                      	  <th>COUNTRY</th>
                      	  <th>JOB REFERENCE</th>
                          <th>DATETIME STARTED</th>
                          <th>JOB STATUS</th>
                          <th>JOB Description</th>
                      </tr>
                      </thead>
                      <tbody>
                      </tbody>
                  </table>
</div>

						</div>
					</div>
				</div>
			</div>
              </section>
			</div>
		