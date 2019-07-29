package org.yht.controller.bbs;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yht.domain.test01.NoticeParam;
import org.yht.domain.test01.NoticeVo;
import org.yht.service.bbs.NoticeService;

@Controller
public class NoticeController {
	
	@Resource(name="NoticeService")
	NoticeService noticeService;
	
	@RequestMapping(value = "noticeBbsList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeBbsList(Model model, NoticeParam param) {
		
				// paging 처리
				int sn = param.getPageNumber();
				int start = (sn) * param.getRecordCountPerPage() + 1;
				int end = (sn+1) * param.getRecordCountPerPage();
				
				param.setStart(start);
				param.setEnd(end);
				
				List<NoticeVo> noticeBbsList = noticeService.getNoticeList(param);
				
				// 글의 총 갯수
				int totalRecordCount = noticeService.getNoticeCount(param);
				
				System.out.println("noticeBbsList:" + noticeBbsList.size());
				
				model.addAttribute("noticeBbsList", noticeBbsList);
				
				model.addAttribute("pageNumber", sn);
				model.addAttribute("pageCountPerScreen", 10);
				model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
				model.addAttribute("totalRecordCount", totalRecordCount);
				
				model.addAttribute("n_category", param.getN_category());
				model.addAttribute("n_keyword", param.getN_keyword());
				
				System.out.println("카테고리: " + param.getN_category() + " 검색어: " + param.getN_keyword());
				
				return "noticeBbs/noticeBbsList";
	}
	
	@RequestMapping(value = "writeNotice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeNotice() {
		
			System.out.println("notice 글쓰기로 이동");
		
		return "noticeBbs/noticeWrite";
	}
	
	@RequestMapping(value = "writeNoticeAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeNoticeAf(NoticeVo nv) {
		
			
		
			System.out.println("notice 글쓰기 등록 --" + nv.toString());
			String src = "";
			boolean isS = noticeService.writeNotice(nv);
			
			if(isS) {
				System.out.println("notice 글쓰기 완료!");
				src = "redirect:/noticeBbsList.do";
				
			}else {
				System.out.println("notice 글쓰기 실패!");
				src = "redirect:/writeNotice.do";
			}
		
			return src;
	}
	
	@RequestMapping(value="noticeUpdate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticeUpdate(int notice_seq, Model model) {
		System.out.println("noticeUpdate진입---");
		NoticeVo noticeUpdate = noticeService.getNotice(notice_seq);
		System.out.println(noticeUpdate.toString());
		model.addAttribute("noticeUpdate", noticeUpdate);
		
		return "noticeBbs/noticeUpdate";
	}
	
	@RequestMapping(value="noticeUpdateAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticeUpdateAf(NoticeVo nv, Model model) {
		
		String src = "";
		boolean isS = noticeService.updateNotice(nv);
		
		if(isS) {
			
			System.out.println("notice update 완료");
			src = "redirect:/noticeBbsList.do";
			
		}else {
			
			System.out.println("notice update 실패");
			src = "redirect:/noticeUpdate.do";
			
		}
		
		
		return src;
	}
	

	
	@RequestMapping(value="noticeDelete.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String noticeDelete(int notice_seq) {
		
		String src = "";
		boolean isS = noticeService.deleteNotice(notice_seq);
		
		if(isS) {
			
			System.out.println("noticeDelete 완료");
			src = "redirect:/noticeBbsList.do";
			
		}else {
			
			System.out.println("noticeDelete 실패");
			src = "redirect:/noticeUpdate.do";
			
		}
		
		
		return src;
	}
	
	@ResponseBody
	@RequestMapping(value = "noticeReadcount.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int noticeReadcount(int notice_seq) {
		
		System.out.println("notice_seq:" + notice_seq);
		
		
		noticeService.noticeReadcount(notice_seq);
		int readcount = noticeService.getNoticeReadcount(notice_seq);
		
		System.out.println("readcount:" + readcount);
		
		return readcount;
	}
	

}
