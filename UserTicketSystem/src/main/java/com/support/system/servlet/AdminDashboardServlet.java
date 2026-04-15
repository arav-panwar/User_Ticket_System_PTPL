package com.support.system.servlet;

import com.support.system.dao.TicketDAO;
import com.support.system.model.Ticket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            TicketDAO dao = new TicketDAO();
            List<Ticket> tickets = dao.getAllTickets();

            request.setAttribute("tickets", tickets);

            request.getRequestDispatcher("admin_dashboard.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error loading admin dashboard.");
        }
    }
}