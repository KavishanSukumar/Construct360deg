package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Graph;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GraphDAO {
    public ArrayList<Graph> getProposedGraph(int projectid) throws SQLException {
        ArrayList<Graph> proposedGraph=new ArrayList<>();
        String sql="SELECT * FROM `proposedgraph` WHERE projectid=?";
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,projectid);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            Graph graph=new Graph();
            graph.setProjectid(resultSet.getInt("projectid"));
            graph.setGraphattribute(resultSet.getString("graphattribute"));
            graph.setGraphpoint(resultSet.getFloat("graphpoint"));
            proposedGraph.add(graph);
        }
        return proposedGraph;
    }
    public ArrayList<Graph> getOngoingGraph(int projectid) throws SQLException {
        ArrayList<Graph> ongoingGraph=new ArrayList<>();
        String sql="SELECT * FROM `ongoinggraph` WHERE projectid=?";
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,projectid);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            Graph graph=new Graph();
            graph.setProjectid(resultSet.getInt("projectid"));
            graph.setGraphattribute(resultSet.getString("graphattribute"));
            graph.setGraphpoint(resultSet.getFloat("graphpoint"));
            ongoingGraph.add(graph);
        }
        return ongoingGraph;
    }
    public boolean updateGraph(Graph graph) throws SQLException {
        int row=0;
        String sql="UPDATE `ongoinggraph` SET `graphpoint`=`graphpoint`+? WHERE `projectid`=? AND `graphattribute`=?";
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement=null;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setFloat(1,graph.getGraphpoint());
        preparedStatement.setInt(2,graph.getProjectid());
        preparedStatement.setString(3,graph.getGraphattribute());
        row=preparedStatement.executeUpdate();
        if (row>0){
            return true;
        }else {
            return false;
        }
    }
}
