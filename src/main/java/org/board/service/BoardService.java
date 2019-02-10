package org.board.service;

import java.util.List;

import org.board.domain.BoardVO;
import org.board.domain.Criteria;
import org.board.domain.SearchCriteria;

public interface BoardService {

	public void create(BoardVO vo) throws Exception;
	
	public BoardVO read(Integer b_no) throws Exception;
	
	public void update(BoardVO vo) throws Exception;
	
	public void delete(Integer b_no) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri)throws Exception;
	
	public int countBoards(Criteria cri) throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria searchCri) throws Exception;
	
	public int countSearchBoards(SearchCriteria searchCri) throws Exception;
}
