package org.yht.service.bbs;

import org.yht.domain.test01.LikeVo;

public interface LikeService {
	
	public boolean likeInsert(LikeVo vo); 
	public LikeVo getLike(LikeVo vo); 
	public boolean likeDel(LikeVo vo);
	public boolean like_cnt(LikeVo vo);
		
}
