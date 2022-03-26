package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyProjectDAO {
    public boolean addDetails(Project project,int userid) throws SQLException {
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        int projectid = 0;
        String sql1 = "SELECT `projectid` FROM `projectdetails` WHERE userid=?";
//        String sql = "UPDATE `projectdetails` SET `event1`=?,`event2`=?,`event3`=?,`event4`=?,`other`=?,`contractor`=?,`customer`=?,`land`=? WHERE userid=?";
//        String sql = "UPDATE `projectdetails` SET `event1`=?,`event2`=?,`event3`=?,`event4`=?,`other`=?,`member1`=?,`member2`=?,`member3`=? WHERE projectid=?";
//        int row=0;

        preparedStatement = connection.prepareStatement(sql1);
        preparedStatement.setInt(1,userid);
        ResultSet resultSet = preparedStatement.executeQuery();
//        preparedStatement = connection.prepareStatement(sql);

        while(resultSet.next()){
            projectid = resultSet.getInt("projectid");
        }
        String sql2=null;
        if (projectid!=0){
            sql2 = "UPDATE `projectdetails` SET `event1`=?,`event2`=?,`event3`=?,`event4`=?,`other`=?,`member1`=?,`member2`=?,`member3`=? WHERE projectid=? and userid=?";

        }else {
            sql2="INSERT INTO `projectdetails`(`event1`, `event2`, `event3`, `event4`, `other`, `member1`, `member2`, `member3`,`projectid`,`userid`) VALUES (?,?,?,?,?,?,?,?,?,?)";
        }

        preparedStatement = connection.prepareStatement(sql2);
        int row=0;

        preparedStatement.setString(1,project.getEvent1());
        preparedStatement.setString(2,project.getEvent2());
        preparedStatement.setString(3,project.getEvent3());
        preparedStatement.setString(4,project.getEvent4());
        preparedStatement.setString(5,project.getOther());
        preparedStatement.setString(6,project.getMember1());
        preparedStatement.setString(7,project.getMember2());
        preparedStatement.setString(8,project.getMember3());
//        preparedStatement.setInt(9,project.getUserid());
        preparedStatement.setInt(9,project.getProjectid());
        preparedStatement.setInt(10,project.getUserid());
        row = preparedStatement.executeUpdate();

        if (row > 0) {
            return true;
        } else {
            return false;
        }
    }

    public Project retriveDetails(int projectid) throws SQLException {
        Connection connection = Database.getConnection();
        String sql = "SELECT * FROM `projectdetails` WHERE projectid=?";
        Project project = new Project();
//        Project project = new Project();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
//        preparedStatement.setString(1, projectid);
        preparedStatement.setInt(1, projectid);
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            project.setEvent1(resultSet.getString("event1"));
            project.setEvent2(resultSet.getString("event2"));
            project.setEvent3(resultSet.getString("event3"));
            project.setEvent4(resultSet.getString("event4"));
            project.setOther(resultSet.getString("other"));
            project.setMember1(resultSet.getString("member1"));
            project.setMember2(resultSet.getString("member2"));
            project.setMember3(resultSet.getString("member3"));
            project.setProjectid(resultSet.getInt("projectid"));
//            project.setUserid(resultSet.getInt("userid"));
        }
        return project;
    }

    public void closeproject(Project project, int userid) throws SQLException {
        Connection connection = Database.getConnection();
        int tag = 1;
        int row = 0;
        String sql = "INSERT INTO `closeproject`(`projectid`, `userid`, `reason`) VALUES (?,?,?)";
        String sql2 = "UPDATE `project` SET `isclosed`=? WHERE projectid=?";
//        String sql = "INSERT INTO `closeproject`(`userid`, `reason`, `display`) VALUES (?,?,?)";
        PreparedStatement preparedStatement = null;
        PreparedStatement preparedStatement2 = null;
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement2 = connection.prepareStatement(sql2);

        preparedStatement.setInt(1,project.getProjectid());
        preparedStatement.setInt(2, project.getUserid());
        preparedStatement.setString(3,project.getReason());
//        preparedStatement.setString(4,project.getDisplay());
        row = preparedStatement.executeUpdate();



        preparedStatement2.setInt(1,tag);
        preparedStatement2.setInt(2, project.getProjectid());
        preparedStatement2.executeUpdate();


    }



    public Project displayData(int projectid) throws SQLException {
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `closeproject` WHERE projectid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,projectid);
        ResultSet resultSet = null;
        resultSet = preparedStatement.executeQuery();
        Project project = new Project();

        while (resultSet.next()){
            project.setReason(resultSet.getString("reason"));
            project.setDisplay(resultSet.getString("display"));
            project.setProjectid(resultSet.getInt("projectid"));
        }
        return project;
    }

}
