package org.yht.service.bbs.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yht.dao.bbs.FoodDao;
import org.yht.domain.test01.AttachVo;
import org.yht.domain.test01.FoodParam;
import org.yht.domain.test01.FoodVo;
import org.yht.domain.test01.JoinVo;
import org.yht.domain.test01.LikeVo;
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

	@Transactional
	@Override
	public void writeFood(FoodVo fv) throws Exception  {
		
		System.out.println("foodService--------" + fv.toString());
		
		foodDao.writeFood(fv);
		
		// 게시물의 첨부파일 정보 등록   
		String[] files = fv.getFiles(); // 첨부파일 배열
		System.out.println("배열에 저장됨 : " + files);
		if (files == null)
			return; // 첨부파일이 없으면 메서드 종료
		// 첨부파일들의 정보를 tbl_attach 테이블에 insert
		for (String name : files) {
			foodDao.addAttach(name);
			System.out.println("name : " + name);
		}
	}
	

	@Override
	public List<FoodVo> detailFood(int food_seq) {
		
		return foodDao.detailFood(food_seq);
	}

	@Override
	public List<AttachVo> getAttach(int food_seq) {
		
		return foodDao.getAttach(food_seq);
	}

	@Override
	public boolean read_cnt(int food_seq) {
		
		return foodDao.read_cnt(food_seq);
	}

	@Override
	public LikeVo checkLikeId(LikeVo vo) {
		
		return foodDao.checkLikeId(vo);
	}

	@Override
	public JoinVo checkJoinId(JoinVo vo) {
		
		return foodDao.checkJoinId(vo);
	}

	

	
	
	
	
	
}
