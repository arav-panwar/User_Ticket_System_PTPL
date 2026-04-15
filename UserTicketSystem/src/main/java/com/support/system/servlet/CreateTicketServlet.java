package com.support.system.servlet;

import com.support.system.dao.TicketDAO;
import com.support.system.model.Ticket;
import com.support.system.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/CreateTicketServlet")
public class CreateTicketServlet extends HttpServlet {

    // OPEN CREATE PAGE
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("create_ticket.jsp")
                .forward(request, response);
    }

    // CREATE TICKET
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            User user = (User) session.getAttribute("user");

            Ticket ticket = new Ticket();

            ticket.setUserId(user.getId());
            ticket.setSubject(request.getParameter("subject"));
            ticket.setPriority(request.getParameter("priority"));
            ticket.setDescription(request.getParameter("description"));

            TicketDAO dao = new TicketDAO(); 
            dao.createTicket(ticket);

            response.sendRedirect("mytickets.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error creating ticket.");
        }
    }
}