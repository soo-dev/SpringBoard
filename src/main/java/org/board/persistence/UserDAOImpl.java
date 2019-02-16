package org.board.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.board.domain.LoginDTO;
import org.board.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private static final String NAMESPACE = "org.board.mappers.user.UserMapper";
	
	@Inject
	private SqlSession session;

	@Override
	public void register(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE + ".register", vo);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".login", dto);
	}

	@Override
	public void keepLogin(String user_id, String session_id, Date session_limit) throws Exception {


		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("user_id", user_id);
		paramMap.put("session_id", session_id);
		paramMap.put("session_limit", session_limit);
		
		session.update(NAMESPACE + ".keepLogin", paramMap);
		
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".checkUserWithSessionKey", value);
	}

}
