<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<c:url value="/" var="contextBase" />
	<section class="content-header">
		<h1>
			Dashboard <small>Project Managment</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active"><a href="#"><i class="fa fa-cubes"></i>Project Planning</a></li>
		</ol>
	</section>
	<section class="content">
		<div id="Notifications" style="display:none">
	    	<div class="callout callout-success">
                <h4></h4>
                <p></p>
              </div>
	    </div>
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<div class="box-header with-border">
					<i class="glyphicon glyphicon-tasks"></i>
					<h3 class="box-title">Planning</h3>
					<div class="box-tools pull-right">
            			<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            			<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          			</div>
          			</div>
						<div class="row" id="form-crud-opertations">
							<div class="col-md-12">

						<c:url value="/uploadFile" var="uploadUrl" />
						<form id="planningFileUpload" action="${uploadUrl}" method="post"
							enctype="multipart/form-data">

							<span class="btn btn-info btn-file fa fa-upload" id="importFiles" style="margin: 10px">
								<!--  <i class="fa fa-upload">upload </i>-->
								upload
								<input type="file" name="file" id="file" multiple>
							</span>
							<div id="notifications"></div>
							<div id="status"></div>
						</form>
				</div>
							
					</div>
					</deiv>
						<div class="box-body no-padding">
							
							<!-- row table action -->
							<div id="data-table-actions" class="row">
							<div class="col-md-12">
							<div class="col-sm-3 pull-left">
							<div class="form-group" id="userslist">
							<%-- <select   id="select-user"  data-placeholder="Select a user..." class="form-control select2" style="width:100%">
							<option value="" label="Select a user..."/>
								<c:forEach items="${listUsers}" var="user">
									<option value="${user.username}" label="${user.email}"/>
								</c:forEach>
							</select> --%>
							<select id="select_user" class="form-control">
								<option value="default"></option>
  								<option value="one">anna.salak</option>
  								<option value="two">eric.bouw</option>
  								<option value="three">erwin.rijkes</option>
  								<option value="three">jaap.vandekerke</option>
  								<option value="three">johanna.seaton</option>
  								<option value="three">milan.koelmansmilan.koelmans</option>
  								<option value="three">michiel.vanderwinden</option>
  								<option value="three">patrick.matthiesen</option>
  								<option value="three">patrick.matthiesen</option>
  								<option value="three">samir.elazzouzi</option>
							</select>
						</div>
							</div>
							<div class="col-md-4">
   							<div class="btn-group" role="group" aria-label="Basic example">
  								<button id="Previous" type="button" class="btn btn-secondary glyphicon glyphicon-chevron-left"></button>
     							 <button type="button" class="btn btn-default" id="daterange-projectPlanning">
                    						<span>
                      							<i class="fa fa-calendar"></i> Date range picker
                    						</span>
                    						<i class="fa fa-caret-down"></i>
                  				</button>
  								<button id="NextWeek" type="button" class="btn btn-secondary glyphicon glyphicon-chevron-right"></button>
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
				        <!-- Eind row table actiuon -->
				       <div class="box-body">
				       <div class="col-sm-12">
							<table id="projectPlanningTable" class="table table-hover p-table">
								<thead>
									<tr class="my-fc-header">
										<th>Jira</th>
										<th>Project</th>
										<th>Acitivity</th>
										<th>WHO</th>
										<th>Description</th>
										<th>Remark</th>
										<th>Week Number</th>
										<th>Excpected Hours</th>
										<th>Priority</th>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<th>Actions</th>
										</sec:authorize>

									</tr>
								</thead>
								<tbody>
									


								</tbody>
							</table>
						</div>
						</div>
						</div>
            <!-- /.box-body -->

				</div>
			</div>
		</div>
	</section>
</div>
<script src="<c:url value="/resources/dist/js/letterAvatar.js"/>"></script>
