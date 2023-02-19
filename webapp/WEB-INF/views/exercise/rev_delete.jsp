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
 
<DIV class='title_line'><A href="./list_by_exertypeno_grid.do?exertypeno=${exertypeno }" class='title_link'>${exertypeVO.EXERCISE_TYPE_NAME }</A> > ${title } > 리뷰삭제</DIV>

<DIV class='content_body'>

  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">

        <DIV style='text-align: center; width: 47%; float: left;'>
          <span style='font-size: 1.5em;'></span>
          <br>
          <FORM name='frm' method='POST' action='./rev_delete.do'>
              <input type='hidden' name='exerciseno' value='${exerciseno}'>
              <input type='hidden' name='exertypeno' value='${exertypeno}'>
              <input type='hidden' name='exertypeno' value='${exertypeno}'>
              <input type='hidden' name='now_page' value='${param.now_page}'>
              <br><br>
              <div style='text-align: center; margin: 10px auto;'>
                <span style="color: #FF0000; font-weight: bold;">삭제를 진행 하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
                <br><br>
                <button type = "submit" class="btn btn-primary">삭제 진행</button>
                <button type = "button" onclick = "history.back()" class="btn btn-primary">취소</button>
              </div>   
          </FORM>
        </DIV>
      </li>
     </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
