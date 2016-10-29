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
		
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-green">
            <span class="info-box-icon"><i class="fa fa-shopping-cart"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Success</span>
              <span class="info-box-number">${OrderStatusOverviewByOrderDate.totalOrdersSucceed}</span>
              <div class="progress">
                <div class="progress-bar" style="width: ${OrderStatusOverviewByOrderDate.progressOrdersSucceed}"></div>
              </div>
                  <span class="progress-description">
                    ${OrderStatusOverviewByOrderDate.progressOrdersSucceed} Increase in 1 Day
                  </span>
            </div>
          </div>
        </div>    
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-red">
            <span class="info-box-icon"><i class="fa fa-shopping-cart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Failed</span>
              <span class="info-box-number">${OrderStatusOverviewByOrderDate.totalOrdersFailled}</span>

              <div class="progress">
                <div class="progress-bar" style="width: ${OrderStatusOverviewByOrderDate.progressOrdersFailled}"></div>
              </div>
                  <span class="progress-description">
                    ${OrderStatusOverviewByOrderDate.progressOrdersFailled} Increase in 1 Day
                  </span>
            </div>
          </div>
        </div>
      
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-yellow">
            <span class="info-box-icon"><i class="fa fa-shopping-cart"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Pending</span>
              <span class="info-box-number">${OrderStatusOverviewByOrderDate.totalOrdersPending}</span>
              <div class="progress">
                <div class="progress-bar" style="width: ${OrderStatusOverviewByOrderDate.progressOrdersPending}"></div>
              </div>
                  <span class="progress-description">
                    ${OrderStatusOverviewByOrderDate.progressOrdersPending} Increase in 1 Day
                  </span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-desactive">
            <span class="info-box-icon"><i class="fa fa-shopping-cart"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Cancelled</span>
              <span class="info-box-number">${OrderStatusOverviewByOrderDate.totalOrdersCancelled}</span>
              <div class="progress">
                <div class="progress-bar" style="width: ${OrderStatusOverviewByOrderDate.progressOrdersCancelled}"></div>
              </div>
                  <span class="progress-description">
                    ${OrderStatusOverviewByOrderDate.progressOrdersCancelled} Increase in 1 Day
                  </span>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
		<div class="box">
			<div class="box-header with-border">
              <h3 class="box-title">Order List</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-wrench"></i></button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
						<div class="box-body">
						
                             <div class="row">
                               <div class="col-xs-12">
                               		<div class="col-md-3 pull-left">
                               		    <div class="btn-group">
  											<button  id="EnvBtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   											 Environnement <span class="caret"></span>
  											</button>
  											<ul class="dropdown-menu" id="changeEnv">
    											<li><a href="#">Production</a></li>
    											<li><a href="#">GB</a></li>
    											<li><a href="#">Dev</a></li>
  										    </ul>
										</div>

                               		</div>
                               		<div class="col-md-4">
              							<div class="form-group">
                							<div class="input-group">
                  								<button type="button" class="btn btn-primary pull-right" id="daterange-order_list">
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
													<button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
												</div>
										</div>
							<!-- End Search Box -->
            						</div>
                               </div>
 
 <div id="salesOrganizations" style="display:none">
	 ${salesOrganizations}
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
				
<div class="row"  id ="row_details"  style="display: none;">
<div class="col-xs-12">
 <div class="nav-tabs-custom">
  <ul  class="nav nav-tabs" >
    <li  class="active"><a href="#tab_1"   data-toggle="tab" aria-expanded="true">Order Status History</a></li> 
    <li  class=""><a href="#tab_2"  data-toggle="tab" aria-expanded="false">Order Detail</a></li>
    <li  class=""><a href="#tab_3"  data-toggle="tab" aria-expanded="false">Order XML</a></li>
    <li class="pull-right">
<div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-wrench"></i></button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
</li>
    
    
  </ul>
  <div class="tab-content">
  <div   class="tab-pane active" id="tab_1">
<div class="row" id="order_details">
<div id="notification" class="col-xs-12">
  <div class="alert alert-info alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <h4><i class="icon fa fa-info"></i> Info alert preview. This alert is dismissable!</h4>  
    </div>      
