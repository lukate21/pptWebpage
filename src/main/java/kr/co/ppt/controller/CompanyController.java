package kr.co.ppt.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ppt.serviceImpl.CompanyServiceImpl;
import kr.co.ppt.vo.CompanyVO;

@Controller
@RequestMapping("company")
public class CompanyController {
	@Autowired
	CompanyServiceImpl cService;
	
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
	@RequestMapping("news.json")
	public void getComNews(){
		
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
			System.out.println(comCode);
		}else if(companyVO.getName() != null && companyVO.getCode() == null){
			comCode = cService.selectCom(companyVO).getCode().split("\\.")[0] + ":ks";
			System.out.println(comCode);
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
