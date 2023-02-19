<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
function cancelBtn(){
	refreshList();
}
function updateEvent(){
    $.ajax({
          url: "/exercise_record/edit_ajax.do",
          type:"POST",
          data:$('#frm').serialize(),
          success:function(data){
            alert("수정 완료");
            refreshList();
            },
            error: function(){  
                alert("수정 실패");  
                refreshList();
                }
        });
  }
</script>

<c:set var="exerciseRecordVO" value="${exerRecVO}"/>
<c:set var="exerciseRecordNo" value="${exerciseRecordVO.exercise_record_no}" />
<c:set var="exerciseNo" value="${exerciseRecordVO.exercise_no}" />
<c:set var="exerciseName" value="${exerciseRecordVO.exercise_name}" />
<c:set var="date" value="${exerciseRecordVO.exercise_record_date}" />
<c:set var="time" value="${exerciseRecordVO.exercise_record_time}" />
<c:set var="setof" value='${exerciseRecordVO.exercise_record_setof}'/>
<c:set var="repeat" value="${exerciseRecordVO.exercise_record_repeat}"/>
<c:choose>
    <%--반복--%>
    <c:when test = "${time eq null || time eq 0}">
        <%-- 반복횟수 기준 - 수정 및 추가  --%>
				<FORM name='frm' id='frm' method='POST'>
				    <input type="hidden" name="exercise_record_no" id="exercise_record_no" value=${exerciseRecordNo}>
				    <input type="hidden" name="memberno" id="memberno" value=${memberno}>
	          <input type="hidden" name="exercise_no" id="exercise_no" value=${exerciseNo}>
	          <input type="hidden" name="exercise_record_date" id="exercise_record_date" value=${date}>
	          
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
	                          <span id="exercise_name" style="margin-right:5px">${exerciseName}</span>
	                          <button type="button" onclick="modal()">선택</button>
	                      </DIV>
	                      <%-- 세트수 --%>
	                      <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
	                          <button type="button" class="Circle-Arrow-Btn" onclick="valueDown('exercise_record_setof')">
	                              <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-down-lined.svg" alt="">
	                          </button>
	                          <input type='number' name='exercise_record_setof' id='exercise_record_setof' value=${setof} required="required" autofocus="autofocus" class="form-control" style='width: 72px;height: 48px;border-radius:50%;text-align:center;'>
	                          <button type="button" class="Circle-Arrow-Btn" onclick="valueUp('exercise_record_setof')">
	                              <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-up-lined.svg" alt="">
	                          </button>
	                      </DIV>
	                      <%-- 반복횟수 --%>
	                      <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
	                          <button type="button" class="Circle-Arrow-Btn" onclick="valueDown('exercise_record_repeat')">
	                              <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-down-lined.svg" alt="">
	                          </button>
	                          <input type='number' name='exercise_record_repeat' id='exercise_record_repeat' value=${repeat} required="required" autofocus="autofocus" class="form-control" style='width: 72px;height: 48px;border-radius:50%;text-align:center;'>
	                          <button type="button" class="Circle-Arrow-Btn" onclick="valueUp('exercise_record_repeat')">
	                                  <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-up-lined.svg" alt="">
	                          </button>
	                      </DIV>
	                  </DIV>
	              </DIV>
	              
	              <%-- 버튼 --%>
	              <DIV style="width:7%; top: 0; height: 100%; border-left:1px solid black; display:flex; flex-direction:column; justify-content:center; align-items: center">
	                  <button type="button" class="Circle-Arrow-Btn" onclick="updateEvent()"><img style="width:80%;height:80%;" src="/common/iconmonstr-check-mark.svg" alt=""></button>
	                  <button type="button" class="Circle-Arrow-Btn" onclick="cancelBtn()"><img style="width:80%;height:80%;" src="/common/iconmonstr-x-mark-lined.svg" alt=""></button>
	              </DIV>
	          </DIV>
	      </FORM>
	  </c:when>
    <%--시간--%>
    <c:otherwise>
        <FORM name='frm' id='frm' method='POST'>
	          <input type="hidden" name="exercise_record_no" id="exercise_record_no" value=${exerciseRecordNo}>
            <input type="hidden" name="memberno" id="memberno" value=${memberno}>
            <input type="hidden" name="exercise_no" id="exercise_no" value=${exerciseNo}>
            <input type="hidden" name="exercise_record_date" id="exercise_record_date" value=${date}>
	
	          <DIV style="display:flex ; align-items:center; top:0; height:100%;">
	              <DIV style="width:93%;">
	                  <DIV style="display: flex; align-items: center; height:35%">
	                      <label style="width:33%">운동 명</label>
	                      <label style="width:67%">시간(분)</label>
	                  </DIV>
	                  <DIV style="display: flex; align-items: center; height:65%">
	                      <%-- 운동검색 --%>
	                      <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
	                          <span id="exercise_name" style="margin-right:5px">${exerciseName}</span>
	                          <button type="button" onclick="modal()">선택</button>
	                      </DIV>
	                      <%-- 분 --%>
	                      <DIV style="display: flex; align-items: center; justify-content: center; width:67%">
	                          <button type="button" class="Circle-Arrow-Btn" onclick="valueDown('exercise_record_time')">
	                              <img style="width:100%;height:100%;" src="/common/iconmonstr-arrow-down-lined.svg" alt="">
	                          </button>
	                          <input type='number' name='exercise_record_time' id='exercise_record_time' value=${time} required="required" autofocus="autofocus" class="form-control" style='width: 72px;height: 48px;border-radius:50%;text-align:center;'>
	                          <button type="button" class="Circle-Arrow-Btn" onclick="valueUp('exercise_record_time')">
	                              <img style="width:100%;height:100%;" src="/common/iconmonstr-arrow-up-lined.svg" alt="">
	                          </button>
	                      </DIV>
	                  </DIV>
	              </DIV>
	              
	              <%-- 버튼 --%>
	              <DIV style="width:7%; top: 0; height: 100%; border-left:1px solid black; display:flex; flex-direction:column; justify-content:center; align-items: center">
	                  <button type="button" class="Circle-Arrow-Btn" onclick="updateEvent()"><img style="width:80%;height:80%;" src="/common/iconmonstr-check-mark.svg" alt=""></button>
	                  <button type="button" class="Circle-Arrow-Btn" onclick="cancelBtn()"><img style="width:80%;height:80%;" src="/common/iconmonstr-x-mark-lined.svg" alt=""></button>
	              </DIV>
	          </DIV>
      </FORM>
    </c:otherwise>
</c:choose>
               