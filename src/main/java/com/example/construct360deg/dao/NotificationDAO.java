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
        String  sql1="UPDATE `notification` SET status=1 WHERE notifiyeeid=?";
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
        preparedStatement=connection.prepareStatement(sql1);
        preparedStatement.setInt(1,userid);
        preparedStatement.executeUpdate();

        return notifications;
    }

    public int getInstanceNotification(int userid) throws SQLException {
       int number=0;
       ResultSet resultSet=null;
       String sql="SELECT COUNT(*) AS count FROM `notification` WHERE notifiyeeid=? AND status=0";
       Connection connection=Database.getConnection();
       PreparedStatement preparedStatement=connection.prepareStatement(sql);
       preparedStatement.setInt(1,userid);
        resultSet=preparedStatement.executeQuery();
        while (resultSet.next()){
            number=resultSet.getInt("count");
        }
       return number;
    }
}
