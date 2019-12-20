package com.sp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sp.dao.MemberDAO;
import com.sp.domain.MemberVO;

@Service
public class MemberServiceimpl implements MemberService{

	@Inject
	MemberDAO dao;
	
	@Override
	public int insertMember(MemberVO vo) throws Exception {
		return dao.insertMember(vo);
	}

	@Override
	public MemberVO loginMember(String id) throws Exception {
		return (MemberVO)dao.getMember(id);
	}

}
