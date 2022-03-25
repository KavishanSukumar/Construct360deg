package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.AllUserdocs;
import com.example.construct360deg.model.Requirement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
