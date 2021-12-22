package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Advertise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdvertiseDAO {
    public boolean advertise(Advertise advertise) throws SQLException{
        Boolean status=false;
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        int row = 0;
        String addid= advertise.getAddid();
        String sql1 = "INSERT INTO `advertisement` (`submit_date`, `submit_time`, `userid`, `url`, `headline`, `description`, `image`) VALUES (?,?,?,?,?,?,?)";
        preparedStatement=connection.prepareStatement(sql1);
        preparedStatement.setDate(1,advertise.getTodaydate());
        preparedStatement.setTime(2,advertise.getNowtime());
        preparedStatement.setInt(3,advertise.getUserid());
        preparedStatement.setString(4,advertise.getWeburl());
        preparedStatement.setString(5,advertise.getHeadline());
        preparedStatement.setString(6,advertise.getDescription());
        preparedStatement.setBlob(7,advertise.getImg());
        row+=preparedStatement.executeUpdate();
        if (row>=1){
            status=true;
            System.out.println("All queries successfully updated");
        }else{
            status=false;
            System.out.println("Error");
        }
        return status;

    }
    public boolean acceptadvertise(Advertise acceptadvertise) throws SQLException{
        Boolean status=false;

//        Connection connection= Database.getConnection();
//        PreparedStatement preparedStatement=null;
       int row = 0;
//        String addid = acceptadvertise.getAddid();
//        String sql2 = "INSERT INTO `advertisement` (`addstatus`, `evaluated_date`) VALUES (?,?) where addid = ?;";
//        preparedStatement=connection.prepareStatement(sql2);
//        preparedStatement.setString(1,acceptadvertise.getAddstatus());
//        preparedStatement.setDate(2,acceptadvertise.getEvodate());
//        row+=preparedStatement.executeUpdate();
//        if (row>=1){
//            status=true;
//            System.out.println("All queries successfully updated");
//        }else{
//            status=false;
//            System.out.println("Error");
//        }
        Connection connection=Database.getConnection();
        String sql=null;

            sql="UPDATE `advertisement` SET `evaluated_date`=?, `addstatus`='accepted' WHERE ad_id=?";

        PreparedStatement preparedStatement=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setDate(1,acceptadvertise.getEvodate());
        preparedStatement.setString(2,acceptadvertise.getAddid());
        preparedStatement.executeUpdate();
        System.out.println("test me");

        row+=preparedStatement.executeUpdate();
        if (row>=1){
            status=true;
            System.out.println("All queries successfully updated");
        }else{
            status=false;
            System.out.println("Error");
        }
        return status;
    }
    public boolean rejecttadvertise(Advertise rejecttadvertise) throws SQLException{
        Boolean status=false;

//        Connection connection= Database.getConnection();
//        PreparedStatement preparedStatement=null;
        int row = 0;
//        String addid = acceptadvertise.getAddid();
//        String sql2 = "INSERT INTO `advertisement` (`addstatus`, `evaluated_date`) VALUES (?,?) where addid = ?;";
//        preparedStatement=connection.prepareStatement(sql2);
//        preparedStatement.setString(1,acceptadvertise.getAddstatus());
//        preparedStatement.setDate(2,acceptadvertise.getEvodate());
//        row+=preparedStatement.executeUpdate();
//        if (row>=1){
//            status=true;
//            System.out.println("All queries successfully updated");
//        }else{
//            status=false;
//            System.out.println("Error");
//        }
        Connection connection=Database.getConnection();
        String sql=null;

        sql="UPDATE `advertisement` SET `evaluated_date`=?, `addstatus`='rejected' WHERE ad_id=?";

        PreparedStatement preparedStatement=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setDate(1,rejecttadvertise.getEvodate());
        preparedStatement.setString(2,rejecttadvertise.getAddid());
        preparedStatement.executeUpdate();
        System.out.println("test me");

        row+=preparedStatement.executeUpdate();
        if (row>=1){
            status=true;
            System.out.println("All queries successfully updated");
        }else{
            status=false;
            System.out.println("Error");
        }
        return status;
    }



    public ArrayList<Advertise> retriveAdevertises() throws SQLException{
        ArrayList<Advertise> pendingadvertises = new ArrayList<>();
        Connection  connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        System.out.println("this is advertise dao");

        String sql = "SELECT * FROM `alladdsview`";
        ResultSet resultSet = null;
        preparedStatement= connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();


        while(resultSet.next()){

            Advertise advertise = new Advertise();
            advertise.setTodaydate(resultSet.getDate("submit_date"));
            advertise.setNowtime(resultSet.getTime("submit_time"));
            advertise.setUsername(resultSet.getString("username"));
            advertise.setRole(resultSet.getString("role"));
            advertise.setAddid(resultSet.getString("addid"));
            advertise.setImgblob(resultSet.getBlob("file"));
            pendingadvertises.add(advertise);
        }
        System.out.println("this is advertise dao 1.1");
        return pendingadvertises;

    }


    public ArrayList<Advertise> retreiveacceptadds() throws  SQLException{
        System.out.println("this is advertise dao 2");
        ArrayList<Advertise> acceptadds = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `allacceptadds`";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        System.out.println("this is advertise dao 2.1");
        while (resultSet.next()){
            System.out.println("this is advertise dao 2.2");
            Advertise acceptadd = new Advertise();
            acceptadd.setTodaydate(resultSet.getDate("submit_date"));
            acceptadd.setNowtime(resultSet.getTime("submit_time"));
            acceptadd.setUsername(resultSet.getString("username"));
            acceptadd.setRole(resultSet.getString("role"));
            acceptadd.setAddid(resultSet.getString("addid"));
            acceptadd.setImgblob(resultSet.getBlob("file"));
            System.out.println(resultSet.getBlob("file"));
            acceptadd.setEvodate(resultSet.getDate("evaluated_date"));
            acceptadds.add(acceptadd);
        }


        return acceptadds;
    }

    public ArrayList<Advertise> retreiverejectadds() throws  SQLException{
        ArrayList<Advertise> rejectadds = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `allrejectadds`";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            Advertise rejectadd = new Advertise();
            rejectadd.setTodaydate(resultSet.getDate("submit_date"));
            rejectadd.setNowtime(resultSet.getTime("submit_time"));
            rejectadd.setUsername(resultSet.getString("username"));
            rejectadd.setRole(resultSet.getString("role"));
            rejectadd.setAddid(resultSet.getString("addid"));
            rejectadd.setImgblob(resultSet.getBlob("file"));
            rejectadd.setEvodate(resultSet.getDate("evaluated_date"));
            rejectadds.add(rejectadd);
        }


        return rejectadds;
    }


}
