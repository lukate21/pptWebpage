package kr.co.ppt.dao;

import org.springframework.stereotype.Repository;

import kr.co.ppt.vo.MemberVO;

@Repository
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
