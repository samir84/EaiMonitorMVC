<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<c:url value="/" var="contextBase" />
		<section class="content-header">
      		<h1>
        		Dashboard
        		<small>Project Overview</small>
     		 </h1>
      		<ol class="breadcrumb">
        		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        		<li class="active"><i class="fa fa-cubes"></i>Projects Overview</li>
      		</ol>
    	</section>
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header with-border">
							<i class="glyphicon glyphicon-tasks"></i>
							<h3 class="box-title">Projects</h3>
							<div class="box-tools pull-right">
            					<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            					<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          					</div>
						</div>
						<div class="box-body">
                             <div class="row">
                             	<div class="col-sm-4 pull-left">
  									<span class="">
                          				<button type="button" id="loading-btn" class="btn btn-warning btn-xs" onclick="refreshProjectPage()"><i class="fa fa-refresh"></i> Refresh</button>
                          					<a href="#" class=" btn btn-success btn-xs">Create New Project</a>
                      				</span>
                      				<br></br>
  								</div>
								
									<!--  search Form -->
									<!--<div class="col-sm-3 pull-right">
		<div class="dataTables_filter" id="example1_filter">
			<div class="input-group input-group-sm">
					<input id="projectsTable_filter" name="searchTerm" type="text" placeholder="Search" class="form-control pull-right"  />
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
						</div>
			</div>
			</div>-->
		<!-- Einde search form -->
		</div>

	         <div  id="projectTableWrapper" class="col-sm-12">
				<table id ="projectsTable" class="table table-hover p-table">
                      <thead>
                      <tr>
                          <th>Project Name</th>
                          <th>Team Member</th>
                          <th>Project Progress</th>
                          <th>Total Open Issues</th>
                          <th>URL</th>
                      </tr>
                      </thead>
                      <tbody>
                      <c:if test="${not empty projects}">
                      	<c:forEach var="projectDto" items="${projects}" >
                      	<tr>
                          <td class="p-name">
                              <a href="${contextBase}project_details.html?id=${projectDto.id}" >${projectDto.projectName}</a>
                          </td>
                          
                          <td class="p-team">
                          <c:forEach var="assignee" items="${projectDto.assignees}">
                              <c:if test="${ not empty assignee}">
                                <a href="#"><img id="assigneeImage" alt="${assignee}" width="32" height="32" class="img-circle" src="" avatar="${assignee}"></a>
                               </c:if>
                          </c:forEach>
                          </td>
                          
                          <td class="p-progress">
                              <div class="progress progress-xs">
                                  <div style="width: ${projectDto.projectProgress}%;" class="progress-bar progress-bar-success"></div>
                              </div>
                              <small>${projectDto.completedIssues} Complete </small>
                          </td>
                          <td>
                              <span class="badge bg-blue">${projectDto.openIssues}</span>
                          </td>
                          <td>
                          	<a href="http://vdelnnap46.ce.hsi.local:9080/browse/${projectDto.projectKey}" target="_blank"><i class="fa fa-link"></i>${projectDto.projectKey}</a>
                          </td>
                      </tr>
                      	</c:forEach>
                      </c:if>
                     
                      
                      </tbody>
                  </table>
</div>
<!-- Ein Pagination -->
						</div>
					</div>
				</div>
			</div>
              </section>
			</div>
