package kr.co.ppt.daoImpl;

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
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import kr.co.ppt.mongo.JSONReader;


@Repository
public class DictionaryDAOImpl {
	@Autowired
	SqlSessionTemplate template;
	
	@Autowired
	JSONReader jsonReader;
	//=======================Connect to MongoDB================================//
	private MongoCollection<Document> collection=null;
	
	
	public Document selectDictionary(String colName, Bson query){
		collection = jsonReader.DB.getCollection(colName); 
		return collection.find(query).first();
	}
	
	
	public Map<String,Double> selectTFIDF(Bson query){
		Map<String,Double> map = new HashMap<String,Double>();
		collection = jsonReader.DB.getCollection("TFIDF");
		MongoCursor<Document> cursor = collection.find(query).iterator();
		JSONParser parser = new JSONParser();
		while(cursor.hasNext()){
			try {
				JSONObject obj = (JSONObject)parser.parse(cursor.next().toJson());
				map.put((String)obj.get("word"), (Double)obj.get("tfidf"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}
	
	public void insertUserDic(Document dom){
		collection = jsonReader.DB.getCollection("USER_DIC");
		collection.insertOne(dom);
	}
	
	public void deleteUserDic(Bson query){
		collection = jsonReader.DB.getCollection("USER_DIC");
		collection.deleteOne(query);
	}
	
	public FindIterable<Document> selectUserDic(Bson query){
		collection = jsonReader.DB.getCollection("USER_DIC"); 
		return collection.find(query);
	}
}
