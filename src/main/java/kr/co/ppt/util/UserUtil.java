package kr.co.ppt.util;

import javax.servlet.http.HttpServletRequest;

import kr.co.ppt.vo.MemberVO;

public class UserUtil {

	public static MemberVO makeBasicInfo(String email, String password){
		MemberVO member = new MemberVO();
		member.setId(email.split("@")[0]);
		member.setDomain(email.split("@")[1]);
		member.setPassword(SHA_ENC.SHA256_Encrypt(password));
		
		return member;
	}
	
	public static void makeMessage(String msg, String ref, HttpServletRequest request) {
		request.setAttribute("msg", msg);
		request.setAttribute("ref", ref);
	}
}
