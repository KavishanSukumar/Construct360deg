package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Complain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ComplainDAO {
    public boolean lodgecomplain(Complain complain) throws SQLException {
        Connection connection= Database.getConnection();
        String sql="INSERT INTO `complain`( `complainer`, `complainee`, `fullname`, `email`, `category`, `message`) VALUES (?,?,?,?,?,?)";
        PreparedStatement preparedStatement=null;
        int row=0;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,complain.getComplainer());
        preparedStatement.setInt(2,complain.getComplainee());
        preparedStatement.setString(3,complain.getFullname());
        preparedStatement.setString(4,complain.getEmail());
        preparedStatement.setString(5,complain.getCategory());
        preparedStatement.setString(6,complain.getMessage());
        row=preparedStatement.executeUpdate();

        if (row>0){
            return true;
        }else{
            return false;
        }
    }
}
