package com.sp.dao;

import com.sp.domain.MemberVO;

public interface MemberDAO {
	
	public int insertMember(MemberVO vo) throws Exception;
	
	public MemberVO getMember(String id) throws Exception;
	
}
