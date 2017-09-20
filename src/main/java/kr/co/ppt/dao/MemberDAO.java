package kr.co.ppt.dao;


import kr.co.ppt.vo.MemberVO;


public interface MemberDAO {

	MemberVO logIn(MemberVO user);
	
	// 회원가입
	int insertUser(MemberVO user);
	
	// 탈퇴
	int deleteUser(MemberVO user);
	
	// 수정
	int modifyUser(MemberVO user);
	
	// 회원조회
	int selectUser();
}
