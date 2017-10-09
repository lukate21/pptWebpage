package kr.co.ppt.daoImpl;

import java.util.List;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;

import kr.co.ppt.mongo.JSONReader;

@Repository
public class DtreeDAO {
	@Autowired
	JSONReader jsonReader;
	private MongoCollection<Document> collection=null;
	
	public FindIterable<Document> selectDtreeAll(Bson query){
		collection = jsonReader.DB.getCollection("DTREE"); 
		return collection.find(query);
	}
	
	public Document selectDtree( Bson query){
		collection = jsonReader.DB.getCollection("DTREE"); 
		return collection.find(query).first();
	}
	
}
