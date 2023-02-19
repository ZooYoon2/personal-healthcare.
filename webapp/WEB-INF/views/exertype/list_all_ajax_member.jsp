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
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
<DIV class='title_line'>운동 종류</DIV>

<DIV class='content_body'>
  
  <TABLE class='table table-hover'>
    
    <tbody>
    <c:forEach var="exertypeVO" items="${list }">
      <c:set var="exertypeno" value="${exertypeVO.EXERCISE_TYPE_NO }" />
      <c:set var="name" value="${exertypeVO.EXERCISE_TYPE_NAME }" />
      <c:set var="cnt" value="${exertypeVO.EXERCISE_TYPE_CNT }" />
      
      <DIV style='width: 19%; height: 170px;
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #E2E2E2; text-align: center;'>
                <a href="../exercise/list_by_exertypeno_grid.do?exertypeno=${exertypeno }">               
                  <span style=" font-weight: bold; font-size: 2em;color: black;font-family: arial;"><br>
                    ${name}</span>
                </a>       
      </DIV>  
    </c:forEach>
    
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
