package com.sp.service;

import com.sp.domain.MemberVO;

public interface MemberService {
	public int insertMember(MemberVO vo)throws Exception;
	public MemberVO loginMember(String id) throws Exception;
}
