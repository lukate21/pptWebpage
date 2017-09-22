package kr.co.ppt.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ppt.service.MemberService;
import kr.co.ppt.util.SHA_ENC;
import kr.co.ppt.vo.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	/**
	 * 메인 홈 화면
	 */
	@RequestMapping("hello.do")
	public String home(){
		return "mainPage";
	}
	
	/**
	 * 회원가입 화면
	 */
	@RequestMapping(value="join.do", method=RequestMethod.GET )
	public String joinForm(){
		return "";
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.POST )
	public String join(String email, String password, String name, String tel){
		
		MemberVO member = makeBasicInfo(email, password);
		member.setName(name);
		member.setTel(tel);
		
		int result = memberService.join(member);
		
		System.out.println("result val : " + result);
		
		if(result == 1)
			return "mainPage";
		else
			return "";
	}
	
	@ResponseBody
	@RequestMapping(value="idCheck.json", method=RequestMethod.POST)
	public int idCheck(String email){
		
		String id = email.split("@")[0];
		String domain = email.split("@")[1];
		
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setDomain(domain);
		
		int result = memberService.idCheck(member);
		return result;
	}
	
	/**
	 * 비밀번호 틀린지 체크
	 */
	@ResponseBody
	@RequestMapping(value="checkPassword.json", method=RequestMethod.POST)
	public int checkPassword(String password){
		int result = memberService.passwordCheck(SHA_ENC.SHA256_Encrypt(password));
		return result;
	}

	/**
	 * 로그인 화면
	 */
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String loginForm(HttpServletRequest req){

		return "login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(String email,String password, String remember, 
			HttpSession session, HttpServletRequest request, HttpServletResponse response){
		
		MemberVO member = makeBasicInfo(email, password);
		System.out.println("remember: "+remember);

		MemberVO loginUser = memberService.login(member);
		if(loginUser != null){
			if(remember != null && remember.equals("stay")){
				Cookie cookie = new Cookie("user_remember", remember);
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*7); // 단위는 (초)임으로 7일정도로 유효시간을 설정해 준다.
				response.addCookie(cookie);
			}
			
			session.setAttribute("loginUser", loginUser);
			String msg = "로그인에 성공했습니다.";
			String ref = "hello.do";
			
			request.setAttribute("msg", msg);
			request.setAttribute("ref", ref);
		} else {
			String msg = "아이디 또는 비밀번호가 잘못되었습니다.";
			String ref = "login.do";
			
			request.setAttribute("msg", msg);
			request.setAttribute("ref", ref);
		}
		
		return "messageAlert";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session, HttpServletRequest request){
		session.invalidate();
		
		String msg = "로그아웃 되었습니다.";
		String ref = "hello.do";
		
		request.setAttribute("msg", msg);
		request.setAttribute("ref", ref);
		
		return "messageAlert";
	}
	
	@ResponseBody
	@RequestMapping("stock.json")
	public void getStock(){
		
	}
	
	@ResponseBody
	@RequestMapping("favorite.json")
	public void getFavorite(){
		
	}
	
	@ResponseBody
	@RequestMapping("recommend.json")
	public void getRecommend(){
		
	}
	
	/**
	 * mobileLogin
	 * @param email
	 * @param password
	 * @return result 1 | 0
	 */
	@ResponseBody
	@RequestMapping(value="loginM.do", method=RequestMethod.POST)
	public String mobileLogin(String email, String password){
		
		int result = 0;
		String memberData = "";
		MemberVO member = makeBasicInfo(email, password);
		
		MemberVO loginUser = memberService.login(member);

		if(loginUser != null)
			result = 1;
		else 
			result = 0;
		
		memberData = "{ \"result\" : \""+result+"\", \"id\" : \""+ loginUser.getId()+"\", \"domain\" : \""+ loginUser.getDomain()
		+"\", \"name\" : \""+loginUser.getName()+"\", \"tel\" : \""+loginUser.getTel()+"\"}";
		
		return memberData;
	}
	
	/**
	 * mobileJoin
	 * @param email
	 * @param password
	 * @param name
	 * @param tel
	 * @return result 1 | 0
	 */
	@ResponseBody
	@RequestMapping(value="joinM.do", method=RequestMethod.POST)
	public int mobileJoin(String email, String password, String name, String tel){
		
		MemberVO member = makeBasicInfo(email, password);
		member.setName(name);
		member.setTel(tel);
		
		int result = memberService.join(member);
		
		return result;
	}
	
	private MemberVO makeBasicInfo(String email, String password){
		MemberVO member = new MemberVO();
		member.setId(email.split("@")[0]);
		member.setDomain(email.split("@")[1]);
		member.setPassword(SHA_ENC.SHA256_Encrypt(password));
		
		return member;
	}
}
