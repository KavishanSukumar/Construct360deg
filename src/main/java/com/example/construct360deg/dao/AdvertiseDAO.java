package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Advertise;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
public class AdvertiseDAO {
    public boolean advertise(Advertise advertise) throws SQLException{
        Boolean status=false;
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        int row = 0;
        String addid= advertise.getAddid();
        String sql1 = "INSERT INTO `advertisement` (`submit_date`, `submit_time`, `userid`, `url`, `headline`, `description`, `image`) VALUES (?,?,?,?,?,?,?)";
        preparedStatement=connection.prepareStatement(sql1);
        preparedStatement.setDate(1,advertise.getTodaydate());
        preparedStatement.setTime(2,advertise.getNowtime());
        preparedStatement.setInt(3,advertise.getUserid());
        preparedStatement.setString(4,advertise.getWeburl());
        preparedStatement.setString(5,advertise.getHeadline());
        preparedStatement.setString(6,advertise.getDescription());
        preparedStatement.setBlob(7,advertise.getImg());
        row+=preparedStatement.executeUpdate();
        if (row>=1){
            status=true;
            System.out.println("All queries successfully updated");
        }else{
            status=false;
            System.out.println("Error");
        }
        return status;

    }
    public boolean acceptadvertise(Advertise acceptadvertise) throws SQLException{
        Boolean status=false;

//        Connection connection= Database.getConnection();
//        PreparedStatement preparedStatement=null;
       int row = 0;
//        String addid = acceptadvertise.getAddid();
//        String sql2 = "INSERT INTO `advertisement` (`addstatus`, `evaluated_date`) VALUES (?,?) where addid = ?;";
//        preparedStatement=connection.prepareStatement(sql2);
//        preparedStatement.setString(1,acceptadvertise.getAddstatus());
//        preparedStatement.setDate(2,acceptadvertise.getEvodate());
//        row+=preparedStatement.executeUpdate();
//        if (row>=1){
//            status=true;
//            System.out.println("All queries successfully updated");
//        }else{
//            status=false;
//            System.out.println("Error");
//        }
        Connection connection=Database.getConnection();
        String sql=null;

            sql="UPDATE `advertisement` SET `evaluated_date`=?, `addstatus`='accepted' WHERE ad_id=?";

        PreparedStatement preparedStatement=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setDate(1,acceptadvertise.getEvodate());
        preparedStatement.setString(2,acceptadvertise.getAddid());
        preparedStatement.executeUpdate();
        System.out.println("test me");

        row+=preparedStatement.executeUpdate();
        if (row>=1){
            status=true;
            System.out.println("All queries successfully updated");
        }else{
            status=false;
            System.out.println("Error");
        }
        return status;
    }
    public boolean rejecttadvertise(Advertise rejecttadvertise) throws SQLException{
        Boolean status=false;

//        Connection connection= Database.getConnection();
//        PreparedStatement preparedStatement=null;
        int row = 0;
//        String addid = acceptadvertise.getAddid();
//        String sql2 = "INSERT INTO `advertisement` (`addstatus`, `evaluated_date`) VALUES (?,?) where addid = ?;";
//        preparedStatement=connection.prepareStatement(sql2);
//        preparedStatement.setString(1,acceptadvertise.getAddstatus());
//        preparedStatement.setDate(2,acceptadvertise.getEvodate());
//        row+=preparedStatement.executeUpdate();
//        if (row>=1){
//            status=true;
//            System.out.println("All queries successfully updated");
//        }else{
//            status=false;
//            System.out.println("Error");
//        }
        Connection connection=Database.getConnection();
        String sql=null;

        sql="UPDATE `advertisement` SET `evaluated_date`=?, `addstatus`='rejected' WHERE ad_id=?";

        PreparedStatement preparedStatement=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setDate(1,rejecttadvertise.getEvodate());
        preparedStatement.setString(2,rejecttadvertise.getAddid());
        preparedStatement.executeUpdate();
        System.out.println("test me");

        row+=preparedStatement.executeUpdate();
        if (row>=1){
            status=true;
            System.out.println("All queries successfully updated");
        }else{
            status=false;
            System.out.println("Error");
        }
        return status;
    }

