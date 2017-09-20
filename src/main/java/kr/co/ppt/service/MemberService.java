package kr.co.ppt.service;


import kr.co.ppt.vo.MemberVO;

public interface MemberService {
	
	public MemberVO login(MemberVO member);
	public int join(MemberVO member);
}
