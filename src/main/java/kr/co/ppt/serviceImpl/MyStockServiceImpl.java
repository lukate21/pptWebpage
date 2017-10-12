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
		
		for(MyStockVO my : myStockList)
			System.out.println(my);
		return myStockList;
	}
	
	public List<MyStockVO> getStockInfoByUserNo(int userNo){
		List<MyStockVO> myStockList = myStock.getMyStockByUserNo(userNo);
		
		for(MyStockVO my : myStockList)
			System.out.println(my);
		return myStockList;
	}
	
	public int getUserNo(String id){
		int userNo = myStock.getUserNo(id);
		
		return userNo;
	}
	
	public int getComNo(String comName){
		int comNo = myStock.getComNo(comName);
		
		return comNo;
	}
	
	public String insertMyStock(MyStockVO myStockVO){
		int result = myStock.insertMyStock(myStockVO);
		String msg = "";
		if(result == 0) msg = "실패";
		else msg = "성공";
		
		return msg;
	}
	
	public String updateMyStock(MyStockVO myStockVO){
		int result = myStock.updateMyStock(myStockVO);
		String msg = "";
		if(result == 0) msg = "실패";
		else msg = "성공";
		
		return msg;
	}
	
	public String deleteMyStock(MyStockVO myStockVO){
		int result = myStock.deleteMyStock(myStockVO);
		String msg = "";
		
		if(result == 0) msg = "실패";
		else msg = "성공";
		
		return msg;
	}
}
