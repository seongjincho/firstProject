package org.yht.controller.bbs;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.yht.domain.test01.AttachVo;
import org.yht.domain.test01.FoodParam;
import org.yht.domain.test01.FoodVo;

import org.yht.service.bbs.FoodService;

@Controller
public class FoodController {
	
	@Resource(name="FoodService")
	FoodService foodService;
	
	
	@RequestMapping(value = "foodBbsList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String foodBbsList(Model model, FoodParam param) {
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<FoodVo> foodBbsList = foodService.getFoodList(param);
		
		// 글의 총 갯수
		int totalRecordCount = foodService.getFoodCount(param);
		
		System.out.println("foodBbsList:" + foodBbsList.size());
		
		model.addAttribute("foodBbsList", foodBbsList);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("f_category", param.getF_category());
		model.addAttribute("f_keyword", param.getF_keyword());
		
		return "foodBbs/foodBbsList";
		
		
	}
	
	@RequestMapping(value = "writeFood.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeFood() {
		
			System.out.println("notice 글쓰기로 이동");
		
		return "foodBbs/foodWrite";
	}
	
	@RequestMapping(value = "writeFoodAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeFoodAf(@ModelAttribute FoodVo fv) throws Exception {
		
			
		
			System.out.println("food 글쓰기 등록 --" + fv.toString());
			System.out.println("--------------------------------");
			System.out.println("파일이름들: " + fv.getFiles());
			foodService.writeFood(fv);
		
			return "redirect:/foodBbsList.do";
	}
	
	@RequestMapping(value = "detailFood.do", method = {})
	public String detailFood(int food_seq, Model model) {
			
			boolean isS = foodService.read_cnt(food_seq);
			if(isS) {
				System.out.println("조회수 up");
			}else {
				System.out.println("조회수 down");
			}
		
		
			List<FoodVo> allFoodDetail = foodService.detailFood(food_seq);
			
			System.out.println(allFoodDetail.toString());
			
			for(int i = 0; i < allFoodDetail.size(); i++) {
				System.out.println("allFoodDetail.get("+i+") : " + allFoodDetail.get(i).getFullname());
			}
			
			FoodVo foodList = allFoodDetail.get(0);  // 첫번째 사진을 포함한 디테일 글 
			
			
			List<AttachVo> attachList = foodService.getAttach(food_seq); // 사진 목록 
			
			System.out.println(attachList.toString());
			
		
			
			//model.addAttribute("allFoodDetail", allFoodDetail);  // 글 전체  
			model.addAttribute("foodList", foodList); // 첫번째 사진을 포함한 디테일 글 
			model.addAttribute("attachList", attachList); // 전체사진
		
		return "foodBbs/foodDetail";
	}
	

}
