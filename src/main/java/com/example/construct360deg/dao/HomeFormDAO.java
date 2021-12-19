package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.HomeForm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class HomeFormDAO {
    public boolean homeform(HomeForm homeForm) throws SQLException{
        Connection connection = Database.getConnection();
        String sql = "INSERT INTO `homeform`(`fname`, `lname`, `email`, `message`) VALUES (?,?,?,?) ";
        PreparedStatement preparedStatement = null;
        int row = 0;

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,homeForm.getFname());
        preparedStatement.setString(2, homeForm.getLname());
        preparedStatement.setString(3, homeForm.getEmail());
        preparedStatement.setString(4,homeForm.getMessage());
        row = preparedStatement.executeUpdate();

        if(row>0){
            return true;
        }else {
            return false;
        }
    }

}
