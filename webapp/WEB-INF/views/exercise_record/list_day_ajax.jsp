<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
function editEvent(no){
	$.ajax({
        url: "/exercise_record/edit_ajax.do"+"?exercise_record_no="+no,
        type:"GET",
        datatype:"html",
        success:function(data){
        	$("#"+"b"+no).html(data);
        }
      });
}
function deleteEvent(no){
	  if(confirm("삭제하시겠습니까?")==true){
		  var param = {};
		  param.exercise_record_no = no;
		  $.ajax({
	          url: "/exercise_record/delete.do",
	          type:"POST",
	          data: param,
	          success:function(data){
	        	  alert(data);
	        	  refreshList();
	        	   },
	        	   error:function(){
	        		   alert("전송실패");
		        	   }
	        });
		  }
	}
</script>

<c:choose>
    <c:when test="${list.size() eq 0}">Nothing</c:when>
    <c:otherwise>
        <c:forEach var="exerciseRecordVO" items="${list}">
					  <c:set var="exerciseName" value="${exerciseRecordVO.exercise_name}" />
					  <c:set var="time" value="${exerciseRecordVO.exercise_record_time}" />
					  <c:set var="setof" value='${exerciseRecordVO.exercise_record_setof}'/>
					  <c:set var="repeat" value="${exerciseRecordVO.exercise_record_repeat}"/>
					  <%--기록보기--%>
					  <c:choose>
					      <%--반복--%>
					      <c:when test = "${time eq null || time eq 0}">
					          <DIV id="b${exerciseRecordVO.exercise_record_no}" class="record-box" disabled="disabled">
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
		                                    <span>${exerciseName}</span>
		                                </DIV>
		                                <%-- 세트수 --%>
		                                <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
		                                    <span>${setof}</span>
		                                </DIV>
		                                <%-- 반복횟수 --%>
		                                <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
		                                    <span>${repeat}</span>
		                                </DIV>
		                            </DIV>
		                        </DIV>
		                        
		                        <%-- 버튼 --%>
		                        <DIV style="width:7%; top: 0; height: 100%; border-left:1px solid black; display:flex; flex-direction:column; justify-content:center; align-items: center">
		                            <button type="button" class="Circle-Arrow-Btn" onclick="editEvent('${exerciseRecordVO.exercise_record_no}')"><img style="width:80%;height:80%;" src="/common/iconmonstr-pencil-square-lined.svg" alt=""></button>
		                            <button type="button" class="Circle-Arrow-Btn" onclick="deleteEvent('${exerciseRecordVO.exercise_record_no}')"><img style="width:80%;height:80%;" src="/common/iconmonstr-trash-can-lined.svg" alt=""></button>
		                        </DIV>
		                    </DIV>
                    </DIV>
					      </c:when>
					      <%--시간--%>
					      <c:otherwise>
					           <DIV id="b${exerciseRecordVO.exercise_record_no}"  class="record-box">
								           <DIV style="display:flex ; align-items:center; top:0; height:100%;">
			                        <DIV style="width:93%;">
			                            <DIV style="display: flex; align-items: center; height:35%">
			                                <label style="width:33%">운동 명</label>
			                                <label style="width:67%">시간(분)</label>
			                            </DIV>
			                            <DIV style="display: flex; align-items: center; height:65%">
			                                <%-- 운동검색 --%>
			                                <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
			                                    <span>${exerciseName}</span>
			                                </DIV>
			                                <%-- 분 --%>
			                                <DIV style="display: flex; align-items: center; justify-content: center; width:67%">
			                                    <span>${time}</span>
			                                </DIV>
			                            </DIV>
			                        </DIV>
			                        
			                        <%-- 버튼 --%>
			                        <DIV style="width:7%; top: 0; height: 100%; border-left:1px solid black; display:flex; flex-direction:column; justify-content:center; align-items: center">
			                            <button type="button" class="Circle-Arrow-Btn" onclick="editEvent('${exerciseRecordVO.exercise_record_no}')"><img style="width:80%;height:80%;" src="/common/iconmonstr-pencil-square-lined.svg" alt=""></button>
			                            <button type="button" class="Circle-Arrow-Btn" onclick="deleteEvent('${exerciseRecordVO.exercise_record_no}')"><img style="width:80%;height:80%;" src="/common/iconmonstr-trash-can-lined.svg" alt=""></button>
			                        </DIV>
			                    </DIV>
                     </DIV>
					          
					      </c:otherwise>
					  </c:choose>
				</c:forEach>
		</c:otherwise>
</c:choose>

<script>
var count = 2;
window.onscroll = function(e) {
  if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
    setTimeout(function(){
      var addContent = document.createElement("div");
      addContent.classList.add("box")
      addContent.innerHTML = '<p>${count}번째 블록</p>'
      document.querySelector('section').appendChild(addContent);
    }, 1000)  
  }
}
</script>