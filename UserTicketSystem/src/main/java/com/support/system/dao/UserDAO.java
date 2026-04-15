package com.support.system.dao;

import com.support.system.DBUtil;
import com.support.system.model.User;

import java.sql.*;

public class UserDAO {

    public User login(String email, String password) throws Exception {

        Connection con = DBUtil.getConnection();

        PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?");

        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        User user = null;

        if (rs.next()) {

            user = new User();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setRole(rs.getString("role"));
        }

        con.close();

        return user;
    }

    public void register(User user) throws Exception {

        Connection con = DBUtil.getConnection();

        PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name,email,password,role) VALUES (?,?,?,?)");

        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPassword());
        ps.setString(4, "USER");

        ps.executeUpdate();

        con.close();
    }
}