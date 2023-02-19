package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;
import dev.mvc.tool.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.story.NoticeProc")
public class NoticeProc implements NoticeProcInter{
  @Autowired
  private NoticeDAOInter noticeDAO;

  @Override
  public int create(NoticeVO noticeVO) {
    int cnt = this.noticeDAO.create(noticeVO);
    return cnt;
  }

  @Override
  public int add_file(ArrayList<NoticeFileVO> noticeFileVOs) {
    if(noticeFileVOs.size()==0) {
      return 0;
    }
    for(NoticeFileVO nl : noticeFileVOs) {
      this.noticeDAO.add_file(nl);
    }
    return noticeFileVOs.size();
  }

  @Override
  public ArrayList<NoticeVO> list_all() {
    ArrayList<NoticeVO> noticeVOs = this.noticeDAO.list_all();
    return noticeVOs;
  }
  @Override
  public NoticeVO read(int notice_no) {
    NoticeVO noticeVO = this.noticeDAO.read(notice_no);
    return noticeVO;
  }
  @Override
  public ArrayList<NoticeFileVO> read_file(int notice_no){
    ArrayList<NoticeFileVO> noticeImageVOs = this.noticeDAO.read_file(notice_no);
    return noticeImageVOs;
  }

  @Override
  public int delete(int notice_no) {
    int cnt = this.noticeDAO.delete(notice_no);
    return cnt;
  }

  @Override
  public int delete_file(int notice_no) {
    int cnt = this.noticeDAO.delete_file(notice_no);
    return cnt;
  }

  @Override
  public int update(NoticeVO noticeVO) {
    int cnt = this.noticeDAO.update(noticeVO);
    return cnt;
  }

  @Override
  public int update_file(int notice_no) {
    int cnt = this.noticeDAO.update_file(notice_no);
    return cnt;
  }

  @Override
  public int delete_file_no(int notice_file_no) {
    int cnt = this.noticeDAO.delete_file_no(notice_file_no);
    return cnt;
  }

  @Override
  public ArrayList<NoticeVO> list_all_search_paging(HashMap<String, Object> map) {
    int begin_of_page = ((Integer)map.get("now_page") - 1) * Notice.RECORD_PER_PAGE;
    int start_num = begin_of_page + 1;
    int end_num = begin_of_page + Notice.RECORD_PER_PAGE;
    map.put("start_num", start_num);
    map.put("end_num", end_num);
    ArrayList<NoticeVO> list = this.noticeDAO.list_all_search_paging(map);
    
    return list;
  }

  @Override
  public String pagingBox(int search_count, int now_page, String word) {
    int total_page = (int)(Math.ceil((double)search_count/Notice.RECORD_PER_PAGE)); // 전체 페이지 수 
    int total_grp = (int)(Math.ceil((double)total_page/Notice.PAGE_PER_BLOCK)); // 전체 그룹  수
    int now_grp = (int)(Math.ceil((double)now_page/Notice.PAGE_PER_BLOCK));  // 현재 그룹 번호
    
    // 1 group: 1, 2, 3 ... 9, 10
    // 2 group: 11, 12 ... 19, 20
    // 3 group: 21, 22 ... 29, 30
    int start_page = ((now_grp - 1) * Notice.PAGE_PER_BLOCK) + 1; // 특정 그룹의 시작  페이지  
    int end_page = (now_grp * Notice.PAGE_PER_BLOCK);               // 특정 그룹의 마지막 페이지   
     
    StringBuffer str = new StringBuffer(); // String class 보다 문자열 추가등의 편집시 속도가 빠름 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    //str.append("    border: 1px;"); 
    //str.append("    border-style: solid;"); 
    //str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    //str.append("    background-color: #668db4;"); 
    str.append("    color: #668db4;"); 
    str.append("    font-size: 1em;"); 
    str.append("    font-weight: bold;");
    str.append("    text-decoration:underline;");
    //str.append("    border: 1px;"); 
    //str.append("    border-style: solid;"); 
    //str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    // 이전 10개 페이지로 이동
    // now_grp: 1 (1 ~ 10 page)
    // now_grp: 2 (11 ~ 20 page)
    // now_grp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
    int _now_page = (now_grp - 1) * Notice.PAGE_PER_BLOCK;  
    if (now_grp >= 2){ // 현재 그룹번호가 2이상이면 페이지수가 11페이 이상임으로 이전 그룹으로 갈수 있는 링크 생성 
      str.append("<span class='span_box_1'><A href='"+Notice.LIST_PAGE+"?&word="+word+"&now_page="+_now_page+"'>이전</A></span>"); 
      //str.append("<button style='text-align: center; border: 1px solid; padding:1px 6px 1px 6px;  margin:1px 2px 1px 2px;' onclick='location.href='"+Notice.LIST_PAGE+"?&word="+word+"&now_page="+_now_page+"'>이전</button>"); 
    } 
 
    // 중앙의 페이지 목록
    for(int i=start_page; i<=end_page; i++){ 
      if (i > total_page){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break; 
      } 
  
      if (now_page == i){ // 목록에 출력하는 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<span class='span_box_1'><A href='"+Notice.LIST_PAGE+"?word="+word+"&now_page="+i+"'>"+i+"</A></span>");  
        //str.append("<button style='text-align: center; border: 1px solid; padding:1px 6px 1px 6px;  margin:1px 2px 1px 2px;' onclick='location.href='"+Notice.LIST_PAGE+"?word="+word+"&now_page="+i+"'>"+i+"</button>");
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 페이지 5일경우 -> 현재 1그룹: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 페이지 15일경우 -> 현재 2그룹: (2 * 10) + 1 = 3그룹의 시작페이지 21
    // 현재 페이지 25일경우 -> 현재 3그룹: (3 * 10) + 1 = 4그룹의 시작페이지 31
    _now_page = (now_grp * Notice.PAGE_PER_BLOCK)+1; //  최대 페이지수 + 1 
    if (now_grp < total_grp){ 
      str.append("<span class='span_box_1'><A href='"+Notice.LIST_PAGE+"?&word="+word+"&now_page="+_now_page+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  @Override
  public int search_count(HashMap<String, Object> map) {
    int cnt = this.noticeDAO.search_count(map);
    return cnt;
  }

  @Override
  public int delete_file_reminders(int notice_no, String[] keepFileNos) {
    int cnt = this.noticeDAO.delete_file_reminders(notice_no, keepFileNos);
    return cnt;
  }

  @Override
  public int count(int notice_no) {
    int cnt = this.noticeDAO.count(notice_no);
    return cnt;
  }
}
