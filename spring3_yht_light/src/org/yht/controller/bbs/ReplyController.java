package org.yht.controller.bbs;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.yht.service.bbs.ReplyService;

@Controller
public class ReplyController {

	@Resource(name="ReplyService")
	ReplyService replyService;
}
