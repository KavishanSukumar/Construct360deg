package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Notification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NotificationDAO {
    public ArrayList<Notification> getNotifications(int userid) throws SQLException {
        ArrayList<Notification> notifications= new ArrayList<>();
        String sql="SELECT * FROM `notification` WHERE notifiyeeid=? ORDER BY datetime DESC";
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            Notification notification=new Notification();
            notification.setNotificationid(resultSet.getInt("notificationid"));
            notification.setNotifiyeeid(resultSet.getInt("notifiyeeid"));
            notification.setNotifierid(resultSet.getInt("notifierid"));
            notification.setNotificationtype(resultSet.getString("notificationtype"));
            notification.setNotificationmessage(resultSet.getString("notificationmessage"));
            notification.setDatetime(resultSet.getString("datetime"));
            notifications.add(notification);
        }
        return notifications;
    }
}
