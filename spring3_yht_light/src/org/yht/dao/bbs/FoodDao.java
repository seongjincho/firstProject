package org.yht.dao.bbs;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yht.domain.test01.FoodParam;
import org.yht.domain.test01.FoodVo;

@Repository("FoodDao")
public class FoodDao {

	@Resource(name="sqlSession")
	SqlSession sqlSession;
	
	public List<FoodVo> getFoodList(FoodParam param) {
		
		return sqlSession.selectList("Food.getFoodList", param);
		
	}
	
	public int getFoodCount(FoodParam param) {
		
		return sqlSession.selectOne("Food.getFoodCount", param);
		
	}
}
