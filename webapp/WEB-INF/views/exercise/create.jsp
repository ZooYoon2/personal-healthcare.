<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
 
<DIV class='title_line'>${exertypeVO.EXERCISE_TYPE_NAME } > 글 등록</DIV>

<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
    <input type="hidden" name="EXERCISE_TYPE_NO" value="${exertypeVO.EXERCISE_TYPE_NO }">
    
    <div>
       <label>운동명</label>
       <input type='text' name='EXERCISE_NAME' value='러닝' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>운동 기구명</label>
       <input type='text' name='EXERCISE_EQ' value='런닝머신' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>운동 순서</label>
       <textarea name='EXERCISE_PRO' required="required" class="form-control" rows="12" style='width: 100%;'>운동이좋다</textarea>
    </div>
    <div>
       <label>운동 정보</label>
       <textarea name='EXERCISE_INFO' required="required" class="form-control" rows="12" style='width: 100%;'>운동이좋다</textarea>
    </div>
    <div>
       <label>운동 주의사항</label>
       <textarea name='EXERCISE_PRECAU' required="required" class="form-control" rows="12" style='width: 100%;'>운동이좋다</textarea>
    </div>
    <div>
       <label>YOUTUBE</label>
       <input type='text' name='EXERCISE_YOUTUBE' value='https://www.youtube.com/watch?v=W3A6hxKhthw' required="required" 
                 class="form-control" style='width: 100%;'>
    </div> 
    <div>
       <label>운동 특징</label>
       <input type='text' name='EXERCISE_CHAR' value='뛴다' required="required" 
                 class="form-control" style='width: 100%;'>
    </div>
    <input type="hidden" name="ADMINNO" value="1"> <%-- 관리자 개발후 변경 필요 --%>  
    <div>
       <label>이미지</label>
       <input type='file' class="form-control" name='file1MF' id='file1MF' 
                 value='' placeholder="파일 선택">
    </div>     
    <div class="content_body_bottom">
      <button type="submit" onclick="location.href='./list_by_exertypeno_grid.do?exertypeno=${param.exertypeno}'"class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list_by_exertypeno_grid.do?exertypeno=${param.exertypeno}'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>