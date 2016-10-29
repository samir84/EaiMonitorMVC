package com.hs.eai.monitor.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.hs.eai.monitor.order.model.OrderDetail;
import com.hs.eai.monitor.order.model.OrderHdr;
import com.hs.eai.monitor.service.AppUtilsService;
import com.hs.eai.monitor.service.EaiMasterService;
import com.hs.eai.monitor.service.RestClientService;
import com.hs.eai.orderoverview.orderjaxb.Order;

@Controller
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	private static final String REST_URI_ORDERS_BASE = "restUriOrderBase";
	private static final String REST_URI_ORDER_DETAIL = "restUriOrderDetail";
	private static final String REST_URI_ALLE_ORDERS_LazyLoad = "restUriAllOrdersLazyLoad";
    private static final String REST_URI_ALLE_ORDERS_BY_DATE_BETWEEN = "restUriAllOrdersByOrderDateBetween";
    
	
	@Autowired
	RestClientService restClientService;
	@Autowired
	AppUtilsService appUtilsService;
	@Autowired
	EaiMasterService eaiMasterService;
	ObjectMapper mapper;
	
	
	@PostConstruct
	public void init() {
		restClientService.setUriBase(REST_URI_ORDERS_BASE);
		 mapper = new ObjectMapper();
	}
    

	@RequestMapping(value = "/orders", method = RequestMethod.GET)
	public String showorders(Model model,HttpServletRequest request){
		request.getSession().setAttribute("salesOrganizations",eaiMasterService.getSalesOrganizations());
		return "orders";
	}
	/**
	 * 
	 * @param show
	 *            all orders
	 * @param OrderId
	 * @return
	 */
	@RequestMapping(value = "/orders.json", method = RequestMethod.GET)
	@ResponseBody
	public String ordersJson(Model model, @RequestParam(value = "fromDate", required = true) String fromDate,
			@RequestParam(value = "toDate", required = true) String toDate) {
		
		String ordersJson = null;
		Map<String, String> params = new HashMap<String, String>();
		params.put("fromDate", fromDate);
		params.put("toDate", toDate);
		
		try{
			RestTemplate restTemplate = new RestTemplate();
			String restUriAllOrdersByOrderDateBetween = restClientService
					.readUriFromProperty(REST_URI_ALLE_ORDERS_BY_DATE_BETWEEN);

			ResponseEntity<List<OrderHdr>> ordersResponse = restTemplate.exchange(restUriAllOrdersByOrderDateBetween,
					HttpMethod.GET, null, new ParameterizedTypeReference<List<OrderHdr>>() {
					}, params);
			if(ordersResponse.getBody()== null){
				
				
				ordersJson = mapper.writeValueAsString(new ArrayList<OrderHdr>());
			}else{
				ordersJson = mapper.writeValueAsString(ordersResponse.getBody());
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return ordersJson;
		
	}
	

	@RequestMapping(value = "/order_details.html", method = RequestMethod.GET)
	public String showOrderDetails(Model model, @RequestParam(value = "id", required = true) Integer orderId,
			@RequestParam(value = "userId", required = false) String userId) {

		logger.debug("Showing Order detail page..");
		RestTemplate restTemplate = new RestTemplate();
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("orderId", orderId);
		String restUriOrderDetail = restClientService.readUriFromProperty(REST_URI_ORDER_DETAIL);

		ResponseEntity<List<OrderDetail>> orderDetailsResponse = restTemplate.exchange(restUriOrderDetail,
				HttpMethod.GET, null, new ParameterizedTypeReference<List<OrderDetail>>() {
				}, params);
		List<OrderDetail> orderDetails = orderDetailsResponse.getBody();
		model.addAttribute("oderDetails", orderDetails);

		if (userId != null) {

			// String restUriCutomerSyncByUserId =
			// restClientService.readUriFromProperty(REST_URI_CUSTOMER_SYNC_BY_USER_ID);
			// String
			// restUriCutomerSyncByUserId="http://localhost:8080/TransactionsWS/api/customer/{userId}";
			String restUriOrderXmlByUserId = "http://localhost:8080/TransactionsWS/api/orderXml/{userId}";
			// http://localhost:8080/TransactionsWS/api/customer/{userId}
			ResponseEntity<Order> OrderXMLResponse = restTemplate.exchange(restUriOrderXmlByUserId, HttpMethod.GET,
					null, Order.class, userId);
			// OrderAddressService
			Order orderXml = OrderXMLResponse.getBody();

			if (orderXml != null) {

				model.addAttribute("orderXml", orderXml);
			}

		}
		return "orderdetails";
	}
	
	
}	
