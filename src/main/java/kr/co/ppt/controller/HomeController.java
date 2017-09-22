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
	public String login(String email,String password, 
			HttpSession session, HttpServletRequest request, HttpServletResponse response){
		
		MemberVO member = makeBasicInfo(email, password);
		String remember = request.getParameter("remember");
		System.out.println("remember: "+remember);

		MemberVO loginUser = memberService.login(member);
		if(loginUser != null){
			if(remember != null){
				Cookie savedId = new Cookie("savedId", member.getId()+"@"+member.getDomain());
				Cookie savedPassword = new Cookie("savedPassword", password);
				Cookie savedCheck = new Cookie("savedCheck", "checked");
				
				savedId.setMaxAge(60*60*24*15); // 단위는 (초)임으로 15일정도로 유효시간을 설정해 준다.
				savedPassword.setMaxAge(60*60*24*15); // 단위는 (초)임으로 15일정도로 유효시간을 설정해 준다.
				savedCheck.setMaxAge(60*60*24*15);

				response.addCookie(savedId);
				response.addCookie(savedPassword);
				response.addCookie(savedCheck);
				System.out.println("쿠키에 저장된 정보");
				System.out.println("savedId key : "+ savedId.getName() +", value : " + savedId.getValue());
				System.out.println("savedPassword key : "+ savedPassword.getName() +", value : " + savedPassword.getValue());
			} else {
				System.out.println("==유저정보삭제==");
				Cookie[] cookies = request.getCookies();
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("savedId") || cookie.getName().equals("savedPassword") || cookie.getName().equals("savedCheck")){
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
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

		if(loginUser != null) {
			result = 1;
			memberData = "{ \"result\" : \""+result+"\", \"id\" : \""+ loginUser.getId()+"\", \"domain\" : \""+ loginUser.getDomain()
			+"\", \"name\" : \""+loginUser.getName()+"\", \"tel\" : \""+loginUser.getTel()+"\"}";
			
			return memberData;
		}
		else 
			return "{\"result\" : \""+result+"\"}"; 
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
