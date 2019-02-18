package org.board.service;

import java.util.Date;

import javax.inject.Inject;
import org.board.domain.LoginDTO;
import org.board.domain.UserVO;
import org.board.persistence.UserDAO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;

	@Override
	public void register(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.register(vo);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	@Override
	public void keepLogin(String user_id, String session_id, Date session_limit) throws Exception {

		dao.keepLogin(user_id, session_id, session_limit);
		
	}

	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkUserWithSessionKey(value);
	}


}
