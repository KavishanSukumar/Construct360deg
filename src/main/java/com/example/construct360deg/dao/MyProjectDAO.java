package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyProjectDAO {
    public static boolean addDetails(Project project) throws SQLException {
        Connection connection = Database.getConnection();
        String sql = "INSERT INTO `projectdetails`(`event1`, `event2`, `event3`, `event4`, `other`, `contractor`, `customer`, `land`) VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = null;
        int row=0;
        preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1,project.getEvent1());
        preparedStatement.setString(2,project.getEvent2());
        preparedStatement.setString(3,project.getEvent3());
        preparedStatement.setString(4,project.getEvent4());
        preparedStatement.setString(5,project.getOther());
        preparedStatement.setString(6,project.getContractor());
        preparedStatement.setString(7,project.getCustomer());
        preparedStatement.setString(8,project.getLand());
        row = preparedStatement.executeUpdate();

        if (row > 0) {
            return true;
        } else {
            return false;
        }
    }

    public ArrayList<Project> retriveDetails() throws SQLException {
        ArrayList<Project> projects = new ArrayList<>();
        Connection connection = Database.getConnection();
        String sql = "SELECT * FROM `projectdetails`";
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            Project project = new Project();
            project.setUserid(resultSet.getInt("userid"));
            project.setEvent1(resultSet.getString("event1"));
            project.setEvent2(resultSet.getString("event3"));
            project.setEvent3(resultSet.getString("event3"));
            project.setEvent4(resultSet.getString("event4"));
            project.setOther(resultSet.getString("other"));
            project.setContractor(resultSet.getString("contractor"));
            project.setCustomer(resultSet.getString("customer"));
            project.setLand(resultSet.getString("land"));
            projects.add(project);
        }
        return projects;
    }
}
