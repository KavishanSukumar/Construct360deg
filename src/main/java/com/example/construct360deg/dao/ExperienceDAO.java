package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Experience;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ExperienceDAO {
    public boolean addexperience(Experience experience) throws SQLException {
        Connection connection = Database.getConnection();
        String sql ="INSERT INTO `experience`(`userid`, `title`, `companyname`, `location`, `years`) VALUES (?,?,?,?,?)";
        PreparedStatement preparedStatement = null;
        int row=0;

        preparedStatement= connection.prepareStatement(sql);
        preparedStatement.setInt(1,experience.getUserid());
        preparedStatement.setString(2,experience.getTitle());
        preparedStatement.setString(3,experience.getCompanyname());
        preparedStatement.setString(4,experience.getLocation());
        preparedStatement.setInt(5,experience.getYears());
        row=preparedStatement.executeUpdate();

        if (row>0){
            return true;
        }else{
            return false;
        }

    }

    public ArrayList<Experience> retriveExperience(int userid) throws SQLException {
        ArrayList<Experience> experiences = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `experience` WHERE userid=?";
        ResultSet resultSet = null;

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            Experience experience = new Experience();
            experience.setTitle(resultSet.getString("title"));
            experience.setCompanyname(resultSet.getString("companyname"));
            experience.setLocation(resultSet.getString("location"));
            experience.setYears(resultSet.getInt("years"));
            experience.setUserid(resultSet.getInt("userid"));
            experiences.add(experience);
        }

        return experiences;
    }
}






