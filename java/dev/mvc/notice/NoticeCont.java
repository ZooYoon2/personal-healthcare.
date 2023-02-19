package dev.mvc.notice;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class NoticeCont {  
  @Autowired
  @Qualifier("dev.mvc.story.NoticeProc")
  private NoticeProcInter noticeProc;
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc;
  
  public NoticeCont() {
    System.out.println("-> NoticeCont created.");
  }
  
  @RequestMapping(value="/notice/create.do",method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/notice/create");
    return mav;
  }
  @RequestMapping(value="/notice/create.do",method=RequestMethod.POST)
  public ModelAndView create(MultipartHttpServletRequest request, NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    
    /*Enumeration<String> params = request.getParameterNames();
    while(params.hasMoreElements()){
      String paramName = params.nextElement();
      System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
     }*/
    
    List<MultipartFile> fileList = request.getFiles("file");
    ArrayList<NoticeFileVO> noticeFileVOs = new ArrayList<>();
    
    int cnt = this.noticeProc.create(noticeVO); //컨텐츠ID와 함꼐 story데이터추가
    int notice_no = noticeVO.getNotice_no();
    System.out.println("->noticeNO : "+notice_no);
    
    for(MultipartFile mf : fileList) {
      
      String fileFile = "";          // 원본 파일명 File
      fileFile = mf.getOriginalFilename(); // 원본 순수 파일명 산출
      System.out.println("-> file: " + fileFile);
      if(fileFile=="") {
        break;
      }
      String savefileFile = "";   // 저장된 파일명, File

      // 기준 경로 확인
      String user_dir = System.getProperty("user.dir"); // 시스템 제공
      // System.out.println("-> User dir: " + user_dir);
      //  --> User dir: C:\kd\ws_java\resort_v1sbm3c
      
      // 파일 접근임으로 절대 경로 지정, static 폴더 지정
      // 완성된 경로 C:/kd/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage
      String upDir =  user_dir + "/src/main/resources/static/notice/storage"; // 절대 경로
      // System.out.println("-> upDir: " + upDir);
      
      long fileSize = mf.getSize();  // 파일 크기
      
      if (fileSize > 0) { // 파일 크기 체크
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        savefileFile = Upload.saveFileSpring(mf, upDir);
      }
      
      NoticeFileVO tmpVO = new NoticeFileVO();
      tmpVO.setNotice_no(notice_no);
      tmpVO.setFile_og(fileFile);
      tmpVO.setFile_save(savefileFile);
      tmpVO.setFile_size((int) fileSize);
      noticeFileVOs.add(tmpVO);
    }
    
    int cnt2 = this.noticeProc.add_file(noticeFileVOs);
    //mav.setViewName("redirect:/notice/list_all.do");
    mav.setViewName("redirect:/notice/list_all_search_paging.do");
    return mav;
  }

  @RequestMapping(value="/notice/list_all.do",method = RequestMethod.GET)
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/list_all");
    ArrayList<NoticeVO> noticeVOs = this.noticeProc.list_all();
    mav.addObject("noticeVOs",noticeVOs);
    
    return mav;
  }
  
  @RequestMapping(value = "/notice/list_all_search_paging.do", method = RequestMethod.GET)
  public ModelAndView list_by_cateno_search_paging(@RequestParam(value = "word", defaultValue = "") String word,
                                                                     @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
    System.out.println("--> now_page: " + now_page);

    ModelAndView mav = new ModelAndView();

    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word); // #{word}
    map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

    // 검색 목록
    ArrayList<NoticeVO> noticeVOs = this.noticeProc.list_all_search_paging(map);
    mav.addObject("noticeVOs", noticeVOs);

    // 검색된 레코드 갯수
    int search_count = this.noticeProc.search_count(map);
    mav.addObject("search_count", search_count);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
     * 18 19 20 [다음]
     * @param cateno 카테고리번호
     * @param search_count 검색(전체) 레코드수
     * @param now_page 현재 페이지
     * @param word 검색어
     * @return 페이징용으로 생성된 HTML/CSS tag 문자열
     */
    String paging = noticeProc.pagingBox(search_count, now_page, word);
    mav.addObject("paging", paging);

    // mav.addObject("now_page", now_page);
    
    mav.setViewName("/notice/list_all_search_paging");  // /contents/list_by_cateno_search_paging.jsp

    return mav;
  }
  
  @RequestMapping(value="/notice/read.do",method = RequestMethod.GET)
  public ModelAndView read(int notice_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("notice/read");
    NoticeVO noticeVO = this.noticeProc.read(notice_no);
    this.noticeProc.count(notice_no);
    ArrayList<NoticeFileVO> noticeFileVOs = this.noticeProc.read_file(notice_no);
    for(NoticeFileVO fileVO : noticeFileVOs) {
      fileVO.setFile_size_label(Tool.unit(fileVO.getFile_size()));
    }
    mav.addObject("noticeVO",noticeVO);
    mav.addObject("noticeFileVOs", noticeFileVOs);
    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value="/notice/delete.do",method=RequestMethod.POST)
  public String delete(int notice_no) {
    this.noticeProc.delete_file(notice_no);
    int cnt = this.noticeProc.delete(notice_no);
    String code;
    if(cnt ==0) {
      code = "삭제 실패";
    }
    else {
      code = "삭제 성공";
    }
    return code;
  }
  
  @RequestMapping(value="/notice/update.do",method=RequestMethod.GET)
  public ModelAndView update(HttpSession session, int notice_no) {
    ModelAndView mav = new ModelAndView();
    if(this.adminProc.isAdmin(session)) {
      NoticeVO noticeVO = this.noticeProc.read(notice_no);
      if((Integer)session.getAttribute("adminno")==noticeVO.getAdminno()) {
        mav.setViewName("notice/update");
        ArrayList<NoticeFileVO> noticeFileVOs = this.noticeProc.read_file(notice_no);
        mav.addObject("noticeVO",noticeVO);
        mav.addObject("noticeFileVOs", noticeFileVOs);
      }
    }
    else {
      mav.setViewName("/admin/login_need");
    }
    return mav;
  }
  
  @RequestMapping(value="/notice/update.do",method=RequestMethod.POST)
  public ModelAndView update(MultipartHttpServletRequest request, NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    /*Enumeration<String> params = request.getParameterNames();
    while(params.hasMoreElements()){
      String paramName = params.nextElement();
      System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
     }*/
    
    List<MultipartFile> fileList = request.getFiles("file");
    String[] keepFileNos = request.getParameterValues("keepFile");
    ArrayList<NoticeFileVO> noticeFileVOs = new ArrayList<>();
    
    int cnt = this.noticeProc.update(noticeVO); //컨텐츠ID와 함꼐 story데이터추가
    int notice_no = noticeVO.getNotice_no();
    System.out.println("->noticeNO : "+notice_no);
    int delcnt = this.noticeProc.delete_file_reminders(notice_no, keepFileNos);

    for(MultipartFile mf : fileList) {
      
      String fileFile = "";          // 원본 파일명 File
      fileFile = mf.getOriginalFilename(); // 원본 순수 파일명 산출
      System.out.println("-> file: " + fileFile);
      if(fileFile=="") {
        break;
      }
      String savefileFile = "";   // 저장된 파일명, File

      // 기준 경로 확인
      String user_dir = System.getProperty("user.dir"); // 시스템 제공
      // System.out.println("-> User dir: " + user_dir);
      //  --> User dir: C:\kd\ws_java\resort_v1sbm3c
      
      // 파일 접근임으로 절대 경로 지정, static 폴더 지정
      // 완성된 경로 C:/kd/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage
      String upDir =  user_dir + "/src/main/resources/static/notice/storage"; // 절대 경로
      // System.out.println("-> upDir: " + upDir);
      
      long fileSize = mf.getSize();  // 파일 크기
      
      if (fileSize > 0) { // 파일 크기 체크
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        savefileFile = Upload.saveFileSpring(mf, upDir);
      }
      
      NoticeFileVO tmpVO = new NoticeFileVO();
      tmpVO.setNotice_no(notice_no);
      tmpVO.setFile_og(fileFile);
      tmpVO.setFile_save(savefileFile);
      tmpVO.setFile_size((int) fileSize);
      noticeFileVOs.add(tmpVO);
    }
    
    int cnt2 = this.noticeProc.add_file(noticeFileVOs);
    //mav.setViewName("redirect:/notice/list_all.do");
    mav.setViewName("redirect:/notice/read.do?notice_no="+notice_no);
    return mav;
  }
}
