package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.javassist.compiler.ast.Pair;

import dev.mvc.exercise_record.ExerciseRecordVO;

public interface NoticeDAOInter {
  /*
   * 등록(글)
   * id="create"
   * @param noticeVO
   * @return 등록 레코드 갯수
   */
  public int create(NoticeVO noticeVO);
  /*
   * 등록(이미지)
   * id="add_img"
   * @param noticeImageVO
   * @return 등록 레코드 갯수
   */
  public int add_file(NoticeFileVO noticeFileVO);
  
  public ArrayList<NoticeVO> list_all();
  
  public NoticeVO read(int notice_no);
  public int count(int notice_no);
  public ArrayList<NoticeFileVO> read_file(int notice_no);
  
  public int delete(int notice_no);
  public int delete_file(int notice_no);
  
  public int update(NoticeVO noticeVO);
  public int update_file(int notice_no);
  public int delete_file_no(int notice_file_no);
  public int delete_file_reminders(@Param("notice_no") int notice_no,@Param("keepFileNos") String[] keepFileNos);
  
  public ArrayList<NoticeVO> list_all_search_paging(HashMap<String, Object> map);
  public int search_count(HashMap<String, Object> map);
  
}
