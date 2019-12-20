package com.sp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sp.dao.ReplyDAO;
import com.sp.domain.ReplyVO;

@Service
public class ReplyServiceimpl implements ReplyService{
	@Inject
	ReplyDAO dao;
	
	@Override
	public float getReplyCount(int bno) throws Exception {
		return dao.getReplyCount(bno);
	}

	@Override
	public List<ReplyVO> getReplyList(int bno, int start, int cnt) throws Exception {
		return dao.getReplyList(bno, start, cnt);
	}

	@Override
	public int insertReply(ReplyVO vo) throws Exception {
		return dao.insertReply(vo);
	}

	@Override
	public int replyDelete(int rno) throws Exception {
		return dao.replyDelete(rno);
	}
	
	
}
