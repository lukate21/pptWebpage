package kr.co.ppt.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ppt.dao.MemberDAO;
import kr.co.ppt.daoImpl.MemberDAOImpl;
import kr.co.ppt.service.MemberService;
import kr.co.ppt.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAOImpl memberDAO;
	
	@Override
	public int join(MemberVO member) {
		int result = memberDAO.insertUser(member);
		return result;
	}

	@Override
	public MemberVO login(MemberVO member) {
		MemberVO memberVO = null;
		try {
			memberVO = memberDAO.login(member);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return memberVO;
	}

	@Override
	public int idCheck(MemberVO member) {
		int result = 1;
		
		MemberVO memberVO = memberDAO.idCheck(member);
		
		if(memberVO == null) result = 0; //db에 id가 없는 경우

		return result;
	}

	@Override
	public int passwordCheck(String password) {
		
		String pCheck = memberDAO.passwordCheck(password);
		if(pCheck == null)
			return 0;
		else
			return 1;
	}

	@Override
	public MemberVO getUserInfo(MemberVO member) {
		MemberVO loginUser = memberDAO.getUserInfo(member);
		return loginUser;
	}

	@Override
	public int modifyUser(MemberVO member) {
		int result = memberDAO.modifyUser(member);
		return result;
	}
	
}
