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
  function createCancel(){
	  var tag = `
		  <DIV style="display: flex; justify-content: center; align-items: center; width:80%; top:0; height:100%;">
		  <button class="Circle-Arrow-Btn" style="width:60px; height:60px; margin-left:5%; margin-right:5%; " onclick="createNew()">
		  <img style="width:80%;height:80%;" src="/common/iconmonstr-plus-lined.svg" alt="">
		  </button>
		  </DIV>`;
	  $("#block").html(tag);
	  }
  function createNew() {
	  var tag = `
		  <DIV style="display: flex; align-items: center; justify-content: center; width:80%; top:0; height:100%; ">
		  <button class="Circle-Arrow-Btn" style="width:60px; height:60px; margin-left:5%; margin-right:5%" onclick="createTime()">
		  <img style="width:80%;height:80%;" src="/common/exercise-icon.svg" alt="">
		  </button>
		  <button class="Circle-Arrow-Btn" style="width:60px; height:60px; margin-left:5%; margin-right:5%" onclick="createRepeat()">
		  <img style="width:80%;height:80%;" src="/common/fitness-icon.svg" alt="">
		  </button>
		  </DIV>`;
		  $("#block").html(tag);
		  }
  function createRepeat(){
	  var tag = `<FORM name='frm' id='frm' method='POST'>
	        <input type="hidden" name="memberno" id="memberno" value='${sessionScope.memberno}'>
	        <input type="hidden" name="exercise_no" id="exercise_no" value="">
	        <input type="hidden" name="exercise_record_date" id="exercise_record_date" value="${date}">
	        
	        <DIV style="display:flex ; align-items:center; top:0; height:100%;">
	            <DIV style="width:93%;">
	                <DIV style="display: flex; align-items: flex-end; height:35%">
	                    <label style="width:33%">?????? ???</label>
	                    <label style="width:33%">?????? ???</label>
	                    <label style="width:33%">?????? ???</label>
	                </DIV>
	                <DIV style="display: flex; align-items: center; height:65%">
	                    <%-- ???????????? --%>
	                    <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
	                        <span id="exercise_name" style="margin-right:5px">?????????</span>
	                        <button type="button" onclick="modal()">??????</button>
	                    </DIV>
	                    <%-- ????????? --%>
	                    <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
	                        <button type="button" class="Circle-Arrow-Btn" onclick="valueDown('exercise_record_setof')">
	                            <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-down-lined.svg" alt="">
	                        </button>
	                        <input type='number' name='exercise_record_setof' id='exercise_record_setof' value='0' required="required" autofocus="autofocus" class="form-control" style='width: 72px;height: 48px;border-radius:50%;text-align:center;'>
	                        <button type="button" class="Circle-Arrow-Btn" onclick="valueUp('exercise_record_setof')">
	                            <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-up-lined.svg" alt="">
	                        </button>
	                    </DIV>
	                    <%-- ???????????? --%>
	                    <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
	                        <button type="button" class="Circle-Arrow-Btn" onclick="valueDown('exercise_record_repeat')">
	                            <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-down-lined.svg" alt="">
	                        </button>
	                        <input type='number' name='exercise_record_repeat' id='exercise_record_repeat' value='0' required="required" autofocus="autofocus" class="form-control" style='width: 72px;height: 48px;border-radius:50%;text-align:center;'>
	                        <button type="button" class="Circle-Arrow-Btn" onclick="valueUp('exercise_record_repeat')">
	                                <img style="width:80%;height:80%;" src="/common/iconmonstr-arrow-up-lined.svg" alt="">
	                        </button>
	                    </DIV>
	                </DIV>
	            </DIV>
	            
	            <%-- ?????? --%>
	            <DIV style="width:7%; top: 0; height: 100%; border-left:1px solid black; display:flex; flex-direction:column; justify-content:center; align-items: center">
	                <button type="button" class="Circle-Arrow-Btn" onclick="creatRecord()"><img style="width:80%;height:80%;" src="/common/iconmonstr-check-mark.svg" alt=""></button>
	                <button type="button" class="Circle-Arrow-Btn" onclick="createCancel()"><img style="width:80%;height:80%;" src="/common/iconmonstr-x-mark-lined.svg" alt=""></button>
	            </DIV>
	        </DIV>
	        
	    </FORM>`;
	    $("#block").html(tag);
	  }
  function createTime(){
	    var tag = `<%-- ???????????? ?????? - ?????? ??? ??????  --%>
	    	<FORM name='frm' id='frm' method='POST'>
	        <input type="hidden" name="memberno" id="memberno" value='${sessionScope.memberno}'>
	        <input type="hidden" name="exercise_no" id="exercise_no" value="">
	        <input type="hidden" name="exercise_record_date" id="exercise_record_date" value="${date}">

	        <DIV style="display:flex ; align-items:center; top:0; height:100%;">
	            <DIV style="width:93%;">
	                <DIV style="display: flex; align-items: center; height:35%">
	                    <label style="width:33%">?????? ???</label>
	                    <label style="width:67%">??????(???)</label>
	                </DIV>
	                <DIV style="display: flex; align-items: center; height:65%">
	                    <%-- ???????????? --%>
	                    <DIV style="display: flex; align-items: center; justify-content: center; width:33%">
	                        <span id="exercise_name" style="margin-right:5px">?????????</span>
	                        <button type="button" onclick="modal()">??????</button>
	                    </DIV>
	                    <%-- ??? --%>
	                    <DIV style="display: flex; align-items: center; justify-content: center; width:67%">
	                        <button type="button" class="Circle-Arrow-Btn" onclick="valueDown('exercise_record_time')">
	                            <img style="width:100%;height:100%;" src="/common/iconmonstr-arrow-down-lined.svg" alt="">
	                        </button>
	                        <input type='number' name='exercise_record_time' id='exercise_record_time' value='0' required="required" autofocus="autofocus" class="form-control" style='width: 72px;height: 48px;border-radius:50%;text-align:center;'>
	                        <button type="button" class="Circle-Arrow-Btn" onclick="valueUp('exercise_record_time')">
	                            <img style="width:100%;height:100%;" src="/common/iconmonstr-arrow-up-lined.svg" alt="">
	                        </button>
	                    </DIV>
	                </DIV>
	            </DIV>
	            
	            <%-- ?????? --%>
	            <DIV style="width:7%; top: 0; height: 100%; border-left:1px solid black; display:flex; flex-direction:column; justify-content:center; align-items: center">
	                <button type="button" class="Circle-Arrow-Btn" onclick="creatRecord()"><img style="width:80%;height:80%;" src="/common/iconmonstr-check-mark.svg" alt=""></button>
	                <button type="button" class="Circle-Arrow-Btn" onclick="createCancel()"><img style="width:80%;height:80%;" src="/common/iconmonstr-x-mark-lined.svg" alt=""></button>
	            </DIV>
	        </DIV>
	        
	    </FORM>`;
	    $("#block").html(tag);
  }
  function creatRecord(){
	  if(document.getElementById("exercise_no").value===null | document.getElementById("exercise_no").value===""){
		  alert("?????? ??????????????????");
		  }
	  else if(document.getElementById("memberno").value===null|document.getElementById("memberno").value===""){
		  alert("????????? ??? ????????? ?????????");
		  }
	  else{
		  $.ajax({
	            url: "/exercise_record/create_ajax.do",
	            type:"POST",
	            data:$('#frm').serialize(),
	            success:function(data){
	              alert("?????? ??????");
	              createCancel();
	              refreshList();
	              },
	              error: function(){  
	                  alert("?????? ??????");  
	                  createCancel();
	                  }
	          });
		  }
    }
</script>
<c:set var="sys_date" value="${date}" />
<DIV id='block' style="width:100%;top:0;height:100%; padding:auto" >
    <DIV style="display: flex; justify-content: center; align-items: center; width:80%; top:0; height:100%;">
		    <button class="Circle-Arrow-Btn" style="width:60px; height:60px; margin-left:5%; margin-right:5%; " onclick="createNew()">
		        <img style="width:80%;height:80%;" src="/common/iconmonstr-plus-lined.svg" alt="">
		    </button>
    </DIV>
</DIV>