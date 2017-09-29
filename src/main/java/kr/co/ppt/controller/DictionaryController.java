package kr.co.ppt.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.ppt.serviceImpl.DictionaryServiceImpl;
import kr.co.ppt.util.SHA_ENC;

@Controller
@RequestMapping("/dictionary")
public class DictionaryController {
	@Autowired
	DictionaryServiceImpl dService;
	public static Map<String,JSONArray> userReqCheckDic = new HashMap<>();
	
	
	//=======================Connect to MongoDB================================//
	@RequestMapping("/mongo/selectOpiDic.do")
	@ResponseBody
	public String selectOpiDicMongo(String comName,String opinion, String newsCode){
		JSONObject obj = dService.selectOpiDicMongo(comName, opinion, newsCode);
		return obj.toJSONString();
	}
	
	@RequestMapping("/mongo/selectProDic.do")
	@ResponseBody
	public String selectProDicMongo(String comName, String newsCode){
		return  dService.selectProDicMongo(comName, newsCode).toJSONString();
	}
	
	@RequestMapping("/mongo/selectPro2Dic.do")
	@ResponseBody
	public String selectPro2Dic(String comName, String newsCode){
		return  dService.selectPro2DicMongo(comName, newsCode).toJSONString();
	}
	@RequestMapping("/mongo/selectTFIDF.do")
	@ResponseBody
	public String selectTFIDFMongo(String comName,String newsCode, String anaCode){
		return dService.selectTFIDFMongo(comName,newsCode,anaCode).toJSONString();
	}
	
	/*
	 * anaCode
	 * opi1,2 -> OPI_DIC
	 * pro1 -> PRO_DIC
	 * pro2 -> PRO2_DIC
	 * fit&meg1,2 -> filtered tfidf
	*/
	@RequestMapping("/getDictionary.json")
	@ResponseBody
	public String getDictionary(String id, String name, String anaCode, String newsCode){
		id = SHA_ENC.SHA256_Encrypt(id); // id 암호화하여 고유 키로 사용
		System.out.println("id : " + id);
		System.out.println("name : " + name);
		System.out.println("anaCode : " + anaCode);
		System.out.println("newsCode : " + newsCode);
		switch(anaCode){
			case "opi1":
			case "opi2":
				JSONArray opiDic = new JSONArray();
				JSONObject posDic = dService.selectOpiDicMongo(name, "pos", newsCode);
				JSONObject negDic = dService.selectOpiDicMongo(name, "neg", newsCode);
				opiDic.add(posDic);
				opiDic.add(negDic);
				userReqCheckDic.put(id, opiDic);
				System.out.println("opiDic(" + opiDic.toJSONString().length() + ") 호출");
				break;
			case "pro1":
				JSONArray proDic = dService.selectProDicMongo(name, newsCode);
				userReqCheckDic.put(id, proDic);
				System.out.println("pro1Dic(" + proDic.toJSONString().length() + ") 호출");
				break;
			case "pro2":
				JSONArray pro2Dic = dService.selectPro2DicMongo(name, newsCode);
				userReqCheckDic.put(id, pro2Dic);
				System.out.println("pro2Dic(" + pro2Dic.toJSONString().length() + ") 호출");
				break;
			default:
				JSONArray tfidfDic = new JSONArray();
				tfidfDic.add(dService.selectTFIDFMongo(name,newsCode,anaCode));
				userReqCheckDic.put(id, tfidfDic);
				System.out.println("tfidfDic(" + tfidfDic.toJSONString().length() + ") 호출");
		}
		return id;
	}
	
	@RequestMapping(value="/validation.json", method=RequestMethod.POST)
	@ResponseBody
	public String getValidation(String key, String userReq){
		if(key == null || userReqCheckDic.isEmpty() || !userReqCheckDic.containsKey(key) || userReq == null){
			return "";
		}else{
			//return value
			Set<String> equalTerm = new HashSet<>();
			Set<String> garbageTerm = new HashSet<>();
			//request value
			Set<String> userTermSet = new HashSet<>();
			userReq = userReq.substring(1, userReq.length()-1).replaceAll("\"", "");
			String[] userReqArr = userReq.split(",");
			for(int i=0; i<userReqArr.length; i++){
				userTermSet.add(userReqArr[i]);
			}
			JSONArray checkArr = userReqCheckDic.get(key);
			if(checkArr.size() == 1){//TFIDF_DIC
				JSONObject tfidfDic = (JSONObject)checkArr.get(0);
				Iterator<String> userTermIter = userTermSet.iterator();
				while(userTermIter.hasNext()){
					String userTerm = userTermIter.next();
					if(tfidfDic.containsKey(userTerm))
						equalTerm.add(userTerm);
					else{
						garbageTerm.add(userTerm);
					}
				}
			}else if(checkArr.size() == 2){//OPI_DIC
				JSONObject posDic = (JSONObject)checkArr.get(0);
				JSONObject negDic = (JSONObject)checkArr.get(0);
				Iterator<String> userTermIter = userTermSet.iterator();
				while(userTermIter.hasNext()){
					String userTerm = userTermIter.next();
					if(posDic.containsKey(userTerm))
						equalTerm.add(userTerm);
					else if(negDic.containsKey(userTerm))
						equalTerm.add(userTerm);
					else{
						garbageTerm.add(userTerm);
					}
				}
			}else{//PRO_DIC
				Set<String> proDic = new HashSet<>();
				for(int i=0; i<checkArr.size(); i++){
					JSONObject prevDic = (JSONObject)checkArr.get(i);
					proDic.add((String)prevDic.get("word"));
				}
				Iterator<String> userTermIter = userTermSet.iterator();
				while(userTermIter.hasNext()){
					String userTerm = userTermIter.next();
					if(proDic.contains(userTerm))
						equalTerm.add(userTerm);
					else{
						garbageTerm.add(userTerm);
					}
				}
			}
			JSONArray resultArr = new JSONArray();
			Iterator equalTermIter = equalTerm.iterator();
			while(equalTermIter.hasNext()){
				JSONObject resultObj = new JSONObject();
				resultObj.put("equalTerm", equalTermIter.next());
				resultArr.add(resultObj);
			}
			Iterator garbageTermIter = garbageTerm.iterator();
			while(garbageTermIter.hasNext()){
				JSONObject resultObj = new JSONObject();
				resultObj.put("garbageTerm", garbageTermIter.next());
				resultArr.add(resultObj);
			}
			
			return resultArr.toJSONString();
		}
	}
}