    public void deleteadvertise(int addid) throws SQLException{
        int row = 0;
        Connection connection=Database.getConnection();
        String sql="DELETE FROM `advertisement` WHERE ad_id=?";
        PreparedStatement preparedStatement=null;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,addid);
        preparedStatement.executeUpdate();
        System.out.println("test me");
        row+=preparedStatement.executeUpdate();
        if (row>=1){

            System.out.println("All queries successfully updated");
        }else{

            System.out.println("Error");
        }
    }

    public ArrayList<Advertise> retriveAdevertises(String searchinput,String activityfrom,String activityTo) throws SQLException{
        ArrayList<Advertise> pendingadvertises = new ArrayList<>();
        Connection  connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        System.out.println("this is retriveAdevertises function in  Adevertisedao");
        System.out.println(searchinput);
        String sql = null;
        System.out.println("----------activityfrom--------------");
        System.out.println(activityfrom);
        System.out.println("---------activityTo----------------");
        System.out.println(activityTo);

//        Date from = new SimpleDateFormat("dd-MMM-yyyy").parse(activityfrom);



        if((activityfrom!="" && activityfrom!=null) && (activityTo!="" && activityTo!=null)){
            System.out.println("addver 1");
            if(searchinput=="" || searchinput==null){
                System.out.println("addver 2");
                sql = "SELECT * FROM `alladdsview` WHERE isproduct=0 and submit_date >= CAST('"+ activityfrom + "' AS date )   AND submit_date <= CAST('"+activityTo+"' AS date )";
                System.out.println(sql);
            }else {
                sql = "SELECT * FROM `alladdsview` WHERE  isproduct=0 and submit_date >= CAST('"+ activityfrom + "' AS date )   AND submit_date <= CAST('"+activityTo+"' AS date )" +
                        "AND (submit_time like '%" + searchinput + "%' OR CONVERT(username, CHAR(30)) like '%" + searchinput + "%'" +
                        "OR CONVERT(role, CHAR(30)) like '%" + searchinput + "%' OR CONVERT(addid, CHAR(30)) like '%" + searchinput + "%')";
                System.out.println("addver 3");
            }
        }else{
            if(searchinput=="" || searchinput==null){
                sql = "SELECT * FROM `alladdsview` where isproduct=0";
                System.out.println("addver 4");
            }else{
                sql = "SELECT * FROM `alladdsview` WHERE   isproduct=0 and  " +"CONVERT(submit_time, CHAR(30)) like '%"+searchinput+"%' OR CONVERT(username, CHAR(30)) like '%"+searchinput+"%'" +
                        "OR CONVERT(role, CHAR(30)) like '%"+searchinput+"%' OR CONVERT(addid, CHAR(30)) like '%"+searchinput+"%'";
                System.out.println("addver 5");
            }

        }

        ResultSet resultSet = null;
        preparedStatement= connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();


        while(resultSet.next()){

            Advertise advertise = new Advertise();
            advertise.setTodaydate(resultSet.getDate("submit_date"));
            advertise.setNowtime(resultSet.getTime("submit_time"));
            advertise.setUsername(resultSet.getString("username"));
            advertise.setRole(resultSet.getString("role"));
            advertise.setAddid(resultSet.getString("addid"));
            byte[] img = resultSet.getBytes("file");
            advertise.setAddimg(img);
            advertise.setImgblob(resultSet.getBlob("file"));
            pendingadvertises.add(advertise);
        }
        System.out.println("this is advertise dao 1.1");
        return pendingadvertises;

    }


    public ArrayList<Advertise> retreiveacceptadds(String searchinput,String activityfrom,String activityTo) throws  SQLException{
        System.out.println("this is advertise dao 2");
        ArrayList<Advertise> acceptadds = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;

        String sql = null;
        if((activityfrom!="" && activityfrom!=null) && (activityTo!="" && activityTo!=null)){

            if(searchinput=="" || searchinput==null){

                sql = "SELECT * FROM `allacceptadds` WHERE  evaluated_date >= CAST('"+ activityfrom + "' AS date )   AND evaluated_date <= CAST('"+ activityTo + "' AS date )";
                System.out.println("ooo ");
                System.out.println(sql);
            }else {
                sql = "SELECT * FROM `allacceptadds` WHERE  evaluated_date >= CAST('"+ activityfrom + "' AS date )   AND evaluated_date <= CAST('"+ activityTo + "' AS date ) " +
                        "AND (submit_time like '%" + searchinput + "%' OR CONVERT(username, CHAR(30)) like '%" + searchinput + "%'" +
                        "OR CONVERT(role, CHAR(30)) like '%" + searchinput + "%' OR CONVERT(addid, CHAR(30)) like '%" + searchinput + "%')";
                System.out.println("ooo ooo ");
            }
        }else{
            if(searchinput=="" || searchinput==null){
                sql = "SELECT * FROM `allacceptadds`";
                System.out.println("ooo ooo ooo ");
            }else{
                sql = "SELECT * FROM `allacceptadds` WHERE  " + " CONVERT(submit_time, CHAR(30)) like '%"+searchinput+"%' OR CONVERT(username, CHAR(30)) like '%"+searchinput+"%'" +
                        "OR CONVERT(role, CHAR(30)) like '%"+searchinput+"%' OR CONVERT(addid, CHAR(30)) like '%"+searchinput+"%'";
                System.out.println("ooo ooo ooo ooo");
            }

        }
//        submit_date	 submit_time	 username	 role	 addid	 file	 evaluated_date
//        sql = "SELECT * FROM `allacceptadds`";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        System.out.println("this is advertise dao 2.1");
        while (resultSet.next()){
            System.out.println("this is advertise dao 2.2");
            Advertise acceptadd = new Advertise();
            acceptadd.setTodaydate(resultSet.getDate("submit_date"));
            acceptadd.setNowtime(resultSet.getTime("submit_time"));
            acceptadd.setUsername(resultSet.getString("username"));
            acceptadd.setRole(resultSet.getString("role"));
            acceptadd.setAddid(resultSet.getString("addid"));
            acceptadd.setImgblob(resultSet.getBlob("file"));
            System.out.println(resultSet.getBlob("file"));
            byte[] img = resultSet.getBytes("file");
            acceptadd.setAddimg(img);
            acceptadd.setEvodate(resultSet.getDate("evaluated_date"));
            acceptadds.add(acceptadd);
        }


        return acceptadds;
    }

    public ArrayList<Advertise> retreiverejectadds(String searchinput,String activityfrom,String activityTo) throws  SQLException{
        ArrayList<Advertise> rejectadds = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = null;
        if((activityfrom!="" && activityfrom!=null) && (activityTo!="" && activityTo!=null)){

            if(searchinput=="" || searchinput==null){

                sql = "SELECT * FROM `allrejectadds` WHERE  evaluated_date >= CAST('"+ activityfrom + "' AS date )   AND evaluated_date <= CAST('"+ activityTo + "' AS date )";
                System.out.println("333");
                System.out.println(sql);
            }else {
                sql = "SELECT * FROM `allrejectadds` WHERE  evaluated_date >= CAST('"+ activityfrom + "' AS date )   AND evaluated_date <= CAST('"+ activityTo + "' AS date ) " +
                        "AND (submit_time like '%" + searchinput + "%' OR CONVERT(username, CHAR(30)) like '%" + searchinput + "%'" +
                        "OR CONVERT(role, CHAR(30)) like '%" + searchinput + "%' OR CONVERT(addid, CHAR(30)) like '%" + searchinput + "%')";
                System.out.println("333 333 ");
            }
        }else{
            if(searchinput=="" || searchinput==null){
                sql = "SELECT * FROM `allrejectadds`";
                System.out.println("333 333 333 ");
            }else{
                sql = "SELECT * FROM `allrejectadds` WHERE  " + " CONVERT(submit_time, CHAR(30)) like '%"+searchinput+"%' OR CONVERT(username, CHAR(30)) like '%"+searchinput+"%'" +
                        "OR CONVERT(role, CHAR(30)) like '%"+searchinput+"%' OR CONVERT(addid, CHAR(30)) like '%"+searchinput+"%'";
                System.out.println("333 333 333 333");
            }

        }

        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            Advertise rejectadd = new Advertise();
            rejectadd.setTodaydate(resultSet.getDate("submit_date"));
            rejectadd.setNowtime(resultSet.getTime("submit_time"));
            rejectadd.setUsername(resultSet.getString("username"));
            rejectadd.setRole(resultSet.getString("role"));
            rejectadd.setAddid(resultSet.getString("addid"));
            rejectadd.setImgblob(resultSet.getBlob("file"));
            byte[] img = resultSet.getBytes("file");
            rejectadd.setAddimg(img);
            rejectadd.setEvodate(resultSet.getDate("evaluated_date"));
            rejectadds.add(rejectadd);
        }


        return rejectadds;
    }

    public ArrayList<Advertise> displayadds() throws SQLException {
        ArrayList<Advertise> displayadds = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `displayadds` ORDER BY `submit_date` DESC";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        System.out.println("hello 1");
        while(resultSet.next()){
            Advertise displayadd = new Advertise();
            displayadd.setUserid(resultSet.getInt("userid"));
            displayadd.setAddid(resultSet.getString("ad_id"));
            displayadd.setAddstatus(resultSet.getString("ad_status"));
            displayadd.setWeburl(resultSet.getString("ad_url"));
            displayadd.setHeadline(resultSet.getString("ad_topic"));
            displayadd.setUsername(resultSet.getString("username"));
            displayadd.setPrice(resultSet.getFloat("price"));
            byte[] img1=resultSet.getBytes("profilepic");
            displayadd.setProfimg(img1);
            byte[] img2=resultSet.getBytes("ad_img");
            displayadd.setAddimg(img2);
            displayadds.add(displayadd);
            displayadd.setDescription(resultSet.getString("description"));
            displayadd.setNowtime(resultSet.getTime("submit_time"));
            displayadd.setTodaydate(resultSet.getDate("submit_date"));
            displayadd.setIsproduct(resultSet.getInt("isproduct"));
        }
        System.out.println("hello 2");
     return displayadds;

    }

    public ArrayList<Advertise> displayownadds(int userid) throws SQLException {
        ArrayList<Advertise> displayadds = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `advertisement` WHERE `userid` = ?";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        resultSet = preparedStatement.executeQuery();
        System.out.println("displayownadds(prof)1");
        while (resultSet.next()) {
            Advertise displayadd = new Advertise();
            displayadd.setUserid(resultSet.getInt("userid"));
            displayadd.setAddid(resultSet.getString("ad_id"));
            displayadd.setAddstatus(resultSet.getString("addstatus"));
            displayadd.setWeburl(resultSet.getString("url"));
            displayadd.setHeadline(resultSet.getString("headline"));
            displayadd.setDescription(resultSet.getString("description"));
            displayadd.setTodaydate(resultSet.getDate("submit_date"));
            displayadd.setNowtime(resultSet.getTime("submit_time"));
            displayadd.setEvodate(resultSet.getDate("evaluated_date"));

            byte[] img = resultSet.getBytes("image");
            displayadd.setAddimg(img);
            System.out.println(img);
            displayadds.add(displayadd);
        }
        System.out.println("displayownadds(prof) 2");
        return displayadds;
    }

    public void sendproducttoaddtable(Advertise advertise) throws SQLException {
         String sql1 = "select * from product where productid = ?";
        PreparedStatement preparedStatement = null;
        Connection connection = Database.getConnection();
        preparedStatement = connection.prepareStatement(sql1);
        preparedStatement.setInt(1,advertise.getProductid());
        ResultSet resultSet = null;
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            advertise.setImgblob(resultSet.getBlob("productimage"));
            advertise.setPrice(resultSet.getFloat("productprice"));
            advertise.setDescription(resultSet.getString("productdes"));
        }
        System.out.println("this is send product add dao === "+advertise.getProductid()+" "+advertise.getTodaydate()+" "+advertise.getNowtime());
        System.out.println("this is send product add dao === "+advertise.getPrice()+" "+advertise.getDescription()+" "+advertise.getImgblob());
      String sql2 = "INSERT INTO `advertisement` (`submit_date`, `submit_time`, `userid`,  `description`,  `isproduct`, `price`,`image`,`addstatus`) " +
                     "VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement2 = null;

        preparedStatement2 =connection.prepareStatement(sql2);
        preparedStatement2.setDate(1,advertise.getTodaydate());
        preparedStatement2.setTime(2,advertise.getNowtime());
        preparedStatement2.setInt(3,advertise.getUserid());
        preparedStatement2.setString(4,advertise.getDescription());
        preparedStatement2.setInt(5,1);
        preparedStatement2.setFloat(6,advertise.getPrice());
        preparedStatement2.setBlob(7,advertise.getImgblob());
        preparedStatement2.setString(8,"accepted");
        preparedStatement2.executeUpdate();

    }


}
