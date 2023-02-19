<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="exerciseno" value="${exerciseVO.EXERCISE_NO }" />
<c:set var="exertypeno" value="${exerciseVO.EXERCISE_TYPE_NO }" />
<c:set var="title" value="${exerciseVO.EXERCISE_NAME }" />        
<c:set var="equip" value="${exerciseVO.EXERCISE_EQ }" />
<c:set var="file1" value="${exerciseVO.file1 }" />
<c:set var="file1saved" value="${exerciseVO.file1saved }" />
<c:set var="thumb1" value="${exerciseVO.thumb1 }" />
<c:set var="size1" value="${exerciseVO.size1 }" />
<c:set var="procedure" value="${exerciseVO.EXERCISE_PRO }" />
<c:set var="content" value="${exerciseVO.EXERCISE_INFO }" />
<c:set var="precau" value="${exerciseVO.EXERCISE_PRECAU }" />
<c:set var="word" value="${exerciseVO.EXERCISE_CHAR }" />
<c:set var="size1_label" value="${exerciseVO.size1_label }" />
<c:set var="youtube" value="${exerciseVO.EXERCISE_YOUTUBE }" />
 
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
 
<DIV class='title_line'><A href="./list_by_exertypeno_grid.do?exertypeno=${exertypeno }" class='title_link'>
              ${exertypeVO.EXERCISE_TYPE_NAME } > ${exerciseVO.EXERCISE_NAME }(관리자)</A></DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?exertypeno=${exertypeno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./update.do?exerciseno=${exerciseno}&now_page=${param.now_page}">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./delete.do?exerciseno=${exerciseno}&now_page=${param.now_page}&exertypeno=${exertypeno}">삭제</A>  
  </ASIDE> 
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 50%; text-align: center; margin-right: 10px; margin: auto;">
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/exercise/storage/ --%>
                <A href="/exercise/storage/${file1saved }"><IMG src="/exercise/storage/${file1saved }" style="width: 100%;"></A> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/exercise/images/none1.png" style="width: 100%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>
        <DIV style="width: 47%; height: 800px;  text-align: center; margin-right: 10px; margin-bottom: 30px; margin: auto;">
          <span style="font-size: 2em; font-weight: 900;">${title }</span><br>
          <br><br><span style="font-size: 1.5em; font-weight: 500;">운동 순서</span>
          <br>${procedure }<br><br>
          <br><span style="font-size: 1.5em; font-weight: 500;">운동 정보</span>
          <br>${content }<br><br>
          <br><span style="font-size: 1.5em; font-weight: 500;">운동 주의사항</span>
          <br>${precau }<br><br>
          <br><span style="font-size: 1.5em; font-weight: 500;">운동 특징 키워드</span>
          <br>${word }<br><br>
        </DIV> 
      </li>

      <c:if test="${youtube.trim().length() > 0 }">
        <li class="li_none" style="clear: both; padding-top: 15px; padding-bottom: 100px;">
          <DIV style="text-align: center;">
            <span style="font-size: 2em; font-weight: 1000;">YOUTUBE</span><br>
            ${youtube }
          </DIV>
        </li>
      </c:if>
      
      <li> 
      <DIV style="width: 80%; height: 80px;  text-align: center; margin-right: 10px; margin-bottom: 30px; margin: auto;">
          <span style="font-size: 2em; font-weight: 1000;">운동리뷰</span><br><br>
      </DIV>
      <FORM name='frm_create' id='frm_create' method='POST' action='./read.do'>
      <DIV style="width: 88%; height: 200px;  text-align: right; margin-right: 10px; margin-bottom: 30px; margin: auto; float: left;">
          <textarea name='EXERREV_CONTENT' required="required" class="form-control" rows="5" style='width: 100%;'>리뷰를 남겨주세요.</textarea>
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <input type="radio" name="EXERREV_RECOM" value="5">&nbsp; &nbsp;
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <input type="radio" name="EXERREV_RECOM" value="4">&nbsp;  &nbsp;
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <input type="radio" name="EXERREV_RECOM" value="3">&nbsp; &nbsp;
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <input type="radio" name="EXERREV_RECOM" value="2">&nbsp;&nbsp;
          <IMG src="/exercise/images/star.png" style="width: 1.2%;">
          <input type="radio" name="EXERREV_RECOM" value="1">&nbsp;&nbsp;
          
          <input type="hidden" name="MEMBERNO" value="${nameno }">
          <input type="hidden" name="EXERCISE_NO" value="${exerciseVO.EXERCISE_NO }">
          
      </DIV>
      <DIV style="width: 10%; height: 200px;  text-align: center; margin-right: 10px; margin-bottom: 30px; margin: auto; float: right;">
          <button type="submit" onclick="location.href='./read.do?exerciseno=${exerciseno}&exertypeno=${exertypeno}'"class="btn btn-primary" style='font-size:20px; padding:50px 40px'>등록</button>
      </DIV>
      </FORM>
      
	      <DIV style="text-align: center;">
	        <FORM name='frm' method='POST' action='./rev_delete.do'>
		      <table class="table table-striped" style='width: 100%;'>
				    <colgroup>
				      <col style="width: 10%;"></col>
				      <col style="width: 55%;"></col>
				      <col style="width: 15%;"></col>
				      <col style="width: 10%;"></col>
				      <col style="width: 10%;"></col>
				    </colgroup>
				    
				    <%-- table 컬럼 --%>
				    <thead>
				      <tr>
				        <th style='text-align: center;'>회원이름</th>
				        <th style='text-align: center;'>리뷰</th>
				        <th style='text-align: center;'>추천점수</th>
				        <th style='text-align: center;'>등록일</th>
				        <th style='text-align: center;'>삭제</th>
				      </tr>
				    
				    </thead>
				    
				    <%-- table 내용 --%>
				    <tbody>
				      <c:forEach var="ExerrevVO" items="${list }">
				        <c:set var="memberno" value="${exerrevVO.MEMBERNO }" />
				        <c:set var="revcontent" value="${exerrevVO.EXERREV_CONTENT }" />
				        <c:set var="revdate" value="${exerrevVO.EXERREV_DATE }" />
				        <c:set var="recom" value="${exerrevVO.EXERREV_RECOM }" />
				
					        <input type='hidden' name='exerciseno' value='${exerciseVO.EXERCISE_NO}'>
	                <input type='hidden' name='exertypeno' value='${exertypeno}'>
	                <input type='hidden' name='exerrevno' value='${ExerrevVO.EXERREV_NO}'>
					        <tr style="height: 132px;"> 
					          <input type='hidden' name='exerrevno' value='${ExerrevVO.EXERREV_NO}'>
					          <td style='vertical-align: middle; text-align: center;'>
					            <strong>${ExerrevVO.MNAME}</strong>  
					          </td>  
					          <td style='vertical-align: middle;'>
					            <strong>${ExerrevVO.EXERREV_CONTENT}</strong>  
					          </td> 
					          <td style='vertical-align: middle; text-align: center;'>
					            <strong>${ExerrevVO.EXERREV_RECOM}</strong>  
					          </td>
					          <td style='vertical-align: middle; text-align: center;'>
					            <strong>${ExerrevVO.EXERREV_DATE}</strong>  
					          </td>
					          <td style='vertical-align: middle; text-align: center;'>
						          <A href="./rev_delete.do?exerciseno=${exerciseno}&exerrevno=${ExerrevVO.EXERREV_NO}" title="삭제"><IMG src="/exercise/images/delete.png" class="icon"></A>
	                   </td>
					        </tr>
				      </c:forEach>
				    </tbody>
		      </table>
		      </FORM>
		    </DIV>
      </li>
    </ul>
  </fieldset>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
