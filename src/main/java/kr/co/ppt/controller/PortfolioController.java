package kr.co.ppt.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ppt.serviceImpl.CompanyServiceImpl;
import kr.co.ppt.vo.CompanyVO;

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
	
	@RequestMapping(value="/favorite.do",method=RequestMethod.GET)
	public String favorite(Model model, int userNo){
		model.addAttribute("favoriteList", cService.selectFavoriteList(userNo));
		return "/my/favorite";
	}
	
	@RequestMapping(value="/favorite.json",method=RequestMethod.GET)
	@ResponseBody
	public String checkFavorite(int userNo, String comName){
		Map<String,Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("comName", comName);
		if(cService.selectFavoriteAble(map) == null)
			return "able";
		else
			return "disable";
	}
	
	@RequestMapping(value="/favorite.json",method=RequestMethod.POST)
	@ResponseBody
	public String addFavorite(int userNo, String comName, String method){
		CompanyVO companyVO = new CompanyVO();
		companyVO.setName(comName);
		companyVO = cService.selectCom(companyVO);
		Map<String,Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("comNo", companyVO.getNo());
		if(method.equals("insert"))
			cService.insertFavorite(map);
		else if(method.equals("delete"))
			cService.deleteFavorite(map);
		return "성공";
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
	
	@RequestMapping("/analysis/result.do")
	public String result(){
		return "/my/result";
	}
}
