package com.sp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sp.domain.ReplyVO;

@Repository
public class ReplyDAOimpl implements ReplyDAO{
	@Inject
	SqlSession session;
	
	@Override
	public float getReplyCount(int bno) throws Exception {
		return session.selectOne("reply.getReplyCount",bno);
	}

	@Override
	public List<ReplyVO> getReplyList(int bno, int start, int cnt) throws Exception {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("bno",bno);
		map.put("start",start);
		map.put("cnt",cnt);
		System.out.println(bno+start+cnt);
		return session.selectList("reply.getReplyList",map);
	}

	@Override
	public int insertReply(ReplyVO vo) throws Exception {
		return session.insert("reply.insertReply",vo);
	}

	@Override
	public int replyDelete(int rno) throws Exception {
		return session.delete("reply.deleteReply",rno);
	}
	
	
}
