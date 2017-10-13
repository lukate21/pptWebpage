package kr.co.ppt.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
	
	public List<MyFavoriteVO> selectFavoriteList(Map<String,Object> map){
		/*if(!map.containsKey("groupName")){
			List<MyFavoriteVO> favoriteList = new ArrayList<>();
			List<MyFavoriteVO> list = pDAO.selectFavoriteList(map);
			Map<String,Integer> tmpMap = new HashMap<>();
			for(int i=0; i<list.size(); i++){
				tmpMap.put(list.get(i).getComName(), i);
			}
			Iterator<String> iter = tmpMap.keySet().iterator();
			while(iter.hasNext()){
				favoriteList.add(list.get(tmpMap.get(iter.next())));
			}
			return favoriteList;
		}else{
			return pDAO.selectFavoriteList(map);
		}*/
		return pDAO.selectFavoriteList(map);
	}
	public List<MyFavoriteVO> selectFavoriteGroup(int userNo){
		return pDAO.selectFavoriteGroup(userNo);
	}
	public void insertFavorite(Map<String,Object> map){
		pDAO.insertFavorite(map);
	}
	public void deleteFavorite(Map<String,Object> map){
		pDAO.deleteFavorite(map);
	}
	public void updateGroupName(Map<String,Object> map){
		pDAO.updateGroupName(map);
	}
	
	public List<MyAnalisysVO> selectMyAnalysis(int userNo){
		return pDAO.selectMyAnalysis(userNo);
	}
}
