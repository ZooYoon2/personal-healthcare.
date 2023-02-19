package dev.mvc.notice;

import org.springframework.web.multipart.MultipartFile;

/*
    NOTICE_FILE_NO                    NUMBER(10)     NOT NULL    PRIMARY KEY,
    NOTICE_NO                         NUMBER(10)     NOT NULL,
    FILE_OG                               VARCHAR2(100)    NOT NULL,
    FILE_SAVE                         VARCHAR2(100)    NOT NULL,
    FILE_SIZE                         NUMBER(10)     NOT NULL,
 * */
public class NoticeFileVO {
  private int notice_file_no;
  private int notice_no;
  private String file_og;
  private String file_save;
  private int file_size;
  private String file_size_label;
  
  public String getFile_size_label() {
    return file_size_label;
  }
  public void setFile_size_label(String file_size_label) {
    this.file_size_label = file_size_label;
  }
  public int getNotice_file_no() {
    return notice_file_no;
  }
  public void setNotice_file_no(int notice_file_no) {
    this.notice_file_no = notice_file_no;
  }
  public int getNotice_no() {
    return notice_no;
  }
  public void setNotice_no(int notice_no) {
    this.notice_no = notice_no;
  }
  public String getFile_og() {
    return file_og;
  }
  public void setFile_og(String file_og) {
    this.file_og = file_og;
  }
  public String getFile_save() {
    return file_save;
  }
  public void setFile_save(String file_save) {
    this.file_save = file_save;
  }
  public int getFile_size() {
    return file_size;
  }
  public void setFile_size(int file_size) {
    this.file_size = file_size;
  }
  
  
}
