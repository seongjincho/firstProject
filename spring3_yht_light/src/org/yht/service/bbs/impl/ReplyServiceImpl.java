package org.yht.service.bbs.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.yht.dao.bbs.ReplyDao;
import org.yht.service.bbs.ReplyService;

@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService {

	@Resource(name="ReplyDao")
	ReplyDao replyDao; 
}
