CREATE TABLE tb_board (

	b_no INT NOT NULL AUTO_INCREMENT,			-- 게시글 번호
	title VARCHAR(200) NOT NULL,				-- 게시글 제목
	content TEXT NULL,							-- 게시글 내용
	writer VARCHAR(50) NOT NULL, 				-- 게시글 작성자
	regdate TIMESTAMP NOT NULL DEFAULT NOW(),	-- 게시글 등록시간
	viewcnt INT DEFAULT 0, 						-- 게시글 조회수
	PRIMARY KEY (b_no)							-- 게시글 기본키
	
)

SELECT * FROM tb_board order by b_no desc

CREATE TABLE `tb_reply` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `b_no` int(11) NOT NULL DEFAULT '0',
  `replytext` varchar(1000) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `replyer` varchar(50) NOT NULL,
  PRIMARY KEY (`rno`),
  KEY `fk_board` (`bno`),
  CONSTRAINT `fk_b` FOREIGN KEY (`bno`) REFERENCES `tb_board` (`b_no`)
) 

drop table tb_reply

-- 댓글 갯수 컬럼
ALTER TABLE tb_board ADD COLUMN replycnt int DEFAULT 0;

-- 댓글 갯수와 rno의 개수 맞춰주기
update tb_board set replycnt = (select count(rno) from tb_reply where bno = tb_board.b_no)where b_no > 0;


CREATE TABLE tb_board_file (
	file_name VARCHAR(150) NOT NULL,
	b_no INT NOT NULL,
	regdate TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY(file_name)
)

-- 첨부파일 테이블 참조키 설정
ALTER TABLE tb_board_file ADD CONSTRAINT fk_board_file FOREIGN KEY(b_no) REFERENCES tb_board(b_no)

-- 게시글 테이블 첨부파일 갯수 컬럼 추가
ALTER TABLE tb_board ADD COLUMN filecnt INT DEFAULT 0


CREATE TABLE tb_user(
	user_id VARCHAR(50) NOT NULL,
	user_pw VARCHAR(100) NOT NULL,
	user_name VARCHAR(100) NOT NULL,
	user_email VARCHAR(50) NOT NULL,
	user_point INT NOT NULL DEFAULT 0,
	session_key VARCHAR(50) NOT NULL DEFAULT 'none',
	session_limit TIMESTAMP,
	user_img VARCHAR(100) NOT NULL DEFAULT 'user/default-user.png',
	user_login_date TIMESTAMP NOT NULL DEFAULT NOW(),
	user_join_date TIMESTAMP NOT NULL DEFAULT NOW(),
	user_signature VARCHAR(200) NOT NULL DEFAULT '안녕하세요^-^',
	PRIMARY KEY(user_id)
)

ALTER TABLE tb_reply CHANGE bno b_no int(11) NOT NULL DEFAULT '0'
