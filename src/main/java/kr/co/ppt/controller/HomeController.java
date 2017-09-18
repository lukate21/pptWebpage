package kr.co.ppt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ppt.vo.MemberVO;

@Controller
public class HomeController {
	
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
	public static String signInForm(){
		return "";
	}
	
	@RequestMapping(value="signin.do", method=RequestMethod.POST )
	public static void signIn(){
		
	}
	
	/**
	 * 비밀번호 틀린지 체크
	 */
	@ResponseBody
	@RequestMapping(value="checkPassword.json", method=RequestMethod.POST)
	public static void checkPassword(){
		
	}

	/**
	 * 로그인 화면
	 */
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public static String logInForm(){
		return "login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public static void logIn(MemberVO user){
		
		
	}
	
	@ResponseBody
	@RequestMapping("newsHeadline.json")
	public static void getNewsHeadline(){

	}
	
	@ResponseBody
	@RequestMapping("newsCategoty.json")
	public static void getNewsCategory(){
		
	}
	
	@ResponseBody
	@RequestMapping("stock.json")
	public static void getStock(){
		
	}
	
	@ResponseBody
	@RequestMapping("favorite.json")
	public static void getFavorite(){
		
	}
	
	@ResponseBody
	@RequestMapping("recommend.json")
	public static void getRecommend(){
		
	}
	
	@ResponseBody
	@RequestMapping("data.do")
	public static String getData(){
		return "";
	}
}
