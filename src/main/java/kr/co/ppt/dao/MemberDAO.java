package kr.co.ppt.dao;


import kr.co.ppt.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO member);
	
	// 회원가입
	int insertUser(MemberVO member);
	
	// 탈퇴
	int deleteUser(MemberVO member);
	
	// 수정
	int modifyUser(MemberVO member);
	
	// 회원조회
	int selectUser();
	
	// id중복체크
	MemberVO idCheck(MemberVO member);
	
	// password확인
	String passwordCheck(String password);
}
