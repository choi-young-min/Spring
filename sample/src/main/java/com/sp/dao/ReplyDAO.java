package com.sp.dao;

import java.util.List;

import com.sp.domain.ReplyVO;

public interface ReplyDAO {
	public float getReplyCount(int bno) throws Exception;
	public List<ReplyVO> getReplyList(int bno, int start, int cnt) throws Exception;
	public int insertReply(ReplyVO vo) throws Exception;
	public int replyDelete(int rno) throws Exception;
}
