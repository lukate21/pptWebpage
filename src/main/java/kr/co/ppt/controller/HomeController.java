package kr.co.ppt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ppt.service.MemberService;
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
	@RequestMapping(value="signin.do", method=RequestMethod.GET )
	public String signInForm(){
		return "";
	}
	
	@RequestMapping(value="signin.do", method=RequestMethod.POST )
	public void signIn(){
		
	}
	
	/**
	 * 비밀번호 틀린지 체크
	 */
	@ResponseBody
	@RequestMapping(value="checkPassword.json", method=RequestMethod.POST)
	public void checkPassword(){
		
	}

	/**
	 * 로그인 화면
	 */
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String logInForm(){
		return "login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String logIn(MemberVO user){
		memberService.login(user);
		return "mainPage";
	}
	
	@ResponseBody
	@RequestMapping("newsHeadline.json")
	public void getNewsHeadline(){

	}
	
	@ResponseBody
	@RequestMapping("newsCategoty.json")
	public void getNewsCategory(){
		
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
}
