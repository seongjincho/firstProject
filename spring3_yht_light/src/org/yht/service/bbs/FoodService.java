package org.yht.service.bbs;

import java.util.List;

import org.yht.domain.test01.AttachVo;
import org.yht.domain.test01.FoodParam;
import org.yht.domain.test01.FoodVo;

public interface FoodService {

	public List<FoodVo> getFoodList(FoodParam param); 
	public int getFoodCount(FoodParam param);	
	public void writeFood(FoodVo fv) throws Exception;
	
	public List<String> getAttach(int food_seq);
	
}
