package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteAccountDAO {
    public boolean deleteaccount(int userid) throws SQLException {
        Boolean status=false;
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;

        String sql = "DELETE FROM `user` WHERE userid=?";


        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);

        int rows = preparedStatement.executeUpdate();
        if(rows>0){
            status=true;
        }

        return status;
    }
}
