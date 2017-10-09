package kr.co.ppt.daoImpl;

import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import kr.co.ppt.mongo.JSONReader;
import kr.co.ppt.vo.CompanyVO;
import kr.co.ppt.vo.MyFavoriteVO;
import kr.co.ppt.vo.NewsCountVO;
import kr.co.ppt.vo.RTAVO;
import kr.co.ppt.vo.ReliabilityVO;


@Repository
public class CompanyDAOImpl {
	@Autowired
	SqlSessionTemplate template;
	
	@Autowired
	JSONReader jsonReader;
	//=======================Connect to MongoDB================================//
	private MongoCollection<Document> collection=null;
	
	public Document selectStock(Bson query){
		collection = jsonReader.DB.getCollection("STOCKS"); 
		return collection.find(query).first();
	}
	
	//=======================Connect to Oracle================================//
	public void insertCompany(Map<Object,Object> map){
		template.insert("company.insertComList", map);
	}
	
	public List<CompanyVO> selectComList(){
		return template.selectList("company.selectComList");
	}
	
	public List<MyFavoriteVO> selectFavoriteList(int userNo){
		return template.selectList("company.selectFavoriteList",userNo);
	}
	
	public MyFavoriteVO selectFavoriteAble(Map<String,Object> map){
		return template.selectOne("company.selectFavoriteAble",map);
	}
	
	public void insertFavorite(Map<String,Object> map){
		template.insert("company.insertFavorite",map);
	}
	public void deleteFavorite(Map<String,Object> map){
		template.delete("company.deleteFavorite",map);
	}
	
	public CompanyVO selectCom(CompanyVO companyVO){
		return template.selectOne("company.selectCom",companyVO);
	}
	
	public List<RTAVO> selectRTA(String name){
		return template.selectList("company.selectRTA", name);
	}
	
	public ReliabilityVO selectBestAnalysis(String comName){
		return template.selectOne("company.selectBestAnalysis",comName);
	}
	
	public List<ReliabilityVO> selectReliability(String comName){
		return template.selectList("company.selectReliability",comName);
	}
	public List<NewsCountVO> selectNewsCount(){
		return template.selectList("company.selectNewsCount");
	}
}
