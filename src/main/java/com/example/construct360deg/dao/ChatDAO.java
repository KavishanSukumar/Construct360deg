package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ChatDAO {
    public void sendMessage(Chat chat) throws SQLException {
        Connection connection= Database.getConnection();
        String sql="INSERT INTO `chat`(`sender`, `receiver`, `datetime`, `message`) VALUES (?,?,?,?)";
        PreparedStatement preparedStatement=null;


        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,chat.getSender());
        preparedStatement.setInt(2,chat.getReceiver());
        preparedStatement.setString(3,chat.getDatetime());
        preparedStatement.setString(4,chat.getMessage());
        preparedStatement.executeUpdate();

//        String sql2="INSERT INTO `chat`(`receiver`,`sender`,  `datetime`, `message`, `mode`) VALUES (?,?,?,?,?)";
//        PreparedStatement preparedStatement2=null;
//        preparedStatement2=connection.prepareStatement(sql2);
//        preparedStatement2.setInt(1,chat.getSender());
//        preparedStatement2.setInt(2,chat.getReceiver());
//        preparedStatement2.setString(3,chat.getDatetime());
//        preparedStatement2.setString(4,chat.getMessage());
//        preparedStatement2.setInt(5,0);
//        preparedStatement2.executeUpdate();
    }
    public ArrayList<Chat> viewMessage(int sender) throws SQLException {
        ArrayList<Chat> chats=new ArrayList<>();
        Connection connection=Database.getConnection();
        String sql="SELECT * FROM `chat` WHERE sender=? OR receiver=?";
        PreparedStatement preparedStatement=null;
        ResultSet resultSet;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,sender);
        preparedStatement.setInt(2,sender);
        resultSet=preparedStatement.executeQuery();
        while (resultSet.next()){
            Chat chat=new Chat();
            chat.setSender(resultSet.getInt("sender"));
            chat.setReceiver(resultSet.getInt("receiver"));
            chat.setMessage(resultSet.getString("message"));
            chat.setDatetime(resultSet.getString("datetime"));
            chats.add(chat);
        }

        return chats;
    }
}
