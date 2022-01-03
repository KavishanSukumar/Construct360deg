package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Newproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NewProjectDAO {
    public boolean addProject(Newproject newproject) throws SQLException {
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO `addproject`(`newproject`) VALUES (?)";
        preparedStatement = connection.prepareStatement(sql);
        int row =0;

        preparedStatement.setString(1,newproject.getNewproject());
        row = preparedStatement.executeUpdate();
         if (row>0){
             return true;
         }else{
             return false;
         }
    }

    public ArrayList<Newproject> viewProject() throws SQLException {
        ArrayList<Newproject> newprojects = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql ="SELECT * FROM `addproject`";
        preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = null;
        resultSet= preparedStatement.executeQuery();

        while (resultSet.next()){
            Newproject newproject = new Newproject();
            newproject.setUserid(resultSet.getInt("userid"));
            newproject.setNewproject(resultSet.getString("newproject"));
            newprojects.add(newproject);
        }
        return newprojects;

    }
}
