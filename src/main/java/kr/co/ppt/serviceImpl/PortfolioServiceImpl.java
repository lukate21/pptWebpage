package kr.co.ppt.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bson.conversions.Bson;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mongodb.client.model.Filters;

import kr.co.ppt.daoImpl.PortfolioDAOImpl;
import kr.co.ppt.vo.CompanyVO;
import kr.co.ppt.vo.MyAnalisysVO;
import kr.co.ppt.vo.MyFavoriteVO;
import kr.co.ppt.vo.NewsCountVO;
import kr.co.ppt.vo.RTAVO;
import kr.co.ppt.vo.ReliabilityVO;

@Service
public class PortfolioServiceImpl {
	@Autowired
	PortfolioDAOImpl pDAO;
	
	public List<MyFavoriteVO> selectFavoriteList(int userNo){
		return pDAO.selectFavoriteList(userNo);
	}
	
	public MyFavoriteVO selectFavoriteAble(Map<String,Object> map){
		return pDAO.selectFavoriteAble(map);
	}
	public void insertFavorite(Map<String,Object> map){
		pDAO.insertFavorite(map);
	}
	public void deleteFavorite(Map<String,Object> map){
		pDAO.deleteFavorite(map);
	}
	
	public List<MyAnalisysVO> selectMyAnalysis(int userNo){
		return pDAO.selectMyAnalysis(userNo);
	}
}
