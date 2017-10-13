package kr.co.ppt.serviceImpl;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import com.mongodb.Cursor;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import kr.co.ppt.daoImpl.DictionaryDAOImpl;
import kr.co.ppt.mongo.JSONReader;

@Service
public class DictionaryServiceImpl {
	@Autowired
	DictionaryDAOImpl dDAO;
	
	//=======================Connect to MongoDB================================//
	public static Map<String,Map<String,String[]>> threshold = new HashMap<>();
	private static final Resource RESOURCE = new ClassPathResource("/");
	private static final String[] newsCodes = {"culture","digital","economic","entertain","foreign","politics","society"};
	static{
		for(String newsCode : newsCodes){
			try {
				FileReader fr = new FileReader(RESOURCE.getURI().getPath().substring(1)+newsCode+"_tfidf.csv");
				BufferedReader br = new BufferedReader(fr);
				String data = "";
				String text = br.readLine();
				Map<String,String[]> map = new HashMap<>();
				while ((text = br.readLine()) != null) {
					map.put(text.split(",")[0], text.split(","));
				}
				threshold.put(newsCode, map);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public JSONObject selectOpiDicMongo(String comName,String opinion, String newsCode){
		Bson query = Filters.and(Filters.eq("comName",comName), Filters.eq("opinion",opinion), Filters.eq("newsCode",newsCode));
		String data = dDAO.selectDictionary("OPI_DIC",query).toJson();
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject)((JSONArray)((JSONObject) parser.parse(data)).get("dictionary")).get(0);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return obj;
	}
	
	public JSONArray selectProDicMongo(String comName, String newsCode){
		Bson query = Filters.and(Filters.eq("comName",comName), Filters.eq("newsCode",newsCode));
		String data = dDAO.selectDictionary("PRO_DIC",query).toJson();
		JSONParser parser = new JSONParser();
		JSONArray arr = null;
		try {
			arr = (JSONArray)((JSONObject) parser.parse(data)).get("dictionary");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}
	
	public JSONArray selectPro2DicMongo(String comName, String newsCode){
		Bson query = Filters.and(Filters.eq("comName",comName), Filters.eq("newsCode",newsCode));
		String data = dDAO.selectDictionary("PRO2_DIC",query).toJson();
		JSONParser parser = new JSONParser();
		JSONArray arr = null;
		try {
			arr = (JSONArray)((JSONObject) parser.parse(data)).get("dictionary");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}
	
	
	public Map<String,Double> selectTFIDFMongo(String newsCode, double from, double to){
		Bson query = Filters.and(Filters.eq("newsCode",newsCode),Filters.gt("idf",from), Filters.lt("idf",to));
		Map<String,Double> map =dDAO.selectTFIDF(query);
		System.out.println("MongoDB - " + from + "< idf < " + to + "범위 TF-IDF사전 " + map.size() + "건 호출 성공");
		return map;
	}
	
	public Map<String,Double> selectTFIDFMongo(String newsCode){
		Bson query = Filters.eq("newsCode",newsCode);
		Map<String,Double> map =dDAO.selectTFIDF(query);
		System.out.println("MongoDB - TF-IDF사전 " + map.size() + "건 호출 성공");
		return map;
	}
	
	public JSONObject selectTFIDFMongo(String comName, String newsCode, String anaCode){
		int from = 1;
		int to = 2;
		switch(anaCode){
		case "fit2":
			from += 2;
			to += 2;
			break;
		case "meg1":
			from += 4;
			to += 4;
			break;
		case "meg2":
			from += 6;
			to += 6;
			break;
		}
		Bson query = Filters.and(Filters.eq("newsCode",newsCode),Filters.gt("idf",from), Filters.lt("idf",to));
		Map<String,Double> map =dDAO.selectTFIDF(query);
		return new JSONObject(map);
	}
	
	public void insertUserDic(Document dom){
		dDAO.insertUserDic(dom);
	}
	
	public void deleteUserDic(int userNo, String dicName){
		Bson query = Filters.and(Filters.eq("userNo",userNo),Filters.eq("dicName",dicName));
		dDAO.deleteUserDic(query);
	}
	
	public JSONArray selectUserDic(int userNo, String dicName, boolean dicInclude){
		JSONArray arr = new JSONArray();
		Bson query = null;
		if(dicName != null)//selectOne
			query = Filters.and(Filters.eq("userNo",userNo), Filters.eq("dicName",dicName));
		else
			query = Filters.eq("userNo",userNo);
		MongoCursor<Document> cursor = dDAO.selectUserDic(query).iterator();
		while(cursor.hasNext()){
			Document dom = cursor.next();
			JSONObject obj = new JSONObject();
			obj.put("userNo", dom.get("userNo"));
			obj.put("comName", dom.get("comName"));
			obj.put("newsCode", dom.get("newsCode"));
			obj.put("anaCode", dom.get("anaCode"));
			obj.put("dicName", dom.get("dicName"));
			obj.put("reliability", dom.get("reliability"));
			if(dicInclude)
				obj.put("dictionary", dom.get("dictionary"));
			else
				obj.put("dictionary", ((ArrayList)dom.get("dictionary")).size());
			arr.add(obj);
		}
		return arr;
	}
}
