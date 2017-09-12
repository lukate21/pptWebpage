package kr.co.ppt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("company")
public class CompanyController {

	@RequestMapping("searchCompany.do")
	public static void searchCompany(){
		
	}
	
	@ResponseBody
	@RequestMapping("news.json")
	public static void getComNews(){
		
	}
	
	@ResponseBody
	@RequestMapping("stock.json")
	public static void getComStock(){
		
	}
}
