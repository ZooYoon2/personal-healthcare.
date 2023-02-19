<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
  function valueDown(inputId) {
	  var input = document.getElementById(inputId);
	  if(input.value > 0){
		  var num = Number(input.value) - 1;
		  input.value = num;
		  }
	  }
  function valueUp(inputId) {
	    var input = document.getElementById(inputId);
	    var num = Number(input.value) + 1;
      input.value = num;
	    }
</script>

<%-- 반복횟수 기준 - 수정 및 추가  --%>
<FORM name='frm' method='POST' action='./create_ajax.do' enctype="multipart/form-data">
    <input type="hidden" name="memberno" value="1">
    <input type="hidden" name="exercise_no" value="1">
    
    <DIV style="display:flex ; align-items:center; top:0; height:100%;">
		    <DIV style="width:93%;">
		        <DIV style="display: flex; align-items: flex-end; height:35%">
		            <label style="width:33%">운동 명</label>
		            <label style="width:33%">세트 수</label>
		            <label style="width:33%">반복 수</label>
		        </DIV>
		        <DIV style="display: flex; align-items: center; height:65%">
		            <%-- 운동검색 --%>
		            <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
		                <span>운동명</span>
		                <button type="button">검색</button>
		            </DIV>
		            <%-- 세트수 --%>
		            <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
		                <button type="button" class="Circle-Arrow-Btn" onclick="valueDown('inputSetof')">
		                    <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-down-lined.svg" alt="">
		                </button>
		                <input type='number' name='setof' id='inputSetof' value='0' required="required" autofocus="autofocus" class="form-control" style='width: 72px;height: 48px;border-radius:50%;text-align:center;'>
		                <button type="button" class="Circle-Arrow-Btn" onclick="valueUp('inputSetof')">
		                    <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-up-lined.svg" alt="">
		                </button>
		            </DIV>
		            <%-- 반복횟수 --%>
		            <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
		                <button type="button" class="Circle-Arrow-Btn" onclick="valueDown('inputRepeat')">
		                    <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-down-lined.svg" alt="">
		                </button>
		                <input type='number' name='repeat' id='inputRepeat' value='0' required="required" autofocus="autofocus" class="form-control" style='width: 72px;height: 48px;border-radius:50%;text-align:center;'>
		                <button type="button" class="Circle-Arrow-Btn" onclick="valueUp('inputRepeat')">
		                        <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-up-lined.svg" alt="">
		                </button>
		            </DIV>
		        </DIV>
		    </DIV>
		    
		    <%-- 버튼 --%>
		    <DIV style="width:7%; top: 0; height: 100%; border-left:1px solid black; display:flex; flex-direction:column; justify-content:center; align-items: center">
		        <button type="submit" class="Circle-Arrow-Btn"><img style="width:80%;height:80%;" src="/common/iconmonstr-check-mark.svg" alt=""></button>
		        <button type="button" class="Circle-Arrow-Btn"><img style="width:80%;height:80%;" src="/common/iconmonstr-trash-can-lined.svg" alt=""></button>
		    </DIV>
		</DIV>
		
</FORM>


<c:if test = "{false}">
<%-- 시간횟수 기준 - 수정 및 추가  --%>
<DIV style="display: flex; align-items: center; height:35%">
<label style="width:10%">운동</label>
<label style="width:30%">운동 명</label>
<label style="width:60%">시간(분)</label>
</DIV>
<DIV style="display: flex; align-items: center; height:65%">
<label style="width:10%">운동</label>
<%-- 운동검색 --%>
<DIV style="display: flex; align-items: center; justify-content: center; width:30%">
<span>운동명</span>
<button>검색</button>
</DIV>
<%-- 분 --%>
<DIV style="display: flex; align-items: center; justify-content: center; width:60%">
<button class="Circle-Arrow-Btn"><img style="width:100%;height:100%;" src="/common/iconmonstr-arrow-down-circle-lined.svg" alt=""></button>
<input type='number' name='time_min' value='0' required="required" autofocus="autofocus" class="form-control" style='width: 72px;height: 48px;border-radius:50%;text-align:center;'>
<button class="Circle-Arrow-Btn"><img style="width:100%;height:100%;" src="/common/iconmonstr-arrow-up-circle-lined.svg" alt=""></button>
</DIV>
</DIV>
</c:if>