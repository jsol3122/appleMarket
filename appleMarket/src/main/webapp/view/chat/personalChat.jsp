<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>personalchat.jsp</h1>
<input type="text" value="${chatRoom_id}"/>
<%--
${chatRoom_id}
${member_id }
 
<c:forEach items=${map} var="map">
           ${map.key} = ${map.value}  
</c:forEach>
  --%>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
$(function(){
	alert(JSON.stringify(data))
	
});


</script>

</body>

</html>