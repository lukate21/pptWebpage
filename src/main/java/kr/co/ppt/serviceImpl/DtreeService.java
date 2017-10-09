package kr.co.ppt.serviceImpl;

import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;

import kr.co.ppt.daoImpl.DtreeDAO;

@Service
public class DtreeService {
	@Autowired
	DtreeDAO dDAO;
	
	public JSONArray selectDtree(String comName){
		Bson query = Filters.eq("comName",comName);
		JSONArray arr = new JSONArray();
		MongoCursor<Document> cursor = dDAO.selectDtreeAll(query).iterator();
		while(cursor.hasNext()){
			Document dom = cursor.next();
			JSONObject obj = new JSONObject();
			obj.put("comName", dom.get("comName"));
			obj.put("newsCode", dom.get("newsCode"));
			obj.put("anaCode", dom.get("anaCode"));
			obj.put("dTree", dom.get("dTree"));
			arr.add(obj);
		}
		return arr;
	}
	
	public JSONArray selectDtree(String comName, String newsCode, String anaCode){
		Bson query = Filters.and(Filters.eq("comName",comName), Filters.eq("newsCode",newsCode), Filters.eq("anaCode",anaCode));
		String data = dDAO.selectDtree(query).toJson();
		JSONParser parser = new JSONParser();
		JSONArray arr = null;
		try {
			arr = (JSONArray)((JSONObject) parser.parse(data)).get("dTree");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}
	
}
