<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="notice_no" value="${noticeVO.notice_no }" />
<c:set var="adminno" value="${noticeVO.adminno }" />
<c:set var="title" value="${noticeVO.notice_title }" />        
<c:set var="content" value="${noticeVO.notice_content }" />
<c:set var="word" value="${noticeVO.notice_word }" />
<c:set var="rdate" value="${noticeVO.notice_rdate }" />
<c:set var="udate" value="${noticeVO.notice_udate }" />
<c:set var="cnt" value="${noticeVO.notice_cnt }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
function deleteNotice(no){
    if(confirm("삭제하시겠습니까?")==true){
      var param = {};
      param.notice_no = no;
      $.ajax({
            url: "/notice/delete.do",
            type:"POST",
            data: param,
            success:function(data){
              alert(data);
              location.href='/notice/list_all_search_paging.do'
               },
               error:function(){
                 alert("전송실패");
                 }
          });
      }
  }
</script>
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'></DIV>
<DIV style="margin:auto;margin-bottom:8px; width:1000px; display:flex;justify-content:flex-end ; align-items:center; top:0; height:100%;">
    <c:choose>
        <c:when test="${sessionScope.adminno == adminno}">
            <button type="button" id='btn_send' onclick="location.href='/notice/update.do?notice_no=${notice_no}'" class="btn btn-dark" style="margin-right:10px">수정</button>
            <button type="button" id='btn_send' onclick="deleteNotice('${notice_no}')" class="btn btn-dark" style="margin-right:10px">삭제</button>
        </c:when>
    </c:choose>
    <button type="button" id='btn_send' onclick="location.href='/notice/list_all_search_paging.do'" class="btn btn-dark">목록</button>
</DIV>
<DIV style='width:1000px; margin:auto;border: 1px solid;'> 
    <DIV style="width:1000px; height:50px; margin:auto; text-align:center; background-color:#353A40">
          <span style="font-size: 1.1em; font-weight: bold; line-height:50px; color:white">${title }</span>
    </DIV>
    <DIV style="width:1000px; height:30px; margin:auto; text-align:center; background-color:gray;">
          <span style="font-size: 0.9em; line-height:30px; color:white">${rdate }</span>
    </DIV>
    
    <c:if test="${ noticeFileVOs.size() ne 0}">
	    <DIV style="text-align:right;margin-bottom:5px;">
	          <c:forEach var="noticeFileVO" items="${noticeFileVOs}">
                  <div><a href='/download?dir=/notice/storage&filename=${noticeFileVO.file_save}&downname=${noticeFileVO.file_og}'
                  style="font-size: 0.9em; line-height:30px; margin-right:10px">&#128190 ${noticeFileVO.file_og} (${noticeFileVO.file_size_label})</a></div>
              </c:forEach>
	    </DIV>
    </c:if>
    
    <DIV style='width:92%; margin:auto; margin-top:10px; margin-bottom:10px'>
        <DIV style="margin-bottom:5px">${content }</DIV>
        <DIV style='margin-top:20px; text-decoration: none;font-size: 0.9em;color:gray'>
          검색어(키워드): ${word }
        </DIV>
    </DIV>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>