package dev.mvc.exercise_record;

/*
CREATE TABLE EXERCISE_RECORD(
    EXERCISE_RECORD_NO                NUMBER(10)     NOT NULL    PRIMARY KEY,
    EXERCISE_NO                       NUMBER(10)     NOT NULL,
    MEMBERNO                         NUMBER(10)     NOT NULL,
    EXERCISE_RECORD_DATE              DATE     NOT NULL,
    EXERCISE_RECORD_TIME              NUMBER(10)    DEFAULT NULL    NULL ,
    EXERCISE_RECORD_SETOF             NUMBER(10)    DEFAULT NULL    NULL ,
    EXERCISE_RECORD_REPEAT            NUMBER(10)    DEFAULT NULL    NULL ,
  FOREIGN KEY (EXERCISE_NO) REFERENCES EXERCISE (EXERCISE_NO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);
 */
public class ExerciseRecordVO {
  private int exercise_record_no;
  private int exercise_no;
  private int memberno;
  private String exercise_record_date;
  private int exercise_record_time;
  private int exercise_record_setof;
  private int exercise_record_repeat;
  private String exercise_name;
  
  public String getExercise_name() {
    return exercise_name;
  }
  public void setExrcise_name(String exrcise_name) {
    this.exercise_name = exrcise_name;
  }
  public int getExercise_record_no() {
    return exercise_record_no;
  }
  public void setExercise_record_no(int record_no) {
    this.exercise_record_no = record_no;
  }
  public int getExercise_no() {
    return exercise_no;
  }
  public void setExercise_no(int exercise_no) {
    this.exercise_no = exercise_no;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getExercise_record_date() {
    return exercise_record_date;
  }
  public void setExercise_record_date(String exercise_record_date) {
    this.exercise_record_date = exercise_record_date;
  }
  public int getExercise_record_time() {
    return exercise_record_time;
  }
  public void setExercise_record_time(int exercise_record_time) {
    this.exercise_record_time = exercise_record_time;
  }
  public int getExercise_record_setof() {
    return exercise_record_setof;
  }
  public void setExercise_record_setof(int exercise_record_setof) {
    this.exercise_record_setof = exercise_record_setof;
  }
  public int getExercise_record_repeat() {
    return exercise_record_repeat;
  }
  public void setExercise_record_repeat(int exercise_record_repeat) {
    this.exercise_record_repeat = exercise_record_repeat;
  }
}


