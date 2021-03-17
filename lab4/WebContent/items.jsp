<%@ page import="com.PAF.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Items Management</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>

<div class="container">
	<h1>Items Management</h1>
	<form method="post" action="items.jsp">
	 <div class="row">
		 <div class="col">
	
			 Item code: <input name="itemCode" type="text"  class="form-control"><br></div> </div>
			 Item name: <input name="itemName" type="text"  class="form-control"><br>
			 Item price: <input name="itemPrice" type="text" class="form-control"><br>
			 Item description: <input name="itemDesc" type="text" class="form-control"><br>
			 <input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
		</form>
		 
	
</div>
	
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
		
		<div class="alert alert-success">
		 <% out.print(session.getAttribute("statusMsg"));%>
		</div>
		<%
		
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
