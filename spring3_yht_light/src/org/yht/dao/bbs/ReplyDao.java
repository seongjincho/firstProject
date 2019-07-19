package org.yht.dao.bbs;



import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("ReplyDao")
public class ReplyDao {
	
	@Resource(name="sqlSession")
	SqlSession sqlSession;
}
