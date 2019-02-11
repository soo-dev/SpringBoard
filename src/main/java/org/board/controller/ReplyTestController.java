package org.board.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/reply")
public class ReplyTestController {
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String replyAjaxTest() {
		
		return "/test/reply_test";
	}

}
