package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Closeproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CloseProjectDAO {
    public boolean insertData(Closeproject closeproject) throws SQLException {
        Connection connection = Database.getConnection();
        int row = 0;
        String sql = "INSERT INTO `closeproject`(`reason`, `display`) VALUES (?,?)";
        PreparedStatement preparedStatement = null;
        preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1,closeproject.getReason());
        preparedStatement.setString(2,closeproject.getDisplay());
        row = preparedStatement.executeUpdate();

        if (row > 0) {
            return true;
        } else {
            return false;
        }
    }

    public ArrayList<Closeproject> displayData() throws SQLException {
        ArrayList<Closeproject> closeprojects = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `closeproject`";
        preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = null;
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            Closeproject closeproject = new Closeproject();
            closeproject.setUserid(resultSet.getInt("userid"));
            closeproject.setReason(resultSet.getString("reason"));
            closeproject.setDisplay(resultSet.getString("display"));
            closeprojects.add(closeproject);
        }
        return closeprojects;
    }
}
