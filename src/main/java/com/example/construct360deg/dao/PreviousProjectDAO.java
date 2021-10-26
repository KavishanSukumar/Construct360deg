package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.PreviousProject;

import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Year;
import java.util.ArrayList;
import java.util.UUID;

public class PreviousProjectDAO {
    public boolean uploadPreviousProject(PreviousProject previousProject) throws SQLException {
        Boolean status=false;
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String projectid=previousProject.getProjectid();
        int row=0;
        String sql1="INSERT INTO `previousprojectdone`(`userid`, `projectid`) VALUES (?,?)";
        String sql2="INSERT INTO `preprojectimage`(`projectid`, `image`) VALUES (?,?)";
        String sql3="INSERT INTO `previousproject`(`projectid`, `customerfeedback`, `province`, `district`, `city`, `street`, `houseno`, `noofstars`,`builtyear`) VALUES (?,?,?,?,?,?,?,?,?)";
        String sql4="INSERT INTO `previousprojectcontno`(`projectid`, `referancecontactno`, `referenceemail`, `referencename`) VALUES (?,?,?,?)";

        preparedStatement=connection.prepareStatement(sql1);
        preparedStatement.setInt(1,previousProject.getUserid());
        preparedStatement.setString(2,projectid);
        row=+preparedStatement.executeUpdate();

        preparedStatement=connection.prepareStatement(sql2);
        preparedStatement.setString(1,projectid);
        preparedStatement.setBlob(2,previousProject.getImage());
        row+=preparedStatement.executeUpdate();


        preparedStatement=connection.prepareStatement(sql3);
        preparedStatement.setString(1,projectid);
        preparedStatement.setString(2,previousProject.getCustomerfeedback());
        preparedStatement.setString(3,previousProject.getProvince());
        preparedStatement.setString(4,previousProject.getDistrict());
        preparedStatement.setString(5,previousProject.getCity());
        preparedStatement.setString(6,previousProject.getStreet());
        preparedStatement.setString(7,previousProject.getHouseno());
        preparedStatement.setInt(8,previousProject.getNoofstars());
        preparedStatement.setString(9,previousProject.getBuiltYear());
        row+=preparedStatement.executeUpdate();

        preparedStatement=connection.prepareStatement(sql4);
        preparedStatement.setString(1,projectid);
        preparedStatement.setString(2,previousProject.getReferancecontactno());
        preparedStatement.setString(3,previousProject.getReferenceemail());
        preparedStatement.setString(4,previousProject.getReferencename());
        row+=preparedStatement.executeUpdate();
        if (row>=4){
            status=true;
            System.out.println("All queries successfully updated");
        }
        return status;
    }

    public ArrayList<PreviousProject> getAllPreviousProjects(int userid) throws SQLException {
        ArrayList<PreviousProject> previousProjects=new ArrayList<>();
        String sql="SELECT * FROM `allpreviousprojectsview` WHERE userid=?";
        PreparedStatement preparedStatement=null;
        Connection connection=Database.getConnection();
        ResultSet resultSet=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            PreviousProject previousProject=new PreviousProject();
            previousProject.setProjectid(resultSet.getString("projectid"));
            previousProject.setUserid(userid);
            previousProject.setCustomerfeedback(resultSet.getString("customerfeedback"));
            previousProject.setProvince(resultSet.getString("province"));
            previousProject.setDistrict(resultSet.getString("district"));
            previousProject.setCity(resultSet.getString("city"));
            previousProject.setStreet(resultSet.getString("street"));
            previousProject.setHouseno(resultSet.getString("houseno"));
            previousProject.setNoofstars(resultSet.getInt("noofstars"));
            previousProject.setImageid(resultSet.getInt("imageid"));
            previousProject.setReferancecontactno(resultSet.getString("referancecontactno"));
            previousProject.setReferenceemail(resultSet.getString("referenceemail"));
            previousProject.setReferencename(resultSet.getString("referencename"));
            previousProject.setImgBytes(resultSet.getBytes("image"));
            previousProject.setBuiltYear(resultSet.getString("builtyear"));
            previousProjects.add(previousProject);
        }
        return previousProjects;
    }
}
/*
CREATE VIEW allpreviousprojects AS
SELECT previousprojectdone.userid,
previousprojectdone.projectid,
previousprojectcontno.referancecontactno,
previousprojectcontno.referenceemail,
previousprojectcontno.referencename,
previousproject.customerfeedback,
previousproject.province,
previousproject.district,
previousproject.city,
previousproject.street,
previousproject.houseno,
previousproject.noofstars,
previousproject.builtyear,
preprojectimage.imageid,
preprojectimage.image
FROM previousprojectdone, previousprojectcontno,previousproject,preprojectimage
WHERE previousprojectdone.projectid=previousprojectcontno.projectid AND previousprojectdone.projectid=previousproject.projectid
AND previousprojectdone.projectid=preprojectimage.projectid;
 */