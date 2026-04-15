package com.support.system.servlet;

import com.support.system.dao.TicketDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteTicketServlet")
public class DeleteTicketServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int ticketId = Integer.parseInt(request.getParameter("id"));

            TicketDAO dao = new TicketDAO();

            dao.deleteTicket(ticketId);

            response.sendRedirect("AdminDashboardServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting ticket.");
        }
    }
}