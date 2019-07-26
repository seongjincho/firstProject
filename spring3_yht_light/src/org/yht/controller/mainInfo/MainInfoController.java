package org.yht.controller.mainInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainInfoController {

	@RequestMapping(value = "brandStory.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String brandStory() {
		
		return "main/brandStory";
	}

	
	@RequestMapping(value = "customerService.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String customerService() {
		
		return "main/customerService";
	}
	
	@RequestMapping(value = "privacy1.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String privacy1() {
		
		return "main/privacy1";
	}
	
	@RequestMapping(value = "privacy2.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String privacy2() {
		
		return "main/privacy2";
	}
	

}
