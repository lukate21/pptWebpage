package kr.co.ppt.daoImpl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ppt.vo.MyStockVO;

@Repository
public class MyStockDAOImpl {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<MyStockVO> getMyStock(String id){
		List<MyStockVO> myStockList = sqlSession.selectList("myStock.getInfo",id);
		
		return myStockList;
	}
	
	public List<MyStockVO> getMyStockByUserNo(int userNo){
		List<MyStockVO> myStockList = sqlSession.selectList("myStock.getInfoByUserNo",userNo);

		return myStockList;
	}
	
	public int getUserNo(String id){
		int userNo = sqlSession.selectOne("myStock.getUserNo", id);
		
		return userNo;
	}
	
	public int getComNo(String comName){
		int comNo = sqlSession.selectOne("myStock.getComNo", comName);
		
		return comNo;
	}
	
	public int insertMyStock(MyStockVO myStock){
		int result = sqlSession.insert("myStock.insertMyStock", myStock);
		
		return result;
	}
	
	public int updateMyStock(MyStockVO myStock){
		int result = sqlSession.update("myStock.updateMyStock", myStock);
		
		return result;
	}
	
	public int deleteMyStock(MyStockVO myStock){
		int result = sqlSession.delete("myStock.deleteMyStock", myStock);
		
		return result;
	}
	
	public Map<String,BigDecimal> countDupComByNo(int no) {
		Map<String,BigDecimal> result = sqlSession.selectOne("myStock.countDupComByNo", no);
		
		return result;
	}
}
