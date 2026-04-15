package com.support.system.servlet;

import com.support.system.DBUtil;
import com.support.system.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

try{

HttpSession session = request.getSession();
User user = (User) session.getAttribute("user");

String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

Connection con = DBUtil.getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE users SET name=?, email=?, password=? WHERE id=?");

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,password);
ps.setInt(4,user.getId());

ps.executeUpdate();

user.setName(name);
user.setEmail(email);
user.setPassword(password);

session.setAttribute("user",user);

response.sendRedirect("profile.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}