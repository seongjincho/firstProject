package org.yht.service.login.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
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

	@Override
	public boolean regiAf(MemberVo vo) throws Exception {
		
		return loginDao.regiAf(vo);
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
	

}
