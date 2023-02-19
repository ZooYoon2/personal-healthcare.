package dev.mvc.exercise_record;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import java.util.Date;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExerciseRecordCont {
  @Autowired
  @Qualifier("dev.mvc.exercise_record.ExerciseRecordProc") 
  private ExerciseRecordProcInter ExerciseRecordProc;
  
  public ExerciseRecordCont() {
    System.out.println("-> ExerciseRecordCont created.");
  }
  
 //통합 폼
 // http://localhost:9093/exercise_record/home.do
 @RequestMapping(value="/exercise_record/home.do", method = RequestMethod.GET)
 public ModelAndView home(HttpSession session) {
   System.out.println("-> home()");
   ModelAndView mav = new ModelAndView();
   if(session.getAttribute("memberno")!=null) {
     mav.setViewName("/exercise_record/home"); // /webapp/WEB-INF/views/exercise_record/home.jsp//JSP View path
   }
   else {
     mav.setViewName("/member/login_need");
   }
   return mav;
 }
 
 //등록 GET
 @ResponseBody
 @RequestMapping(value="/exercise_record/create_ajax.do",method = RequestMethod.GET)
 public ModelAndView create_ajax(int year, int month, int day) {
   ModelAndView mav = new ModelAndView();
   String date = Integer.toString(year)+'-'+Integer.toString(month)+'-'+Integer.toString(day);
   mav.addObject("date", date);
   mav.setViewName("/exercise_record/create_ajax");
   return mav;
 }
 //등록 POST
 @RequestMapping(value="/exercise_record/create_ajax.do",method=RequestMethod.POST)
 public String create(ExerciseRecordVO exerciseRecordVO) {
   if(exerciseRecordVO.getExercise_record_time() == 0) {
     this.ExerciseRecordProc.create_repeat(exerciseRecordVO);
   }
   else {
     this.ExerciseRecordProc.create_time(exerciseRecordVO);
   }
   return null;
 }
 //검색
 // http://localhost:9093/exercise_record/list_day_ajax.do
 @RequestMapping(value="/exercise_record/list_day_ajax.do", method = RequestMethod.GET)
 public ModelAndView list_day_ajax(HttpSession session,int year, int month, int day) {
   ModelAndView mav = new ModelAndView();
   String date = Integer.toString(year)+'-'+Integer.toString(month)+'-'+Integer.toString(day);
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("date", date); // #{word}
   map.put("memberno", (Integer)session.getAttribute("memberno")); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
   System.out.print("memberno ->"+(Integer)session.getAttribute("memberno"));
   ArrayList<ExerciseRecordVO> list = this.ExerciseRecordProc.daily_list(map);
   for(ExerciseRecordVO l : list) {
     System.out.print(l.getExercise_record_no());
   }
   mav.addObject("list", list);
   mav.addObject("date", date);
   mav.setViewName("/exercise_record/list_day_ajax");
   return mav;
 }
 //수정 조회
 // http://localhost:9093/exercise_record/edit_ajax.do
 @RequestMapping(value="/exercise_record/edit_ajax.do", method = RequestMethod.GET)
 public ModelAndView edit_ajax(int exercise_record_no) {
   ModelAndView mav = new ModelAndView();
   ExerciseRecordVO exerRecVO = this.ExerciseRecordProc.read(exercise_record_no);
   mav.addObject("exerRecVO", exerRecVO);
   mav.setViewName("/exercise_record/edit_ajax");
   return mav;
 }
//수정
// http://localhost:9093/exercise_record/edit_ajax.do
@RequestMapping(value="/exercise_record/edit_ajax.do", method = RequestMethod.POST)
public String update(ExerciseRecordVO exerciseRecordVO) {
  if(exerciseRecordVO.getExercise_record_time() == 0) {
    this.ExerciseRecordProc.update_repeat(exerciseRecordVO);
  }
  else {
    this.ExerciseRecordProc.update_time(exerciseRecordVO);
  }
  return null;
}
//삭제
@ResponseBody
@RequestMapping(value="/exercise_record/delete.do", method=RequestMethod.POST)
public String delete(int exercise_record_no) {
  int cnt = this.ExerciseRecordProc.delete(exercise_record_no);
  String code;
  if(cnt ==0) {
    code = "삭제 실패";
  }
  else {
    code = "삭제 성공";
  }
  return code;
}
//운동선택 모달창
@RequestMapping(value="/exercise_record/exerciseModal.do", method = RequestMethod.GET)
public ModelAndView exerModal(@RequestParam(value = "word", defaultValue = "") String word,
                                          @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
  ModelAndView mav = new ModelAndView();
  
//숫자와 문자열 타입을 저장해야함으로 Obejct 사용
  HashMap<String, Object> map = new HashMap<String, Object>();
  map.put("word", word); // #{word}
  map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

  // 검색 목록
  ArrayList<Map<String,String>> list = this.ExerciseRecordProc.exercise_list_streamline(map);
  mav.addObject("exerList", list);

  // 검색된 레코드 갯수
  int search_count = this.ExerciseRecordProc.search_count(map);
  mav.addObject("search_count", search_count);

  String paging = this.ExerciseRecordProc.pagingBox(search_count, now_page, word);
  mav.addObject("paging", paging);
  
  mav.setViewName("exercise_record/exerciseModal");
  
  return mav;
}
}





