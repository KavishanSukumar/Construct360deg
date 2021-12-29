package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProjectDAO {
    public boolean uploadPayemnt(Payment payment) throws SQLException {
        String sql="INSERT INTO `uploadpayments`(`projectid`, `paymentName`, `paymentdatetime`, `payee`, `payer`, `image`) VALUES (?,?,?,?,?,?)";
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        int row=0;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,payment.getProjectid());
        preparedStatement.setString(2,payment.getPaymentName());
        preparedStatement.setString(3,payment.getPaymentdatetime());
        preparedStatement.setInt(4,payment.getPayee());
        preparedStatement.setInt(5,payment.getPayer());
        preparedStatement.setBlob(6,payment.getImage());
        row=preparedStatement.executeUpdate();
        if (row>0){
            return true;
        }else {
            return false;
        }
    }
}
