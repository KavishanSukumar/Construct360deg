package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.HomeForm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HomeFormDAO {
    public boolean homeform(HomeForm homeForm) throws SQLException{
        Connection connection = Database.getConnection();
        String sql = "INSERT INTO `homeform`(`fname`, `lname`, `email`, `message`) VALUES (?,?,?,?) ";
        PreparedStatement preparedStatement = null;
        int row = 0;

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,homeForm.getFname());
        preparedStatement.setString(2, homeForm.getLname());
        preparedStatement.setString(3, homeForm.getEmail());
        preparedStatement.setString(4,homeForm.getMessage());
        row = preparedStatement.executeUpdate();

        if(row>0){
            return true;
        }else {
            return false;
        }
    }

    public ArrayList<HomeForm> retriveHomeForm() throws SQLException {
        ArrayList<HomeForm> homeForms = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `homeform`";
        ResultSet resultSet = null;

        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            HomeForm homeForm = new HomeForm();
            homeForm.setContactid(resultSet.getInt("contactid"));
            homeForm.setFname(resultSet.getString("fname"));
            homeForm.setLname(resultSet.getString("lname"));
            homeForm.setEmail(resultSet.getString("email"));
            homeForm.setMessage(resultSet.getString("message"));
            homeForms.add(homeForm);
        }

        return homeForms;
    }

}
