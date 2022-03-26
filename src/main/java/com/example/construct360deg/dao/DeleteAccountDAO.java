package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteAccountDAO {
    public boolean deleteaccount(int userid) throws SQLException {
        Boolean status=false;
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement1 = null;
        PreparedStatement preparedStatement2 = null;

        String sql = "DELETE FROM `users` WHERE userid=?";
        String sql2 = "DELETE FROM `login` WHERE userid=?";


        preparedStatement1=connection.prepareStatement(sql);
        preparedStatement2=connection.prepareStatement(sql2);
        preparedStatement1.setInt(1,userid);
        preparedStatement2.setInt(1,userid);

        int row1 = preparedStatement1.executeUpdate();
        int row2 = preparedStatement2.executeUpdate();
        if(row1>0 && row2>0){
            status=true;
        }

        return status;
    }
}
