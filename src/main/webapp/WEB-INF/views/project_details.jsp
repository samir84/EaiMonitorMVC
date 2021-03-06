<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="content-wrapper">
	  
	 
		<section class="content-header">
			<h1>
			Dashboard <small>Project Managment</small>
			</h1>
			<ol class="breadcrumb">
				<li>
					<a href="#">
						<i class="fa fa-cubes"></i> Projects
					</a>
				</li>
				<li class="active">Project Detail</li>
			</ol>
		</section>
		<section class="content">
			<div class="row">
<div class="col-lg-12">
			<div class="box">
			 <div class="box-header with-border">
              <h3 class="box-title">Status Summary</h3>

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
				  <div class="col-sm-2 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green"><i class="fa fa-caret-up">
                    </i> ${projectStatistics.percentOpenIssues}</span>
                    <h5 class="description-header">${projectdetails.openIssues}</h5>
                    <span class="description-text">OPEN ISSUES</span>
                  </div>
                  <!-- /.description-block -->
                </div>
				<div class="col-sm-2 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green">
                    <i class="fa fa-caret-up"></i> ${projectStatistics.percentReopenIssues}</span>
                    <h5 class="description-header">${projectdetails.reopenIssues}</h5>
                    <span class="description-text">REOPEN ISSUES</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <div class="col-sm-2 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green">
                    <i class="fa fa-caret-up"></i> ${projectStatistics.inprogressIssues}</span>
                    <h5 class="description-header">${projectdetails.inprogressIssues }</h5>
                    <span class="description-text">IN PROGRESS ISSUES</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <div class="col-sm-2 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green">
                    <i class="fa fa-caret-up"></i>${projectStatistics.percentResolved}</span>
                    <h5 class="description-header">${projectdetails.resolvedIssues }</h5>
                    <span class="description-text">RESOLVED ISSUES</span>
                  </div>
                  <!-- /.description-block -->
                </div>
			    <div class="col-sm-2 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green">
                    <i class="fa fa-caret-up"></i>${projectStatistics.percentClosed}</span>
                    <h5 class="description-header">${projectdetails.closedIssues }</h5>
                    <span class="description-text">CLOSED ISSUES</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <div class="col-sm-2 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green">
                    <i class="fa fa-caret-up"></i>${projectStatistics.percentCompletedIssues}</span>
                    <h5 class="description-header">${projectdetails.completedIssues }</h5>
                    <span class="description-text">Completed ISSUES</span>
                  </div>
                  <!-- /.description-block -->
                </div>
				  </div>
				 
			
				</div>
				
			</div>
			
			<div class="box">
			<div class="box-header with-border">
			<i class="fa fa-area-chart"></i> <h3 class="box-title">TIMEORIGINAL vs TIMESPENT</h3></li>
           
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
			<input type="hidden" id="chosenAreaId" value="" />
			<c:url value="/TimeOrgVsTimeSpentByPeriodeAndProject.json" var="timeOrVSTimeSpentUrl" />
			<c:url value="/projectStatistics.json" var="projectStatisticsUrl" />
			<div class="nav-tabs-custom" id="tabs" target_url="${timeOrVSTimeSpentUrl}">
            <ul class="nav nav-tabs pull-left" id="timeorg_timespent" >  
  				<li class="pull-left header">
  				<li id="selectedTab" class="active">
  					<a href="#last_year" id="last_year" data-toggle="tab" aria-expanded="true" target_url="${projectStatisticsUrl}">
  						Last year
  					</a>
  				</li>
            </ul>
            <div class="pull-right">
              <div class="form-group">
                <div class="input-group">
                  <button type="button" class="btn btn-default pull-right" id="daterange-btn">
                    <span>
                      <i class="fa fa-calendar"></i> Periode range picker
                    </span>
                    <i class="fa fa-caret-down"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
			  
			  <div class="tab-content">
              		<div class="tab-pane active" id="last_year">
               				<div class="chart">
                				<canvas id="last_year_areaChart" class="chart" style="height:250px"></canvas>
              				</div>
              		</div>
              <!-- /.tab-pane -->
              		<!--  <div class="tab-pane" id="last_month">
                      <canvas id="last_month_areaChart" style="height:250px"></canvas>
              		</div>-->
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
              
            </div>
			</div>
			</div>
			</div>
		
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-9">
						<section class="panel">
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<div id="projectdetailsId" class="m-b-md" projectId="${projectdetails.id}">
											<a class="btn btn-white btn-xs pull-right" href="#">Edit project</a>
											<h2>${projectdetails.projectName}</h2>
										</div>
										
									</div>
								</div>
								<div class="row">
									<div class="col-lg-5">
										<dl class="dl-horizontal">
											<dt>Created by:</dt>
											<dd>
												<a href="#"><img alt="${projectdetails.projectLead}" width="32" height="32" class="img-circle" src="" avatar="${projectdetails.projectLead}"></a>
											</dd>
											<dt>Total Issues:</dt>
											<dd>${projectdetails.totalIssues}</dd>
											<dt>Project Type:</dt>
											<dd>
												<a class="text-navy" href="#"> ${projectdetails.projectCategory}</a>
											</dd>
										</dl>
									</div>
									<div id="cluster_info" class="col-lg-7">
										<dl class="dl-horizontal">
											<dt>Participants:</dt>
											<dd class="project-people">
												<c:forEach var="assignee" items="${projectdetails.assignees}">
													<!-- <a href=""><img src="img/a3.jpg" class="img-circle" alt="image"></a>-->
														<c:if test="${ not empty assignee}">
                                							<a href="#"><img alt="${assignee}" width="32" height="32" class="img-circle" src="" avatar="${assignee}"></a>
                               							</c:if>
													</c:forEach>
												</dd>
											</dl>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<dl class="dl-horizontal">
												<dt>Completed:</dt>
												<dd>
													<div class="progress progress-striped active m-b-sm">
														<div class="progress-bar" style="width: ${projectdetails.projectProgress}%;"></div>
													</div>
													<dd>
														<p class="project-completed-label">
															<small>${projectdetails.completedIssues} of ${projectdetails.totalIssues} ISSUES COMPLETED WITH OVERALL
																	PERCENTAGE OF <b>${projectdetails.projectProgress}</b>
															</small>
														</p>
													</dd>

												</dl>
											</div>
										</div>
										<!-- Project Activities -->
										<section class="panel">
											<header class="panel-heading"> Last Activity </header>
											<div class="panel-body">
												
															<c:forEach var="activity" items="${projectActivities}">
														
				<div class="box-footer box-comments">											
              <%-- <div class="box-comment">
                <!-- User image -->
                <!--  <img alt="User Image" src="../dist/img/user3-128x128.jpg" class="img-circle img-sm">-->
                <a href="#"><img alt="image" width="32" height="32" class="img-circle" src="" avatar="${activity.author}"></a>

                <div class="comment-text">
                      <span class="username">${activity.author}
                      	<span class="text-muted pull-right"><fmt:formatDate pattern="${dateTimePattern}" value="${activity.created}" /></span>
                      </span>${activity.actionbody}
                </div>
              </div> --%>
              <div class="direct-chat-msg">
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-timestamp pull-right"><fmt:formatDate pattern="${dateTimePattern}" value="${activity.created}" /></span>
                      </div>
                      <!-- /.direct-chat-info -->
                      <!-- <img alt="message user image" src="dist/img/user1-128x128.jpg" class="direct-chat-img"> --><!-- /.direct-chat-img -->
                      <a href="#"><img alt="image" width="32" height="32" alt ="${activity.author}" class="img-circle direct-chat-img" src="" avatar="${activity.author}"></a>
                      <div class="direct-chat-text">
                        ${activity.actionbody}
                      </div>
                      <!-- /.direct-chat-text -->
                    </div>
              <!-- /.box-comment -->
            </div>
		</c:forEach>		
											</div>
										</section>
										<!-- Eind Activities -->
										
									</div>
								</section>
							</div>

									<!-- Project Description  -->
									<div class="col-md-3">
										<section class="panel">
											<header class="panel-heading"> Projects Description </header>
											<div class="panel-body project-other-info">
												<a href="#">
													<img alt="image" class="client-logo"
												src="../../../assets/images/google-logo.png">
													</a>
													<hr>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Repudiandae esse aperiam, culpa quos veniam modi
												facere, quis libero sint quisquam est asperiores dolor.
												Officiis molestias error alias harum ullam accusantium?</p>
														<p>Fuga consequuntur eos reprehenderit quasi, sunt magni
												voluptatum nihil eligendi in quia modi repudiandae natus eum
												laudantium ex possimus officia quod necessitatibus ipsam
												quam quisquam! Cum ducimus tempore, incidunt modi.</p>
														<p>Illum repellendus tenetur, illo optio laborum
												reiciendis ipsam, accusamus in ducimus adipisci voluptate.
												Deserunt laboriosam, recusandae nam consectetur rem aperiam
												magni numquam ducimus reprehenderit dolores nisi magnam
												ipsam quidem. Beatae!</p>
														<p>Tempora deleniti distinctio unde, autem eligendi
												pariatur sed soluta consectetur ipsa qui, harum vitae cum
												voluptas rerum adipisci optio nesciunt ab id similique, aut
												voluptates! Consequatur ut harum accusantium ratione?</p>
														<br>
															<h5>
																<b>Priority</b>
															</h5>
															<ul class="nav nav-pills nav-stacked">
																<li>
																	<p>
																		<i class=" fa fa-circle text-danger"></i> High Priority
																	</p>
																</li>
															</ul>

															<br>
																<h5>
																	<b>Project files</b>
																</h5>
																<ul class="list-unstyled project-files">
																	<li>
																		<a href="">
																			<i class="fa fa-file-o"></i>
														Documentation.docx
																		</a>
																	</li>
																	<li>
																		<a href="">
																			<i class="fa fa-file-pdf-o"></i>Wireframe.pdf</a>
																	</li>
																	<li>
																		<a href="">
																			<i class="fa fa-file-video-o"></i>
														Video.mp4
																		</a>
																	</li>
																	<li>
																		<a href="">
																			<i class="fa fa-picture-o"></i>
														Logo.png
																		</a>
																	</li>
																</ul>
																<br>

																	<h5>
																		<b>Project Tags</b>
																	</h5>
																	<ul class="project-tag-list list-inline">
																		<li>
																			<a href="">
																				<i class="fa fa-tag"></i> PHP
																			</a>
																		</li>
																		<li>
																			<a href="">
																				<i class="fa fa-tag"></i>
														Javascript
																			</a>
																		</li>
																		<li>
																			<a href="">
																				<i class="fa fa-tag"></i> CSS
																			</a>
																		</li>
																		<li>
																			<a href="">
																				<i class="fa fa-tag"></i>jQuery
																			</a>
																		</li>
																		<li>
																			<a href="">
																				<i class="fa fa-tag"></i> Angular
																			</a>
																		</li>
																	</ul>

																	<div class="text-center mtop20">
																		<a class="btn btn-sm btn-primary btn-flat" href="#">Add
													files</a> <a class="btn btn-sm btn-warning btn-flat" href="#">Report
													contact</a>
																	</div>
																</div>

															</section>

														</div>
														<!-- Eind Project description -->
											</div>
										</div>
									</section>
							

		
</div>
				