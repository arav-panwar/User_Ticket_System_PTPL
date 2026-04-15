package com.support.system.servlet;

import com.support.system.dao.UserDAO;
import com.support.system.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role"); // 🔥 NEW

            UserDAO dao = new UserDAO();

            User user = dao.login(email, password);

            //  Invalid login OR wrong role
            if (user == null || !user.getRole().equalsIgnoreCase(role)) {
                response.getWriter().println("Invalid Credentials");
                return;
            }

            //  destroy old session (fix mixing issue)
            HttpSession session = request.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            // create new session
            session = request.getSession(true);
            session.setAttribute("user", user);

            // redirect based on role
            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("AdminDashboardServlet");
            } else {
                response.sendRedirect("user_home.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}