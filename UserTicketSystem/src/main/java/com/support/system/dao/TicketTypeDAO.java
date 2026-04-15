package com.support.system.dao;

import com.support.system.DBUtil;
import com.support.system.model.TicketType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketTypeDAO {

    // GET ALL TICKET TYPES
    public List<TicketType> getAllTypes() throws Exception {

        List<TicketType> list = new ArrayList<>();

        Connection con = DBUtil.getConnection();

        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery(
                "SELECT * FROM ticket_types ORDER BY id");

        while (rs.next()) {

            TicketType type = new TicketType();

            type.setId(rs.getInt("id"));
            type.setTypeName(rs.getString("type_name"));

            list.add(type);
        }

        rs.close();
        stmt.close();
        con.close();

        return list;
    }
    
    // GET TYPE BY ID (OPTIONAL)
    public TicketType getTypeById(int id) throws Exception {

        TicketType type = null;

        Connection con = DBUtil.getConnection();

        PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM ticket_types WHERE id=?");

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            type = new TicketType();
            type.setId(rs.getInt("id"));
            type.setTypeName(rs.getString("type_name"));
        }

        rs.close();
        ps.close();
        con.close();

        return type;
    }
}