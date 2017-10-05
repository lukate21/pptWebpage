package kr.co.ppt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ppt.service.MemberService;
import kr.co.ppt.util.SHA_ENC;
import kr.co.ppt.util.UserUtil;
import kr.co.ppt.vo.MemberVO;

@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
	@Autowired
	MemberService memberService;

	@RequestMapping(value="modifyCheck.do", method=RequestMethod.GET)
	public String myPage() {
		return "myPage/myPageCheck";
	}
	
	@RequestMapping(value="modifyCheck.do", method=RequestMethod.POST)
	public String modifyPage(String id, String domain, String password, HttpServletRequest request) {
		String email = id+"@"+domain;
		System.out.println(email);
		MemberVO member = UserUtil.makeBasicInfo(email, password);
		System.out.println(member);
		
		MemberVO loginUser = memberService.getUserInfo(member);
		if(loginUser != null)
			return "myPage/myPage";
		else {
			String msg = "일치하는 정보가 없습니다.";
			String ref = "myPage.do";
			UserUtil.makeMessage(msg, ref, request);
			
			return "messageAlert";
		}
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public String modify(String email, String password, String tel, HttpServletRequest request) {
		MemberVO member = UserUtil.makeBasicInfo(email, password);
		if(tel != null)
			member.setTel(tel);
		
		int result = memberService.modifyUser(member);
		if(result == 1) {
			String msg = "수정되었습니다.";
			String ref = "hello.do";
			UserUtil.makeMessage(msg, ref, request);
			return "messageAlert";
		} else {
			String msg = "수정 실패했습니다.";
			String ref = "myPage.do";
			UserUtil.makeMessage(msg, ref, request);
			return "messageAlert";
		}
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public String test(String password) {
		String ppp = SHA_ENC.SHA256_Encrypt(password);
		return ppp;
	}
	
	@RequestMapping("myStock.do")
	public String myStock(){
		return "myPage/myStock";
	}
	
	
}
