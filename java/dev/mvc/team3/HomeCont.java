package dev.mvc.team3;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeCont {
  public HomeCont() {
    System.out.println("-> HomeCont created.");
  }

  // http://localhost:9093
  //http://localhost:9093/index.do
  @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
  public ModelAndView home() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/index");  // /WEB-INF/views/index.jsp
    
    return mav;
  }
  

  // http://localhost:9091/menu/top.do
  @RequestMapping(value = {"/menu/top.do"}, method=RequestMethod.GET)
  public ModelAndView top() {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/menu/top");  // /WEB-INF/views/menu/top.jsp
    
    return mav;
  }

}
