package kr.co.ppt.dao;

import org.springframework.stereotype.Repository;

import kr.co.ppt.vo.StockVO;

@Repository
public interface StockDAO {

	int insertStock(StockVO stock);
	
	int deleteStock(StockVO stock);
	
	int selectStock();
	
	int selectStockByComNo(int comNo);
}
