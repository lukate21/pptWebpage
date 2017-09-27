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

import kr.co.ppt.serviceImpl.CompanyServiceImpl;

@Controller
@RequestMapping("/my")
public class PortfolioController {
	@Autowired
	CompanyServiceImpl cService;
	
	@RequestMapping("/analysis.do")
	public String analysis(){
		return "/my/analysis";
	}
	
	@RequestMapping("/analysis/first.do")
	public String first(Model model){
		model.addAttribute("comList", cService.selectComList());
		return "/my/firstStep";
	}
	@RequestMapping("/analysis/second.do")
	public String second(Model model, String name,String newsCode){
		try {
			URL url = new URL("http://222.106.22.63:8080/ppt/dictionary/mongo/selectTFIDF.do?newsCode="+newsCode);
			URLConnection uc = url.openConnection();
			uc.connect();
			InputStream is = uc.getInputStream();
			InputStreamReader isr = new InputStreamReader(is,"utf-8");
			BufferedReader br = new BufferedReader(isr);
			String text = "";
			String data = "";
			while((text = br.readLine()) != null){
				data += text;
			}
			model.addAttribute("dictionary", data);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/my/secondStep";
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
