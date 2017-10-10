package kr.co.ppt.daoImpl;

import java.util.List;

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
}