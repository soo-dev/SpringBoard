package org.board.dao;

import java.util.List;


import javax.inject.Inject;

import org.board.domain.BoardVO;
import org.board.domain.Criteria;
import org.board.domain.SearchCriteria;
import org.board.persistence.BoardDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Inject
	private BoardDAO boardDAO;
	
/*	@Test
	public void testCreate() throws Exception {

		for (int i=1; i<=1000; i++) {
			
			BoardVO vo = new BoardVO();
			
			vo.setTitle(i + "번째 글 작성 테스트 제목");
			vo.setContent(i + "번째 글 작성 테스트 내용");
			vo.setWriter("user0"+(i%10));
			
			boardDAO.create(vo);
		
		}

	}*/
	
	
/*	@Test
	public void testRead() throws Exception {

		logger.info(boardDAO.read(1).toString());

	}*/
	
	/*@Test
	public void testUpdate() throws Exception {

		BoardVO vo = new BoardVO();
		vo.setB_no(1);
		vo.setTitle("1번 글 수정한 제목");
		vo.setContent("1번 글 수정한 내용");
		boardDAO.update(vo);

	}
	*/
	/*@Test
	public void testDelete() throws Exception {

		boardDAO.delete(1);

	}*/
	
	/*@Test
	public void testListPaging() throws Exception {
		
		int page = 3;
		
		List<BoardVO> voList = boardDAO.listPaging(page);
		
		for(BoardVO vo : voList) {
			logger.info(vo.getB_no()+":"+vo.getTitle());
		}
	}*/
	
	/*@Test
	public void testListCriteria() throws Exception {
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		List<BoardVO> voList = boardDAO.listCriteria(cri);
		
		for(BoardVO vo : voList) {
			logger.info(vo.getB_no()+":"+vo.getTitle());
		}
	}*/
	
	/*@Test
	public void testURI() throws Exception {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/board/read")
				.queryParam("b_no", 12)
				.queryParam("perPageNum", 20)
				.build();
		logger.info("/board/read?b_no=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}*/
	
	@Test
	public void testDynamic1() throws Exception {
		
		SearchCriteria searchCri = new SearchCriteria();
		searchCri.setPage(1);
		searchCri.setKeyword("qwerty");
		searchCri.setSearchType("c");
		
		logger.info("======================");
		
		List<BoardVO> boards = boardDAO.listSearch(searchCri);
		
		for(BoardVO board : boards) {
			logger.info(board.getB_no() + ":" + board.getTitle());
		}
		
		logger.info("======================");
		
		logger.info("searched boards count : " + boardDAO.countSearchBoards(searchCri));
	}
	
}
