package yht.framework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.yht.controller.login.LoginController;

import org.yht.domain.test01.MemberVo;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws java.lang.Exception{
		
		String uri        = request.getRequestURI();
		MemberVo vo         = (MemberVo)request.getSession(true).getAttribute("SESS_YHT_USER");
		
		// 로그인 체크
		if(uri.endsWith("NoCheck.do")){

		}else if(handler instanceof LoginController){

		}else if(vo == null){
			throw new ModelAndViewDefiningException(new ModelAndView("redirect:/login.do"));
		}
		
		return super.preHandle(request, response, handler);
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws java.lang.Exception{
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws java.lang.Exception{
		
		super.afterCompletion(request, response, handler, ex);
	}
}