</div>
<div id="order_status_steps" class="row smpl-step" style="border-bottom: 0px none; min-width: 500px;" transactionstatus="d.transactionStatus.code">
 <div id="smpl-step-step1" class="col-xs-2 smpl-step-step">
     
     <div class="progress progress-xs ">
         <div id="progress_step1" class="progress-bar " aria-valuenow="80" style="width:100%;"></div>
     </div>
     <a class="smpl-step-icon"><i class="fa fa-shopping-cart"></i></a>
     <div class="smpl-step-info text-center">
     	<a href="#" data-trigger="focus" data-placement="bottom" data-toggle="popover" title="" data-content="Some content inside the popover" class="text-right text-light-blue" data-original-title="Popover Header">
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
     	<a href="#" data-trigger="focus" data-placement="bottom" data-toggle="popover" title="" data-content="Some content inside the popover" class="text-right text-light-blue" data-original-title="Popover Header">
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
     	<a href="#" data-trigger="focus" data-placement="bottom" data-toggle="popover" title="" data-content="Some content inside the popover" class="text-right text-light-blue" data-original-title="Popover Header">
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
     	<a href="#" data-trigger="focus" data-placement="bottom" data-toggle="popover" title="" data-content="Some content inside the popover" class="text-right text-light-blue" data-original-title="Popover Header"> 
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
     	<a href="#" data-trigger="focus" data-placement="bottom" data-toggle="popover" title="" data-content="Some content inside the popover" class="text-right text-light-blue" data-original-title="Popover Header">
          Digis
          <i class=" fa fa-info-circle"></i>
        </a>
     </div>
 </div>
</div>
</div>



</div>
 <div id="tab_2" class="tab-pane">
 <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> Order: <b>#${orderHeader.orderHdr.refno}</b> 
            <small class="pull-right">Date: ${orderHeader.orderHdr.orderDate}</small>
          </h2>
        </div>

        <!-- /.col -->
      </div>
      <!-- info row -->
      
      <div class="row order_detail-info">
        <div class="col-sm-8 invoice-col">
          <h2 class="order_detail customer_infor">Customer Information:</h2>
          <address id="order_detail_custom_info">
            
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
        
         <h2 class="invoice-client mrg10T"><b>Order Info</b><br></h2>
         <div class="form-group row">
      		<label class="col-sm-4 col-form-label" >Order ID</label>
      		<div class="col-sm-4" data="order_refno">${orderHeader.orderHdr.refno}</div>
   		 </div>
   		 <div class="form-group row">
      		<label class="col-sm-4 col-form-label" >Status</label>
      		<div class="col-sm-4" data="orderStatus.description">
      			<span class="label label-succes">${orderHeader.orderHdr.orderStatus.description}</span>
      			<span class="label label-succes">succes</span>
      			<span class="label label-warning">${orderHeader.orderHdr.orderStatus.description}</span>
      			<span class="label label-warning">Denied</span>
      		</div>
   		 </div>
   		 <div class="form-group row">
      		<label class="col-sm-4 col-form-label" >Payment Method</label>
      		<div class="col-sm-4">${orderHeader.orderHdr.paymentMethod}</div>
   		 </div>
         
        </div>
        <!-- /.col -->
      </div>
      <div class="divider"></div>

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Qty</th>
              <th>Item Code</th>
              <th>invoice type</th>
              <th>Description</th>
              <th>Subtotal</th>
            </tr>
            </thead>
            <c:if test="${ not empty oderDetails }">
            <tbody>
            <c:forEach var="orderDetail" items="${oderDetails}" >
            <tr>
              <td>${orderDetail.quantity}</td>
              <td>${orderDetail.itemcode}</td>
              <td>${orderDetail.invoiceType}</td>
              <td>must me implemented</td>
              <td>${orderDetail.unitprice}</td>
            </tr>
            </c:forEach>
            </tbody>
            </c:if>
          </table>
        </div>
        <!-- /.col -->
      </div>
</div>
<div id="tab_3"  class="tab-pane">
<div class="row">
<div class="col-md-6">
<button id="downloadOrderXML" type="button" class="btn btn-primary" onclick="downloadOrderXml()">
Download <span class="fa fa-download"></span>
</button>
</div>
<br />
<div class="col-md-12">
<textarea id="orderxml" orderNumber="" rows="50" cols="200" style="border:none;">

</textarea>
</div>
</div>
</div>
</div>
  </div>
 </div>
 </div>
              </section>
			</div>