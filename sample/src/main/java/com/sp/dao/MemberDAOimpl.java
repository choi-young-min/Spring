package com.sp.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sp.domain.MemberVO;

@Repository
public class MemberDAOimpl implements MemberDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int insertMember(MemberVO vo) throws Exception {
		return sqlSession.insert("member.insertMember",vo);
	}

	@Override
	public MemberVO getMember(String id) throws Exception {
		return sqlSession.selectOne("member.loginMember", id);
	}
}
