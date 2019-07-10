package org.yht.dao.bbs;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yht.domain.test01.NoticeParam;
import org.yht.domain.test01.NoticeVo;

@Repository("NoticeDao")
public class NoticeDao {
	
	@Resource(name="sqlSession")
	SqlSession sqlSession;
	
	public List<NoticeVo> getNoticeList(NoticeParam param){
		return sqlSession.selectList("Notice.getNoticeList", param);
	}
	public int getNoticeCount(NoticeParam param) {
		return sqlSession.selectOne("Notice.getNoticeCount", param);
	}
	public boolean writeNotice(NoticeVo vo) {
		int n = sqlSession.insert("Notice.writeNotice", vo);
		return n>0?true:false;
	} 
	public NoticeVo getNotice(int notice_seq) {
		return sqlSession.selectOne("Notice.getNotice", notice_seq);
	}
	
	public boolean updateNotice(NoticeVo vo) {
		int n = sqlSession.insert("Notice.updateNotice", vo);
		return n>0?true:false;
	}
	public boolean deleteNotice(int notice_seq) {
		int n = sqlSession.insert("Notice.deleteNotice", notice_seq);
		return n>0?true:false;
	}
	public boolean noticeReadcount(int notice_seq) {
		int n = sqlSession.insert("Notice.noticeReadcount", notice_seq);
		return n>0?true:false;
	}
	public int getNoticeReadcount(int notice_seq) {
		return sqlSession.insert("Notice.getNoticeReadcount", notice_seq);
		
	}

}
