package org.board.controller;


import javax.inject.Inject;


import org.board.domain.BoardVO;
import org.board.domain.Criteria;
import org.board.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createGET() throws Exception {
		logger.info("normal createGET()........... ");
		return "/board/create";
	}
	
	@RequestMapping(value = "/create", method=RequestMethod.POST)
	public String createPOST(BoardVO vo
							, RedirectAttributes rttr) throws Exception {
		
		logger.info("normal create post............ ");
		logger.info(vo.toString());
		
		service.create(vo);
		
		rttr.addFlashAttribute("msg", "regSuccess");
		
		return "redirect:/board/list";

	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		logger.info("normal list........");
		
		model.addAttribute("boards", service.listAll());
		
		return "board/list";
	}
	
/*	@RequestMapping(value = "/listCriteria", method=RequestMethod.GET)
	public String listCriteria(Model model, Criteria cri) throws Exception{
		
		logger.info("normal listCriteria............");
		
		model.addAttribute("boards",service.listCriteria(cri));
		
		return "board/list_criteria";
	}
	*/
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("b_no") int b_no, Model model) throws Exception {
		logger.info("normal read...............");
		model.addAttribute("board", service.read(b_no));
		
		return "board/read";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateGET(@RequestParam("b_no") int b_no, Model model) throws Exception {
		logger.info("normal update get............ ");
		
		model.addAttribute("board", service.read(b_no));
		
		return "board/update";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("normal update........");
		
		service.update(vo);
		rttr.addFlashAttribute("msg", "modSuccess");
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("b_no") int b_no, RedirectAttributes rttr) throws Exception {
		logger.info("normal delete post............ ");
		service.delete(b_no);
		rttr.addFlashAttribute("msg", "delSuccess");
		
		return "redirect:/board/list";
		
	}
	

}
