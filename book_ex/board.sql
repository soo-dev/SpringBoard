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