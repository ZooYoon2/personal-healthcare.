package dev.mvc.exercise_record;

import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

// Spring framework에서 제공하는 기능
// application.properties를 읽어서 DBMS 연결/해제 자동 구현
// try ~ catch 자동 구현
// cateVO 값을 SQL에 자동 전달 및 실행
// return 자동 구현
public interface ExerciseRecordDAOInter {
  /*
   * 등록(시간기준)
   * id="create_time"
   * @param exerciseVO
   * @return 등록 레코드 갯수
   */
  public int create_time(ExerciseRecordVO exerciseRecordVO);
  /*
   * 등록(반복기준)
   * id="create_repeat"
   * @param exerciseVO
   * @return 등록 레코드 갯수
   */
  public int create_repeat(ExerciseRecordVO exerciseRecordVO);
  /*
   * 검색
   * id="read"
   * @param exerciseVO
   * @return 검색 레코드 리스트
   */
  public ExerciseRecordVO read(int exercise_record_no);
  
  public ArrayList<ExerciseRecordVO> list();
  
  public ArrayList<ExerciseRecordVO> daily_list(HashMap map);
  
  /*
   * 등록(시간기준)
   * id="create_time"
   * @param exerciseVO
   * @return 등록 레코드 갯수
   */
  public int update_time(ExerciseRecordVO exerciseRecordVO);
  /*
   * 등록(반복기준)
   * id="create_repeat"
   * @param exerciseVO
   * @return 등록 레코드 갯수
   */
  public int update_repeat(ExerciseRecordVO exerciseRecordVO);
  
  public int delete(int exercise_record_no);
  
  public ArrayList<Map<String,String>> exercise_list_streamline(HashMap<String,Object> map);
  public int search_count(HashMap<String, Object> map);
}


