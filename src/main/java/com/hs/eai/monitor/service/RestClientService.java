package com.hs.eai.monitor.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@Scope("prototype")
public class RestClientService {

	private static final Logger logger = LoggerFactory.getLogger(RestClientService.class);

	private static final String REST_URI_COUNT_ALLE_PROJECTS ="restUriCountProjects";
	private static final String REST_URI_COUNT_ALLE_ORDERS ="restUriCountOrders";
	private static final String REST_URI_COUNT_ALLE_JOBS ="restUriCountJobs";
	private static final String REST_URI_ALLE_PROJECTS_LazyLoad_MAX_RESULT = "restUriAllProjectslazyLoadMaxResult";
	private static final String REST_URI_ALLE_ORDERS_LazyLoad_MAX_RESULT = "restUriAllOrdersLazyLoadMaxResult";
	private static final String REST_URI_ALLE_CATALOGS_LazyLoad_MAX_RESULT = "restUriAllCatalogsLazyLoadMaxResult";
	private static final String REST_URI_ALLE_JOBS_LazyLoad_MAX_RESULT = "restUriAllJobsLazyLoadMaxResult";
	
	
	@Autowired
	private Environment env;

	private String uriBase;

	public String getUriBase() {
		return uriBase;
	}

	public void setUriBase(String uriBase) {
		this.uriBase = uriBase;
	}

	public String getRequiredProperty(final String property){
		return env.getRequiredProperty(property);
	}
	public String readUriFromProperty(final String property) {

		return env.getRequiredProperty(uriBase) + env.getRequiredProperty(property);
	}




}
