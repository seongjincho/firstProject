package org.yht.controller.bbs;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.yht.service.bbs.FoodService;

@Controller
public class FoodController {
	
	@Resource(name="FoodService")
	FoodService FoodService;
	
	
	@RequestMapping(value = "foodBbsList.do", method = {})
	public String foodBbsList() {
		
		return "";
	}

}
