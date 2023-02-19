/**********************************/
/* Table Name: 공지사항 */
/**********************************/
DROP TABLE NOTICE CASCADE CONSTRAINTS;

CREATE TABLE NOTICE(
		NOTICE_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ADMINNO                       		NUMBER(10)		 NOT NULL,
		NOTICE_TITLE                  		VARCHAR2(300)		 NULL ,
		NOTICE_CONTENT                		VARCHAR2(4000)		 NULL ,
		NOTICE_WORD                   		VARCHAR2(300)		 NULL ,
		NOTICE_RDATE                  		DATE		 NULL ,
		NOTICE_UDATE                  		DATE		DEFAULT NULL     NULL,
		NOTICE_CNT                    		NUMBER(7)	DEFAULT 0   NOT NULL  ,
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (adminno)
);

COMMENT ON TABLE NOTICE is '공지사항';
COMMENT ON COLUMN NOTICE.NOTICE_NO is '공지사항번호';
COMMENT ON COLUMN NOTICE.ADMINNO is '관리자번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE is '제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT is '내용';
COMMENT ON COLUMN NOTICE.NOTICE_WORD is '검색어';
COMMENT ON COLUMN NOTICE.NOTICE_RDATE is '등록일';
COMMENT ON COLUMN NOTICE.NOTICE_UDATE is '수정일';
COMMENT ON COLUMN NOTICE.NOTICE_CNT is '조회수';

DROP SEQUENCE NOTICE_SEQ;

CREATE SEQUENCE NOTICE_SEQ
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

--삽입
INSERT INTO notice(notice_no, adminno, notice_title, notice_content, notice_word, notice_rdate)
VALUES(notice_seq.nextval, 1, '임시공지', '테스트를 위한 임시공지', '테스트', sysdate);

--조회
SELECT * FROM notice;
SELECT * FROM notice WHERE notice_no = 1;

--수정
UPDATE notice set notice_title = '임시공지수정', notice_content = '수정 테스트를 위한 임시공지 수정', notice_word='수정테스트',
notice_udate = sysdate WHERE notice_no = 1;

--삭제
DELETE FROM notice WHERE notice_no=1;

COMMIT;

/**********************************/
/* Table Name: 공지사항이미지 */
/**********************************/
DROP TABLE NOTICE_FILE CASCADE CONSTRAINTS;
CREATE TABLE NOTICE_FILE(
		NOTICE_FILE_NO                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NOTICE_NO                     		NUMBER(10)		 NOT NULL,
		FILE_OG                               VARCHAR2(100)    NOT NULL,
		FILE_SAVE                         VARCHAR2(100)    NOT NULL,
		FILE_SIZE                      		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (NOTICE_NO) REFERENCES NOTICE (NOTICE_NO)
);

COMMENT ON TABLE NOTICE_IMG is '공지사항이미지';
COMMENT ON COLUMN NOTICE_IMG.NOTICE_IMG_NO is '첨부파일번호';
COMMENT ON COLUMN NOTICE_IMG.NOTICE_NO is '공지사항번호';
COMMENT ON COLUMN NOTICE_IMG.FILE_OG is '원본파일명';
COMMENT ON COLUMN NOTICE_IMG.FILE_SAVE is '저장된파일명';
COMMENT ON COLUMN NOTICE_IMG.FILE_SIZE is '첨부파일크기';

DROP SEQUENCE NOTICE_FILE_SEQ;
CREATE SEQUENCE NOTICE_FILE_SEQ
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
  --삽입
INSERT INTO notice_file(notice_file_no, notice_no, file_og, file_save, file_size)
VALUES(notice_file_seq.nextval, 1,'testIMG.png', 'testIMG.png', 39);

--조회
SELECT * FROM notice_file WHERE notice_no = 1;

--수정

--삭제
DELETE FROM notice_file WHERE notice_no=1;
DELETE FROM notice_file WHERE notice_file_no=1;

COMMIT;
