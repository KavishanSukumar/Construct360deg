package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NewProjectDAO {
    public boolean addProject(Project project) throws SQLException {
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
//        String sql = "INSERT INTO `addproject`(`newproject`) VALUES (?)";
        String sql = "INSERT INTO `project`(`projectname`) VALUES (?)";
        preparedStatement = connection.prepareStatement(sql);
        int row =0;

        preparedStatement.setString(1,project.getProjectname());
        row = preparedStatement.executeUpdate();
         if (row>0){
             return true;
         }else{
             return false;
         }
    }

    public ArrayList<Project> viewProject() throws SQLException {
        ArrayList<Project> newprojects = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql ="SELECT * FROM `project`";
        preparedStatement = connection.prepareStatement(sql);
//        preparedStatement.setInt(1,projectid);
        ResultSet resultSet = null;
        resultSet= preparedStatement.executeQuery();

        while (resultSet.next()){
            Project project = new Project();
            project.setProjectname(resultSet.getString("projectname"));
//            project.setProjectid(resultSet.getInt("projectid"));
            newprojects.add(project);
        }
        return newprojects;

    }
}
