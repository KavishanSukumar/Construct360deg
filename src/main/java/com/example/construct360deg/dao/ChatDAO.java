package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ChatDAO {

    public void createachat(){

    }

    public void sendMessage(Chat chat) throws SQLException {
        Connection connection= Database.getConnection();
        String sql="INSERT INTO `chat`(`sender`, `projectid`, `datetime`, `message`) VALUES (?,?,?,?)";
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
    public ArrayList<Chat> viewMessage(int sender, int receiver) throws SQLException {
        ArrayList<Chat> chats=new ArrayList<>();
        Connection connection=Database.getConnection();
        String sql="SELECT * FROM `chat` WHERE projectid=? ORDER BY datetime ASC";
        PreparedStatement preparedStatement=null;
        ResultSet resultSet;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,receiver);
        resultSet=preparedStatement.executeQuery();
        while (resultSet.next()){
            Chat chat=new Chat();
            chat.setSender(resultSet.getInt("sender"));
            chat.setReceiver(resultSet.getInt("projectid"));
            chat.setMessage(resultSet.getString("message"));
            chat.setDatetime(resultSet.getString("datetime"));
            chats.add(chat);
        }

        return chats;
    }

//    public ArrayList<Chat> ViewChats(int sender) throws SQLException {
//        ArrayList<Chat> chats=new ArrayList<>();
//        String sql="SELECT * FROM mychats WHERE sender=? OR receiver=?";
//        Connection connection=Database.getConnection();
//        PreparedStatement preparedStatement=null;
//        ResultSet resultSet;
//        preparedStatement=connection.prepareStatement(sql);
//        preparedStatement.setInt(1,sender);
//        preparedStatement.setInt(2,sender);
//        resultSet=preparedStatement.executeQuery();
//
//        while (resultSet.next()){
//            Chat chat=new Chat();
//            chat.setSender(resultSet.getInt("sender"));
//            chat.setReceiver(resultSet.getInt("receiver"));
//            chat.setCustomerindividualName(resultSet.getString("customerindividualName"));
//            chat.setCustomercomname(resultSet.getString("customercomname"));
//            chat.setIndividualprof(resultSet.getString("individualprof"));
//            chat.setProfessionalname(resultSet.getString("professionalname"));
//            chats.add(chat);
//        }
//        return chats;
//    }

}

/*
DROP VIEW mychats;
CREATE view mychats AS
SELECT DISTINCT chat.sender AS 'sender',chat.receiver AS 'receiver', CONCAT(customerindividual.firstname," ",customerindividual.lastname) AS 'customerindividualName',
customercompany.companyname AS 'customercomname', CONCAT(individualprof.firstname," ",individualprof.lastname) AS 'individualprof',companyprof.companyname AS
'professionalname'
FROM ((((chat LEFT JOIN customerindividual ON(chat.receiver=customerindividual.userid))LEFT JOIN customercompany ON (chat.receiver=customercompany.userid)) LEFT JOIN individualprof ON (chat.receiver=individualprof.userid))
LEFT JOIN companyprof ON (chat.receiver=companyprof.userid) ) GROUP BY chat.receiver;
 */