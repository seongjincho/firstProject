package org.yht.controller.mypage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yht.domain.test01.FoodVo;
import org.yht.domain.test01.MemberVo;
import org.yht.service.mypage.MypageService;

@Controller
public class MypageController {

	@Resource(name="MypageService")
	MypageService mypageService;
	
	@RequestMapping(value="mypage_main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypage_main() {
		
		System.out.println("마이페이지 진입");
		
		return "mypage/mypage_main";
	}
	
	@RequestMapping(value="goUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goUpdate() {
		
		System.out.println("정보수정 진입 비밀번호 체크");
		
		
		return "mypage/goUpdate";
	}
	
	@RequestMapping(value="goUpdateAF.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goUpdateAF(@RequestParam String pwd, HttpServletRequest req) {
		System.out.println("정보수정 진입");
		
		String src = "";
		
		MemberVo mem = (MemberVo)req.getSession().getAttribute("login");
		mem.setPwd(pwd);
		
		System.out.println("id=" + mem.getId());
		System.out.println("pwd=" + mem.getPwd());
		
		MemberVo checkPwd = mypageService.checkPwd(mem);
		
		
		if(checkPwd == null) { // 로그인 실패 
			System.out.println("비밀번호 에러");
			src = "mypage/errorPwd";
			
		}else {   // 로그인 성공 
			System.out.println("정보수정 진입");
			src = "redirect:/mypage_update.do";
		}
		
		
		return src;
	}
	
	@RequestMapping(value="mypage_update.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypage_update(Model model, HttpServletRequest req) {
		
		MemberVo mem = (MemberVo)req.getSession().getAttribute("login");
		
		model.addAttribute("mem", mem);
		
		return "mypage/mypage_update";
	}
	
	@ResponseBody
	@RequestMapping(value = "myInfoPhone.do", method = RequestMethod.POST)
	public Map<String, Object> phonecheck(MemberVo dto, Model model) {
		System.out.println("폰 중복확인");
		
		System.out.println("phone=" + dto.getPhone());
		
		MemberVo mem = mypageService.myPhone(dto);
		
		String check = mypageService.phoneCheck(dto);
		String str = "";
		Map<String, Object> map = new HashMap<>();
		
		if(mem != null) {
			str = "MYPHONE";
			map.put("MY", str);
		}else {
			if(check == null){
				str = "OK";
				map.put("OK", str);
			} else{
				str = "NO";
				map.put("NO", str);
			}
		}
		return map;
	}
	
	@RequestMapping(value = "mypage_updateAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypage_updateAf(MemberVo dto) {
		System.out.println("정보 업데이트 등록!");
		
		//MemberVo mem = mypageService.myPhone(dto);
		
		//String check = mypageService.phoneCheck(dto);
		boolean isS = mypageService.mypage_update(dto);
		
/*		if(mem != null) {
		//	b = myPageService.myInfoUp(dto);	// 폰 번호를 변경 안할시
		} else {
			
			if(check == null){
				//b = myPageService.myInfoUpdate(dto);	// 폰 번호 변경시
			}
			
		}*/
		
		if(isS) {			
			
			System.out.println("정보 업데이트 완료");
			return "redirect:/mypage_main.do";	
			
		} else {		
			
			System.out.println("정보 업데이트 실패");
			return "redirect:/mypage_update.do";		
			
		}
		
		
	}
	
	@RequestMapping(value = "mypage_delete.do", method = {})
	public String mypage_delete() {
		
		System.out.println("삭제진입");
		
		
		return "mypage/mypage_delete";
	}
	
	@RequestMapping(value = "mypage_deleteAf.do", method = {})
	public String mypage_deleteAf(HttpServletRequest req) {
		
		System.out.println("탈퇴 시도");
		
		String src = "";
		
		MemberVo dto = (MemberVo)req.getSession().getAttribute("login");
		
		String id = dto.getId();
		
		boolean isS = mypageService.mypage_delete(id);
		
		if(isS) {
			
			System.out.println("탈퇴 성공");
			src = "redirect:/logout.do";
			
		}else {
			
			System.out.println("탈퇴 실패");
			src = "redirect:/mypage_delete.do";
			
		}
		
		return src;
	}
	
	@RequestMapping(value="mypage_like.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String mypage_wish(Model model, HttpServletRequest req) {
		
		MemberVo mem = (MemberVo)req.getSession().getAttribute("login");
		String id = mem.getId();
		List<FoodVo> myLikeList = mypageService.mypage_like(id);
		model.addAttribute("myLikeList", myLikeList);
		
		return "mypage/mypage_like";
	}
	
	

}
