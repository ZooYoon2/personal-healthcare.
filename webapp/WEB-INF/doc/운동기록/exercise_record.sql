/**********************************/
/* Table Name: 운동기록 */
/**********************************/
DROP TABLE exercise_record CASCADE CONSTRAINTS;

CREATE TABLE EXERCISE_RECORD(
    EXERCISE_RECORD_NO                NUMBER(10)     NOT NULL    PRIMARY KEY,
    EXERCISE_NO                       NUMBER(10)     NOT NULL,
    MEMBERNO                         NUMBER(10)     NOT NULL,
    EXERCISE_RECORD_DATE              DATE     NOT NULL,
    EXERCISE_RECORD_TIME              NUMBER(10)    NULL ,
    EXERCISE_RECORD_SETOF             NUMBER(10)    NULL ,
    EXERCISE_RECORD_REPEAT            NUMBER(10)    NULL ,
  FOREIGN KEY (EXERCISE_NO) REFERENCES EXERCISE (EXERCISE_NO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE EXERCISE_RECORD is '운동기록';
COMMENT ON COLUMN EXERCISE_RECORD.EXERCISE_RECORD_NO is '운동기록번호';
COMMENT ON COLUMN EXERCISE_RECORD.EXERCISE_NO is '운동 번호';
COMMENT ON COLUMN EXERCISE_RECORD.MEMBERNO is '회원 번호';
COMMENT ON COLUMN EXERCISE_RECORD.EXERCISE_RECORD_DATE is '기록일';
COMMENT ON COLUMN EXERCISE_RECORD.EXERCISE_RECORD_TIME is '운동 시간';
COMMENT ON COLUMN EXERCISE_RECORD.EXERCISE_RECORD_SETOF is '운동 세트';
COMMENT ON COLUMN EXERCISE_RECORD.EXERCISE_RECORD_REPEAT is '운동 횟수';

DROP SEQUENCE EXERCISE_RECORD_SEQ;
CREATE SEQUENCE EXERCISE_RECORD_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 9999999999
  CACHE 2
  NOCYCLE;
  
  
--삽입(시간기준, 시스템시간)
INSERT INTO exercise_record(exercise_record_no, exercise_no, memberno, exercise_record_date, exercise_record_time,
 exercise_record_setof, exercise_record_repeat)
 VALUES(exercise_record_seq.nextval, 1, 1, sysdate, 50, NULL, NULL);
 
--삽입(반복기준, 시스템시간)
INSERT INTO exercise_record(exercise_record_no, exercise_no, memberno, exercise_record_date, exercise_record_time,
 exercise_record_setof, exercise_record_repeat)
 VALUES(exercise_record_seq.nextval, 2, 1, sysdate, NULL, 3, 10);

--삽입(시간기준)
INSERT INTO exercise_record(exercise_record_no, exercise_no, memberno, exercise_record_date, exercise_record_time,
 exercise_record_setof, exercise_record_repeat)
 VALUES(exercise_record_seq.nextval, 2, 1, TO_DATE('2022-12-21', 'YYYY-MM-DD'), 50, NULL, NULL);
 
--삽입(반복기준)
INSERT INTO exercise_record(exercise_record_no, exercise_no, memberno, exercise_record_date, exercise_record_time,
 exercise_record_setof, exercise_record_repeat)
 VALUES(exercise_record_seq.nextval, 2, 1, TO_DATE('2022-12-21', 'YYYY-MM-DD'), NULL, 3, 10);
 
--목록
SELECT exercise_record_no, exercise_no, memberno, exercise_record_date, exercise_record_time,
    exercise_record_setof, exercise_record_repeat 
FROM exercise_record;

--조회(전체,운동이름)
SELECT r.exercise_record_no, r.exercise_no, r.memberno, TO_CHAR(r.exercise_record_date,'YYYY-MM-DD'), 
       r.exercise_record_time, r.exercise_record_setof, r.exercise_record_repeat,
       e.exercise_name
FROM exercise_record r, exercise e
WHERE r.exercise_no = e.exercise_no
ORDER BY exercise_record_no;

--조회(특정 기록, 운동이름)
SELECT r.exercise_record_no, r.exercise_no, r.memberno, TO_CHAR(r.exercise_record_date,'YYYY-MM-DD'), 
       r.exercise_record_time, r.exercise_record_setof, r.exercise_record_repeat,
       e.exercise_name
    FROM exercise_record r, exercise e
    WHERE r.exercise_record_no = 1 AND r.exercise_no = e.exercise_no

--조회(특정날짜,운동이름)
SELECT r.exercise_record_no, r.exercise_no, r.memberno, TO_CHAR(r.exercise_record_date,'YYYY-MM-DD'), 
       r.exercise_record_time, r.exercise_record_setof, r.exercise_record_repeat,
       e.exercise_name
FROM exercise_record r, exercise e
WHERE r.exercise_no = e.exercise_no AND r.exercise_record_date = TO_DATE('2022-12-21', 'YYYY-MM-DD')
ORDER BY exercise_record_no;

--수정(시간기준)
UPDATE exercise_record SET exercise_no = 2, exercise_record_time = 30
    WHERE exercise_record_no = 1;

--수정(반복기준)
UPDATE exercise_record SET exercise_no = 2, exercise_record_setof = 5, exercise_record_repeat = 12
    WHERE exercise_record_no = 2;

--삭제
DELETE FROM exercise_record WHERE exercise_record_no = 1;

COMMIT;
  