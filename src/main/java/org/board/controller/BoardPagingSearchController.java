package org.board.controller;

import org.board.domain.BoardVO;
import org.board.domain.PageMaker;
import org.board.domain.SearchCriteria;
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

import javax.inject.Inject;

@Controller
@RequestMapping("/board/paging/search/*")
public class BoardPagingSearchController {

    private static final Logger logger = LoggerFactory.getLogger(BoardPagingSearchController.class);

    @Inject
    private BoardService service;

    
   

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createGET(@ModelAttribute("searchCri") SearchCriteria searchCri) throws Exception {

        return "board/search/create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createPOST(BoardVO vo,
                            RedirectAttributes rttr) throws Exception {

        service.create(vo);
        rttr.addFlashAttribute("msg", "regSuccess");

        return "redirect:/board/paging/search/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(@ModelAttribute("searchCri") SearchCriteria searchCri,
                       Model model) throws Exception {

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(searchCri);
        pageMaker.setTotalCount(service.countSearchBoards(searchCri));

        model.addAttribute("boards", service.listSearch(searchCri));
        model.addAttribute("pageMaker", pageMaker);

        return "board/search/list";
    }

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public String read(@RequestParam("b_no") int b_no,
                       @ModelAttribute("searchCri") SearchCriteria searchCri,
                       Model model) throws Exception {

        model.addAttribute("board", service.read(b_no));

        return "board/search/read";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateGET(@RequestParam("b_no") int b_no,
                            @ModelAttribute("searchCri") SearchCriteria searchCri,
                            Model model) throws Exception {

        logger.info(searchCri.toString());
        model.addAttribute("board", service.read(b_no));

        return "board/search/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(BoardVO vo,
                             SearchCriteria searchCri,
                             RedirectAttributes rttr) throws Exception {

        service.update(vo);
        rttr.addAttribute("page", searchCri.getPage());
        rttr.addAttribute("perPageNum", searchCri.getPerPageNum());
        rttr.addAttribute("searchType", searchCri.getSearchType());
        rttr.addAttribute("keyword", searchCri.getKeyword());
        rttr.addFlashAttribute("msg", "modSuccess");

        return "redirect:/board/paging/search/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("b_no") int b_no,
                         SearchCriteria searchCri,
                         RedirectAttributes rttr) throws Exception {

        service.delete(b_no);
        rttr.addAttribute("page", searchCri.getPage());
        rttr.addAttribute("perPageNum", searchCri.getPerPageNum());
        rttr.addAttribute("searchType", searchCri.getSearchType());
        rttr.addAttribute("keyword", searchCri.getKeyword());
        rttr.addFlashAttribute("msg", "delSuccess");

        return "redirect:/board/paging/search/list";
    }
}
