package kr.co.ppt.service;


import kr.co.ppt.vo.MemberVO;

public interface MemberService {
	
	public MemberVO login(MemberVO member);
	public int join(MemberVO member);
	public int idCheck(MemberVO member);
	public int passwordCheck(String password);
	public MemberVO getUserInfo(MemberVO member);
	public int modifyUser(MemberVO member);
	public String deleteUser(int no);
}
