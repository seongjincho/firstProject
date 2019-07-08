package org.yht.controller.login;

import java.io.PrintWriter;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import org.yht.domain.test01.MemberVo;
import org.yht.service.login.LoginService;



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

	@RequestMapping(value="loginAf.do", method = {RequestMethod.POST})
	public String loginCheck(MemberVo vo, Model model , HttpServletRequest request) throws Exception{
		
		
		System.out.println(vo.toString());
		
		String src = null;
		MemberVo login = loginService.login(vo);
		
		if(login != null && !login.getId().equals("")) {
			if(login.getAuthstatus() == 0) {  //이메일 인증 안됨 
/*				model.addAttribute("email_check", 0);
				
				return "emailConfirm.tiles";*/
				System.out.println("이메일 인증 안하셨음");
				
				
				return "login/login";
				
				
			} else if(login.getDel() == 1) {  // 탈퇴한 회원 
				
				System.out.println("탈퇴 회원");
				
				return "login/leave";
			}
			
			System.out.println("로그인성공");
			request.getSession().setAttribute("login", login);
			
			return "main/main";
		} else {
			
			System.out.println("에러");
			return "login/error";
			
		}
		
		//return src;

	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		String nextPage = "login/login";
		
		HttpSession session = request.getSession(true);
				
		
		session.invalidate();
		
		return nextPage;
	}
	
	@RequestMapping(value="main.do")
	public String main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String mainPage = "main/main";
			
		return mainPage;
	}
	
	@RequestMapping(value="regi.do")
	public String regi() throws Exception{
		String regiPage = "login/regi";
		
		System.out.println("회원가입 창 ㄱㄱ");
		
		return regiPage;
	}
	
	@RequestMapping(value="regiAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String regiAf(MemberVo mem, Model model) throws Exception{
		
		String loginPage = "login/login";
		
		System.out.println("회원가입 시도!");
				loginService.regiAf(mem);
		

		return loginPage;
	}
/*	idcheck.do emailcheck.do  phonecheck.do*/
	
	@ResponseBody
	@RequestMapping(value = "idcheck.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String idcheck(String id) throws Exception {
		
		System.out.println("id:" + id);
		
		String idCheck = loginService.idcheck(id);
		String str = "";
		
		if(idCheck == null) {
			str = "OK";
		} else{
			str = "NO";
		}
		
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value = "emailcheck.do", method = RequestMethod.POST)
	public String emailcheck(String email) throws Exception {
		
		
		System.out.println("email: " + email);
		
		String check = loginService.emailcheck(email);
		String str = "";
		
		System.out.println("check=" + check);
		
		if(check == null){
			str = "OK";
		} else{
			str = "NO";
		}
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value = "phonecheck.do", method = RequestMethod.POST)
	public String phonecheck(String phone) throws Exception {
		
		String str = "";
		String check = loginService.phonecheck(phone);
		
		
		System.out.println("check=" + check);
		
		if(check == null){
			str = "OK";
		} else{
			str = "NO";
		}
		return str;
	}
	
	
}
