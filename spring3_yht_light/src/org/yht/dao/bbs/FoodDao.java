package org.yht.dao.bbs;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yht.domain.test01.AttachVo;
import org.yht.domain.test01.FoodParam;
import org.yht.domain.test01.FoodVo;
import org.yht.domain.test01.JoinVo;
import org.yht.domain.test01.LikeVo;
import org.yht.domain.test01.ReplyVo;

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
	
	public void writeFood(FoodVo fv) throws Exception  {
		
		sqlSession.insert("Food.writeFood", fv);
		
		
	}
	
	public List<FoodVo> detailFood(int food_seq) {
		
		return sqlSession.selectList("Food.detailFood", food_seq);
	}
	
	
	//파일 업로드
	public List<AttachVo> getAttach(int food_seq){
		
		return sqlSession.selectList("Food.getAttach", food_seq);
		
	}
	
	public void addAttach(String fullname) {
		
		 sqlSession.insert("Food.addAttach", fullname);
		
	}
	
	public boolean read_cnt(int food_seq) {
	
		int n = sqlSession.update("Food.read_cnt", food_seq);
		
		return n>0?true:false;
		
	}
	
	public LikeVo checkLikeId(LikeVo vo) {
		
		return sqlSession.selectOne("Food.checkLikeId", vo);
		
	} 
	
	public JoinVo checkJoinId(JoinVo vo) {
		
		return sqlSession.selectOne("Food.checkJoinId", vo);
		
	} 
	
	public boolean writeFoodJoin(FoodVo fv) {
		
		int n = sqlSession.insert("Food.writeFoodJoin", fv);
		
		return n>0?true:false;
	}
	
	public List<ReplyVo> replyList(int food_seq){
		return sqlSession.selectList("Food.replyList", food_seq);
	}
	


}
