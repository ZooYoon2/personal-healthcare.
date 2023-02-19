<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko"> 
<head> 
<meta charset="EUC-KR"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
var date = new Date();
var year = date.getFullYear();
var month = date.getMonth()+1;
var day = date.getDate();

$(document).ready(function(){
        $.ajax({
            url: "/exercise_record/create_ajax.do"+"?year="+year+"&&month="+month+"&&day="+day,
            type:"GET",
            datatype:"html",
            success:function(data){
              $("#recordBlock").html(data);
            }
          });
        $.ajax({
            url: "/exercise_record/list_day_ajax.do"+"?year="+year+"&&month="+month+"&&day="+day,
            type:"GET",
            datatype:"html",
            success:function(data){
              $("#recordList").html(data);
            }
          });
        });
function refreshDate(){
	  year = date.getFullYear();
	  month = date.getMonth()+1;
	  day = date.getDate();
	  document.getElementById("year").innerHTML=year.toString()+'년';
	  document.getElementById("month").innerHTML=month.toString()+'월';
	  for(var i=-3;i<4;i++){
		  var idStr = "day" + i.toString();
		  var tmpDate = new Date(date);
		  tmpDate.setDate(date.getDate()+i);
		  document.getElementById(idStr).innerHTML=tmpDate.getDate();
		  if(date.getMonth()!==tmpDate.getMonth()){
			  document.getElementById(idStr).style.color = "gray"
			  }
		  else{
			  document.getElementById(idStr).style.color = "black"
				  if(idStr=="day0"){document.getElementById(idStr).style.color = "white"}
			  }
		}
}
$(document).ready(function(){
	  refreshDate();
});
function changeDay(newDay){
	date.setDate(date.getDate()+newDay);
	refreshDate();
	refreshCreate();
	refreshList();
}
function refreshCreate(){
	$.ajax({
        url: "/exercise_record/create_ajax.do"+"?year="+year+"&&month="+month+"&&day="+day,
        type:"GET",
        datatype:"html",
        success:function(data){
          $("#recordBlock").html(data);
        }
      });
}
function refreshList(){
	$.ajax({
        url: "/exercise_record/list_day_ajax.do"+"?year="+year+"&&month="+month+"&&day="+day,
        type:"GET",
        datatype:"html",
        success:function(data){
          $("#recordList").html(data);
        }
      });
}
</script>

</head> 
 
<body>
<!-- Moa Modal Button -->
<a onclick="fnModuleInfo('${test.id}')">
  <i class="fa fa-arrow-circle-right fa-lg"></i>
</a>

<!-- Moa Modal-->
<div class="modal fade" id="MoaModal" tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
	        <h5 class="modal-title" id="historyModalLabel">운동선택</h5>
	        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">×</span>
	        </button>
        </div>
        <div class="modal-body">
	        <%-- 검색 --%>
	        <DIV style="text-align: center;clear: both;">
            <form name='searchFrm' id='searchFrm' method='get' action='./exerciseModal.do' style="text-align: left;margin-right:10px; display:inline">     
              <c:choose>
                <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
                  <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
                </c:when>
                <c:otherwise> <%-- 검색하지 않는 경우 --%>
                  <input type='text' name='word' id='word' value='' style='width: 20%;'>
                </c:otherwise>
              </c:choose>
              <button type='button' onclick="modalSearch()">검색</button>   
            </form>
          </DIV>
          <div id="modal-body" style="margin-top:10px">
          </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        </div>
    </div>
  </div>
</div>
<script>
function modalSearch(){
	var formDt = $("#searchFrm").serialize();
	 $.ajax({
         url: "/exercise_record/exerciseModal.do",
         type:"GET",
         data:formDt,
         datatype:"html",
         success:function(data){
        	 $('#modal-body').html(data);
         }
       });
}
function modalPaging(page){
	  var formDt = $("#searchFrm").serialize();
	  formDt += "&now_page="+page;
	   $.ajax({
	         url: "/exercise_record/exerciseModal.do",
	         type:"GET",
	         data:formDt,
	         datatype:"html",
	         success:function(data){
	           $('#modal-body').html(data);
	         }
	       });
	}
function modal(){
	var formDt = $("#searchFrm").serialize();
	   $.ajax({
	         url: "/exercise_record/exerciseModal.do",
	         type:"GET",
	         data:formDt,
	         datatype:"html",
	         success:function(data){
	           $('#modal-body').html(data);
	         }
	       });
	//$('#modal-body').load("/exercise_record/exerciseModal.do");
	$('#MoaModal').modal();
  }
function selectExer(str){
	  document.getElementById('exerName').innerHTML= str
	  }
</script>

 <c:import url="/menu/top.do" />
<DIV class='title_line'>운동 기록</DIV>

<DIV class='content_body'>
    <%-- 중앙 --%>
    <DIV style="height:100%;padding:1px;">
        <DIV align=center style="margin-left:auto; margin-right:auto; width:800px;">
            <DIV style="">
                <a id="year" style="font-size: 13px; color:black"></a>
            </DIV>
            <DIV style="">
                <a id="month" style="font-size: 22px; color:black"></a>
            </DIV>
            <DIV align=center style="display: flex; align-items: center; justify-content: center;margin:15px">
                <c:forEach var="i" begin="0" end="6">
                    <button id="day${i-3}" 
                    style="width:38px; height:38px;font-size:24px; margin:auto; color:black;
                    border-radius: 50%;border:none;background-color:white;
                    <c:if test = '${i eq 3 }'>
                    background-color:#555555; color:white;
                    </c:if>
                    "
                    onclick="changeDay(${i-3})"></button>
                </c:forEach>
            </DIV>
            
            <DIV align=center style="height:100%;">
                <DIV id="recordBlock" class="record-shadow-box">
                </DIV>
                <DIV id= "recordList">
                </DIV>
            </DIV>
            
        </DIV>
    </DIV>
    
</DIV>

</body>
<script>

</script>
</html>
 