package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;

public interface NoticeProcInter {
  /*
   * 등록(글)
   * @param noticeVO
   * @return 등록 레코드 갯수
   */
  public int create(NoticeVO noticeVO);
  /*
   * 등록(이미지)
   * @param noticeImageVO
   * @return 등록 레코드 갯수
   */
  public int add_file(ArrayList<NoticeFileVO> noticeFileVOs);
  public ArrayList<NoticeVO> list_all();
  public NoticeVO read(int notice_no);
  public int count(int notice_no);
  public ArrayList<NoticeFileVO> read_file(int notice_no);
  
  public int delete(int notice_no);
  public int delete_file(int notice_no);
  
  public int update(NoticeVO noticeVO);
  public int update_file(int notice_no);
  public int delete_file_no(int notice_file_no);
  public int delete_file_reminders(int notice_no, String[] keepFileNos);
  
  public ArrayList<NoticeVO> list_all_search_paging(HashMap<String, Object> map);
  
  public String pagingBox(int search_count, int now_page, String word);
  public int search_count(HashMap<String, Object> map);
}
