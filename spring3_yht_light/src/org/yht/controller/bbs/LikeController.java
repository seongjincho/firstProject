package org.yht.controller.bbs;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yht.domain.test01.LikeVo;
import org.yht.service.bbs.LikeService;

@Controller
public class LikeController {

	@Resource(name="LikeService")
	LikeService likeService;
	
	
	@ResponseBody
	@RequestMapping(value="getLike.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getLike(LikeVo vo) {
		
		System.out.println("getLike ---------");
		LikeVo lv = likeService.getLike(vo);
		String msg = "";
		
		if(lv != null) { // not null 
			System.out.println("데이터 이미 존재 좋아요 등록 불가  삭제 가능     ");
			msg = "NO";
			
		}else {  // null 
			
			System.out.println("데이터 없음  좋아요 등록가능 " );
			
			msg = "OK";
		}
		
		
		return msg;   
	}
	
	@ResponseBody
	@RequestMapping(value="likeInsert.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String likeInsert(LikeVo vo) {
		
		System.out.println("likeInsert ---------");
		boolean isS = likeService.likeInsert(vo);
		String msg = "";
		boolean isCnt = likeService.like_cnt(vo);
		
		if(isS) { // 좋아요 등록 완료 
			System.out.println("좋아요 등록 완료");
			
			if(isCnt) { // cnt up
				
				System.out.println("like cnt update 성공!");
				msg = "OK";
				
			}else { // cnt down
				
				System.out.println("like cnt update 실패!");
				
			}
			
			
			
			
		}else {  // 좋아요 등록 실패 
			
			System.out.println("좋아요 등록 실패  " );
			
			msg = "NO";
			
		}
		
		
		return msg;   
	}
	
	@ResponseBody
	@RequestMapping(value="likeDel.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String likeDel(LikeVo vo) {
		
		System.out.println("likeDel ---------");
		boolean isS = likeService.likeDel(vo);
		String msg = "";
		boolean isCnt = likeService.like_cnt(vo);
		
		if(isS) { // 좋아요 삭제 완료 
			System.out.println("좋아요 삭제 완료 ");
			
			if(isCnt) { // cnt up
				
				System.out.println("like cnt update 성공!");
				msg = "OK";
				
			}else { // cnt down
				
				System.out.println("like cnt update 실패!");
				
			}
			
			
			
		}else {  // 좋아요 삭제 실패
			
			System.out.println("좋아요 삭제 실패" );
			
			msg = "NO";
			
		}
		
		
		return msg;   
	}
	
	
}
