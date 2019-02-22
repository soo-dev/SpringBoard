# 안녕하세요! 최수영 포트폴리오 입니다.



## SpringBoard
	- Board with Spring framwork
	- 데이터베이스를 활용해서 기본적인 등록, 수정, 삭제, 조회 기능을 구현 
	- 웹 화면에서 페이징 처리와 검색 처리
	- Ajax를 이용하는 데이터 처리 
	- 쿠키나 세션 등을 이용한 로그인/로그아웃 인증 처리
	
## 사용한 기능
	- STS(Spring Tool Suite)
	- WAS : Tomcat 8
	- DBMS : MySQL 5.1
	- Tool : eclipse Oxygen
	- JSP, Bootstrap 등
	
<div>
	<h3>Spring Board의 데이터베이스 스키마 입니다.</h3>
</div>

```
CREATE TABLE tb_board (

	b_no INT NOT NULL AUTO_INCREMENT,			-- 게시글 번호
	title VARCHAR(200) NOT NULL,				-- 게시글 제목
	content TEXT NULL,					-- 게시글 내용
	writer VARCHAR(50) NOT NULL, 				-- 게시글 작성자
		regdate TIMESTAMP NOT NULL DEFAULT NOW(),	-- 게시글 등록시간
	viewcnt INT DEFAULT 0, 					-- 게시글 조회수
	PRIMARY KEY (b_no)					-- 게시글 기본키
	
)

SELECT * FROM tb_board order by b_no desc

CREATE TABLE `tb_reply` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,			-- 댓글 번호
  `b_no` int(11) NOT NULL DEFAULT '0',				-- 댓글이 달린 게시물의 번호
  `replytext` varchar(1000) NOT NULL,				-- 댓글 내용
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,	-- 댓글 등록 날짜
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,	-- 댓글 수정 날짜
  `replyer` varchar(50) NOT NULL,				-- 댓글 단 사용자
  PRIMARY KEY (`rno`),
  KEY `fk_board` (`bno`),
  CONSTRAINT `fk_b` FOREIGN KEY (`bno`) REFERENCES `tb_board` (`b_no`)
) 

drop table tb_reply

-- 댓글 갯수 컬럼
ALTER TABLE tb_board ADD COLUMN replycnt int DEFAULT 0;

-- 댓글 갯수와 rno의 개수 맞춰주기
update tb_board set replycnt = (select count(rno) from tb_reply where bno = tb_board.b_no)where b_no > 0;

CREATE TABLE tb_user(
	user_id VARCHAR(50) NOT NULL,						-- 사용자 ID
	user_pw VARCHAR(100) NOT NULL,						-- 비밀번호
	user_name VARCHAR(100) NOT NULL,					-- 닉네임 또는 이름
	user_email VARCHAR(50) NOT NULL,					-- 이메일
	session_key VARCHAR(50) NOT NULL DEFAULT 'none',			-- 세션 키
	session_limit TIMESTAMP,						-- 세션 제한 
	user_login_date TIMESTAMP NOT NULL DEFAULT NOW(),			-- 사용자 로그인 날짜
	user_join_date TIMESTAMP NOT NULL DEFAULT NOW(),			-- 사용자 회원가입 날짜
	PRIMARY KEY(user_id)
)


```

<div>
	<h3>메인 화면입니다.</h3>
	<p>부트스트랩으로 head, footer, main, left column으로 영역을 나누어 구성하였습니다.</p>
	<img src="https://user-images.githubusercontent.com/46646408/52951013-0e6ad600-33c4-11e9-9469-8124113067e7.PNG">
	<br>
	<div>
	<h3>로그인 전 후 헤더의 프로필 화면입니다..</h3>
	<p>로그인을 하지 않았을 때는 회원가입 또는 로그인을 하도록 유도합니다.</p>
	<span><img src="https://user-images.githubusercontent.com/46646408/52953947-38c09180-33cc-11e9-93f9-2c90f870363b.PNG"></span>
	<p>로그인을 했을 때는 자신의 프로필 정보를 볼 수 있는 내 프로필 버튼과 로그아웃으로 버튼을 설계하였습니다.</p>
	<span><img src="https://user-images.githubusercontent.com/46646408/52951019-0f036c80-33c4-11e9-9805-d42dbe1191a2.PNG"></span>
	</div>
	<br>
	<h3>회원가입과 로그인 관련 화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52951015-0f036c80-33c4-11e9-8dca-951df545cc00.PNG">
	<p>로그인 시 로그인 유지를 체크하면 쿠키를 이용해 사용자가 브라우저 종료 후 다시 그 브라우저로 들어가도 로그인이 유지되게끔 개발하였습니다.</p>
	<img src="https://user-images.githubusercontent.com/46646408/52951017-0f036c80-33c4-11e9-85d7-4336fbb984e9.PNG">
	<br>
	<h3>회원의 정보 페이지입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52958559-a6be8600-33d7-11e9-8098-6674c68c6b74.PNG">
	<br>
	<h3>로그아웃 화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52953944-3827fb00-33cc-11e9-9415-cf233cf60fb2.PNG">
	<br>
	<h3>게시물 CREATE 화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52951020-0f9c0300-33c4-11e9-8fad-6bb78351b3bb.PNG">
	<img src="https://user-images.githubusercontent.com/46646408/52951021-0f9c0300-33c4-11e9-9523-d68f5dd632f7.PNG">
	<br>
	<h3>게시물 LIST 화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52951023-10349980-33c4-11e9-9429-84f988bcd556.PNG">
	<br>
	<h3>게시물 READ 화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52951006-0b6fe580-33c4-11e9-8174-e36e8604d111.PNG">
	<br>
	<h3>게시물 READ 중 댓글 화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52951024-10349980-33c4-11e9-99b3-be49f8b73885.PNG">
	<img src="https://user-images.githubusercontent.com/46646408/52951025-10349980-33c4-11e9-9619-74693694ff82.PNG">
	<br>
	<p>로그인 했을 때는 바로 댓글을 달 수 있지만, 로그인 하지 않았을 시에는 다른 화면을 띄어 로그인을 유도합니다.</p>
	<img src="https://user-images.githubusercontent.com/46646408/52953945-38c09180-33cc-11e9-803c-b56dbe578318.PNG">
	<br>
	<h3>게시물 댓글 수정화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52951001-09a62200-33c4-11e9-9d2d-6e2ea13288be.PNG">
	<br>
	<h3>게시물 댓글 삭제화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52951009-0c087c00-33c4-11e9-96b4-6c3b28d570fb.PNG">
	<img src="https://user-images.githubusercontent.com/46646408/52951004-0ad74f00-33c4-11e9-9ffa-99a5f4ac2c5e.PNG">
	<br>
	<h3>게시물 UPDATE 화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52951010-0ca11280-33c4-11e9-8137-da74f33dc98e.PNG">
	<img src="https://user-images.githubusercontent.com/46646408/52951011-0ca11280-33c4-11e9-9aec-070323f09420.PNG">
	<br>
	<h3>게시물 DELETE 화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52953943-3827fb00-33cc-11e9-9331-6cee3e5f83c3.PNG">
	<img src="https://user-images.githubusercontent.com/46646408/52951009-0c087c00-33c4-11e9-96b4-6c3b28d570fb.PNG">
	<br>
	<h3>게시물 내의 검색 화면입니다.</h3>
	<img src="https://user-images.githubusercontent.com/46646408/52951012-0dd23f80-33c4-11e9-9fe6-8d70cc1a6aa6.PNG">
	
</div>
