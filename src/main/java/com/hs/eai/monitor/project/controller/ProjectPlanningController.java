package com.hs.eai.monitor.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.hs.eai.monitor.project.model.ProjectsPlanning;
import com.hs.eai.monitor.service.AppUtilsService;
import com.hs.eai.monitor.service.RestClientService;
import com.hs.eai.monitor.user.model.User;
import com.hs.eai.monitor.user.service.UserService;

@Controller
public class ProjectPlanningController {

	private static final Logger logger = LoggerFactory.getLogger(ProjectPlanningController.class);

	private static final String REST_URI_EAI_MONITOR_BASE = "restUriEaiMonitorWSBase";
	private static final String REST_URI_ALL_PROJECT_PLANNING = "restUriEaiMonitorWSAllProjectsPlanning";
	private static final String REST_URI_ALL_PROJECT_PLANNING_BY_ASSIGNEE ="restUriEaiMonitorAllProjectsPlanningByAssignee";

	private static final String REST_URI_ALL_PROJECT_PLANNING_BY_WEEK_NUMBER ="restUriEaiMonitorAllProjectsPlanningByWeekNumber";
	private static final String REST_URI_ALL_PROJECT_PLANNING_BY_ASSIGNEE_AND_WEEK_NUMBER ="restUriEaiMonitorAllProjectsPlanningByAssigneeAndWeekNumber";
	
	@Autowired
	UserService userService;
	
	@Autowired
	RestClientService restClientService;
	@Autowired
	AppUtilsService appUtilsService;
	ObjectMapper mapper;
	
	@PostConstruct
	public void init() {
		restClientService.setUriBase(REST_URI_EAI_MONITOR_BASE);
		 mapper = new ObjectMapper();
		
	}
	
	//projectsPlanning
		@RequestMapping(value = "/planning", method = RequestMethod.GET)
		public String showProjectPlanning(Model model){
			
			/*try{
				RestTemplate restTemplate = new RestTemplate();
				 String restUriEaiMonitorAllProjectsPlanning  = restClientService.readUriFromProperty(REST_URI_ALL_PROJECT_PLANNING);
				    
				    ResponseEntity<List<ProjectsPlanning>> projectsPlanningResponse =
				            restTemplate.exchange(restUriEaiMonitorAllProjectsPlanning,
				                        HttpMethod.GET, null, new ParameterizedTypeReference<List<ProjectsPlanning>>() {
				                });
				    
				    List<ProjectsPlanning> projectsPlanningList = projectsPlanningResponse.getBody();
				    ProjectsPlanning projectsPlanning = new ProjectsPlanning();
				    List<User> listUsers = userService.findAll();
				    System.out.println("listUsers:"+listUsers.size());
				    model.addAttribute("listUsers",listUsers);
					model.addAttribute("projectsPlanningList", projectsPlanningList);
					model.addAttribute("projectsPlanning", projectsPlanning);
			}catch(Exception ex){
				
			}*/
			return "projectsPlanning";
		}
		@RequestMapping(value = "/planning.json", method = RequestMethod.GET)
		@ResponseBody
		public String getProjectPlanning(@RequestParam (required=false) String anything){
			String projectPlanningJson = null;
			try {
				RestTemplate restTemplate = new RestTemplate();
				 String restUriEaiMonitorAllProjectsPlanning  = restClientService.readUriFromProperty(REST_URI_ALL_PROJECT_PLANNING);
				    
				    ResponseEntity<List<ProjectsPlanning>> projectsPlanningResponse =
				            restTemplate.exchange(restUriEaiMonitorAllProjectsPlanning,
				                        HttpMethod.GET, null, new ParameterizedTypeReference<List<ProjectsPlanning>>() {
				                });
				    
				projectPlanningJson = mapper.writeValueAsString(projectsPlanningResponse.getBody());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return projectPlanningJson;
		}
		/**
		 * Retrieve All ProjectsPlanning by assignees
		 * 
		 * @return
		 */
		@RequestMapping(value = "/planning/{assignee}/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
		public String listAllProjectsPlanningByAssignee(@PathVariable String assignee) {

			String projectPlanningJson = null;
			try {
				RestTemplate restTemplate = new RestTemplate();
				 String restUriEaiMonitorAllProjectsPlanningByAssignee  = restClientService.readUriFromProperty(REST_URI_ALL_PROJECT_PLANNING_BY_ASSIGNEE);
				    
				    ResponseEntity<List<ProjectsPlanning>> projectsPlanningResponse =
				            restTemplate.exchange(restUriEaiMonitorAllProjectsPlanningByAssignee,
				                        HttpMethod.GET, null, new ParameterizedTypeReference<List<ProjectsPlanning>>() {
				                });
				    
				projectPlanningJson = mapper.writeValueAsString(projectsPlanningResponse.getBody());
			} catch (Exception e) {
				e.printStackTrace();
			}
			return projectPlanningJson;

		}
		@RequestMapping(value = "/users.json", method = RequestMethod.GET)
		@ResponseBody
		public String getUsers(){
			
			ObjectMapper mapper = new ObjectMapper();
			String usersJson = null;
			
			try {
				List<User> users = userService.findAll();    
				usersJson = mapper.writeValueAsString(users);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return usersJson;
		}
}
