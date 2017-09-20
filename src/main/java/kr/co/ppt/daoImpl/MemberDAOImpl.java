package kr.co.ppt.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ppt.dao.MemberDAO;
import kr.co.ppt.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVO logIn(MemberVO user) {
		MemberVO memberVO = null;
		try{
			memberVO = sqlSession.selectOne("memberDAO.login",user);
			System.out.println(memberVO);
		} catch(Exception e){
			System.out.println(e.getMessage());
		}
		return memberVO;
	}

	@Override
	public int insertUser(MemberVO user) {
		return 0;
	}

	@Override
	public int deleteUser(MemberVO user) {
		return 0;
	}

	@Override
	public int modifyUser(MemberVO user) {
		return 0;
	}

	@Override
	public int selectUser() {
		return 0;
	}
	
}
