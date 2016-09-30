package com.hs.eai.monitor.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.hs.eai.monitor.jobs.model.ProjectIssueStatistics;
import com.hs.eai.monitor.project.model.JiraAction;
import com.hs.eai.monitor.project.model.ProjectStatistics;
import com.hs.eai.monitor.project.model.ProjectsPlanning;
import com.hs.eai.monitor.project.model.dto.ProjectDto;
import com.hs.eai.monitor.service.AppUtilsService;
import com.hs.eai.monitor.service.RestClientService;

@Controller
public class ProjectController {

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	private static final String REST_URI_PROJECT_BASE = "restUriProjectBase";
	//private static final String REST_URI_ALL_PROJECTS  = "restUriAllProjects";
	private static final String REST_URI_PROJECTS_DTO = "restUriAllProjectsDto";
	private static final String REST_URI_PROJECT_DETAIL = "restUriProjectDetails";
	private static final String REST_URI_PROJECT_ACTIVITIES = "restUriProjectActivities";
	//private static final String REST_URI_ALLE_PROJECT_LazyLoad ="restUriAllProjectsLazyLoad";
	//private static final String REST_URI_ALLE_PROJECT_FULL_TEXT_SEARCH ="restUriAllProjectsDetailsfullTextProjectSearchWildcard";
	private static final String DATE_TIME_PATTERN_PROJECT_ACTIVITIES_ ="dateTimPatternProjectActivities";//add this later to property
	private static final String REST_URI_PROJECT_STATISTICS_TIME_ESTIMATED_SPENT ="restUriProjectStatisticsTimeoriginalestimatedAndTimespent";
	private static final String REST_URI_PROJECT_STATISTICS_TIME_ESTIMATED_SPENT_BY_PROJECT_AND_YEAR ="restUriProjectStatisticsTimeoriginalestimatedAndTimespentByProjectAndYear";
	
	@Autowired
	RestClientService restClientService;
	@Autowired
	AppUtilsService appUtilsService;
	ObjectMapper mapper;
	
	@PostConstruct
	public void init() {
		restClientService.setUriBase(REST_URI_PROJECT_BASE);
		 mapper = new ObjectMapper();
		
	}
	
	/**
	 * 
	 * @param show all projects
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/projects", method = RequestMethod.GET)
	public String showProjects(Model model) {

		try {
			RestTemplate restTemplate = new RestTemplate();
		    String restUriAllProjectsDto  = restClientService.readUriFromProperty(REST_URI_PROJECTS_DTO);
		   
		    ResponseEntity<List<ProjectDto>> projectsResponse =
		            restTemplate.exchange(restUriAllProjectsDto,
		                        HttpMethod.GET, null, new ParameterizedTypeReference<List<ProjectDto>>() {
		                });
		    model.addAttribute("projects",projectsResponse.getBody()) ;  
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			return "projects";
	}


	@RequestMapping(value = "/project_details", method = RequestMethod.GET)
	public String showProjectDto(Model model, @RequestParam(value = "id", required = true) Integer projectId) {

		logger.debug("Showing Project details page..");
		RestTemplate restTemplate = new RestTemplate();
	    
	    String restUriProjectDetail = restClientService.readUriFromProperty(REST_URI_PROJECT_DETAIL);
	    model.addAttribute("dateTimePattern",restClientService.getRequiredProperty(DATE_TIME_PATTERN_PROJECT_ACTIVITIES_));//change later to property based
		ProjectDto ProjectDto = restTemplate.getForObject(restUriProjectDetail, ProjectDto.class, projectId);
		ProjectStatistics projectStatistics = new ProjectStatistics(ProjectDto);
		
		Float inprogressIssues = appUtilsService.calculatePercentage(ProjectDto.getInprogressIssues(), ProjectDto.getTotalIssues());
		Float percentResolved =  appUtilsService.calculatePercentage(ProjectDto.getResolvedIssues(), ProjectDto.getTotalIssues());
		Float percentReopenIssues =  appUtilsService.calculatePercentage(ProjectDto.getReopenIssues(), ProjectDto.getTotalIssues());
		Float percentOpenIssues = appUtilsService.calculatePercentage(ProjectDto.getOpenIssues(), ProjectDto.getTotalIssues());
		Float percentClosed = appUtilsService.calculatePercentage(ProjectDto.getClosedIssues(), ProjectDto.getTotalIssues());
		
		projectStatistics.setPercentClosed(appUtilsService.toPercentage(percentClosed));
		projectStatistics.setPercentResolved(appUtilsService.toPercentage(percentResolved));
		projectStatistics.setPercentReopenIssues(appUtilsService.toPercentage(percentReopenIssues));
		projectStatistics.setPercentOpenIssues(appUtilsService.toPercentage(percentOpenIssues));
		projectStatistics.setInprogressIssues(appUtilsService.toPercentage(inprogressIssues));
		
	    //model.addAttribute("timeEstimatedAndTimespentStatistics", projectsDetailsStatisticsResp.getBody());
		//
	    

		String restUriProjectActivities  = restClientService.readUriFromProperty(REST_URI_PROJECT_ACTIVITIES);
		   
	    ResponseEntity<List<JiraAction>> restUriProjectActivitiesResponse =
	            restTemplate.exchange(restUriProjectActivities,
	                        HttpMethod.GET, null, new ParameterizedTypeReference<List<JiraAction>>() {
	                },projectId);
		
		model.addAttribute("projectdetails", ProjectDto);
		model.addAttribute("projectStatistics", projectStatistics);
		model.addAttribute("projectActivities", restUriProjectActivitiesResponse.getBody());
		
		return "projectdetails";
	}
	
	@RequestMapping(value = "/projectStatistics.json", method = RequestMethod.GET)
	@ResponseBody
	public String getprojectStatistics(@RequestParam (value ="id" , required=true ) String projectId){
		
		
		String projectStatisticsJson = "";
		try {
			RestTemplate restTemplate = new RestTemplate();
			//statistics
			Map <String,Object> map = new HashMap<String,Object>();
			map.put("projectId", projectId);
			map.put("year", "2016");//2015-11-01 00:00:00.000/2015-11-30 11:59:59.999
			
			String restUriProjectStatisticsTimeoriginalestimatedAndTimespentByProjectAndYear  = 
				restClientService.readUriFromProperty(REST_URI_PROJECT_STATISTICS_TIME_ESTIMATED_SPENT_BY_PROJECT_AND_YEAR);
			 
			ResponseEntity<List<ProjectIssueStatistics>> projectsDetailsStatisticsResp =
			            restTemplate.exchange(restUriProjectStatisticsTimeoriginalestimatedAndTimespentByProjectAndYear,
			                        HttpMethod.GET, null, new ParameterizedTypeReference<List<ProjectIssueStatistics>>() {
			                },map);
			 
			projectStatisticsJson = mapper.writeValueAsString(projectsDetailsStatisticsResp.getBody());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return projectStatisticsJson;
	}
	


}
