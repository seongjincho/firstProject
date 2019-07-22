package org.yht.service.bbs;

import org.yht.domain.test01.ReplyVo;

public interface ReplyService {

	public boolean replyInsert(ReplyVo vo);
	public boolean replyDelete(ReplyVo vo);
	public boolean replyUpdate(ReplyVo vo);
	public void reReply(ReplyVo vo);
	
	
}
