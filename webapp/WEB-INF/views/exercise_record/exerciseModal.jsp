<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- histoty Modal-->
<table class="table table-sm table-hover">
            <colgroup>
              <col style="width: 30%;"></col>
              <col style="width: 35%;"></col>
              <col style="width: 35%;"></col>
            </colgroup>
            <thead class="thead-dark">
            <tr class="content">
                <th class="text-center">
                    운동번호
                </th>
                <th class="text-center">
                    운통종류
                </th>
                <th class="text-center">
                    운동명
                </th>
            </tr>
            </thead>
            <tbody class="text-center">
            <c:forEach var="exer" items="${exerList}" >
                <tr class="content" style="font-size: 12px;" onclick="selectExer('${exer.EXERCISE_NO}','${exer.EXERCISE_NAME}')" data-dismiss="modal" aria-label="Close">
                    <td class="text-center">${exer.EXERCISE_NO}</td>
                    <td class="text-center">${exer.EXERCISE_TYPE_NAME}</td>
                    <td class="text-center">${exer.EXERCISE_NAME}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <DIV class='bottom_menu'>${paging }</DIV>
        
<script>
function selectExer(no,name){
	document.getElementById('exercise_name').innerHTML= name;
	document.getElementById('exercise_no').value=no;
    }
</script>
</script>