package org.yht.controller.bbs;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yht.domain.test01.JoinVo;

import org.yht.service.bbs.JoinService;

@Controller
public class JoinController {

	@Resource(name="JoinService")
	JoinService joinService;
	
	@ResponseBody
	@RequestMapping(value="getJoin.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getJoin(JoinVo vo) {
		
		System.out.println("getJoin ---------");
		JoinVo jv = joinService.getJoin(vo);
		String msg = "";
		
		if(jv != null) { // not null 
			System.out.println("데이터 이미 존재 이미참여중    ");
			msg = "NO";
			
		}else {  // null 
			
			System.out.println("데이터 없음  참여가능 " );
			
			msg = "OK";
		}
		
		
		return msg;   
	}
	
	@ResponseBody
	@RequestMapping(value="joinInsert.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String joinInsert(JoinVo vo) {
		
		System.out.println("joinInsert ---------");
		String msg = "";
		boolean isS = joinService.joinInsert(vo);
		boolean isCnt = joinService.join_cnt(vo);

		if(isS) { // 참여 완료 
			System.out.println("참여 완료");
			
			if(isCnt) { // cnt up
				
				System.out.println("join cnt update 성공!");
				msg = "OK";
				
			}else { // cnt down
				
				System.out.println("join cnt update 실패!");
				
			}
			
			
			
			
		}else {  // 참여 완료 실패
			
			System.out.println("참여 실패 " );
			
			msg = "NO";
			
		}
		
		
		
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping(value="joinDel.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String joinDel(JoinVo vo) {
		
		
		
		System.out.println("joinDel ---------");
		boolean isS = joinService.joinDel(vo);
		String msg = "";
		boolean isCnt = joinService.join_cnt(vo);
		
		if(isS) { // 참여취소  
			System.out.println("참여취소 완료 ");
			
			if(isCnt) { // cnt up
				
				System.out.println("join cnt update 성공!");
				msg = "OK";
				
			}else { // cnt down
				
				System.out.println("join cnt update 실패!");
				
			}
			
			
			
		}else {  //  참여 취소 실패
			
			System.out.println("참여 취소 실패" );
			
			msg = "NO";
			
		}
		
		
		return msg;   
	}
	
	@RequestMapping(value="food_joinlist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String food_joinlist(int food_seq, Model model) {
		
		
		List<JoinVo> food_joinlist = joinService.food_joinlist(food_seq);
		model.addAttribute("food_joinlist", food_joinlist); //  참여자 목록
		
		return "foodBbs/foodJoin";
	}
	
}
