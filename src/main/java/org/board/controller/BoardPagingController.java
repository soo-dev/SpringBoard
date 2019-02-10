package org.board.controller;


import javax.inject.Inject;




import org.board.domain.BoardVO;
import org.board.domain.Criteria;
import org.board.domain.PageMaker;
import org.board.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board/paging/*")
public class BoardPagingController {

	private static final Logger logger = LoggerFactory.getLogger(BoardPagingController.class);
	
	@Inject
	private BoardService service;
	
	
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createGET() throws Exception {
		logger.info("paging create get............ ");
		return "board/paging/create";
	}
	
	@RequestMapping(value = "/create", method=RequestMethod.POST)
	public String createPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		
		logger.info("paging create post............ ");
		logger.info(vo.toString());
		
		service.create(vo);
		
		rttr.addFlashAttribute("msg", "regSuccess");
		
		return "redirect:/board/paging/list";

	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPaging(Model model, Criteria cri) throws Exception {
		
		logger.info(cri.toString());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		// pageMaker.setTotalCount(1000);
		pageMaker.setTotalCount(service.countBoards(cri));
		
		model.addAttribute("boards", service.listCriteria(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/paging/list";
	}
	
	
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("b_no") int b_no, @ModelAttribute("cri") Criteria cri,  Model model) throws Exception {
		logger.info("paging read...............");
		model.addAttribute("board", service.read(b_no));
		
		return "board/paging/read";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateGET(@RequestParam("b_no") int b_no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("paging update get............ ");
		
		model.addAttribute("board", service.read(b_no));
		
		return "board/paging/update";
	
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(BoardVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("paging update POST............");

		service.update(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "modSuccess");
		
		logger.info(rttr.toString());
		
		return "redirect:/board/paging/list";
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePaging(@RequestParam("b_no") int b_no, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		logger.info("paging delete post...........");
		
		service.delete(b_no);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "delSuccess");
		
		return "redirect:/board/paging/list";
	}
}
