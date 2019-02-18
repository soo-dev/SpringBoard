package org.board.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.board.domain.LoginDTO;
import org.board.domain.UserVO;
import org.board.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;


@Controller
@RequestMapping("/user")
public class UserLoginController {

	@Inject
	private UserService service;
	
	
	
	// 로그인 페이지
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto")LoginDTO dto) throws Exception{
		return "/user/login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession httpSession, Model model) throws Exception {
		
		UserVO vo = service.login(dto);
		
		if(vo == null || !BCrypt.checkpw(dto.getUser_pw(), vo.getUser_pw())) {
			return;
		}
		model.addAttribute("user", vo);
		
		// 로그인 유지 선택 시
		if(dto.isUseCookie()) {
			int amount = 60*60*24*7; // 7일
			Date session_limit = new Date(System.currentTimeMillis() + (1000 * amount));
			service.keepLogin(vo.getUser_id(), httpSession.getId(), session_limit);
		}
		
	}
	
	// 로그아웃
		@RequestMapping(value="/logout", method = RequestMethod.GET)
		public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception{
			
			Object object = httpSession.getAttribute("login");
			
			if(object != null) {
				UserVO vo = (UserVO) object;
				httpSession.removeAttribute("login");
				httpSession.invalidate();
				
				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
				if(loginCookie != null) {
					loginCookie.setPath("/");
					loginCookie.setMaxAge(0);
					response.addCookie(loginCookie);
					service.keepLogin(vo.getUser_id(), "none", new Date());
				}
			}
			
			return "/user/logout";
		}
}
