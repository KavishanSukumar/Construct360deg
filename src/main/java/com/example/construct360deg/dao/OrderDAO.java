package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDAO {
    public ArrayList<Integer> getOrderIDs() throws SQLException {
        ArrayList<Integer> productOrders=new ArrayList<>();
        Connection connection= Database.getConnection();
        String sql="SELECT DISTINCT orderid FROM `orders`";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        ResultSet resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            productOrders.add(resultSet.getInt("orderid"));
        }
        return productOrders;
    }
    public ArrayList<Product> getOrderDetails(Integer orderid) throws SQLException {
        ArrayList<Product> orderlist=new ArrayList<>();
        String sql="SELECT orders.orderid , orders.quantity, product.productname,product.productprice   FROM orders INNER JOIN product ON orders.productid=product.productid WHERE orders.orderid=?";
        PreparedStatement preparedStatement;
        Connection connection=Database.getConnection();
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,orderid);
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
}
