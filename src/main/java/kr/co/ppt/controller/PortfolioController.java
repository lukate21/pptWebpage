package kr.co.ppt.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ppt.serviceImpl.CompanyServiceImpl;
import kr.co.ppt.serviceImpl.DictionaryServiceImpl;
import kr.co.ppt.vo.CompanyVO;
import kr.co.ppt.vo.MemberVO;

@Controller
@RequestMapping("/my")
public class PortfolioController {
	@Autowired
	CompanyServiceImpl cService;
	@Autowired
	DictionaryServiceImpl dService;
	
	@RequestMapping("/analysis.do")
	public String analysis(Model model){
		model.addAttribute("comList", cService.selectComList());
		return "/my/analysis";
	}
	
	@RequestMapping("/result.do")
	public String result(Model model,HttpSession session){
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		JSONArray arr = dService.selectUserDic(memberVO.getNo(), null);
		model.addAttribute("myDic", arr.toJSONString());
		model.addAttribute("comList", cService.selectComList());
		return "/my/result";
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
	
	@RequestMapping(value="/analysis/getReliability.json",method=RequestMethod.POST)
	@ResponseBody
	public String getReliability(String comName, String newsCode, String anaCode,String userDic){
		userDic = userDic.substring(1, userDic.length()-1).replaceAll("\"", "");
		String[] userReqArr = userDic.split(",");
		JSONArray dicArr = new JSONArray();
		for(String term : userReqArr){
			JSONObject obj = new JSONObject();
			obj.put("term", term);
			dicArr.add(obj);
		}
		String text = "";
		String result = "";
		try {
			URL url = new URL("http://222.106.22.63:8080/ppt/analysis/getReliability.do");
			HttpURLConnection uc = (HttpURLConnection)url.openConnection();
			uc.setRequestMethod("POST");
			uc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			uc.setDoOutput(true);
			String urlParameters = "comName="+comName+"&newsCode="+newsCode+"&anaCode="+anaCode+"&userDic="+dicArr.toJSONString();
			DataOutputStream wr = new DataOutputStream(uc.getOutputStream());
			wr.write(urlParameters.getBytes("utf-8"));
			wr.flush();
			wr.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));
			while ((text = in.readLine()) != null) {
				result+=text;
			}
			in.close();
			System.out.println(result);
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
