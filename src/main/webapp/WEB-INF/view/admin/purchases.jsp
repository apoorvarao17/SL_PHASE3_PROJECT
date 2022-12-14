<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Purchases Report</title>
</head>
<body>
<jsp:include page="/WEB-INF/view/components/admin-header.jsp" ></jsp:include>
<jsp:include page="/WEB-INF/view/components/admin-topbar.jsp" ></jsp:include>


<form name=filterDate action="purchaseFltByDate" method="post">
 <table border=1 cellspacing=2 cellpadding=4>
 	<tr>
 		<td width=25%>Filter by date*</td>
 		<td><input name="purchasedate" type="date"></td>
 		<td colspan=2>
 			<button>Filter</button><br> 			
 		</td>
 	</tr>
 </table>
 </form>
 
 <form name=filterByCategory action="purchaseFltByCategory" method="post">
	
 <table border=1 cellspacing=2 cellpadding=4>
 	<tr>
 		<td width=25%>Filter by Category*</td>
 		<td>
 			<select name="category">
 				<option value="0">Select category</option>
 				${catDropdown}
 			</select>
 		</td>
 		 <td colspan=2>
 			<button>Filter</button><br> 			
 		</td>
 	</tr>
 </table>
 </form>
 
  <form name=filterByCategory action="adminpurchases" method="GET">
	
 <table border=1 cellspacing=2 cellpadding=4>
 	<tr>
 		 <td colspan=2>
 			<button>Show All purchases</button><br> 			
 		</td>
 	</tr>
 </table>
 </form>

<br><br>Total ${list.size()} Orders: ${totalAmount }<br>

<table border=1 cellspacing=2 cellpadding=4>
 	<tr>
 		<td><b>Order ID</b></td>
 		<td><b>User</b>
 		<td><b>Date</b></td>
 		<td><b>Total</b></td>
 		<td><b>Items</b></td>
 	</tr>
 	<c:forEach items="${list}" var="item">
 	  	<tr>
	 		<td>${item.ID }</td>
 			<td>
 				${mapUsers.get(item.ID)}
 			</td>
 			<td>${item.date }</td>
 			<td>${item.total}</td>
 			<td>
 				${mapItems.get(item.ID)}
 			</td>
 	  	</tr>
 	  </c:forEach>
</table> 		

<jsp:include page="/WEB-INF/view/components/admin-footer.jsp"></jsp:include>
</body>
</html>