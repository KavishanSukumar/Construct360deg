package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class PaySubDAO {
    public void updatepaymentstatus(int userid,int status) throws SQLException {
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql=null;
        String subtype=null;
        int value=0;
        ResultSet resultSet=null;
        int paymentref=0;

        if (status==1){
            subtype="Monthly";
            value= 500;
        }else if (status==2){
            subtype="Annual";
            value= 5000;
        }else if (status==3){
            subtype="Basic";
            value= 0;
        }

        java.util.Date date = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        java.sql.Time sqlTime = new java.sql.Time(date.getTime());

        sql="SELECT `paymentref` FROM `subscriptionpayment` WHERE `userid`=?";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            paymentref=resultSet.getInt("paymentref");
        }
        if (paymentref==0){
            sql="INSERT INTO `subscriptionpayment`(`datetime`, `amount`, `userid`, `subtype`) VALUES (?,?,?,?)";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,sqlDate + " " + sqlTime);
            preparedStatement.setInt(2,value);
            preparedStatement.setInt(3,userid);
            preparedStatement.setString(4,subtype);
            preparedStatement.executeUpdate();
        }else {
            sql="UPDATE `subscriptionpayment` SET `datetime`=?,`amount`=?,`userid`=?,`subtype`=? WHERE `paymentref`=?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,sqlDate + " " + sqlTime);
            preparedStatement.setFloat(2,value);
            preparedStatement.setInt(3,userid);
            preparedStatement.setString(4,subtype);
            preparedStatement.setInt(5,paymentref);
            preparedStatement.executeUpdate();
        }

    }
    public String getThesubtype(int userid) throws SQLException {
        String status=null;
        String sql="SELECT `subtype` FROM `subscriptionpayment` WHERE `userid`=?";
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            status=resultSet.getString("subtype");
        }
        return status;
    }
}
