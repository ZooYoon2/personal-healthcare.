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
    
    int cnt = this.noticeProc.create(noticeVO); //?????????ID??? ?????? story???????????????
    int notice_no = noticeVO.getNotice_no();
    System.out.println("->noticeNO : "+notice_no);
    
    for(MultipartFile mf : fileList) {
      
      String fileFile = "";          // ?????? ????????? File
      fileFile = mf.getOriginalFilename(); // ?????? ?????? ????????? ??????
      System.out.println("-> file: " + fileFile);
      if(fileFile=="") {
        break;
      }
      String savefileFile = "";   // ????????? ?????????, File

      // ?????? ?????? ??????
      String user_dir = System.getProperty("user.dir"); // ????????? ??????
      // System.out.println("-> User dir: " + user_dir);
      //  --> User dir: C:\kd\ws_java\resort_v1sbm3c
      
      // ?????? ??????????????? ?????? ?????? ??????, static ?????? ??????
      // ????????? ?????? C:/kd/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage
      String upDir =  user_dir + "/src/main/resources/static/notice/storage"; // ?????? ??????
      // System.out.println("-> upDir: " + upDir);
      
      long fileSize = mf.getSize();  // ?????? ??????
      
      if (fileSize > 0) { // ?????? ?????? ??????
        // ?????? ?????? ??? ???????????? ???????????? ?????????, spring.jsp, spring_1.jpg...
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

    // ????????? ????????? ????????? ????????????????????? Obejct ??????
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word); // #{word}
    map.put("now_page", now_page); // ???????????? ????????? ???????????? ????????? ?????????????????? ??????

    // ?????? ??????
    ArrayList<NoticeVO> noticeVOs = this.noticeProc.list_all_search_paging(map);
    mav.addObject("noticeVOs", noticeVOs);

    // ????????? ????????? ??????
    int search_count = this.noticeProc.search_count(map);
    mav.addObject("search_count", search_count);

    /*
     * SPAN????????? ????????? ?????? ????????? ??????, 1 ??????????????? ?????? ?????? ?????????: 11 / 22 [??????] 11 12 13 14 15 16 17
     * 18 19 20 [??????]
     * @param cateno ??????????????????
     * @param search_count ??????(??????) ????????????
     * @param now_page ?????? ?????????
     * @param word ?????????
     * @return ?????????????????? ????????? HTML/CSS tag ?????????
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
      code = "?????? ??????";
    }
    else {
      code = "?????? ??????";
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
    
    int cnt = this.noticeProc.update(noticeVO); //?????????ID??? ?????? story???????????????
    int notice_no = noticeVO.getNotice_no();
    System.out.println("->noticeNO : "+notice_no);
    int delcnt = this.noticeProc.delete_file_reminders(notice_no, keepFileNos);

    for(MultipartFile mf : fileList) {
      
      String fileFile = "";          // ?????? ????????? File
      fileFile = mf.getOriginalFilename(); // ?????? ?????? ????????? ??????
      System.out.println("-> file: " + fileFile);
      if(fileFile=="") {
        break;
      }
      String savefileFile = "";   // ????????? ?????????, File

      // ?????? ?????? ??????
      String user_dir = System.getProperty("user.dir"); // ????????? ??????
      // System.out.println("-> User dir: " + user_dir);
      //  --> User dir: C:\kd\ws_java\resort_v1sbm3c
      
      // ?????? ??????????????? ?????? ?????? ??????, static ?????? ??????
      // ????????? ?????? C:/kd/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage
      String upDir =  user_dir + "/src/main/resources/static/notice/storage"; // ?????? ??????
      // System.out.println("-> upDir: " + upDir);
      
      long fileSize = mf.getSize();  // ?????? ??????
      
      if (fileSize > 0) { // ?????? ?????? ??????
        // ?????? ?????? ??? ???????????? ???????????? ?????????, spring.jsp, spring_1.jpg...
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
