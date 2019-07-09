package org.yht.service.login.impl;



import javax.annotation.Resource;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yht.dao.login.LoginDao;

import org.yht.domain.test01.MemberVo;
import org.yht.service.login.LoginService;





@Service("LoginService")
public class LoginServiceImpl implements LoginService {
	protected static final Log logger = LogFactory.getLog(LoginServiceImpl.class);
	
	@Resource(name="LoginDao")
	LoginDao loginDao;
	
	@Override
	public MemberVo login(MemberVo vo) throws Exception {
		return loginDao.getUserInfo(vo);
	}
	
	@Transactional
	@Override
	public void regiAf(MemberVo vo) throws Exception {
		
		loginDao.regiAf(vo);
		

		

		
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
