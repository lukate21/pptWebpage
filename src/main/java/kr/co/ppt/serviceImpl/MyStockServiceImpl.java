package kr.co.ppt.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ppt.daoImpl.MyStockDAOImpl;
import kr.co.ppt.vo.MyStockVO;

@Service
public class MyStockServiceImpl {

	@Autowired
	MyStockDAOImpl myStock;
	
	public List<MyStockVO> getStockInfo(String id){
		List<MyStockVO> myStockList = myStock.getMyStock(id);
		
		if(myStockList == null){
			MyStockVO myStock = new MyStockVO();
			myStockList.add(myStock);
		}
		return myStockList;
	}
}
