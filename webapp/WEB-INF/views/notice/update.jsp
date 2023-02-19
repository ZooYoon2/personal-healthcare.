<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width"/>
<title>LifeStyle</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">  <!-- /static -->

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
var dtFiles = new DataTransfer();
function addInputFiles(data){
  if(data.files.length!=0){
        const fileArr = Array.from(data.files);
        if(dtFiles.files.length==0){
          fileArr.forEach((file) => {
              dtFiles.items.add(file);
          });
        }
        else{
          const dtArr = Array.from(dtFiles.files);
          fileArr.forEach((file) => {
            var overlap = false;
            dtArr.forEach((item)=>{
                if(item.name === file.name){overlap = true; return;}
            });
            if(overlap){alert(file.name+"이 중복됩니다.");}
            else{dtFiles.items.add(file);}
            });
        }
  }
  document.getElementById('file').files = dtFiles.files;
  preview(document.getElementById('file'));
}
function removeFile(fileId){
    const dataTransfer = new DataTransfer();
    var files = document.getElementById('file').files;
    Array.from(files).forEach(file =>{
      if(file.name !== fileId){
        dataTransfer.items.add(file);
        }
      }
    )
    document.getElementById(fileId).remove();
    dtFiles = dataTransfer;
    document.getElementById('file').files = dataTransfer.files;
  }
  
function preview(data){
    const container = document.getElementById('previewContainer');
    container.replaceChildren();
    if(data.files){
      const fileArr = Array.from(data.files);
      fileArr.forEach((file, index) => {
        var reader = new FileReader();
        var $span = document.createElement('span');
        $span.textContent=file.name;
        var $ctn = document.createElement('div');
        $ctn.style.cssText="margin-bottom:10px;";
        $ctn.id = file.name;
        var $delBtn = document.createElement('button');
        $delBtn.style.cssText="width:20px;height:20px; display:inline-block;vertical-align: top; border:none;background: transparent; cursor: pointer; color:red";
        $delBtn.textContent+="X";
        $delBtn.onclick = function(){removeFile(file.name)};
        $ctn.appendChild($span);
        $ctn.appendChild($delBtn);
        container.appendChild($ctn);
        reader.readAsDataURL(file);
      })
    }
  }
  
$(function() {
    CKEDITOR.replace('notice_content');  // <TEXTAREA>태그 name 값
  });
</script>
<c:set var="notice_no" value="${noticeVO.notice_no }" />
<c:set var="adminno" value="${noticeVO.adminno }" />
<c:set var="title" value="${noticeVO.notice_title }" />        
<c:set var="content" value="${noticeVO.notice_content }" />
<c:set var="word" value="${noticeVO.notice_word }" />
</head>
<body>
<c:import url="/menu/top.do"/>
<DIV class='title_line'>
  <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }" class='title_link'>${cateVO.name }</A>
</DIV>
  <%--등록 폼 --%>
  <FORM name='frm' method='POST' action='./update.do' enctype="multipart/form-data" >
    <input type="hidden" name="notice_no" value="${notice_no }">
    <input type="hidden" name="adminno" value="${sessionScope.adminno}"> <%-- 관리자 개발후 변경 필요 --%>
    <div style="width:1000px;height:100%; margin:auto; margin-top:50px;
                   display: flex;
                   align-items : center;
                   justify-content: center;">
        <div style="padding:15px;border: 1px solid #808080;">
            <div>
               <label>제목</label>
               <input type='text' name='notice_title' value='${title }' required="required" 
                         autofocus="autofocus" class="form-control" style='width: 100%;'>
            </div>
            <div>
               <label>내용</label>
               <textarea class="form-control" name='notice_content' rows='10' placeholder="내용">${content }</textarea>
            </div>
            <div>
               <label>태그</label>
               <input type='text' name='notice_word' value='${word }'
                         class="form-control" style='width: 100%;'>
            </div>   
            <div>
               <label>이미지</label>
               <div class="form-control" style="height:100%">
                  <input type='file' name='file' id='file' onchange="preview(this);"
                         value='' placeholder="파일 선택" multiple>
                  <div id = 'previewContainer' style="margin-top:5px">
                  </div>
                  <script>
                  function delDOMById(id){
                      document.getElementById(id).remove();
                      }
                  </script>
                  <c:if test="${noticeFileVOs.size() ne 0 }">
                      <div>
		                      <c:forEach items="${noticeFileVOs}" var="noticeFileVO" varStatus="cnt">
				                      <div id="file${noticeFileVO.notice_file_no}" style="margin-bottom:10px;">
				                          <input type='hidden' name="keepFile" value="${noticeFileVO.notice_file_no }">
						                      <span>${noticeFileVO.file_og }</span>
						                      <button type="button" onclick="delDOMById('file${noticeFileVO.notice_file_no}')" style="width:20px;height:20px; display:inline-block;vertical-align: top; border:none;background: transparent; cursor: pointer; color:red">X</button>
				                      </div>
		                      </c:forEach>
                      </div>
                  </c:if>
               </div>
            </div>
            <div class="content_body_bottom">
              <button type="submit" class="btn btn-primary">수정</button>
              <button type="button" onclick="location.href='/notice/read.do?notice_no=${notice_no}'" class="btn btn-primary">취소</button>
            </div>
        </div>
    </div>
  </FORM>
</body>
</html>