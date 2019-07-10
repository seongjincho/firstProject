package org.yht.service.bbs.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.yht.dao.bbs.FoodDao;
import org.yht.service.bbs.FoodService;


@Service("FoodService")
public class FoodServiceImpl implements FoodService {

	@Resource(name="FoodDao")
	FoodDao foodDao; 
}
