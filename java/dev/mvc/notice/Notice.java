package dev.mvc.notice;

import java.io.File;

public class Notice{
  public static int RECORD_PER_PAGE = 10;
  public static int PAGE_PER_BLOCK = 10;
  public static String LIST_PAGE = "list_all_search_paging.do";
  public static synchronized String getUploadDir() {
    String path = "";
    if (File.separator.equals("\\")) {
        // path = "C:/kd/deploy/resort_v1sbm3c/contents/storage/";
        path="C:\\kd\\ws_java\\team3_v2sbm3c\\src\\main\\resources\\static\\notice\\storage\\";
        // System.out.println("Windows 10: " + path);
        
    } else {
        // System.out.println("Linux");
        //path = "/home/ubuntu/deploy/resort_v1sbm3c/contents/storage/";
    }
    
    return path;
}
}