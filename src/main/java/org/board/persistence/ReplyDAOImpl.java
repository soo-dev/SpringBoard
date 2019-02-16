package org.board.persistence;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.board.domain.Criteria;
import org.board.domain.ReplyVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.board.mappers.reply.ReplyMapper";

	@Override
	public List<ReplyVO> list(Integer b_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".list", b_no);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", rno);
	}

	@Override
	public List<ReplyVO> listPage(Integer b_no, Criteria cri) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("b_no", b_no);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}

	@Override
	public int count(Integer b_no) throws Exception {
		
		return session.selectOne(namespace + ".count", b_no);
	}

	@Override
	public int getB_no(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getB_no", rno);
	}

}
