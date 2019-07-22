package org.yht.controller.bbs;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yht.domain.test01.ReplyVo;
import org.yht.service.bbs.ReplyService;

@Controller
public class ReplyController {

	@Resource(name="ReplyService")
	ReplyService replyService;
	
	@ResponseBody
	@RequestMapping(value="replyInsert.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String replyInsert(ReplyVo vo) {
		
		boolean isS = replyService.replyInsert(vo);
		String msg = "";
		
		
		if(isS) {
			System.out.println("댓글 입력 성공 ");
			msg = "OK";
		}else {
			System.out.println("댓글 입력 실패 ");
			msg = "NO";
		}
		
		return msg;
	}
	
  @ResponseBody
  @RequestMapping(value="replyDelete.do", method= {RequestMethod.GET, RequestMethod.POST})
  public String replyDelete(ReplyVo vo) {
	  
	  boolean isS = replyService.replyDelete(vo);
	  String msg = "";
	  
		if(isS) {
			System.out.println("댓글 삭제 성공 ");
			msg = "OK";
		}else {
			System.out.println("댓글 삭제 실패 ");
			msg = "NO";
		}
		
		return msg;
  }
  
  @ResponseBody
  @RequestMapping(value = "replyUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
  public String replyUpdate(ReplyVo vo) {
	  
	  System.out.println(vo.toString());
	  
	  boolean isS = replyService.replyUpdate(vo);
	  String msg = "";
	  
		if(isS) {
			System.out.println("댓글 수정 성공 ");
			msg = "OK";
		}else {
			System.out.println("댓글 수정 실패 ");
			msg = "NO";
		}
		
		return msg;
  }
  
  @ResponseBody
  @RequestMapping(value="reReply.do", method = {})
  public void reReply(ReplyVo vo) {
	  System.out.println(vo.toString());
	  
	  replyService.reReply(vo);

	  
	  System.out.println("성공?");

	  
  }
  
}
