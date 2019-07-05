package org.yht.controller.login;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.yht.domain.test01.MemberVo;
import org.yht.service.login.LoginService;

import yht.framework.util.EncryptionUtils;
import yht.framework.util.Util;

@Controller
public class LoginController {
	protected static final Log logger = LogFactory.getLog(LoginController.class);

	
	
	@Resource(name="LoginService")
	LoginService loginService;
	
	@RequestMapping(value="login.do", method = {RequestMethod.GET, RequestMethod.POST} )
	public String loginPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String loginPage = "login/login";
		
//		System.out.println(VarLanguage.getMsg(request, "MSG001"));
		
		return loginPage; 
	}

	@RequestMapping(value="loginAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginCheck(MemberVo vo, Model model) throws Exception{
		
		String src = null;
		MemberVo login = loginService.login(vo);
		
		if(login != null && !login.getId().equals("")) {
			if(login.getAuthstatus() == 0) {  //이메일 인증 안됨 
/*				model.addAttribute("email_check", 0);
				
				return "emailConfirm.tiles";*/
				System.out.println("이메일 인증 안하셨음");
				
			} else if(login.getDel() == 1) {  // 탈퇴한 회원 
				
				System.out.println("탈퇴 회원");
			}
			
			System.out.println("로그인성공");
			src = "main/main";
		} else {
			
			System.out.println("에러");
			
		}
		
		return src;

	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		String nextPage = "login/login";
		
		HttpSession session = request.getSession(true);
				
		// 세션 정보에 사용자 저장
		session.invalidate();
		
		return nextPage;
	}
	
	@RequestMapping(value="/dev/devFirst.do")
	public String devFirst(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String nextPage = "com/devFirst";
		
//		System.out.println(VarLanguage.getMsg(request, "MSG001"));
		
		return nextPage;
	}
}
