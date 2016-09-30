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
			<li class="active"><i class="fa fa-cubes"></i>Project Managment</li>
			<li class="active"><i class="fa fa-cubes"></i>Project Planning</li>
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
						    <div id ="left" class="col-md-4"></div>
						    <div id ="center" class="col-md-4"></div>
							<div class="col-md-4 pull-right">

						<c:url value="/uploadFile" var="uploadUrl" />
						<form id="planningFileUpload" action="${uploadUrl}" method="post"
							enctype="multipart/form-data">

							<span class="btn btn-default btn-file fa fa-upload" id="importFiles">
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
							<div class="col-sm-4">
							<div class="form-group" id="userslist">
							<form:select path="User"  id="select-user"  data-placeholder="Select a user..." class="form-control select2" style="width:100%">
							<form:option value="" label="Select a user..."/>
								<c:forEach items="${listUsers}" var="user">
									<form:option value="${user.username}" label="${user.email}"/>
								</c:forEach>
							</form:select>
						</div>
							</div>
							<div class="col-md-4">
    <div class="btn-group" role="group" aria-label="Basic example">
  <button id="Previous" type="button" class="btn btn-secondary glyphicon glyphicon-chevron-left"></button>
     <button tabindex="0" class="btn btn-default" role="button" data-toggle="popover" data-trigger="click" data-placement="bottom" data-container="body" data-html="true" id="DateRangePopS" data-content='<div id="popover-content">
<form role="form" method="post">
    <div class="form-group">
        <label>From:</label>
        <div class="input-group date" id="datetimepicker1">
            <input type="text" class="form-control" placeholder="Start Date time of event" /> <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
</span>
        </div>
    </div>
    <div class="form-group">
        <label>To:</label>
        <div class="input-group date" id="datetimepicker2">
            <input type="text" class="form-control" placeholder="End Date time" /> <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
</span>
        </div>
    </div>
    <div class="form-group">
        <button class="btn btn-primary btn-block">Search between dates</button>
    </div>
</form>
</div>'></button>
  <button id="NextWeek" type="button" class="btn btn-secondary glyphicon glyphicon-chevron-right"></button>
</div>
 

</div>
							<div class="col-md-2">
								<div class="form-group has-feedback">
									<input id="projectPlanningTable_filter" type="text"
										class="form-control" placeholder="Search"> <span
										class="glyphicon glyphicon-search form-control-feedback"></span>
								</div>
							</div>
							
				        </div>
				        <!-- Eind row table actiuon -->
				       <div class="box-body">
				       <div class="col-sm-12">
				        <!--  <div id="projectPlanningTableWrapper">-->
							<table id="projectPlanningTable"
								class="table table-bordered table-hover dataTable">
								<thead>
									<tr class="my-fc-header">
										<th>Jira</th>
										<th>Project</th>
										<th>Acitivity</th>
										<th>Who</th>
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
									<c:if test="${not empty projectsPlanningList}">
										<c:forEach var="projectPlanning"
											items="${projectsPlanningList}">
											<tr>
												<td class="p-key"><a
													href="http://vdelnnap46.ce.hsi.local:9080/browse/${projectPlanning.jiraIssue}"
													target="_blank">${projectPlanning.jiraIssue}</a></td>
												<td>${projectPlanning.projectName}</td>
												<td>${projectPlanning.activity}</td>
												<td class="p-team"><a href="#"><img
														alt="${projectPlanning.assignee}" width="32" height="32"
														class="img-circle" src=""
														avatar="${projectPlanning.assignee}"></a></td>
												<td>${projectPlanning.description}</td>
												<td>${projectPlanning.remark}</td>
												<td id="weekNumber" class="test123">
													${projectPlanning.week}</td>
												<td id="excpectedHours" class="test123">
													${projectPlanning.excpectedHours}</td>
												<td id="priority" class="test123">
													${projectPlanning.priority}</td>
												<sec:authorize access="hasRole('ROLE_ADMIN')">
													<td>
														<div class="action-buttons">
															<a style="cursor: pointer;"> <span
																class="glyphicon glyphicon-pencil" id="edit" />
															</a> <a class="trash" style="cursor: pointer;"> <span
																class="glyphicon glyphicon-trash" id="trash" />
															</a>
														</div>

													</td>
												</sec:authorize>
											</tr>
										</c:forEach>
									</c:if>


								</tbody>
							</table>
							<!-- Pagination -->
							<div class="row">
								<div class="col-sm-5">
									<div class="dataTables_info" id="example2_info" role="status"
										aria-live="polite">${totalProjectsMessage}</div>
								</div>
								<div class="col-sm-7"></div>

							</div>
						<!--</div>-->
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
