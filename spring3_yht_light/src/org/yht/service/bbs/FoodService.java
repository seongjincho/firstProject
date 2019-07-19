package org.yht.service.bbs;

import java.util.List;

import org.yht.domain.test01.AttachVo;
import org.yht.domain.test01.FoodParam;
import org.yht.domain.test01.FoodVo;
import org.yht.domain.test01.JoinVo;
import org.yht.domain.test01.LikeVo;
import org.yht.domain.test01.ReplyVo;

public interface FoodService {

	public List<FoodVo> getFoodList(FoodParam param); 
	public int getFoodCount(FoodParam param);	
	public void writeFood(FoodVo fv) throws Exception;
	public List<FoodVo> detailFood(int food_seq);
	
	public List<AttachVo> getAttach(int food_seq);
	public boolean read_cnt(int food_seq); 
	public LikeVo checkLikeId(LikeVo vo);
	public JoinVo checkJoinId(JoinVo vo);
	public boolean writeFoodJoin(FoodVo fv);
	public List<ReplyVo> replyList(int food_seq);

	
}
