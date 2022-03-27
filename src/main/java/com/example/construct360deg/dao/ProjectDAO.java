package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProjectDAO {
    public boolean uploadPayemnt(Payment payment) throws SQLException {
        String sql="INSERT INTO `uploadpayments`(`projectid`, `paymentName`, `paymentdatetime`, `image`) VALUES (?,?,?,?)";
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        int row=0;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,payment.getProjectid());
        preparedStatement.setString(2,payment.getPaymentName());
        preparedStatement.setString(3,payment.getPaymentdatetime());
        preparedStatement.setBlob(4,payment.getImage());
        row=preparedStatement.executeUpdate();
        if (row>0){
            return true;
        }else {
            return false;
        }
    }
    public ArrayList<Payment> getAllpayment(int projectid) throws SQLException {
        ArrayList<Payment> payments=new ArrayList<>();
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        String sql="SELECT * FROM `uploadpayments` WHERE `projectid`=?";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,projectid);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            Payment payment=new Payment();
            payment.setProjectid(resultSet.getInt("paymentid"));
            payment.setPaymentid(resultSet.getInt("projectid"));
            payment.setPaymentName(resultSet.getString("paymentName"));
            payment.setPaymentdatetime(resultSet.getString("paymentdatetime"));
            payment.setImagebyte(resultSet.getBytes("image"));
            payments.add(payment);
        }

        return payments;
    }
}
