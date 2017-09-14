package kr.co.ppt.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.ppt.dao.MemberDAO;
import kr.co.ppt.service.MemberService;
import kr.co.ppt.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	MemberVO memberVO;

	
	
	@Override
	public int join(MemberVO member) {
		int result = memberDAO.insertUser(member);
		return result;
	}

	@Override
	public void login(MemberVO member) {
		memberVO = memberDAO.logIn(member);
	}

}
