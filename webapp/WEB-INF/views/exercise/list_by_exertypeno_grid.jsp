<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>ER SYSTEM</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>
  <A href="./list_by_exertypeno_grid.do?exertypeno=${exertypeVO.EXERCISE_TYPE_NO }" class='title_link'>${exertypeVO.EXERCISE_TYPE_NAME }(관리자)</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?exertypeno=${exertypeVO.EXERCISE_TYPE_NO }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="exerciseVO" items="${list }" varStatus="status">
      <c:set var="exerciseno" value="${exerciseVO.EXERCISE_NO }" />
      <c:set var="title" value="${exerciseVO.EXERCISE_NAME }" />
      <c:set var="content" value="${exerciseVO.EXERCISE_CHAR }" />
      <c:set var="equip" value="${exerciseVO.EXERCISE_EQ }" />
      <c:set var="file1" value="${exerciseVO.file1 }" />
      <c:set var="size1" value="${exerciseVO.size1 }" />
      <c:set var="thumb1" value="${exerciseVO.thumb1 }" />
      
      <!-- 하나의 이미지, 24 * 4 = 96% -->
      <DIV style='width: 19%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #E2E2E2; text-align: center;'>
        <c:choose>
          <c:when test="${size1 > 0}"> <!-- 파일이 존재하면 -->
            <c:choose> 
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="./read.do?exerciseno=${exerciseno}&exertypeno=${param.exertypeno}">               
                  <IMG src="./storage/${thumb1 }" style='width: 100%; height: 150px;'>
                </a>
                <span style=" font-weight: bold; font-size: 1.2em;color: black;font-family: arial;">
								    ${title}
								</span><br>${equip}<br>${content}<br>
              </c:when>
              
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                    <a href="./read.do?exerciseno=${exerciseno}&exertypeno=${param.exertypeno}">${file1}</a><br>
                  </DIV>
                </DIV>
                  <span style=" font-weight: bold; font-size: 1.2em;color: black;font-family: arial;">
                    ${title}
                </span><br>${equip}<br>${content}<br>
              </c:otherwise>
            </c:choose>
          </c:when>
          
          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <a href="./read.do?exerciseno=${exerciseno}&exertypeno=${param.exertypeno}">
              <img src='/exercise/images/none1.png' style='width: 100%; height: 150px;'>
            </a>
            <span style="font-weight: bold; font-size: 1.2em;color: black;font-family: arial;">
                ${title}
            </span><br>${equip}<br>${content}<br>
          </c:otherwise>
        </c:choose>         
      </DIV>  
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->
    <br><br>
  </div>

</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

