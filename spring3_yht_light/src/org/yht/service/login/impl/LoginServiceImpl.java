package org.yht.service.login.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yht.dao.login.LoginDao;

import org.yht.domain.test01.MemberVo;
import org.yht.service.login.LoginService;

import yht.framework.util.MailHandler;
import yht.framework.util.TempKey;



@Service("LoginService")
public class LoginServiceImpl implements LoginService {
	protected static final Log logger = LogFactory.getLog(LoginServiceImpl.class);
	
	@Resource(name="LoginDao")
	LoginDao loginDao;
	
	JavaMailSender mailSender;
	
	
	@Override
	public MemberVo login(MemberVo vo) throws Exception {
		return loginDao.getUserInfo(vo);
	}
	
	@Transactional
	@Override
	public void regiAf(MemberVo vo) throws Exception {
		
		loginDao.regiAf(vo);
		
		/*String authkey = new TempKey().getKey(50, false);
		
		
		System.out.println("authkey:" + authkey);
		
		System.out.println("---------------------:" + mailSender.toString());
		
		vo.setAuthkey(authkey);
		
		loginDao.updateAuthKey(vo);
		
		// mail 작성 관련
				MailHandler sendMail = new MailHandler(mailSender);
				
				
				
				sendMail.setSubject("[Food Sharing] 회원가입 이메일 인증");
				sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
						.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
						.append("<a href='http://localhost:8091/spring3_yht_light/emailConfirm.do")
						.append("?email=")
						.append(vo.getEmail())
						.append("&authkey=")
						.append(authkey)
						.append("' target='_blank'>이메일 인증 확인</a>")
						.toString());
				sendMail.setFrom("testcho0701@gmail.com", "Food Sharing 관리자");
				sendMail.setTo(vo.getEmail());
				sendMail.send();*/
		
	}

	@Override
	public String idcheck(String id) throws Exception {
		
		return loginDao.idcheck(id);
	}

	@Override
	public String emailcheck(String email) throws Exception {
		
		return loginDao.emailcheck(email);
	}

	@Override
	public String phonecheck(String phone) throws Exception {
		
		return loginDao.phonecheck(phone);
	}
	
	@Override
	public void updateAuthKey(MemberVo vo) throws Exception {
		
		loginDao.updateAuthKey(vo);
	}

	@Override
	public void userAuth(String email) throws Exception {
		
		loginDao.userAuth(email);
	}

	

}
