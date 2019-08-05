package org.yht.dao.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yht.domain.test01.AttachVo;
import org.yht.domain.test01.FoodParam;
import org.yht.domain.test01.FoodVo;
import org.yht.domain.test01.JoinVo;
import org.yht.domain.test01.LikeVo;
import org.yht.domain.test01.MemberVo;
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
	
	public boolean updateFood(FoodVo vo)  throws Exception {
		
		int n = sqlSession.update("Food.updateFood", vo);
		
		return n>0?true:false;
	}
	
	public boolean deleteFood(int food_seq) {
		
		int n = sqlSession.update("Food.deleteFood", food_seq);
		
		return n>0?true:false;
		
	}
	
	
	//파일 업로드
	public List<AttachVo> getAttach(int food_seq){
		
		return sqlSession.selectList("Food.getAttach", food_seq);
		
	}
	
	public void addAttach(String fullname) {
		
		 sqlSession.insert("Food.addAttach", fullname);
		
	}
	
	public void updateAttach(String fullname, int food_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullname", fullname);
		map.put("food_seq", food_seq);
		sqlSession.insert("Food.updateAttach", map);
	}

	public void udpateAttach2(int food_seq) {
		sqlSession.delete("Food.updateAttach2", food_seq);
	}
	public void deleteAttach(String fullname) {
		sqlSession.delete("Food.deleteAttach", fullname);
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
	
	public List<MemberVo> likeMemberList(int food_seq){
		return sqlSession.selectList("Food.likeMemberList", food_seq);
	}

}
