package com.support.system.dao;

import com.support.system.DBUtil;
import com.support.system.model.Ticket;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketDAO {

    public void createTicket(Ticket ticket) throws Exception {

        Connection con = DBUtil.getConnection();

        PreparedStatement ps = con.prepareStatement(
        "INSERT INTO tickets (ticket_number,user_id,subject,priority,description,status) VALUES (?,?,?,?,?,?)");

        ps.setString(1, "TCKT-" + System.currentTimeMillis());
        ps.setInt(2, ticket.getUserId());
        ps.setString(3, ticket.getSubject());
        ps.setString(4, ticket.getPriority());
        ps.setString(5, ticket.getDescription());
        ps.setString(6, "Open");

        ps.executeUpdate();

        ps.close();
        con.close();
    }

    public List<Ticket> getAllTickets() throws Exception {

        List<Ticket> list = new ArrayList<>();

        Connection con = DBUtil.getConnection();

        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery(
        "SELECT * FROM tickets ORDER BY created_at DESC");

        while (rs.next()) {

            Ticket t = new Ticket();

            t.setId(rs.getInt("id"));
            t.setTicketNumber(rs.getString("ticket_number"));
            t.setUserId(rs.getInt("user_id"));
            t.setSubject(rs.getString("subject"));
            t.setPriority(rs.getString("priority"));   // ADDED
            t.setDescription(rs.getString("description"));
            t.setStatus(rs.getString("status"));
            t.setCreatedAt(rs.getTimestamp("created_at"));

            list.add(t);
        }

        rs.close();
        stmt.close();
        con.close();

        return list;
    }

    public List<Ticket> getUserTickets(int userId) throws Exception {

        List<Ticket> list = new ArrayList<>();

        Connection con = DBUtil.getConnection();

        PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM tickets WHERE user_id=? ORDER BY created_at DESC");

        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            Ticket t = new Ticket();

            t.setId(rs.getInt("id"));
            t.setTicketNumber(rs.getString("ticket_number"));
            t.setSubject(rs.getString("subject"));
            t.setPriority(rs.getString("priority"));   // ADDED
            t.setDescription(rs.getString("description"));
            t.setStatus(rs.getString("status"));
            t.setCreatedAt(rs.getTimestamp("created_at"));

            list.add(t);
        }

        rs.close();
        ps.close();
        con.close();

        return list;
    }

    public void updateTicket(int id, String description, String status, String priority) throws Exception {

        Connection con = DBUtil.getConnection();

        PreparedStatement ps = con.prepareStatement(
        "UPDATE tickets SET description=?, status=?, priority=? WHERE id=?");

        ps.setString(1, description);
        ps.setString(2, status);
        ps.setString(3, priority);
        ps.setInt(4, id);

        ps.executeUpdate();

        ps.close();
        con.close();
    }

    public void deleteTicket(int id) throws Exception {

        Connection con = DBUtil.getConnection();

        PreparedStatement ps = con.prepareStatement(
        "DELETE FROM tickets WHERE id=?");

        ps.setInt(1, id);

        ps.executeUpdate();

        ps.close();
        con.close();
    }
}