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

}
/*
SELECT product.companyid,product.productname,product.productprice,CONCAT(customerindividual.firstname," ",customerindividual.lastname) AS cusindivname,customercompany.companyname,orders.* FROM
(((orders LEFT JOIN product ON orders.productid=product.productid)LEFT JOIN customerindividual ON orders.userid=customerindividual.userid)LEFT JOIN customercompany
 ON orders.userid=customercompany.userid);
 */