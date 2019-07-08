package org.yht.service.login;

import java.util.List;


import org.yht.domain.test01.MemberVo;


public interface LoginService {
	
	public MemberVo login(MemberVo vo) throws Exception;
	public void regiAf(MemberVo vo) throws Exception;
	public String idcheck(String id) throws Exception;
	public String emailcheck(String email) throws Exception;
	public String phonecheck(String phone) throws Exception;
	public void updateAuthKey(MemberVo vo) throws Exception;
	public void userAuth(String email) throws Exception;
	
}
