package kr.co.ppt.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ppt.serviceImpl.CompanyServiceImpl;
import kr.co.ppt.serviceImpl.DtreeService;
import kr.co.ppt.util.Tool;
import kr.co.ppt.vo.CompanyVO;

@Controller
@RequestMapping("company")
public class CompanyController {
	@Autowired
	CompanyServiceImpl cService;
	@Autowired
	DtreeService dService;
	
	@RequestMapping("/wordcloud.do")
	public String wordCloud(Model model,String name){
		model.addAttribute("name", name);
		return "my/wordcloud";
	}
	
	@RequestMapping(value="/search.do",method=RequestMethod.GET)
	public String search(Model model){
		model.addAttribute("name", "하나금융지주");
		model.addAttribute("comList", cService.selectComList());
		return "company/search";
	}
	
	@RequestMapping(value="/search.do",method=RequestMethod.POST)
	public String search(Model model, String name){
		model.addAttribute("name", name);
		return "company/search";
	}
	
	@RequestMapping("/chart/stock.do")
	public String stock(Model model, String name, String draw){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String yesterday = Tool.getDate(sdf.format(new Date()), -1);
		yesterday = yesterday.substring(0, 4) + "-" + yesterday.substring(4,6) + "-" + yesterday.substring(6);
		model.addAttribute("yesterday",yesterday);
		model.addAttribute("name", name);
		model.addAttribute("draw", draw);
		model.addAttribute("RTA", cService.selectRTA(name, null));
		model.addAttribute("reliability", cService.selectReliability(name));
		model.addAttribute("bestAnalysis", cService.selectBestAnalysis(name));
		return "company/stockChart";
	}
	
	@RequestMapping("/chart/newsCount.do")
	public String news(Model model){
		model.addAttribute("newsCount", cService.selectNewsCount());
		return "company/newsChart";
	}
	
	@RequestMapping("/chart/RTA.do")
	public String RTA(Model model, String name, String option){
		model.addAttribute("name", name);
		model.addAttribute("RTA", cService.selectRTA(name, null));
		model.addAttribute("reliability", cService.selectReliability(name));
		return "company/RTAChart";
	}

	@RequestMapping("/chart/reliability.do")
	public String reliability(Model model, String name, String option){
		model.addAttribute("name", name);
		model.addAttribute("option", option);
		model.addAttribute("bestAnalysis", cService.selectBestAnalysis(name));
		model.addAttribute("reliability", cService.selectReliability(name));
		return "company/reliabilityChart";
	}
	
	@RequestMapping("/chart/dTree.do")
	public String reliability(Model model, String name, String anaCode, String newsCode, String inc, String dec, String equ){
		model.addAttribute("name", name);
		model.addAttribute("anaCode", anaCode);
		model.addAttribute("newsCode", newsCode);
		model.addAttribute("inc", inc);
		model.addAttribute("dec", dec);
		model.addAttribute("equ", equ);
		model.addAttribute("dTree",dService.selectDtree(name).toJSONString());
		return "company/dTreeChart";
	}
	
	@RequestMapping("/selectCompanyList.json")
	@ResponseBody
	public String selectCompanyList() {
		List<CompanyVO> list = cService.selectComList();
		JSONArray result = new JSONArray();
		for(CompanyVO companyVO : list){
			Map<String, String> map = new HashMap<>();
			map.put("comName", companyVO.getName());
			map.put("comCode", companyVO.getCode());
			JSONObject jsonObj = new JSONObject(map);
			result.add(jsonObj);			
		}
		return result.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping("stockList.json")
	public String getComStock(CompanyVO companyVO){
		if(companyVO.getName() != null){
			return cService.selectStockByName(companyVO.getName()).toJSONString();
		}else if(companyVO.getCode() != null){
			return cService.selectStockByCode(companyVO.getCode()).toJSONString();
		}
		return "기업이름 또는 코드를 입력해주세요.";
	}
	
	@ResponseBody
	@RequestMapping("rtStock.json")
	public String getComStock(CompanyVO companyVO,String timeFrame){
		String comCode = "";
		if(timeFrame == null){
			timeFrame = "1_DAY";//디폴트 하루
		}
		if(companyVO.getCode() != null){
			comCode = companyVO.getCode().split("\\.")[0] + ":ks";
		}else if(companyVO.getName() != null && companyVO.getCode() == null){
			if(companyVO.getName().toUpperCase().equals("KOSPI"))
				comCode = "KOSPI:IND";  
			else if(companyVO.getName().toUpperCase().equals("KOSPI2"))
				comCode = "KOSPI2:IND";
			else if(companyVO.getName().toUpperCase().equals("KOSDAQ"))
				comCode = "KOSDAQ:IND";
			else
				comCode = cService.selectCom(companyVO).getCode().split("\\.")[0] + ":ks";
		}
		try {
			URL url = new URL("https://www.bloomberg.com/markets/api/bulk-time-series/price/"+comCode+"?timeFrame="+timeFrame);
			URLConnection bloomberg = url.openConnection();
			bloomberg.connect();
			InputStream is = bloomberg.getInputStream();
			InputStreamReader isr = new InputStreamReader(is,"utf-8");
			BufferedReader br = new BufferedReader(isr);
			String text = "";
			String data = "";
			while((text = br.readLine()) != null){
				data += text;
			}
			return data;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "기업이름 또는 코드를 입력해주세요.";
	}
	
	@RequestMapping("/selectRTA.json")
	@ResponseBody
	public String getRTA(String name, String newsCode){
		return cService.selectRTA(name, newsCode).toJSONString();
	}
}
