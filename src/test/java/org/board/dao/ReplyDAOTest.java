package org.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.board.domain.Criteria;
import org.board.domain.ReplyVO;
import org.board.persistence.ReplyDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ReplyDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Inject
	private ReplyDAO dao;
	
	/*@Test
	public void testReplyCreate() throws Exception {
		
		for(int i=1; i<=100; i++) {
			
			ReplyVO vo = new ReplyVO();
			vo.setBno(3003);
			vo.setReplytext(i + "번째 댓글입니다.");
			vo.setReplyer("user0"+(i%10));
			dao.create(vo);
		}
	}*/
	
	@Test
	public void testReplyList() throws Exception {
		
		logger.info(dao.list(3003).toString());
	}
	
	/*@Test
	public void testReplyUpdate() throws Exception {
		
		ReplyVO vo = new ReplyVO();
		vo.setReply_no(2);
		vo.setReply_content(2+"번째 댓글 수정");
		dao.update(vo);
	}*/

	/*@Test
	public void testReplyDelete() throws Exception {
		dao.delete(3);
	}*/
	
	@Test
	public void testReplyPaging() throws Exception {
		Criteria cri = new Criteria();
		cri.setPerPageNum(20);
		cri.setPage(1);
		
		List<ReplyVO> list = dao.listPage(1000, cri);
		
		for (ReplyVO reply : list) {
			logger.info(reply.getRno() + ":" + reply.getReplytext());
		}
	}
}
