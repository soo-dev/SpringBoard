package org.board.service;

import java.util.List;


import org.board.domain.Criteria;
import org.board.domain.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> listReply(Integer b_no) throws Exception;
	
	public void modifyReply(ReplyVO vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;
	
	public List<ReplyVO> listReplyPage(Integer b_no, Criteria cri) throws Exception;
	
	public int count(Integer b_no) throws Exception;
}
