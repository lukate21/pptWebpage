package kr.co.ppt.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ppt.dao.MemberDAO;
import kr.co.ppt.service.MemberService;
import kr.co.ppt.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int join(MemberVO member) {
		int result = memberDAO.insertUser(member);
		System.out.println(result);
		return result;
	}

	@Override
	public MemberVO login(MemberVO member) {
		MemberVO memberVO = null;
		try {
			memberVO = memberDAO.logIn(member);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return memberVO;
	}

}
