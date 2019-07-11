package org.yht.service.bbs.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.yht.dao.bbs.FoodDao;
import org.yht.domain.test01.FoodParam;
import org.yht.domain.test01.FoodVo;
import org.yht.service.bbs.FoodService;


@Service("FoodService")
public class FoodServiceImpl implements FoodService {

	@Resource(name="FoodDao")
	FoodDao foodDao;

	@Override
	public List<FoodVo> getFoodList(FoodParam param) {
		
		return foodDao.getFoodList(param);
	}

	@Override
	public int getFoodCount(FoodParam param) {
		
		return foodDao.getFoodCount(param);
	} 
	
	
	
	
}
