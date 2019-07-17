package org.yht.service.bbs;

import org.yht.domain.test01.JoinVo;

public interface JoinService {
	
	public boolean joinInsert(JoinVo vo);
	public JoinVo getJoin(JoinVo vo);
	public boolean joinDel(JoinVo vo);
	public boolean join_cnt(JoinVo vo);
}
