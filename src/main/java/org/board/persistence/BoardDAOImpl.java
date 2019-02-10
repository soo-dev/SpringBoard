package org.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.board.domain.BoardVO;
import org.board.domain.Criteria;
import org.board.domain.SearchCriteria;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	private static String NAMESPACE = "org.board.mappers.board.BoardMapper";
	
	@Inject
	private SqlSession session;
	

	@Override
	public void create(BoardVO boardVO) throws Exception {
	
		session.insert(NAMESPACE + ".create", boardVO);
		
	}

	@Override
	public BoardVO read(Integer b_no) throws Exception {
		
		return session.selectOne(NAMESPACE + ".read", b_no);
	}

	@Override
	public void update(BoardVO boardVO) throws Exception {
		
		session.update(NAMESPACE + ".update", boardVO);
		
	}

	@Override
	public void delete(Integer b_no) throws Exception {
		
		session.delete(NAMESPACE + ".delete", b_no);
		
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		
		return session.selectList(NAMESPACE + ".listAll");
	}

	@Override
	public List<BoardVO> listPaging(int page) throws Exception {
		
		if(page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(NAMESPACE+".listPaging", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".listCriteria", cri);
	}

	@Override
	public int countBoards(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".countBoards", cri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria searchCri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + ".listSearch", searchCri);
	}

	@Override
	public int countSearchBoards(SearchCriteria searchCri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + ".countSearchBoards", searchCri);
	}

}
