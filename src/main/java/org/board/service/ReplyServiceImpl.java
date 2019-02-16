package org.board.service;

import java.util.List;



import javax.inject.Inject;

import org.board.domain.Criteria;
import org.board.domain.ReplyVO;
import org.board.persistence.BoardDAO;
import org.board.persistence.ReplyDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO replyDAO;

	@Inject
	private BoardDAO boardDAO;
	
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		replyDAO.create(vo);
		boardDAO.updateReplyCnt(vo.getB_no(), 1);
	}

	@Override
	public List<ReplyVO> listReply(Integer b_no) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.list(b_no);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDAO.update(vo);
	}

	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		int b_no = replyDAO.getB_no(rno);
		
		replyDAO.delete(rno);
		boardDAO.updateReplyCnt(b_no, -1);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer b_no, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.listPage(b_no, cri);
	}

	@Override
	public int count(Integer b_no) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.count(b_no);
	}

}
