package dev.mvc.exercise_record;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


// 데이터 처리 관련 알고리즘 구현, 사칙연산, 제어문
public interface ExerciseRecordProcInter {
  /*
   * 등록(시간기준)
   * @param exerciseVO
   * @return 등록 레코드 갯수
   */
  public int create_time(ExerciseRecordVO exerciseRecordVO);
  /*
   * 등록(반복기준)
   * @param exerciseVO
   * @return 등록 레코드 갯수
   */
  public int create_repeat(ExerciseRecordVO exerciseRecordVO);
  /*
   * 검색
   * @param exerciseVO
   * @return 검색 레코드 리스트
   */
  public ExerciseRecordVO read(int exercise_record_no);
  
  public ArrayList<ExerciseRecordVO> list();
  
  public ArrayList<ExerciseRecordVO> daily_list(HashMap map);
  
  /*
   * 등록(시간기준)
   * @param exerciseVO
   * @return 등록 레코드 갯수
   */
  public int update_time(ExerciseRecordVO exerciseRecordVO);
  /*
   * 등록(반복기준)
   * @param exerciseVO
   * @return 등록 레코드 갯수
   */
  public int update_repeat(ExerciseRecordVO exerciseRecordVO);
  
  public int delete(int exercise_record_no);
  
  public ArrayList<Map<String,String>> exercise_list_streamline(HashMap<String,Object> map);
  public String pagingBox(int search_count, int now_page, String word);
  public int search_count(HashMap<String, Object> map);
}



