package org.yht.dao.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public boolean regiAf(MemberVo vo) throws Exception{
		
		int n = sqlSession.insert("login.regiAf", vo);
		return n>0?true:false;
		
	}
	
	public String idcheck(String id) throws Exception{
		
		return sqlSession.selectOne("login.idcheck", id);
	}
	
	
}
