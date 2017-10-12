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
import kr.co.ppt.vo.MyAnalisysVO;
import kr.co.ppt.vo.MyFavoriteVO;
import kr.co.ppt.vo.NewsCountVO;
import kr.co.ppt.vo.RTAVO;
import kr.co.ppt.vo.ReliabilityVO;


@Repository
public class PortfolioDAOImpl {
	@Autowired
	SqlSessionTemplate template;
	
	public List<MyFavoriteVO> selectFavoriteList(Map<String,Object> map){
		return template.selectList("portfolio.selectFavoriteList",map);
	}
	
	public List<MyFavoriteVO> selectFavoriteGroup(int userNo){
		return template.selectList("portfolio.selectFavoriteGroup",userNo);
	}
	
	public void insertFavorite(Map<String,Object> map){
		template.insert("portfolio.insertFavorite",map);
	}
	public void deleteFavorite(Map<String,Object> map){
		template.delete("portfolio.deleteFavorite",map);
	}
	
	public List<MyAnalisysVO> selectMyAnalysis(int userNo){
		return template.selectList("portfolio.selectMyAnalysis",userNo);
	}
}
