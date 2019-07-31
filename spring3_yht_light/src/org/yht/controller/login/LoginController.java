package org.yht.controller.login;

import java.io.IOException;

import java.util.Date;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.yht.domain.test01.MemberVo;
import org.yht.service.login.LoginService;
import org.yht.service.login.MailService;

import yht.framework.util.TempKey;
import yht.framework.util.VerifyRecaptcha;



@Controller
public class LoginController {
	protected static final Log logger = LogFactory.getLog(LoginController.class);

	
	
	@Resource(name="LoginService")
	LoginService loginService;
	
	//@Resource(name="MailService")	
	@Autowired
	MailService mailService;
	
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
		String id = loginService.idcheck(vo.getId());
		
		
		if(id == "" || id == null) { // 아이디 오류 
			
			System.out.println("아이디가 존재하지 않습니다");
			src = "login/errorId";
			
		}else {
			
			MemberVo login = loginService.login(vo);
			System.out.println("로그인 db  " + login.toString());
			String user_pwd = vo.getPwd();
			String db_pwd = login.getPwd();
			System.out.println("user_pwd:" + user_pwd + " db_pwd:" + db_pwd);
			
			if(user_pwd.equals(db_pwd)) { // 비밀번호 
				
				if(login.getAuthstatus() == 0) {  //이메일 인증 안됨 
					
					System.out.println("이메일 인증 안하셨음");
					
					
					src = "login/emailConfirm";
					
					
				} else if(login.getDel() == 1) {  // 탈퇴한 회원 
					
					System.out.println("탈퇴 회원");
					
					src = "login/leave";
				}else {
					
					System.out.println("로그인 성공 ! ");
					request.getSession().setAttribute("login", login);
					src = "main/main";
					
				}
							
			}else {
				
				System.out.println("비밀번호가 틀립니다.");
				src = "login/errorPwd";
				
			}
			
			
			
		}
	
		
		


			

		
		return src;
		
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		String nextPage = "main/main";
		
		HttpSession session = request.getSession(true);
				
		
		session.invalidate();
		System.out.println("로그아웃");
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
		
		String authkey = new TempKey().getKey(50, false);
		
		System.out.println("authkey:" + authkey);
		
		mem.setAuthkey(authkey);
		
		loginService.updateAuthKey(mem);
		
		System.out.println("----------------" + mem.toString());
				
		StringBuilder sb = new StringBuilder();
		
		sb.append("<p>안녕하세요? "+ mem.getName() +" 님( "+mem.getId()+" )</p>");
		sb.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>");
		sb.append("<a href='http://localhost:8091/spring3_yht/emailConfirm.do");
		sb.append("?email=");
		sb.append(mem.getEmail());
		sb.append("&authkey=");
		sb.append(authkey);
		sb.append("' target='_blank'>이메일 인증 확인</a>");
		
		
		
		System.out.println("------------" + sb.toString());
		
		mailService.send("[Food Sharing] 회원가입 이메일 인증", sb.toString(), "testcho0701@gmail.com(Food Sharing 관리자)", 
						mem.getEmail(), null);		
		

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
	
	@RequestMapping(value = "emailConfirm.do", method = RequestMethod.GET)
	public String emailConfirm(String email, Model model) throws Exception {
		logger.info("MemberController emailConfirm " + new Date());
		
		loginService.userAuth(email);
		
		model.addAttribute("email_check", 1);
		
		return "login/emailConfirm";
	}
	
	  @ResponseBody
	    @RequestMapping(value = "VerifyRecaptcha.do", method = RequestMethod.POST)
	    public int VerifyRecaptcha(HttpServletRequest request, String recaptcha) {
	        VerifyRecaptcha.setSecretKey("6LdGebAUAAAAAH8kLEGJNRwQCVWWlZPHQuJxYv82");
	       // String gRecaptchaResponse = request.getParameter("recaptcha");
	        String gRecaptchaResponse = recaptcha;
	        System.out.println(gRecaptchaResponse);
	        //0 = 성공, 1 = 실패, -1 = 오류
	        
	        try {
	            if(VerifyRecaptcha.verify(gRecaptchaResponse)) {
	            	
	            	return 0;
	            }else {
	            	return 1;
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }


	
	
	
}
