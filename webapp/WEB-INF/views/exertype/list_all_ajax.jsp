<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>ER System</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
 <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
  $(function() {
    // $('#panel_update').hide();
  });

  // 수정
  function read_update_ajax(exertypeno) {
    $('#panel_create').hide();
    $('#panel_update').show();
    
    // alert(exertypeno);

    var params = "";
    params = 'exertypeno=' + exertypeno; // 공백이 값으로 있으면 안됨.
    
     // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // alert('params: ' + params);
    // return;
    $.ajax({
      url: '/exertype/read_ajax_json.do',
      type: 'get',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우
        let frm = $('#frm_update');

        // frm폼의 id가 exertypeno인 태그에 rdata json 객체의 exertypeno 변수의 값을 저장 
        $('#exertypeno', frm).val(rdata.exertypeno);
        $('#cnt', frm).val(rdata.cnt);
        // frm폼의 id가 name인 태그에 rdata json 객체의 name 변수의 값을 저장 
        $('#name', frm).val(rdata.name);

        $('#panel_update_animation').hide(); // 태그 감추기
      },
      error: function(request, status, error) { // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우
        console.log(error);
      }
    });
  
    $('#panel_update_animation').css('text-align', 'center'); // style 접근
    $('#panel_update_animation').html("<img src='/exertype/images/ani01.gif' style='width: 3%;'>");
    $('#panel_update_animation').show(); // 숨겨진 태그의 출력
        
  }

  // 삭제
  function read_delete_ajax(exertypeno) {
    $('#panel_delete_msg').html('삭제 정보를 읽어오는 중입니다.'); // 메시지 출력
    $('#frm_delete_name').html('운동종류: '); // 카테고리 이름 출력
    
    $('#panel_create').hide();
    $('#panel_update').hide();
    $('#panel_delete').show();
        
    // alert(exertypeno);

    var params = "";
    params = 'exertypeno=' + exertypeno; // 공백이 값으로 있으면 안됨.
    
     // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // alert('params: ' + params);
    // return;
    $.ajax({
      url: '/exertype/read_ajax_json_fk.do',
      type: 'get',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우
        let frm = $('#frm_delete');

        // <div id="panel_delete_msg" class="msg_warning">카테고리를 삭제하면 복구 할 수 없습니다.</div>
        let msg ="";
        msg = "운동종류를 삭제하면 복구 할 수 없습니다.";
        $('#btn_submit', frm).show(); // 삭제 버튼 출력

        $('#panel_delete_msg').html(msg); // 메시지 출력
        
        // frm폼의 id가 exertypeno인 태그에 rdata json 객체의 exertypeno 변수의 값을 저장 
        $('#exertypeno', frm).val(rdata.exertypeno);
        $('#frm_delete_name').html('운동종류: ' + rdata.name);

        $('#panel_delete_animation').hide(); // 태그 감추기
      },
      error: function(request, status, error) { // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우
        console.log(error);
      }
    });
  
    $('#panel_delete_animation').css('text-align', 'center'); // style 접근
    $('#panel_delete_animation').html("<img src='/exertype/images/ani01.gif' style='width: 3%;'>");
    $('#panel_delete_animation').show(); // 숨겨진 태그의 출력
        
  }

  
  // 수정 취소, 삭제 취소
  function cancel() {
    $('#panel_create').show();
    $('#panel_update').hide();
    $('#panel_delete').hide();
  }
</script>
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>운동 종류(관리자)</DIV>

<DIV class='content_body'>
  <%-- 등록 --%>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label>운동 종류</label>
      <input type='text' name='EXERCISE_TYPE_NAME' id='name' value='' required="required" style='width: 25%;' autofocus="autofocus">
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
  
  <%-- 수정 --%>
  <DIV id='panel_update' style='display: none; padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./read_update.do'>
      <input type="hidden" name="EXERCISE_TYPE_NO" id="exertypeno" value="${exertypeVO.EXERCISE_TYPE_NO}">
      <input type="hidden" name="EXERCISE_TYPE_CNT" id="cnt" value="${exertypeVO.EXERCISE_TYPE_CNT }">
      
      <label>운동 종류</label>
      <input type='text' name='EXERCISE_TYPE_NAME' id="name" value='' required="required" style='width: 25%;' autofocus="autofocus">
  
      <button type="submit" id='submit'>수정</button>
      <button type="button" onclick="cancel();">취소</button>
      
      <span id='panel_update_animation' style='display: none;'></span>
    </FORM>
  </DIV>

  <%-- 삭제 --%>
  <DIV id='panel_delete' style='display: none; padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div id="panel_delete_msg" class="msg_warning">삭제 정보를 읽어오는 중입니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./read_delete.do'>
      <!-- 삭제할 글 번호 -->
      <input type='hidden' name='exertypeno' id='exertypeno' value="">
      
      <span id="frm_delete_name"></span> <%-- 삭제할 카테고리 이름 --%>
       
      <button type="submit" id='btn_submit'>삭제</button>
      <button type="button" onclick="cancel()">취소</button>
      
      <span id='panel_delete_animation' style='display: none;'></span>
    </FORM>
  </DIV>
  
  <TABLE class='table table-hover'>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 40%;'/>  
      <col style='width: 30%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">카테고리 이름</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="exertypeVO" items="${list }">
      <c:set var="exertypeno" value="${exertypeVO.EXERCISE_TYPE_NO }" />
      <c:set var="name" value="${exertypeVO.EXERCISE_TYPE_NAME }" />

      <TR>
        <TD class="td_bs">${exertypeno}</TD>
        <TD class="td_bs"><A href="../exercise/list_by_exertypeno_grid.do?exertypeno=${exertypeno }">${name }</A></TD>
        <TD class="td_bs">
          <A href="../exercise/create.do?exertypeno=${exertypeno}" title="${name } 등록"><IMG src="/exertype/images/append.png" class="icon"></A>
          <A href="javascript: read_update_ajax(${exertypeno })" title="${name } 수정"><IMG src="/exertype/images/update.png" class="icon"></A>
          <A href="javascript: read_delete_ajax(${exertypeno})" title="${name } 삭제"><IMG src="/exertype/images/delete.png" class="icon"></A>
          
        </TD>   
      </TR> 
      
    </c:forEach>
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
 