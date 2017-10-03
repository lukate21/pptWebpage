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
	@RequestMapping("/mongo/selectOpiDic.json")
	@ResponseBody
	public String selectOpiDicMongo(String comName,String opinion, String newsCode){
		JSONObject obj = dService.selectOpiDicMongo(comName, opinion, newsCode);
		return obj.toJSONString();
	}
	
	@RequestMapping("/mongo/selectProDic.json")
	@ResponseBody
	public String selectProDicMongo(String comName, String newsCode){
		return  dService.selectProDicMongo(comName, newsCode).toJSONString();
	}
	
	@RequestMapping("/mongo/selectPro2Dic.json")
	@ResponseBody
	public String selectPro2Dic(String comName, String newsCode){
		return  dService.selectPro2DicMongo(comName, newsCode).toJSONString();
	}
	
	@RequestMapping("/mongo/selectTFIDF.json")
	@ResponseBody
	public String selectTFIDFMongo(String comName,String newsCode, String anaCode){
		return dService.selectTFIDFMongo(comName,newsCode,anaCode).toJSONString();
	}
	
	@RequestMapping("/mongo/insertUserDic.json")
	@ResponseBody
	public String insertUserDic (int userNo, String comName,String newsCode, String anaCode, String dicName, String userDic){
		//request value
		userDic = userDic.substring(1, userDic.length()-1).replaceAll("\"", "");
		String[] userReqArr = userDic.split(",");
		JSONArray dicArr = new JSONArray();
		for(String term : userReqArr){
			JSONObject obj = new JSONObject();
			obj.put("term", term);
			dicArr.add(obj);
		}
		JSONObject obj = new JSONObject();
		obj.put("userNo", userNo);
		obj.put("comName", comName);
		obj.put("newsCode", newsCode);
		obj.put("anaCode", anaCode);
		obj.put("dicName", dicName);
		obj.put("dictionary", dicArr);
		return obj.toJSONString();
		//return dService.selectTFIDFMongo(comName,newsCode,anaCode).toJSONString();
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
		int size=0;
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
				size = posDic.size() + negDic.size();
				System.out.println("opiDic(" + opiDic.toJSONString().length() + ") 호출");
				break;
			case "pro1":
				JSONArray proDic = dService.selectProDicMongo(name, newsCode);
				userReqCheckDic.put(id, proDic);
				size = proDic.size();
				System.out.println("pro1Dic(" + proDic.toJSONString().length() + ") 호출");
				break;
			case "pro2":
				JSONArray pro2Dic = dService.selectPro2DicMongo(name, newsCode);
				userReqCheckDic.put(id, pro2Dic);
				size = pro2Dic.size();
				System.out.println("pro2Dic(" + pro2Dic.toJSONString().length() + ") 호출");
				break;
			default:
				JSONArray tfidfDic = new JSONArray();
				JSONObject obj = dService.selectTFIDFMongo(name,newsCode,anaCode);
				tfidfDic.add(obj);
				userReqCheckDic.put(id, tfidfDic);
				size = obj.size();
				System.out.println("tfidfDic(" + tfidfDic.toJSONString().length() + ") 호출");
		}
		JSONObject obj = new JSONObject();
		obj.put("id",id);
		obj.put("prevDic", userReqCheckDic.get(id));
		obj.put("size", size);
		return obj.toJSONString();
	}
	
	@RequestMapping(value="/validation.json", method=RequestMethod.POST)
	@ResponseBody
	public String getValidation(String key, String userReq){
		if(key == null || userReqCheckDic.isEmpty() || !userReqCheckDic.containsKey(key) || userReq == null){
			return "";
		}else{
			//return value
			JSONArray usefulTermArr = new JSONArray();
			JSONArray uselessTermArr = new JSONArray();

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
					if(tfidfDic.containsKey(userTerm)){
						JSONObject termObject = new JSONObject();
						termObject.put("key", userTerm);
						termObject.put("value", tfidfDic.get(userTerm));
						termObject.put("opinion", "neu");
						usefulTermArr.add(termObject);
					}else{
						JSONObject termObject = new JSONObject();
						termObject.put("key", userTerm);
						termObject.put("value", 1);
						termObject.put("opinion", "none");
						uselessTermArr.add(termObject);
					}
				}
			}else if(checkArr.size() == 2){//OPI_DIC
				JSONObject posDic = (JSONObject)checkArr.get(0);
				JSONObject negDic = (JSONObject)checkArr.get(1);
				Iterator<String> userTermIter = userTermSet.iterator();
				while(userTermIter.hasNext()){
					String userTerm = userTermIter.next();
					if(posDic.containsKey(userTerm)){
						JSONObject termObject = new JSONObject();
						termObject.put("key", userTerm);
						termObject.put("value", Double.parseDouble((String)posDic.get(userTerm)));
						termObject.put("opinion", "inc");
						usefulTermArr.add(termObject);
					}else if(negDic.containsKey(userTerm)){
						JSONObject termObject = new JSONObject();
						termObject.put("key", userTerm);
						termObject.put("value", Double.parseDouble((String)negDic.get(userTerm)));
						termObject.put("opinion", "dec");
						usefulTermArr.add(termObject);
					}else{
						JSONObject termObject = new JSONObject();
						termObject.put("key", userTerm);
						termObject.put("value", 1);
						termObject.put("opinion", "none");
						uselessTermArr.add(termObject);
					}
				}
			}else{//PRO_DIC
				for(int i=0; i<checkArr.size(); i++){
					JSONObject prevDic = (JSONObject)checkArr.get(i);
					String term = (String)prevDic.get("word");
					if(userTermSet.contains(term)){
						String opinion = "";
						double incValue = Double.parseDouble((String)prevDic.get("inc"));
						double decValue = Double.parseDouble((String)prevDic.get("dec"));
						double equValue = Double.parseDouble((String)prevDic.get("equ"));
						double value = Double.max(Double.max(incValue, decValue), equValue);
						if(value == incValue)
							opinion = "inc";
						else if(value == decValue)
							opinion = "dec";
						else
							opinion = "equ";
						JSONObject termObject = new JSONObject();
						termObject.put("key", term);
						termObject.put("value", value);
						termObject.put("opinion", opinion);
						usefulTermArr.add(termObject);
						userTermSet.remove(term);
					}
				}
				Iterator<String> userTermIter = userTermSet.iterator();
				while(userTermIter.hasNext()){
					String userTerm = userTermIter.next();
					JSONObject termObject = new JSONObject();
					termObject.put("key", userTerm);
					termObject.put("value", 1);
					termObject.put("opinion", "none");
					uselessTermArr.add(termObject);
				}
			}
			JSONObject resultObj = new JSONObject(); // [{usefulTerms : [{key:term,value:num}]}, {uselessTerms:[{key:term,value:num}]}
			resultObj.put("usefulTerms",usefulTermArr);
			resultObj.put("uselessTerms",uselessTermArr);
			return resultObj.toJSONString();
		}
	}
}
