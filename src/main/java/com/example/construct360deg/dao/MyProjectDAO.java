package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyProjectDAO {
    public boolean addDetails(Project project) throws SQLException {
        Connection connection = Database.getConnection();
        String sql = "UPDATE `projectdetails` SET `event1`=?,`event2`=?,`event3`=?,`event4`=?,`other`=?,`contractor`=?,`customer`=?,`land`=? WHERE userid=?";
        PreparedStatement preparedStatement = null;
        int row=0;
        preparedStatement = connection.prepareStatement(sql);

//        preparedStatement.setString(1,project.getProjectid());
        preparedStatement.setString(1,project.getEvent1());
        preparedStatement.setString(2,project.getEvent2());
        preparedStatement.setString(3,project.getEvent3());
        preparedStatement.setString(4,project.getEvent4());
        preparedStatement.setString(5,project.getOther());
        preparedStatement.setString(6,project.getContractor());
        preparedStatement.setString(7,project.getCustomer());
        preparedStatement.setString(8,project.getLand());
//        preparedStatement.setString(9,project.getProjectid());
        preparedStatement.setInt(9,project.getUserid());
        row = preparedStatement.executeUpdate();

        if (row > 0) {
            return true;
        } else {
            return false;
        }
    }

    public Project retriveDetails(int userid) throws SQLException {
        Connection connection = Database.getConnection();
        String sql = "SELECT * FROM `projectdetails` WHERE userid=?";
        Project project = new Project();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
//        preparedStatement.setString(1, projectid);
        preparedStatement.setInt(1, userid);
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            project.setEvent1(resultSet.getString("event1"));
            project.setEvent2(resultSet.getString("event3"));
            project.setEvent3(resultSet.getString("event3"));
            project.setEvent4(resultSet.getString("event4"));
            project.setOther(resultSet.getString("other"));
            project.setContractor(resultSet.getString("contractor"));
            project.setCustomer(resultSet.getString("customer"));
            project.setLand(resultSet.getString("land"));
//            project.setProjectid(resultSet.getString("projectid"));
            project.setUserid(resultSet.getInt("userid"));
//            projects.add(project);
        }
        return project;
    }

    public boolean insertData(Project project) throws SQLException {
        Connection connection = Database.getConnection();
        int row = 0;
        String sql = "INSERT INTO `closeproject`(`userid`, `reason`, `display`) VALUES (?,?,?)";
        PreparedStatement preparedStatement = null;
        preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setInt(1, project.getUserid());
        preparedStatement.setString(2,project.getReason());
        preparedStatement.setString(3,project.getDisplay());
        row = preparedStatement.executeUpdate();

        if (row > 0) {
            return true;
        } else {
            return false;
        }
    }

    public Project displayData(int userid) throws SQLException {
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `closeproject` WHERE userid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        ResultSet resultSet = null;
        resultSet = preparedStatement.executeQuery();
        Project project = new Project();

        while (resultSet.next()){
            project.setReason(resultSet.getString("reason"));
            project.setDisplay(resultSet.getString("display"));
            project.setUserid(resultSet.getInt("userid"));
        }
        return project;
    }

}
