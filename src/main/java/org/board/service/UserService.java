package org.board.service;

import java.util.Date;

import org.board.domain.LoginDTO;
import org.board.domain.UserVO;

public interface UserService {

	public void register(UserVO vo) throws Exception;
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String user_id, String session_id, Date session_limit) throws Exception;
	
	public UserVO checkLoginBefore(String value) throws Exception;
}
