package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Skills;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SkillsDAO {
    public boolean addSkills(Skills skills1) throws SQLException {
        Connection connection = Database.getConnection();
        String sql = "INSERT INTO `skill`(`skill1`, `skill2`, `skill3`, `skill4`, `skill5`, `other`) VALUES (?,?,?,?,?,?)";
        PreparedStatement preparedStatement = null;
        int row = 0;

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, skills1.getSkill1());
        preparedStatement.setString(2, skills1.getSkill2());
        preparedStatement.setString(3, skills1.getSkill3());
        preparedStatement.setString(4, skills1.getSkill4());
        preparedStatement.setString(5, skills1.getSkill5());
        preparedStatement.setString(6, skills1.getOther());
        row = preparedStatement.executeUpdate();

        if (row > 0) {
            return true;
        } else {
            return false;
        }
    }

    public ArrayList<Skills> retriveSkills() throws SQLException {
        ArrayList<Skills> skills = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `skill`";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Skills skills1 = new Skills();
            skills1.setUserid(resultSet.getInt("userid"));
            skills1.setSkill1(resultSet.getString("skill1"));
            skills1.setSkill2(resultSet.getString("skill2"));
            skills1.setSkill3(resultSet.getString("skill3"));
            skills1.setSkill4(resultSet.getString("skill4"));
            skills1.setSkill5(resultSet.getString("skill5"));
            skills1.setOther(resultSet.getString("other"));
            skills.add(skills1);

        }
            return skills;
    }

}
