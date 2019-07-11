package org.yht.service.bbs;

import java.util.List;

import org.yht.domain.test01.FoodParam;
import org.yht.domain.test01.FoodVo;

public interface FoodService {

	public List<FoodVo> getFoodList(FoodParam param); 
	public int getFoodCount(FoodParam param);	
	
}
