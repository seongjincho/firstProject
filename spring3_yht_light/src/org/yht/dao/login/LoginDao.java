package org.yht.dao.login;



import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import org.yht.domain.test01.MemberVo;


@Repository("LoginDao")
public class LoginDao {
	protected static final Log logger = LogFactory.getLog(LoginDao.class);
	
	 @Resource(name="sqlSession")
	 SqlSession sqlSession;
	 

	 
	/**
	 * 사용자 정보 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MemberVo getUserInfo(MemberVo vo) throws Exception{
		
		return (MemberVo)sqlSession.selectOne("login.getUserInfo", vo);
		
	}
	
	public void regiAf(MemberVo vo) throws Exception{
		
		sqlSession.insert("login.regiAf", vo);
		
		
	}
	
	public String idcheck(String id) throws Exception{
		
		return sqlSession.selectOne("login.idcheck", id);
	}
	
	public String emailcheck(String email) throws Exception{
		
		return sqlSession.selectOne("login.emailcheck", email);
	}
	
	public String phonecheck(String phone) throws Exception{
		
		return sqlSession.selectOne("login.phonecheck", phone);
		
	}
	
	public void updateAuthKey(MemberVo vo) throws Exception{
		
		sqlSession.update("login.updateAuthKey", vo);
		
	}
	
	public void userAuth(String email) throws Exception{
		
		sqlSession.update("login.userAuth", email);
		
	}
	
	
	
}
