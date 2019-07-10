package org.yht.dao.bbs;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("FoodDao")
public class FoodDao {

	@Resource(name="sqlSession")
	SqlSession sqlSession;
}
