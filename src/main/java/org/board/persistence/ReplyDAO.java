package org.board.persistence;

import java.util.List;


import org.board.domain.Criteria;
import org.board.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> list(Integer b_no) throws Exception;
	
	public void create(ReplyVO vo) throws Exception;
	
	public void update(ReplyVO vo) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
	public List<ReplyVO> listPage(Integer b_no, Criteria cri) throws Exception;
	
	public int count(Integer b_no) throws Exception;
	
	public int getB_no(Integer rno) throws Exception;
	
}
