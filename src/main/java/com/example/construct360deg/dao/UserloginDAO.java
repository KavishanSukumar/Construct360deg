package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Userlogin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserloginDAO {

    public boolean verify(Userlogin userlogin){
        boolean status=false;
        Connection connection= Database.getConnection();
        String sql="SELECT * FROM login where username=? and password=?";
        PreparedStatement statement;
        try {
            statement=connection.prepareStatement(sql);
            statement.setString(1,userlogin.getUsername());
            statement.setString(2,userlogin.getPassword());
            ResultSet resultSet=statement.executeQuery();
            status=resultSet.next();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return status;
    }
}
