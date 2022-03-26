package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.AllUserdocs;
import com.example.construct360deg.model.Requirement;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class AllUserdocsDAO {
    public void uploadUserDocs(AllUserdocs allUserdocs) throws SQLException {

        Boolean status=false;
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="INSERT INTO `userdocs`(`doc_id`, `userid`, `user_role`, `doc_name`, `document`, `verified`, `uploaded_date`) VALUES (?,?,?,?,?,?,?)";

        int row;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1, allUserdocs.getDoc_id());
        preparedStatement.setInt(2,allUserdocs.getUserid());
        preparedStatement.setString(3,allUserdocs.getUser_role());
        preparedStatement.setString(4,allUserdocs.getDoc_name());
        preparedStatement.setBlob(5,allUserdocs.getDocumentfile());
        preparedStatement.setInt(6,allUserdocs.getVerified());
        preparedStatement.setDate(7,allUserdocs.getUploaded_date());



        row=preparedStatement.executeUpdate();
        if (row>=1){
            status=true;
            System.out.println("file successfully updated");
        }else{
            status=false;
            System.out.println("Error");
        }

    }
    public ArrayList<AllUserdocs> getAlldocs() throws SQLException {
        ArrayList<AllUserdocs> allUserdocs=new ArrayList<>();
        String sql="SELECT `doc_id`, `userid`, `user_role`, `doc_name`, `document`, `verified`, `uploaded_date`, `tag` FROM `userdocs` ORDER BY `doc_id` DESC";
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        preparedStatement=connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            AllUserdocs allUserdocs1=new AllUserdocs();
            allUserdocs1.setDoc_id(resultSet.getInt("doc_id"));
            allUserdocs1.setUserid(resultSet.getInt("userid"));
            allUserdocs1.setUser_role(resultSet.getString("user_role"));
            allUserdocs1.setDoc_name(resultSet.getString("doc_name"));
            allUserdocs1.setDocument(resultSet.getBytes("document"));
            allUserdocs1.setVerified(resultSet.getInt("verified"));
            allUserdocs1.setUploaded_date(resultSet.getDate("uploaded_date"));
            allUserdocs1.setTag(resultSet.getInt("tag"));
            allUserdocs.add(allUserdocs1);
        }


        return allUserdocs;
    }

    public void verifydocument(int task,int docid) throws SQLException {
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql=null;
        if (task==1){
            sql="UPDATE `userdocs` SET `verified`=?,`tag`=? WHERE `doc_id`=?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,1);
            preparedStatement.setInt(2,1);
            preparedStatement.setInt(3,docid);
            preparedStatement.executeUpdate();
        }else {
            sql="UPDATE `userdocs` SET `verified`=?,`tag`=? WHERE `doc_id`=?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,0);
            preparedStatement.setInt(2,1);
            preparedStatement.setInt(3,docid);
            preparedStatement.executeUpdate();
        }

    }
}
