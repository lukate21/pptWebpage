package kr.co.ppt.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ppt.serviceImpl.CompanyServiceImpl;

@Controller
@RequestMapping("/my")
public class PortfolioController {
	@Autowired
	CompanyServiceImpl cService;
	
	@RequestMapping("/analysis.do")
	public String analysis(Model model){
		model.addAttribute("comList", cService.selectComList());
		return "/my/analysis";
	}
	
	@RequestMapping("/analysis/start.do")
	public String start(){
		return "/my/start";
	}
	
	@RequestMapping("/analysis/first.do")
	public String first(Model model){
		model.addAttribute("comList", cService.selectComList());
		return "/my/firstStep";
	}
	
	@RequestMapping("/analysis/getMorp.json")
	@ResponseBody
	public String getMorp(String type, String data){
		String text = "";
		String result = "";
		try {
			URL url = new URL("http://222.106.22.63:8080/ppt/morp/reqMorp.do?type="+type+"&data="+data);
			URLConnection uc = url.openConnection();
			uc.connect();
			InputStream is = uc.getInputStream();
			InputStreamReader isr = new InputStreamReader(is,"utf-8");
			BufferedReader br = new BufferedReader(isr);
			while((text = br.readLine()) != null){
				result += text;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/analysis/third.do")
	public String third(String name){
		return "/my/thirdStep";
	}
	@RequestMapping("/analysis/result.do")
	public String result(){
		return "/my/result";
	}
}