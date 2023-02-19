package dev.mvc.exercise_record;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component("dev.mvc.exercise_record.ExerciseRecordProc")
public class ExerciseRecordProc implements ExerciseRecordProcInter {
  // CateDAOInter interface 만 존재하고 구현 class는 존재하지 않음.
  // interface는 객체를 만들 수 없고 할당만 받을 수 있음.
  
  @Autowired
  private ExerciseRecordDAOInter ExerciseRecordDAO;
  
  public ExerciseRecordProc() {
    System.out.println("-> ExerciseRecordProc created.");
    // System.out.println("-> CateProc: " + (cateDAO == null));
  }

  @Override
  public int create_time(ExerciseRecordVO exerciseRecordVO) {
    int cnt = this.ExerciseRecordDAO.create_time(exerciseRecordVO);
    return cnt;
  }

  @Override
  public int create_repeat(ExerciseRecordVO exerciseRecordVO) {
    int cnt = this.ExerciseRecordDAO.create_repeat(exerciseRecordVO);
    return cnt;
  }

  @Override
  public ExerciseRecordVO read(int exercise_record) {
    ExerciseRecordVO exerRecVO = this.ExerciseRecordDAO.read(exercise_record);
    return exerRecVO;
  }
  
  @Override
  public ArrayList<ExerciseRecordVO> list(){
    ArrayList<ExerciseRecordVO> list = this.ExerciseRecordDAO.list();
    return list;
  }

  @Override
  public ArrayList<ExerciseRecordVO> daily_list(HashMap map) {
    ArrayList<ExerciseRecordVO> list = this.ExerciseRecordDAO.daily_list(map);
    return list;
  }

  @Override
  public int update_time(ExerciseRecordVO exerciseRecordVO) {
    int cnt = this.ExerciseRecordDAO.update_time(exerciseRecordVO);
    return cnt;
  }

  @Override
  public int update_repeat(ExerciseRecordVO exerciseRecordVO) {
    int cnt = this.ExerciseRecordDAO.update_repeat(exerciseRecordVO);
    return cnt;
  }

  @Override
  public int delete(int exercise_record_no) {
    int cnt = this.ExerciseRecordDAO.delete(exercise_record_no);
    return cnt;
  }

  @Override
  public ArrayList<Map<String, String>> exercise_list_streamline(HashMap<String, Object> map) {
    int begin_of_page = ((Integer)map.get("now_page") - 1) * ExerciseRecord.RECORD_PER_PAGE;
    int start_num = begin_of_page + 1;
    int end_num = begin_of_page + ExerciseRecord.RECORD_PER_PAGE;   
    map.put("start_num", start_num);
    map.put("end_num", end_num);
   
    ArrayList<Map<String,String>> list = this.ExerciseRecordDAO.exercise_list_streamline(map);    
    return list;
  }

  @Override
  public String pagingBox(int search_count, int now_page, String word) {
    int total_page = (int)(Math.ceil((double)search_count/ExerciseRecord.RECORD_PER_PAGE)); // 전체 페이지 수 
    int total_grp = (int)(Math.ceil((double)total_page/ExerciseRecord.PAGE_PER_BLOCK)); // 전체 그룹  수
    int now_grp = (int)(Math.ceil((double)now_page/ExerciseRecord.PAGE_PER_BLOCK));  // 현재 그룹 번호
    
    int start_page = ((now_grp - 1) * ExerciseRecord.PAGE_PER_BLOCK) + 1; // 특정 그룹의 시작  페이지  
    int end_page = (now_grp * ExerciseRecord.PAGE_PER_BLOCK);               // 특정 그룹의 마지막 페이지   
     
    StringBuffer str = new StringBuffer(); // String class 보다 문자열 추가등의 편집시 속도가 빠름 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    color: #668db4;"); 
    str.append("    font-size: 1em;"); 
    str.append("    font-weight: bold;");
    str.append("    text-decoration:underline;");
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 

    int _now_page = (now_grp - 1) * ExerciseRecord.PAGE_PER_BLOCK;  
    if (now_grp >= 2){ // 현재 그룹번호가 2이상이면 페이지수가 11페이 이상임으로 이전 그룹으로 갈수 있는 링크 생성 
      str.append("<span class='span_box_1'><A href='javascript:void(0);' onclick='modalPaging("+_now_page+")'>이전</A></span>"); 
    } 
 
    // 중앙의 페이지 목록
    for(int i=start_page; i<=end_page; i++){ 
      if (i > total_page){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break; 
      } 
  
      if (now_page == i){ // 목록에 출력하는 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        //str.append("<span class='span_box_1'><A href='"+ExerciseRecord.LIST_PAGE+"?word="+word+"&now_page="+i+"'>"+i+"</A></span>");
        str.append("<span class='span_box_1'><A href='javascript:void(0);' onclick='modalPaging("+i+")'>"+i+"</A></span>");
      } 
    } 

    _now_page = (now_grp * ExerciseRecord.PAGE_PER_BLOCK)+1;
    if (now_grp < total_grp){ 
      str.append("<span class='span_box_1'><A href='javascript:void(0);' onclick='modalPaging("+_now_page+")'>이전</A></span>");
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
  @Override
  public int search_count(HashMap<String, Object> map) {
    int cnt = this.ExerciseRecordDAO.search_count(map);
    return cnt;
  }
}

