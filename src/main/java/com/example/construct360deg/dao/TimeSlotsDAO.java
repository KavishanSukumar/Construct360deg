package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Advertise;
import com.example.construct360deg.model.Complain;
import com.example.construct360deg.model.Requirement;
import com.example.construct360deg.model.TimeSlots;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class TimeSlotsDAO {
    public void updatetimeslots(int profid,String date, String[] active_slots) throws SQLException {

        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql1="INSERT INTO `profavailabletimeslots` (`profid`, `date`, `slotid`) VALUES (?, ?, ?)";
        String sql2="Delete from `profavailabletimeslots` where date=?";
        int row = 0;

        preparedStatement = connection.prepareStatement(sql2);
        preparedStatement.setString(1,date);
        row = preparedStatement.executeUpdate();

        preparedStatement = connection.prepareStatement(sql1);

        for (int i =0; i< active_slots.length;i++ ){
            preparedStatement.setInt(1,profid);
            preparedStatement.setString(2,date);
            preparedStatement.setInt(3, Integer.parseInt(active_slots[i]));
            row=preparedStatement.executeUpdate();
        }

        if (row>=1){

            System.out.println("uploadRequirementToChooseProf method in requirementDAO All queries successfully updated");
        }else{

            System.out.println("Error in uploadRequirementToChooseProf method in requirementDAO");
        }

    }

    public ArrayList<TimeSlots> getSlotsForProfessional(int profid) throws SQLException {
        ArrayList<TimeSlots> timeSlots = new ArrayList<>();
        ArrayList<HashMap<String,Object>> slots=new ArrayList<>();

        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql="SELECT * FROM `profavailabletimeslots` where profid=?";
        ResultSet resultSet=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,profid);

        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
          TimeSlots timeSlot = new TimeSlots();
          timeSlot.setSlotid(resultSet.getInt("slotid"));
          timeSlot.setProfid(resultSet.getInt("profid"));
          timeSlot.setDate(resultSet.getDate("date"));
          timeSlot.setTag(resultSet.getInt("iscustomerbooked"));
          timeSlots.add(timeSlot);


        }
       return timeSlots;

    }


}
