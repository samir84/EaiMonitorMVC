package com.hs.eai.monitor.user.controller;

import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.hs.eai.monitor.common.GenericResponse;
import com.hs.eai.monitor.project.model.ProjectsPlanning;
import com.hs.eai.monitor.user.model.User;
import com.hs.eai.monitor.user.service.UserService;
import com.hs.eai.monitor.user.util.UserNotFoundException;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	private MessageSource messages;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SimpleMailMessage preConfiguredMessage;
	@Autowired
	private Environment env;

	
	/*@RequestMapping(value = "/users.json", method = RequestMethod.GET)
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
	}*/

	
}
