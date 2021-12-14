package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Advertise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdvertiseDAO {
    public boolean advertise(Advertise advertise) throws SQLException{
        Boolean status=false;
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        int row = 0;
        String addid= advertise.getAddid();
        String sql1 = "INSERT INTO `advertisement`(`userid`, `url`, `headline`, `description`, `image`) VALUES (?,?,?,?,?)";
        preparedStatement=connection.prepareStatement(sql1);
        preparedStatement.setInt(1,advertise.getUserid());
        preparedStatement.setString(2,advertise.getWeburl());
        preparedStatement.setString(3,advertise.getHeadline());
        preparedStatement.setString(4,advertise.getDescription());
        preparedStatement.setBlob(5,advertise.getImg());
        row+=preparedStatement.executeUpdate();
        if (row>=1){
            status=true;
            System.out.println("All queries successfully updated");
        }
        return status;



    }




}
