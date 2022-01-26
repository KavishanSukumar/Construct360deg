package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Appointment;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

    public ArrayList<Appointment> retriveAppointments(int userid) throws SQLException{
        ArrayList<Appointment> appointments = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `appointment` WHERE profid=?";
        ResultSet resultSet = null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            Appointment appointment = new Appointment();
            appointment.setAppoinmentid(resultSet.getInt("appoinmentid"));
            appointment.setCustomerid(resultSet.getInt("customerid"));
            appointment.setProfid(resultSet.getInt("profid"));
            appointment.setTime(resultSet.getString("time"));
            appointment.setDate(resultSet.getString("date"));
            appointment.setCaption(resultSet.getString("caption"));
            appointment.setMessage(resultSet.getString("message"));
            appointment.setAppointmentstatus(resultSet.getString("appointmentstatus"));
//            appointment.setCus_name(resultSet.getString("cus_name"));
//            appointment.setUser_role(resultSet.getString("user_role"));
            appointments.add(appointment);
        }
        return appointments;
    }

    public void Appointmentstatus(int appoinmentid,int task) throws SQLException {
        Connection connection=Database.getConnection();
        String sql=null;
        if(task==1){
            sql="UPDATE `appointment` SET `appointmentstatus`='Confirmed' WHERE appoinmentid=?";
        }
        else if (task==0){
            sql="UPDATE `appointment` SET `appointmentstatus`='Rejected' WHERE appoinmentid=?";
        }
        PreparedStatement preparedStatement=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,appoinmentid);
        preparedStatement.executeUpdate();
        System.out.println("test me");
    }

}
