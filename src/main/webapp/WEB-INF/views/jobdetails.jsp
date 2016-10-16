<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="content-wrapper">
<section class="content-header">
      		<h1>
        		Dashboard
        		<small>Order Detail</small>
     		 </h1>
      		<ol class="breadcrumb">
        		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        		<li class="active"><i class="fa fa-cubes"></i>Orders Overview</li>
        		<li class="active"><i class="fa fa-cubes"></i>Order Details</li>
      		</ol>
</section>
<section class="content">

<!-- JOB Steps Wizard -->
<div class="container" style="margin-top: 100px; margin-bottom: 100px;">
    <div class="row">
        <div class="progress" id="progress1">
            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
            </div>
            <span class="progress-type">Job Progress</span>
            <span class="progress-completed">60%</span>
        </div>
    </div>
    <div class="row">
        <!--<div class="row step">
            <div  class="col-md-2 activestep" onclick="javascript: resetActive(event, 0, 'step-1');">
                <span class="fa fa-cloud-download"></span>
                <p>Job initialized</p>
            </div>
            <div class="col-md-2 activestep " onclick="javascript: resetActive(event, 20, 'step-2');">
                <span class="fa fa-pencil"></span>
                <p>Job validated</p>
            </div>
            <div class="col-md-2 activestep" onclick="javascript: resetActive(event, 40, 'step-3');">
                <span class="fa fa-refresh"></span>
                <p>Job has been invoked by DispatcherExtWebService</p>
            </div>
            <div class="col-md-2" onclick="javascript: resetActive(event, 60, 'step-4');">
                <span class="fa fa-dollar"></span>
                <p>Job is processing by DataTransfer to EXT system</p>
            </div>
            <div class="col-md-2" onclick="javascript: resetActive(event, 80, 'step-5');">
                <span class="fa fa-cloud-upload"></span>
                <p>Message has been send to MSMQ destination.</p>
            </div>
            <div id="last" class="col-md-2" onclick="javascript: resetActive(event, 100, 'step-6');">
                <span class="fa fa-star"></span>
                <p>Job completed</p>
            </div>
        </div>-->
        <div class="row smpl-step" style="border-bottom: 0; min-width: 500px;">
        <div class="col-xs-3 smpl-step-step complete">
            <div class="text-center smpl-step-num">Step 1</div>
            <div class="progress progress-xs active">
                <div class="progress-bar"></div>
            </div>
            <a class="smpl-step-icon"><i class="fa fa-user"></i></a>
            <div class="smpl-step-info text-center">Registe User via control panel.</div>
        </div>

        <div class="col-xs-3 smpl-step-step complete">           
            <div class="text-center smpl-step-num">Step 2</div>
            <div class="progress progress-xs active">
                <div class="progress-bar"></div>
            </div>
            <a class="smpl-step-icon"><i class="fa fa-dollar"></i></a>
            <div class="smpl-step-info text-center">Process Payment and fill out all required fields.</div>
        </div>
        <div class="col-xs-3 smpl-step-step active">          
            <div class="text-center smpl-step-num">Step 3</div>
            <div class="progress progress-xs active">
                <div class="progress-bar"></div>
            </div>
            <a class="smpl-step-icon"><i class="fa fa-repeat"></i></a>
            <div class="smpl-step-info text-center">Confirm Data entered in step 2.</div>
        </div>
        <div class="col-xs-3 smpl-step-step disabled">           
            <div class="text-center smpl-step-num">Step 4</div>
            <div class="progress">
                <div class="progress-bar"></div>
            </div>
            <a class="smpl-step-icon"><i class="fa fa-download" ></i></a>
            <div class="smpl-step-info text-center">Download product after receiving confirmation email.</div>
        </div>
    </div>
</div>
    </div>
    <div class="row setup-content step hiddenStepInfo" id="step-1">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1>STEP 1</h1>
                <h3 class="underline">Instructions</h3>
                Download the application form from our repository.
                This may require logging in.
            </div>
        </div>
    </div>
    <div class="row setup-content step activeStepInfo" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1>STEP 2</h1>
                <h3 class="underline">Instructions</h3>
                Fill out the application. 
                Make sure to leave no empty fields. 
            </div>
        </div>
    </div>
    <div class="row setup-content step hiddenStepInfo" id="step-3">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1>STEP 3</h1>
                <h3 class="underline">Instructions</h3>
                Check to ensure that all data entered is valid. 
            </div>
        </div>
    </div>
    <div class="row setup-content step hiddenStepInfo" id="step-4">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1>STEP 4</h1>
                <h3 class="underline">Instructions</h3>
                Pay the application fee. 
                This can be done either by entering your card details, or by using Paypal.
            </div>
        </div>
    </div>
    <div class="row setup-content step hiddenStepInfo" id="step-5">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1>STEP 5</h1>
                <h3 class="underline">Instructions</h3>
                Upload the application. 
                This may require a confirmation email.
            </div>
        </div>
    </div>
    <div class="row setup-content step hiddenStepInfo" id="step-6">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1>STEP 6</h1>
                <h3 class="underline">Instructions</h3>
                Send us feedback on the overall process. 
                This step is not obligatory.
            </div>
        </div>
    </div>
</div>
<!-- End JOB Setps Wizard -->
      <!-- title row -->
      <div class="row">
       
      </div>
      <!-- info row -->
      
      <div class="row invoice-info">
       
      </div>

      <div class="divider"></div>

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Job id</th>
              <th>job reference</th>
              <th>Job status</th>
              <th>job type code</th>
              <th>timestamp</th>
              <th>job part type id</th>
              <th>job part description</th>
              <th>job part status</th>
              <th>recordcount</th>
            </tr>
            </thead>
            <c:if test="${ not empty jobDetails }">
            <tbody>
            <c:forEach var="jobDetail" items="${jobDetails}" >
            <tr>
              <td>${jobDetail.job.id}</td>
              <td>${jobDetail.job.reference}</td>
              <td>${jobDetail.job.jobStatus.description}</td>
              <td>${jobDetail.job.jobType.code}</td>
              
              <td><fmt:formatDate pattern="${dateTimePattern}" value="${jobDetail.job.timestamp}" /></td>
              <td>${jobDetail.jobPart.id}</td>
              <td>${jobDetail.jobPart.description}</td>
              <td>${jobDetail.jobStatus.description}</td>
              
              <td>${jobDetail.recordcount}</td>
              
            </tr>
            </c:forEach>
            </tbody>
            </c:if>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
</div>