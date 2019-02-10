package org.board.service;

import java.util.List;

import javax.inject.Inject;

import org.board.domain.BoardVO;
import org.board.domain.Criteria;
import org.board.domain.SearchCriteria;
import org.board.persistence.BoardDAO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;

	@Override
	public void create(BoardVO vo) throws Exception {
		
		dao.create(vo);
		
	}

	@Override
	public BoardVO read(Integer b_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(b_no);
	}

	@Override
	public void update(BoardVO vo) throws Exception {

		dao.update(vo);
	}

	@Override
	public void delete(Integer b_no) throws Exception {

		dao.delete(b_no);
		
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int countBoards(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoards(cri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria searchCri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(searchCri);
	}

	@Override
	public int countSearchBoards(SearchCriteria searchCri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countSearchBoards(searchCri);
	}

}
