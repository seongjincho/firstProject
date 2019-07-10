package org.yht.service.bbs;

import java.util.List;

import org.yht.domain.test01.NoticeParam;
import org.yht.domain.test01.NoticeVo;

public interface NoticeService {

	public List<NoticeVo> getNoticeList(NoticeParam param);
	public int getNoticeCount(NoticeParam param);
	public boolean writeNotice(NoticeVo vo);
	public NoticeVo getNotice(int notice_seq);
	public boolean updateNotice(NoticeVo vo);
	public boolean deleteNotice(int notice_seq);
	public boolean noticeReadcount(int notice_seq);
	public int getNoticeReadcount(int notice_seq);
}
