<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Browse Members</title>
</head>
<body>
<jsp:include page="/WEB-INF/view/components/admin-header.jsp" ></jsp:include>
<jsp:include page="/WEB-INF/view/components/admin-topbar.jsp" ></jsp:include>



<form name=search action="adminmembersearch" method="post">
	
	Enter search details:
 <table border=1 cellspacing=2 cellpadding=4>
 	<tr>
 		<td width=25%>First Name of the user*</td>
 		<td><input name=fname maxlength=50></td>
 	</tr>
 	<tr>
 		<td colspan=2>
 			<button>Search</button><br> 			
 		</td>
 	</tr>
 </table>
 </form>
 
Total Members: ${list.size() }

<table border=1 cellspacing=2 cellpadding=4>
 	<tr>
 		<td><b>Name</b></td>
 		<td><b>Email</b></td>
 		<td><b>Signup Date</b></td>
 		<td><b>Age</b></td>
 		<td><b>Address</b></td>
 	</tr>
 	<c:forEach items="${list}" var="item">
 	  	<tr>
	 		<td>${item.fname}&nbsp;${item.lname }</td>
 			<td>${item.email}</td>
 			<td>${item.dateAdded}</td>
 			<td>${item.age}</td>
 			<td>${item.address}</td>
 			
 	  	</tr>
 	  </c:forEach>
</table> 		
	


<jsp:include page="/WEB-INF/view/components/admin-footer.jsp"></jsp:include>
</body>
</html>