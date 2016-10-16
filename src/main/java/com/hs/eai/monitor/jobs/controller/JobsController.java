package com.hs.eai.monitor.jobs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.hs.eai.eaimaster.model.Country;
import com.hs.eai.monitor.jobs.model.Job;
import com.hs.eai.monitor.jobs.model.XrefJobPartStatusJob;
import com.hs.eai.monitor.service.AppUtilsService;
import com.hs.eai.monitor.service.RestClientService;


@Controller
public class JobsController {

	private static final Logger logger = LoggerFactory.getLogger(JobsController.class);

	private static final String REST_URI_JOBS_BASE = "restUriJobsBase";
	private static final String REST_URI_ALLE_JOBS_BY_DATE_BETWEEN = "restUriAllJobsByDateBetween";
	private static final String REST_URI_job_DETAIL = "restUriJobDetail";
	private static final String REST_URI_JOBS_DATE_TIME_PATTERN ="dd-MM-yyyy HH:mm:ss";//add this later to property
	private static final String REST_URI_EAIMASTER_BASE = "restUriEaiMasterBase";
	private static final String REST_URI_EAIMASTER_ALL_COUNTRIES = "restUriAllCountries";
	@Autowired
    private Environment env;
	@Autowired
	RestClientService restClientService;
	@Autowired
	AppUtilsService appUtilsService;
	ObjectMapper mapper;
	
	@PostConstruct
	public void init() {
		restClientService.setUriBase(REST_URI_JOBS_BASE);
		mapper = new ObjectMapper();
	}
	
	@RequestMapping(value = "/jobs", method = RequestMethod.GET)
	public String showProjects(Model model , HttpServletRequest request) {

			request.getSession().setAttribute("countries", getCountriesJson());
			System.out.println("getCountriesJson():"+getCountriesJson());
			return "jobs";
	}
	
	@RequestMapping(value = "/jobs.json", method = RequestMethod.GET)
	@ResponseBody
	public String getJobsAsJson(Model model, @RequestParam(value = "toDate", required = true) String toDate,
			@RequestParam(value = "fromDate", required = true) String fromDate) {
		
		String jobsJson = "";
		RestTemplate restTemplate = new RestTemplate();

		Map<String, String> params = new HashMap<String, String>();
	    params.put("fromDate", fromDate);
	    params.put("toDate", toDate);
	    
	    try{
	    	String restUriAllJobsByDateBetween  = restClientService.readUriFromProperty(REST_URI_ALLE_JOBS_BY_DATE_BETWEEN);
	    	
	    	ResponseEntity<List<Job>> jobsResponse =
	 	            restTemplate.exchange(restUriAllJobsByDateBetween,
	 	                        HttpMethod.GET, null, new ParameterizedTypeReference<List<Job>>() {
	 	                },params);
	    	jobsJson = mapper.writeValueAsString(jobsResponse.getBody());
	    }catch(Exception ex){
	    	ex.printStackTrace();
	    }
	   
		return jobsJson;
	}
	@RequestMapping(value = "/job_details.html", method = RequestMethod.GET)
	public String showjobDetails(Model model, @RequestParam(value = "id", required = true) Integer jobId
			) {

		logger.debug("Showing job detail page..");
		RestTemplate restTemplate = new RestTemplate();
		Map<String, Integer> params = new HashMap<String, Integer>();
	    params.put("jobId", jobId);
	    model.addAttribute("dateTimePattern",REST_URI_JOBS_DATE_TIME_PATTERN);//change later to property based
	    String restUrijobDetail = restClientService.readUriFromProperty(REST_URI_job_DETAIL);
	   
	    ResponseEntity<List<XrefJobPartStatusJob>> jobDetailsResponse =
	            restTemplate.exchange(restUrijobDetail,
	                        HttpMethod.GET, null, new ParameterizedTypeReference<List<XrefJobPartStatusJob>>() {
	                },params);
	    List<XrefJobPartStatusJob> jobDetails = jobDetailsResponse.getBody();
	    for(XrefJobPartStatusJob xref:jobDetails){
	    	
	    	System.out.println("recordcount:"+xref.getRecordcount());
	    }
		model.addAttribute("jobDetails", jobDetails);
	
		return "jobdetails";
	}
	public String getCountriesJson(){
		String countriesJson = "";
		try{
			RestTemplate restTemplate = new RestTemplate();
			
			 String restUriAllCountries  =  env.getRequiredProperty(REST_URI_EAIMASTER_BASE)+"/"+
					 						env.getRequiredProperty(REST_URI_EAIMASTER_ALL_COUNTRIES);
			 ResponseEntity<List<Country>> projectsResponse =
			            restTemplate.exchange(restUriAllCountries,
			                        HttpMethod.GET, null, new ParameterizedTypeReference<List<Country>>() {
			                });
			 countriesJson = mapper.writeValueAsString(projectsResponse.getBody());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countriesJson;
	}
}
