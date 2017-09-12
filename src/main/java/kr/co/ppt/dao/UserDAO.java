package kr.co.ppt.dao;

import org.springframework.stereotype.Repository;

import kr.co.ppt.vo.UserVO;

@Repository
public interface UserDAO {

	UserVO logIn(UserVO user);
	
	int insertUser(UserVO user);
	
	int deleteUser(UserVO user);
	
	int modifyUser(UserVO user);
	
	int selectUser();
}
