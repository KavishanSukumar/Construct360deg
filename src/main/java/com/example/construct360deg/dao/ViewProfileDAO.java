package com.example.construct360deg.dao;
import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Viewprofile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ViewProfileDAO {
    public static void SaveSummary(String task, String summaryText, int userid) throws SQLException {
        Connection connection = Database.getConnection();
        String sql = "INSERT INTO `userdetails`(`userid`, `type`, `data`) VALUES (?,?,?)";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, userid);
        preparedStatement.setString(2, task);
        preparedStatement.setString(3, summaryText);
        preparedStatement.executeUpdate();
        System.out.println("test me");
    }


    public ArrayList<Viewprofile> displaySummary(int userid) throws SQLException {
        ArrayList<Viewprofile> addsummary = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        Connection connection = Database.getConnection();
        String sql = "SELECT * FROM `userdetails` WHERE userid = ? AND type = 'summary'";
        ResultSet resultSet = null;

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, userid);
        resultSet = preparedStatement.executeQuery();


        while (resultSet.next()) {
            Viewprofile viewprofile = new Viewprofile();
            viewprofile.setUserid(userid);
            viewprofile.setSummaryText(resultSet.getString("data"));
            viewprofile.setTask(resultSet.getString("type"));

            addsummary.add(viewprofile);
        }
        return addsummary;

    }
}
