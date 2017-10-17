package kr.co.ppt.controller;


import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ppt.service.MemberService;
import kr.co.ppt.serviceImpl.CompanyServiceImpl;
import kr.co.ppt.serviceImpl.MyStockServiceImpl;
import kr.co.ppt.serviceImpl.PortfolioServiceImpl;
import kr.co.ppt.util.SHA_ENC;
import kr.co.ppt.util.UserUtil;
import kr.co.ppt.vo.CompanyVO;
import kr.co.ppt.vo.MemberVO;
import kr.co.ppt.vo.MyStockVO;

@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CompanyServiceImpl cService;
	
	@Autowired
	MyStockServiceImpl myStockService;

	@Autowired
	PortfolioServiceImpl pService;
	
	@RequestMapping(value="modifyCheck.do", method=RequestMethod.GET)
	public String myPage() {
		return "myPage/myPageCheck";
	}
	
	@RequestMapping(value="modifyCheck.do", method=RequestMethod.POST)
	public String modifyPage(String id, String domain, String password, HttpServletRequest request) {
		String email = id+"@"+domain;
		System.out.println(email);
		
		MemberVO member = UserUtil.makeBasicInfo(email, password);
		
		if(HomeController.tempPass.get(password) != null){
			System.out.println(password+"key + SHA key"+HomeController.tempPass.get(password));
			password = HomeController.tempPass.get(password);
			HomeController.tempPass.remove(password);
			member.setPassword(password);
		}
		
		System.out.println(member);
		
		MemberVO loginUser = memberService.getUserInfo(member);
		if(loginUser != null)
			return "myPage/myPage";
		else {
			String msg = "일치하는 정보가 없습니다.";
			String ref = "myPage/myPage.do";
			UserUtil.makeMessage(msg, ref, request);
			
			return "messageAlert";
		}
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public String modify(String email, String password, String tel, HttpServletRequest request) {
		MemberVO member = UserUtil.makeBasicInfo(email, password);
		if(tel != null)
			member.setTel(tel);
		
		int result = memberService.modifyUser(member);
		if(result == 1) {
			String msg = "수정되었습니다.";
			String ref = "hello.do";
			UserUtil.makeMessage(msg, ref, request);
			return "messageAlert";
		} else {
			String msg = "수정 실패했습니다.";
			String ref = "myPage/myPage.do";
			UserUtil.makeMessage(msg, ref, request);
			return "messageAlert";
		}
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public String test(String password) {
		String ppp = SHA_ENC.SHA256_Encrypt(password);
		return ppp;
	}
	
	@RequestMapping("myStock.do")
	public String myStock(HttpServletRequest request, HttpSession session){
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String id = member.getId();
		System.out.println("myStock id : "+id);
		
		List<MyStockVO> myStockList = myStockService.getStockInfo(id);
		List<MyStockVO> newStockList = new ArrayList<>();
		
		for(MyStockVO myStock : myStockList){
			CompanyVO company = new CompanyVO();
			company.setName(myStock.getComName());
			String data = getComStock(company,"1_DAY");
			JSONParser parser = new JSONParser();
			JSONObject obj = null;
			JSONArray arr = null;
			try {
				obj = (JSONObject)((JSONArray)parser.parse(data)).get(0);
				arr = (JSONArray)obj.get("price");
				int nowPrice = Integer.parseInt(((JSONObject)arr.get(arr.size()-1)).get("value").toString());
				myStock.setNowPrice(nowPrice);
				newStockList.add(myStock);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		request.setAttribute("myStockList", newStockList);
		request.setAttribute("comList", cService.selectComList());
		
		return "myPage/myStock";
	}
	
	private String getComStock(CompanyVO companyVO,String timeFrame){
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
	
	@RequestMapping(value="myStock.do", method=RequestMethod.POST)
	public String addMyStock(String comName, String buyPrice, String volume, String buyDate, String type, HttpSession session){
		System.out.println("comName : "+comName+", buyPrice :"+buyPrice+", volume :"+volume+", buyDate :"+buyDate);
		
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String id = member.getId();
		int userNo = myStockService.getUserNo(id);
		int comNo = myStockService.getComNo(comName);
		
		MyStockVO myStock = new MyStockVO();
		myStock.setUserNo(userNo);
		myStock.setComNo(comNo);
		myStock.setBuyPrice(Integer.parseInt(buyPrice));
		myStock.setVolume(Integer.parseInt(volume));
		myStock.setBuyDate(buyDate);
		
		String msg = myStockService.insertMyStock(myStock);
		System.out.println("추가 결과 : "+msg);
		
		//관심기업 추가
		Map<String,Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("comNo", comNo);
		map.put("groupName", "보유주식");
		if(pService.selectFavoriteList(map).size() == 0){
			pService.insertFavorite(map);
		}
		
		if(type != null && type.equals("m")) return msg;
		else return "redirect:myStock.do";
	}
	
	@ResponseBody
	@RequestMapping("myStock.json")
	public String myStock(int userNo){
		
		List<MyStockVO> myStockList = myStockService.getStockInfoByUserNo(userNo);

		JSONArray jArr = new JSONArray();
		JSONObject jObj = new JSONObject();
		for(MyStockVO myStock : myStockList){
			CompanyVO company = new CompanyVO();
			company.setName(myStock.getComName());
			String data = getComStock(company,"1_DAY");
			JSONParser parser = new JSONParser();
			JSONObject obj = null;
			JSONArray arr = null;
			try {
				obj = (JSONObject)((JSONArray)parser.parse(data)).get(0);
				arr = (JSONArray)obj.get("price");
				int nowPrice = Integer.parseInt(((JSONObject)arr.get(arr.size()-1)).get("value").toString());
				myStock.setNowPrice(nowPrice);
				jObj = makeJson(myStock);
				jArr.add(jObj);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return jArr.toJSONString();
	}
	
	private JSONObject makeJson(MyStockVO myStock){
		JSONObject obj = new JSONObject();
		obj.put("no", myStock.getNo());
		obj.put("comName", myStock.getComName());
		obj.put("comNo", myStock.getComNo());
		obj.put("buyPrice", myStock.getBuyPrice());
		obj.put("volume", myStock.getVolume());
		obj.put("buyDate", myStock.getBuyDate());
		obj.put("nowPrice", myStock.getNowPrice());
		
		return obj;
	}
	
	@RequestMapping(value="myModify.do", method=RequestMethod.POST)
	public String updateMyStock(String no, String comName, String buyPrice, String volume, String buyDate, String type, HttpSession session){
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String id = member.getId();
		int userNo = myStockService.getUserNo(id);
		int comNo = myStockService.getComNo(comName);
		
		MyStockVO myStock = new MyStockVO();
		myStock.setUserNo(userNo);
		myStock.setComNo(comNo);
		myStock.setNo(Integer.parseInt(no));
		if(!buyPrice.equals("")) myStock.setBuyPrice(Integer.parseInt(buyPrice));
		if(!volume.equals("")) myStock.setVolume(Integer.parseInt(volume));
		if(!buyDate.equals("")) myStock.setBuyDate(buyDate);
		
		System.out.println(myStock);
		
		String msg = myStockService.updateMyStock(myStock);
		System.out.println("업데이트 결과 : "+msg);
		
		if(type != null && type.equals("m")) return msg;
		else return "redirect:myStock.do";
	}
	
	@RequestMapping(value="deleteMyStock.do", method=RequestMethod.POST)
	public String deleteMyStock(String no, String type, HttpSession session){
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String id = member.getId();
		int userNo = myStockService.getUserNo(id);
		
		MyStockVO myStock = new MyStockVO();
		myStock.setNo(Integer.parseInt(no));
		myStock.setUserNo(userNo);
		
		String msg = myStockService.deleteMyStock(myStock);
		System.out.println("삭제 결과 : "+msg);
		
		//관심기업 삭제
		List<MyStockVO> list = myStockService.getStockInfoByUserNo(userNo);
		int comNo=0;
		int dupl = 0;
		for(MyStockVO mVO : list){
			if(mVO.getNo() == Integer.parseInt(no)){
				comNo = mVO.getComNo();
				break;
			}
		}
		for(MyStockVO mVO : list){
			if(mVO.getComNo() == comNo){
				dupl++;
			}
		}
		if(dupl ==1){
			Map<String,Object> map = new HashMap<>();
			map.put("userNo", userNo);
			map.put("comNo", comNo);
			map.put("groupName", "보유주식");
			pService.deleteFavorite(map);
		}
		if(type != null && type.equals("m")) return msg;
		else return "redirect:myStock.do";
	}
	
	@ResponseBody
	@RequestMapping("updateMyStock.json")
	public String mobileUpdateMyStock(int userNo, int comNo, int no, int buyPrice, int volume, String buyDate){
		MyStockVO myStock = new MyStockVO();
		myStock.setUserNo(userNo);
		myStock.setComNo(comNo);
		myStock.setNo(no);

		myStock.setBuyPrice(buyPrice);
		myStock.setVolume(volume);
		if(buyDate != null) myStock.setBuyDate(buyDate);
		
		System.out.println(myStock);
		
		String msg = myStockService.updateMyStock(myStock);
		System.out.println("업데이트 결과 : "+msg);
		
		return msg;
	}
	@ResponseBody
	@RequestMapping("deleteMyStock.json")
	public String mobileDeleteMyStock(int no){
		
		MyStockVO myStock = new MyStockVO();
		myStock.setNo(no);
		//관심기업 삭제
		Map<String,BigDecimal> duplCheck = myStockService.countDupComByNo(no);
		System.out.println(duplCheck.toString());
		int dupl = (duplCheck.get("COUNT")).intValue();
		int userNo = duplCheck.get("USERNO").intValue();
		int comNo = duplCheck.get("COMNO").intValue();
		System.out.println(dupl);
		System.out.println(userNo);
		System.out.println(comNo);
		if(dupl ==1){
			Map<String,Object> map = new HashMap<>();
			map.put("userNo", userNo);
			map.put("comNo", comNo);
			map.put("groupName", "보유주식");
			pService.deleteFavorite(map);
		}
		
		String msg = myStockService.deleteMyStock(myStock);
		System.out.println("삭제 결과 : "+msg);
		
		
		return msg;
	}
	
	
}
