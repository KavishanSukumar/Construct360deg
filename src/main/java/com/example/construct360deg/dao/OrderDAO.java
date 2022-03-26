package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Order;
import com.example.construct360deg.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public class OrderDAO {
    public ArrayList<Integer> getOrderIDs(int userid) throws SQLException {
        ArrayList<Integer> productOrders=new ArrayList<>();
        Connection connection= Database.getConnection();
        String sql="SELECT DISTINCT orderid FROM `orders` WHERE userid=?";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        ResultSet resultSet=preparedStatement.executeQuery();
        while (resultSet.next()){
            productOrders.add(resultSet.getInt("orderid"));
        }
        return productOrders;
    }
    public ArrayList<Product> getOrderDetails(Integer orderid,int userid) throws SQLException {
        ArrayList<Product> orderlist=new ArrayList<>();
        String sql="SELECT orders.orderid , orders.quantity, product.productname,product.productprice   FROM orders INNER JOIN product ON orders.productid=product.productid WHERE orders.orderid=? AND orders.userid=? ";
        PreparedStatement preparedStatement;
        Connection connection=Database.getConnection();
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,orderid);
        preparedStatement.setInt(2,userid);
        ResultSet resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            Product product =new Product();
            product.setProductName(resultSet.getString("productname"));
            product.setPrice(resultSet.getFloat("productprice"));
            product.setQuantity(resultSet.getFloat("quantity"));
            orderlist.add(product);
        }
        return orderlist;
    }
    public boolean lodgeOrders(Order order) throws SQLException {

        boolean status=false;
        int row=0;

        String sql="INSERT INTO `orders`( `productid`, `userid`, `quantity`, `district`, `houseno`, `street`, `city`, `Phone`, `email`, `deliverytype`,`OrderDate`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,order.getProductid());
        preparedStatement.setInt(2,order.getUserid());
        preparedStatement.setFloat(3,order.getQuantity());
        preparedStatement.setString(4,order.getDistrict());
        preparedStatement.setString(5,order.getHouseno());
        preparedStatement.setString(6,order.getStreet());
        preparedStatement.setString(7,order.getCity());
        preparedStatement.setString(8,order.getPhone());
        preparedStatement.setString(9,order.getEmail());
        preparedStatement.setString(10,order.getDeliverytype());

        LocalDate lt = LocalDate.now();
        preparedStatement.setString(11, String.valueOf(lt));
        row=preparedStatement.executeUpdate();

        String sql2="UPDATE `product` SET `quantity`=`quantity`-? WHERE `productid`=?";
        preparedStatement=connection.prepareStatement(sql2);
        preparedStatement.setFloat(1,order.getQuantity());
        preparedStatement.setInt(2,order.getProductid());
        row+=preparedStatement.executeUpdate();

        if(row>0){
            status=true;
        }
        return status;
    }

    public ArrayList<Order> getmyorders(int userid) throws SQLException {
        ArrayList<Order> orders=new ArrayList<>();
        String sql="SELECT * FROM `companyorders` WHERE companyid=?";
        PreparedStatement preparedStatement=null;
        Connection connection=Database.getConnection();
        ResultSet resultSet;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            Order order=new Order();
            order.setOrderid(resultSet.getInt("orderid"));
            order.setProductid(resultSet.getInt("productid"));
            order.setUserid(resultSet.getInt("userid"));
            order.setQuantity(resultSet.getFloat("quantity"));
            order.setDistrict(resultSet.getString("district"));
            order.setHouseno(resultSet.getString("houseno"));
            order.setStreet(resultSet.getString("street"));
            order.setCity(resultSet.getString("city"));
            order.setPhone(resultSet.getString("Phone"));
            order.setEmail(resultSet.getString("email"));
            order.setDeliverytype(resultSet.getString("deliverytype"));
            order.setOrderdate(resultSet.getString("OrderDate"));
            order.setOrderstatus(resultSet.getString("orderstatus"));
            if(resultSet.getString("cusindivname")!=null){
                order.setCustomername(resultSet.getString("cusindivname"));
            }else{
                order.setCustomername(resultSet.getString("companyname"));
            }
            order.setProductprice(resultSet.getFloat("productprice"));
            order.setProductname(resultSet.getString("productname"));
            orders.add(order);
        }

        return orders;
    }

    public void Orderstatus(int orderid,int task) throws SQLException {
        Connection connection=Database.getConnection();
        String sql=null;
        if(task==1){
            sql="UPDATE `orders` SET `orderstatus`='Confirmed' WHERE orderid=?";
        }
        else if (task==0){
            sql="UPDATE `orders` SET `orderstatus`='Rejected' WHERE orderid=?";
        }
        PreparedStatement preparedStatement=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,orderid);
        preparedStatement.executeUpdate();
        System.out.println("test me");
    }

    public ArrayList<Order> searchorders(int userid, String fromdate,String todate, String search ) throws SQLException {
        ArrayList<Order> orders=new ArrayList<>();
        String sql=null;
        PreparedStatement preparedStatement=null;
        Connection connection=Database.getConnection();
        ResultSet resultSet;
        search='%'+search+'%';
        if(!fromdate.equals("")&&!todate.equals("")&&!search.equals("")){
            sql="SELECT * FROM `companyorders` WHERE companyid=? AND OrderDate>=? AND OrderDate<=? AND ((cusindivname LIKE ?) OR (companyname LIKE ?))";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,userid);
            preparedStatement.setString(2,fromdate);
            preparedStatement.setString(3,todate);
            preparedStatement.setString(4,search);
            preparedStatement.setString(5,search);
        }else if(!fromdate.equals("")&&!todate.equals("")){
            sql="SELECT * FROM `companyorders` WHERE companyid=? AND OrderDate>=? AND OrderDate<=?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,userid);
            preparedStatement.setString(2,fromdate);
            preparedStatement.setString(3,todate);
        }else if (!todate.equals("")&&!search.equals("")){
            sql="SELECT * FROM `companyorders` WHERE companyid=? AND OrderDate<=? AND ((cusindivname LIKE ?) OR (companyname LIKE ?))";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,userid);
            preparedStatement.setString(2,todate);
            preparedStatement.setString(3,search);
            preparedStatement.setString(4,search);
        }else if (!todate.equals("")){
            sql="SELECT * FROM `companyorders` WHERE companyid=? AND OrderDate<=?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,userid);
            preparedStatement.setString(2,todate);
        }else if(!fromdate.equals("")&&!search.equals("")){
            sql="SELECT * FROM `companyorders` WHERE companyid=? AND OrderDate>=? AND ((cusindivname LIKE ?) OR (companyname LIKE ?))";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,userid);
            preparedStatement.setString(2,fromdate);
            preparedStatement.setString(3,search);
            preparedStatement.setString(4,search);
        }else if(!fromdate.equals("")){
            sql="SELECT * FROM `companyorders` WHERE companyid=? AND OrderDate>=? ";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,userid);
            preparedStatement.setString(2,fromdate);
        }else if(!search.equals("")){
            sql="SELECT * FROM `companyorders` WHERE companyid=? AND ((cusindivname LIKE ?) OR (companyname LIKE ?))";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,userid);
            preparedStatement.setString(2,search);
            preparedStatement.setString(3,search);
        }else{
            sql="SELECT * FROM `companyorders` WHERE companyid=?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,userid);
        }
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            Order order=new Order();
            order.setOrderid(resultSet.getInt("orderid"));
            order.setProductid(resultSet.getInt("productid"));
            order.setUserid(resultSet.getInt("userid"));
            order.setQuantity(resultSet.getFloat("quantity"));
            order.setDistrict(resultSet.getString("district"));
            order.setHouseno(resultSet.getString("houseno"));
            order.setStreet(resultSet.getString("street"));
            order.setCity(resultSet.getString("city"));
            order.setPhone(resultSet.getString("Phone"));
            order.setEmail(resultSet.getString("email"));
            order.setDeliverytype(resultSet.getString("deliverytype"));
            order.setOrderdate(resultSet.getString("OrderDate"));
            order.setOrderstatus(resultSet.getString("orderstatus"));
            if(resultSet.getString("cusindivname")!=null){
                order.setCustomername(resultSet.getString("cusindivname"));
            }else{
                order.setCustomername(resultSet.getString("companyname"));
            }
            order.setProductprice(resultSet.getFloat("productprice"));
            order.setProductname(resultSet.getString("productname"));
            orders.add(order);
        }

        return orders;
    }

}
/*
SELECT product.companyid,product.productname,product.productprice,CONCAT(customerindividual.firstname," ",customerindividual.lastname) AS cusindivname,customercompany.companyname,orders.* FROM
(((orders LEFT JOIN product ON orders.productid=product.productid)LEFT JOIN customerindividual ON orders.userid=customerindividual.userid)LEFT JOIN customercompany
 ON orders.userid=customercompany.userid);
 */