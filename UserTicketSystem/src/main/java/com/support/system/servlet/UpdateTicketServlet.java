package com.support.system.servlet;

import com.support.system.dao.TicketDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateTicketServlet")
public class UpdateTicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            TicketDAO dao = new TicketDAO();

            String delete = request.getParameter("delete");

            // DELETE TICKET
            if ("true".equals(delete)) {

                dao.deleteTicket(id);
                response.sendRedirect("AdminDashboardServlet");
                return;
            }

            // UPDATE TICKET
            String description = request.getParameter("description");
            String status = request.getParameter("status");
            String priority = request.getParameter("priority");

            dao.updateTicket(id, description, status, priority);

            response.sendRedirect("AdminDashboardServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating ticket.");
        }
    }
}