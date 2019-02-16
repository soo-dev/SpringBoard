package org.board.controller;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.board.domain.Criteria;
import org.board.domain.PageMaker;
import org.board.domain.ReplyVO;
import org.board.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value = "", method =  {RequestMethod.GET,RequestMethod.POST} ) 
	public ResponseEntity<String> register(@RequestBody ReplyVO vo) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/all/{b_no}", method = {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<List<ReplyVO>> list (@PathVariable("b_no") Integer b_no) {
		
		ResponseEntity<List<ReplyVO>> entity = null;
		
		try {

			entity = new ResponseEntity<>(
					service.listReply(b_no), HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	 @RequestMapping(value = "/{rno}", method = {RequestMethod.GET, RequestMethod.PATCH, RequestMethod.PUT} )
	  public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) {

	    ResponseEntity<String> entity = null;
	    try {
	      vo.setRno(rno);
	      service.modifyReply(vo);

	      entity = new ResponseEntity<String>("success", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	
	@RequestMapping(value = "/{rno}", method = {RequestMethod.GET, RequestMethod.DELETE} )
	public ResponseEntity<String> remove (@PathVariable("rno") Integer rno) {
		
		ResponseEntity<String> entity = null;
		
		try {

			service.removeReply(rno);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{b_no}/{page}", method = {RequestMethod.GET, RequestMethod.PUT} )
	public ResponseEntity<Map<String, Object>> listPage (@PathVariable("b_no") Integer b_no, @PathVariable("page") Integer page) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {

			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyVO> list = service.listReplyPage(b_no, cri);
			
			map.put("list", list);
			
			int replyCount = service.count(b_no);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
	}


}
