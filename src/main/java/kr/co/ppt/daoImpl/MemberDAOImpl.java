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
	public MemberVO login(MemberVO member) {
		MemberVO memberVO = null;
		try{
			memberVO = sqlSession.selectOne("memDAO.login",member);
		} catch(Exception e){
			System.out.println(e.getMessage());
		}
		return memberVO;
	}

	@Override
	public int insertUser(MemberVO member) {
		int result = sqlSession.insert("memDAO.join", member);
		return result;
	}

	@Override
	public int deleteUser(MemberVO member) {
		return 0;
	}

	@Override
	public int modifyUser(MemberVO member) {
		return 0;
	}

	@Override
	public int selectUser() {
		return 0;
	}

	@Override
	public MemberVO idCheck(MemberVO member) {
		MemberVO memberVO = sqlSession.selectOne("memDAO.idCheck", member);
		return memberVO;
	}

	@Override
	public String passwordCheck(String password) {
		String pCheck = sqlSession.selectOne("memDAO.passwordCheck", password);
		return pCheck;
	}

	@Override
	public MemberVO getUserInfo(MemberVO member) {
		MemberVO memberVO = sqlSession.selectOne("memDAO.getUserInfo", member);
		return memberVO;
	}

	
}
