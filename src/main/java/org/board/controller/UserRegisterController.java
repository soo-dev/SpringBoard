package org.board.controller;

import javax.inject.Inject;


import org.board.domain.UserVO;
import org.board.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UserRegisterController {

	@Inject
	private UserService service;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		return "/user/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserVO vo, RedirectAttributes rttr) throws Exception {
		String hashedPw = BCrypt.hashpw(vo.getUser_pw(), BCrypt.gensalt());
		vo.setUser_pw(hashedPw);
		service.register(vo);
		rttr.addFlashAttribute("msg", "REGISTERED");

		return "redirect:/user/login";
	}

	// 내 프로필 페이지
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info() throws Exception {
		return "/user/info";
	}

	// 내 프로필 수정 페이지
	@RequestMapping(value = "/infoUpdate", method = RequestMethod.GET)
	public String infoUpdate() throws Exception {
		return "/user/infoUpdate";
	}

}
