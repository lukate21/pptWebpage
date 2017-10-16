package kr.co.ppt.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import kr.co.ppt.serviceImpl.PortfolioServiceImpl;
import kr.co.ppt.vo.CompanyVO;
import kr.co.ppt.vo.MemberVO;
import kr.co.ppt.vo.MyAnalisysVO;
import kr.co.ppt.vo.MyFavoriteVO;

@Controller
@RequestMapping("/my")
public class PortfolioController {
	@Autowired
	CompanyServiceImpl cService;
	@Autowired
	DictionaryServiceImpl dService;
	@Autowired
	PortfolioServiceImpl pService;
	
	@RequestMapping("/analysis.do")
	public String analysis(Model model){
		model.addAttribute("comList", cService.selectComList());
		return "/my/analysis";
	}
	
	@RequestMapping("/list.do")
	public String list(Model model,HttpSession session){
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		int userNo = memberVO.getNo();
		JSONArray arr = dService.selectUserDic(userNo, null, false);
		model.addAttribute("myAnalysisList", pService.selectMyAnalysis(userNo));
		model.addAttribute("myDic", arr.toJSONString());
		model.addAttribute("comList", cService.selectComList());
		return "/my/list";
	}
	
	@RequestMapping("/myAnalysis.json")
	@ResponseBody
	public String list(int userNo, String dicName){
		JSONArray arr = new JSONArray();
		List<MyAnalisysVO> list = pService.selectMyAnalysis(userNo);
		for(MyAnalisysVO mVO: list){
			if(dicName.equals(mVO.getDicName())){
				JSONObject obj = new JSONObject();
				obj.put("no", mVO.getNo());
				obj.put("comName", mVO.getComName());
				obj.put("anaCode", mVO.getAnaCode());
				obj.put("newsCode", mVO.getNewsCode());
				obj.put("todayFluc", mVO.getTodayFluc());
				obj.put("todayInc", mVO.getTodayInc());
				obj.put("todayDec", mVO.getTodayDec());
				obj.put("todayEqu", mVO.getTodayEqu());
				obj.put("tomorrowFluc", mVO.getTomorrowFluc());
				obj.put("tomorrowInc", mVO.getTomorrowInc());
				obj.put("tomorrowDec", mVO.getTomorrowDec());
				obj.put("tomorrowEqu", mVO.getTodayEqu());
				return obj.toJSONString();
			}
		}
		return "사전명이 잘못되었습니다.";
	}
	
	@RequestMapping(value="/favorite.do",method=RequestMethod.GET)
	public String favorite(Model model,HttpSession session){
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		List<MyFavoriteVO> list = pService.selectFavoriteGroup(memberVO.getNo());
		Map<String,Object> map = new HashMap<>();
		map.put("userNo", memberVO.getNo());
		if(list.size() != 0){
			map.put("groupName", list.get(0).getGroupName());
			model.addAttribute("groupName", list.get(0).getGroupName());
		}else{
			model.addAttribute("groupName", "");
		}
		model.addAttribute("groupList", list);
		model.addAttribute("favoriteList", pService.selectFavoriteList(map));
		return "/my/favorite";
	}
	
	@RequestMapping(value="/favorite.do",method=RequestMethod.POST)
	public String favorite(Model model,HttpSession session, String groupName){
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		Map<String,Object> map = new HashMap<>();
		map.put("userNo", memberVO.getNo());
		map.put("groupName", groupName);
		model.addAttribute("groupName", groupName);
		model.addAttribute("groupList", pService.selectFavoriteGroup(memberVO.getNo()));
		model.addAttribute("favoriteList", pService.selectFavoriteList(map));
		return "/my/favorite";
	}
	
	@RequestMapping(value="/selectFavoriteList.json",method=RequestMethod.GET)
	@ResponseBody
	public String selectFavoriteList(int userNo, String groupName){
		Map<String,Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("groupName", groupName);
		List<MyFavoriteVO> list = pService.selectFavoriteList(map);
		JSONArray arr = new JSONArray();
		for(MyFavoriteVO myFavoriteVO : list){
			JSONObject obj = new JSONObject();
			obj.put("no", myFavoriteVO.getNo());
			obj.put("userNo", myFavoriteVO.getUserNo());
			obj.put("comNo", myFavoriteVO.getComNo());
			obj.put("comName", myFavoriteVO.getComName());
			obj.put("groupName", myFavoriteVO.getGroupName());
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@RequestMapping(value="/selectFavoriteGroup.json",method=RequestMethod.GET)
	@ResponseBody
	public String selectFavoriteList(int userNo){
		List<MyFavoriteVO> list = pService.selectFavoriteGroup(userNo);
		JSONArray arr = new JSONArray();
		for(MyFavoriteVO myFavoriteVO : list){
			JSONObject obj = new JSONObject();
			obj.put("groupName", myFavoriteVO.getGroupName());
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@RequestMapping(value="/insertFavorite.json",method=RequestMethod.GET)
	@ResponseBody
	public String insertFavorite(int userNo, String comNo, String comName, String groupName){
		Map<String,Object> map = new HashMap<>();
		map.put("userNo", userNo);
		if(comNo == null){
			CompanyVO companyVO = new CompanyVO();
			companyVO.setName(comName);
			companyVO = cService.selectCom(companyVO);
			map.put("comNo", companyVO.getNo());
		}else{
			map.put("comNo", Integer.parseInt(comNo));
		}
		map.put("groupName", groupName);
		if(pService.selectFavoriteList(map).size() == 0){
			pService.insertFavorite(map);
			return "등록 되었습니다.";
		}else{
			return "이미 존재합니다.";
		}
	}
	
	@RequestMapping(value="/deleteFavorite.json",method=RequestMethod.GET)
	@ResponseBody
	public String deletFavorite(String no, int userNo, String comNo, String comName, String groupName){
		Map<String,Object> map = new HashMap<>();
		System.out.println(no);
		if(no != null){
			map.put("no", Integer.parseInt(no));
		}else{
			map.put("userNo", userNo);
			if(comNo == null){
				CompanyVO companyVO = new CompanyVO();
				companyVO.setName(comName);
				companyVO = cService.selectCom(companyVO);
				map.put("comNo", companyVO.getNo());
			}else{
				map.put("comNo", Integer.parseInt(comNo));
			}
			map.put("groupName", groupName);
		}
		pService.deleteFavorite(map);
		return "삭제되었습니다.";
	}
	
	@RequestMapping(value="/updateGroupName.json",method=RequestMethod.GET)
	@ResponseBody
	public String updateGroupName(int userNo, String groupName, String newGroupName){
		Map<String,Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("groupName", groupName);
		map.put("newGroupName", newGroupName);
		pService.updateGroupName(map);
		return groupName;
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
