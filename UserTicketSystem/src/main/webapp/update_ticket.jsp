<%@ page import="java.sql.*,com.support.system.DBUtil" %>

<%
String id=request.getParameter("id");

String status="";
String description="";

try{

Connection con=DBUtil.getConnection();

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM tickets WHERE id=?");

ps.setInt(1,Integer.parseInt(id));

ResultSet rs=ps.executeQuery();

if(rs.next()){
status=rs.getString("status");
description=rs.getString("description");
}

rs.close();
ps.close();
con.close();

}catch(Exception e){
e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>

<head>

<title>Update Ticket</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body style="background:#f4f6f9;">

<nav class="navbar navbar-dark bg-dark px-4">

<span class="navbar-brand">Update Ticket</span>

<a href="AdminDashboardServlet" class="btn btn-light btn-sm">Back</a>

</nav>


<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow p-4">

<h3 class="mb-4 text-center">Update Ticket</h3>

<form action="UpdateTicketServlet" method="post">

<input type="hidden" name="id" value="<%=id%>">

<div class="mb-3">

<label class="form-label">Priority</label>

<select name="priority" class="form-select">

<option value="Low">Low</option>
<option value="Medium">Medium</option>
<option value="High">High</option>
<option value="Critical">Critical</option>

</select>

</div>


<div class="mb-3">

<label class="form-label">Status</label>

<select name="status" class="form-select">

<option value="Open">Open</option>
<option value="In Progress">In Progress</option>
<option value="Resolved">Resolved</option>

</select>

</div>


<div class="mb-3">

<label class="form-label">Description</label>

<textarea name="description" class="form-control" rows="4"></textarea>

</div>


<div class="d-grid">
<button class="btn btn-primary">Update Ticket</button>
</div>

</form>

</div>

</div>

</div>

</div>

</body>

</html>