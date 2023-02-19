<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
 
<DIV class='title_line'><A href="./list_by_exertypeno_grid.do?exertypeno=${exertypeno }" class='title_link'>${exertypeVO.EXERCISE_TYPE_NAME }</A> > 
<A href="./read.do?exerciseno=${exerciseno}&exertypeno=${exertypeno}" class='title_link'>${exerciseVO.EXERCISE_NAME }</A> > 수정</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?exertypeno=${exertypeVO.EXERCISE_TYPE_NO }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
 
  
  <DIV class='menu_line'></DIV>
  <%--수정 폼 --%>
  <FORM name='frm' method='POST' action='./update.do'>
    <input type="hidden" name=EXERCISE_NO value="${exerciseno }">
    <input type="hidden" name="EXERCISE_TYPE_NO" value="${exertypeno }">
    <input type="hidden" name="ADMINNO" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    
    <div>
       <label>운동명</label>
       <input type='text' name='EXERCISE_NAME' value='${title }' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>운동 기구명</label>
       <input type='text' name='EXERCISE_EQ' value='${equip }' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>운동 순서</label>
       <textarea name='EXERCISE_PRO' required="required" class="form-control" rows="12" style='width: 100%;'>${procedure }</textarea>
    </div>
    <div>
       <label>운동 정보</label>
       <textarea name='EXERCISE_INFO' required="required" class="form-control" rows="12" style='width: 100%;'>${content }</textarea>
    </div>
    <div>
       <label>운동 주의사항</label>
       <textarea name='EXERCISE_PRECAU' required="required" class="form-control" rows="12" style='width: 100%;'>${precau }</textarea>
    </div>
    
    <div>
       <label>운동 특징</label>
       <input type='text' name='EXERCISE_CHAR' value='${word }' required="required" 
                 class="form-control" style='width: 100%;'>
    </div>   
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
      <button type="button" onclick="location.href='./list_by_exertypeno_grid.do?exertypeno=${exertypeno}'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>