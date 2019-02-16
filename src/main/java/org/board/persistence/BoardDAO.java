package org.board.persistence;

import java.util.List;


import org.board.domain.BoardVO;
import org.board.domain.Criteria;
import org.board.domain.SearchCriteria;

public interface BoardDAO {

	public void create(BoardVO boardVO) throws Exception;
	
	public BoardVO read(Integer b_no) throws Exception;
	
	public void update(BoardVO boardVO) throws Exception;
	
	public void delete(Integer b_no) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
	public List<BoardVO> listPaging(int page) throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int countBoards(Criteria cri) throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria searchCri) throws Exception;
	
	public int countSearchBoards(SearchCriteria searchCri) throws Exception;
	
	public void updateReplyCnt(Integer b_no, int amount) throws Exception;
	
	public void updateViewCnt(Integer b_no) throws Exception;
	
}
