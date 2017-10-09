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
}
