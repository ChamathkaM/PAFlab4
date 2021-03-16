<%@ page import="com.PAF4.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Items Management</title>
</head>
<body>
	<h1>Items Management</h1>
	<form method="post" action="items.jsp">
		 Item code: <input name="itemCode" type="text"><br>
		 Item name: <input name="itemName" type="text"><br>
		 Item price: <input name="itemPrice" type="text"><br>
		 Item description: <input name="itemDesc" type="text"><br>
		 <input name="btnSubmit" type="submit" value="Save">
	</form>
	<%
		//Insert item----------------------------------
		
		if (request.getParameter("itemCode") != null)
		 {
			 Item itemObj = new Item();
			 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
			 request.getParameter("itemName"),
			 request.getParameter("itemPrice"),
			 request.getParameter("itemDesc"));
			 session.setAttribute("statusMsg", stsMsg);
		 }
	
		//update item
		if(request.getParameter("itemID") != null){
			Item itemObj = new Item();	 
	 		String stsMsg = itemObj.UpdateItem(Integer.parseInt(request.getParameter("ItemID")) ,
									    request.getParameter("ItemCode"),
										request.getParameter("ItemName"),
										request.getParameter("ItemPrice"),
										request.getParameter("ItemDesc"));
										
		                                session.setAttribute("statusMsg", stsMsg);		
	 }
	
		//Delete item----------------------------------
		if (request.getParameter("itemID") != null)
		 {
		 Item itemObj = new Item();
		 String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
		 session.setAttribute("statusMsg", stsMsg);
		 } 
		%>
		<%
		 out.print(session.getAttribute("statusMsg"));
		
		
	 //showing the details in form
	if("Update".equals("btnUpdate")){
		 
		 Item itemObjj = new Item();	 
		 out.print(itemObjj.readSelectedItem(Integer.parseInt(request.getParameter("itemID"))));
			 
	}
	
	 Item itemObj = new Item();
	 out.print(itemObj.readItems());
	
	%>
	
	
</body>
</html>
