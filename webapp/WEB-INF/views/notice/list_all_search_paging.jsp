<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">  <!-- /static -->

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>
</DIV>

<DIV class='content_body'>
	<DIV>
	   <DIV style="float: left; margin-bottom:10px;">
	       <button type="button" id='btn_send' onclick="location.href='/notice/list_all_search_paging.do'" class="btn btn-dark">전체 글</button>
     </DIV>
     <c:choose>
      <c:when test="${sessionScope.admin_id != null}">
            <DIV style="float: right; margin-bottom:10px;">
                <button type="button" id='btn_send' onclick="location.href='/notice/create.do'" class="btn btn-dark">글 쓰기</button>
            </DIV>
      </c:when>
  </c:choose>
	</DIV>
 
  <table class="table table-striped" style='width: 100%;border-top: 1px solid black;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
    <thead class="thead-dark">
      <tr>
        <th style='text-align: center;'>번호</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>날짜</th>
        <th style='text-align: center;'>조회수</th>
      </tr>
    </thead>
    
    <%-- table 내용 --%>
    <tbody class="thead-light">
    
      <c:forEach var="noticeVO" items="${noticeVOs}">
        <c:set var="notice_no" value="${noticeVO.notice_no }" />
        <c:set var="notice_title" value="${noticeVO.notice_title }" />
        <c:set var="notice_rdate" value="${noticeVO.notice_rdate }" />
        <c:set var="notice_cnt" value="${noticeVO.notice_cnt }" />
        
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>
            ${notice_no}
          </td>
          <td style='vertical-align: middle;'>
            <a href="./read.do?notice_no=${notice_no}">
                <strong>${notice_title}</strong> 
            </a> 
          </td> 
          <td style='vertical-align: middle; text-align: center;'>
            ${notice_rdate }
          </td>
          <td style='vertical-align: middle; text-align: center;'>${notice_cnt }</td>
          
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
  <DIV class='bottom_menu'>${paging }</DIV>
  <%-- 검색 --%>
  <DIV style="text-align: center;clear: both;">
    <form name='frm' id='frm' method='get' action='./list_all_search_paging.do' style="text-align: left;margin-right:10px; display:inline">     
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>   
    </form>
  </DIV>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>