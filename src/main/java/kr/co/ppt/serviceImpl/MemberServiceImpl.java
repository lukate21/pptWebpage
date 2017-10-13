package kr.co.ppt.serviceImpl;

import java.util.Random;

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
	
	@Override
	public String deleteUser(int no){
		int result = memberDAO.deleteUser(no);
		String msg ="";
		
		if(result == 0) msg = "실패";
		else msg = "성공";
		
		return msg;
	}
	
	@Override
	public String findId(MemberVO memberVO){
		MemberVO member = memberDAO.findId(memberVO);
		String result = "";
		
		if(member != null)
			result = member.getId()+"@"+ member.getDomain();
		else
			result = "없습니다";
		
		return result;
	}
	
	@Override
	public String findPassword(MemberVO memberVO){
		String password = memberDAO.findPassword(memberVO);
		String newOne = "";
		if(password != null){
			newOne = password+","+temporaryPassword(6);
		}else{
			newOne = "찾는 비밀번호가 존재하지 않습니다.";
		}
		
		return newOne;
	}
	
	public static String temporaryPassword(int size) {
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		
		String ele = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,"
				+ "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9";
		
		String chars[] = ele.split(",");
				
		for (int i = 0; i < size; i++) {
		buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
		}


}
