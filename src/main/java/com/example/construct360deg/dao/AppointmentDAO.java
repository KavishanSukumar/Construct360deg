package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Appointment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AppointmentDAO {
    public boolean makeappointment(Appointment appointment) throws SQLException {
        Connection connection = Database.getConnection();
        String sql = "INSERT INTO `appointment`(`customerid`, `profid`, `time`, `date`, `caption`, `message`) VALUES (?,?,?,?,?,?)";
        PreparedStatement preparedStatement = null;
        int row = 0;
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,appointment.getCustomerid());
        preparedStatement.setInt(2,appointment.getProfid());
        preparedStatement.setString(3, appointment.getTime());
        preparedStatement.setString(4,appointment.getDate());
        preparedStatement.setString(5,appointment.getCaption());
        preparedStatement.setString(6,appointment.getMessage());
        row = preparedStatement.executeUpdate();



        if (row>0){
            return true;
        }else {
            return false;
        }

    }

}
