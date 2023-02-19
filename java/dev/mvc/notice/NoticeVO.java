package dev.mvc.notice;

import org.springframework.web.multipart.MultipartFile;

/*
 * NOTICE_NO                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    ADMINNO                           NUMBER(10)     NOT NULL,
    NOTICE_TITLE                      VARCHAR2(300)    NULL ,
    NOTICE_CONTENT                    VARCHAR2(4000)     NULL ,
    NOTICE_WORD                       VARCHAR2(300)    NULL ,
    NOTICE_RDATE                      DATE     NULL ,
    NOTICE_UDATE                      DATE    DEFAULT NULL     NULL,
    NOTICE_CNT                        NUMBER(7) DEFAULT 0   NOT NULL  ,
 * */
public class NoticeVO {
  private int notice_no;
  private int adminno;
  private String notice_title;
  private String notice_content;
  private String notice_word;
  private String notice_rdate;
  private String notice_udate;
  private int notice_cnt;
  public int getNotice_no() {
    return notice_no;
  }
  public void setNotice_no(int notice_no) {
    this.notice_no = notice_no;
  }
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  public String getNotice_title() {
    return notice_title;
  }
  public void setNotice_title(String notice_title) {
    this.notice_title = notice_title;
  }
  public String getNotice_content() {
    return notice_content;
  }
  public void setNotice_content(String notice_content) {
    this.notice_content = notice_content;
  }
  public String getNotice_word() {
    return notice_word;
  }
  public void setNotice_word(String notice_word) {
    this.notice_word = notice_word;
  }
  public String getNotice_rdate() {
    return notice_rdate;
  }
  public void setNotice_rdate(String notice_rdate) {
    this.notice_rdate = notice_rdate;
  }
  public String getNotice_udate() {
    return notice_udate;
  }
  public void setNotice_udate(String notice_udate) {
    this.notice_udate = notice_udate;
  }
  public int getNotice_cnt() {
    return notice_cnt;
  }
  public void setNotice_cnt(int notice_cnt) {
    this.notice_cnt = notice_cnt;
  }
  
  
}
