/**********************************/
/* Table Name: 운동 */
/**********************************/
DROP TABLE EXERCISE CASCADE CONSTRAINTS;

CREATE TABLE EXERCISE(
    EXERCISE_NO                       NUMBER(10)     NOT NULL       PRIMARY KEY,
    EXERCISE_TYPE_NO                  NUMBER(10)     NULL ,
    EXERCISE_NAME                     VARCHAR(20)    NULL ,
    EXERCISE_EQ                       VARCHAR(20)    NULL ,
    EXERCISE_PRO                     VARCHAR(3000)    NULL ,
    EXERCISE_INFO                     VARCHAR(3000)    NULL ,
    EXERCISE_PRECAU                     VARCHAR(3000)    NULL ,
    EXERCISE_YOUTUBE                  VARCHAR(500)     NULL ,
    EXERCISE_CHAR                     VARCHAR(100)     NULL ,
    ADMINNO                         NUMBER(10)     NULL ,
    EXERCISE_DATE                     DATE     NOT NULL ,
    file1                                   VARCHAR(100)          NULL,  -- 원본 파일명 image
    file1saved                            VARCHAR(100)          NULL,  -- 저장된 파일명, image
    thumb1                              VARCHAR(100)          NULL,   -- preview image
    size1                                 NUMBER(10)      DEFAULT 0 NULL,  -- 파일 사이즈
    FOREIGN KEY (EXERCISE_TYPE_NO) REFERENCES EXERTYPE (EXERCISE_TYPE_NO),
    FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE EXERCISE is '운동';
COMMENT ON COLUMN EXERCISE.EXERCISE_NO is '운동번호';
COMMENT ON COLUMN EXERCISE.EXERCISE_TYPE_NO is '운동종류번호';
COMMENT ON COLUMN EXERCISE.EXERCISE_NAME is '운동명';
COMMENT ON COLUMN EXERCISE.EXERCISE_EQ is '운동기구명';
COMMENT ON COLUMN EXERCISE.EXERCISE_PRO is '운동순서';
COMMENT ON COLUMN EXERCISE.EXERCISE_INFO is '운동정보';
COMMENT ON COLUMN EXERCISE.EXERCISE_PRECAU is '운동주의사항';
COMMENT ON COLUMN EXERCISE.EXERCISE_YOUTUBE is '운동유튜브주소';
COMMENT ON COLUMN EXERCISE.EXERCISE_CHAR is '운동특징';
COMMENT ON COLUMN EXERCISE.ADMINNO is '관리자번호';
COMMENT ON COLUMN EXERCISE.EXERCISE_DATE is '등록일';
COMMENT ON COLUMN EXERCISE.file1 is '메인 이미지';
COMMENT ON COLUMN EXERCISE.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN EXERCISE.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN EXERCISE.size1 is '메인 이미지 크기';

DROP SEQUENCE EXERCISE_SEQ;

CREATE SEQUENCE EXERCISE_SEQ
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

  
INSERT INTO EXERCISE(EXERCISE_NO,EXERCISE_TYPE_NO,EXERCISE_NAME,EXERCISE_EQ,EXERCISE_PRO,EXERCISE_INFO,EXERCISE_PRECAU,EXERCISE_YOUTUBE,EXERCISE_CHAR,ADMINNO,EXERCISE_DATE,file1, file1saved, thumb1, size1)
VALUES(EXERCISE_SEQ.nextval,1,'러닝','러닝머신','운동순서','뛴다','운동주의사항','유튜브' ,'힘들다',1,sysdate,'asdf','asdfasdf','asdfas', 7);
commit;

-- 전체 목록
SELECT EXERCISE_NO,EXERCISE_TYPE_NO,EXERCISE_NAME,EXERCISE_EQ,EXERCISE_INFO,EXERCISE_YOUTUBE,EXERCISE_CHAR,ADMINNO,EXERCISE_DATE,file1, file1saved, thumb1, size1
FROM EXERCISE
ORDER BY EXERCISE_NO ASC;

-- 조회
SELECT EXERCISE_NO,EXERCISE_TYPE_NO,EXERCISE_NAME,EXERCISE_EQ,EXERCISE_INFO,EXERCISE_YOUTUBE,EXERCISE_CHAR,ADMINNO,EXERCISE_DATE,file1, file1saved, thumb1, size1
FROM EXERCISE
WHERE EXERCISE_NO=1;

-- 수정
UPDATE EXERCISE
SET EXERCISE_NAME='런닝',EXERCISE_EQ='런닝머신',EXERCISE_INFO='죽어라 뛴다',EXERCISE_YOUTUBE='https://www.youtube.com/watch?v=jMc_0h9vcN0',EXERCISE_CHAR='건강에 안좋다',EXERCISE_DATE=sysdate
WHERE EXERCISE_NO=1;

commit;

-- 삭제
DELETE FROM EXERCISE
WHERE EXERCISE_NO=1;

commit;

-- 레코드 갯수
SELECT COUNT(*) as cnt FROM EXERCISE;
