package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Proposal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProposalsDAO {
    public boolean uploadProposalToCustomer (Proposal proposal) throws SQLException {
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = null;
        int row = 0;
        boolean status;
        sql = "INSERT INTO `proposals` (`cusid`, `profid`, `filename`, `file`, `reqid`, `submitDate`, `submitTime`, `description`) VALUES (?,?,?,?,?,?,?,?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, proposal.getCusid());
        preparedStatement.setInt(2, proposal.getProfid());
        preparedStatement.setString(3, proposal.getFilename());
        preparedStatement.setBlob(4, proposal.getProposalfile());
        preparedStatement.setInt(5, proposal.getRequirementid());
        preparedStatement.setDate(6, proposal.getProposal_upload_date());
        preparedStatement.setTime(7, proposal.getProposal_upload_time());
        preparedStatement.setString(8, proposal.getDescription());
        row = preparedStatement.executeUpdate();
        if (row >= 1) {
            status = true;
            System.out.println("All queries successfully updated");
        } else {
            status = false;
            System.out.println("Error");
        }

        return status;
    }
    public ArrayList<Proposal> checkAleadySendaProposal(int profid) throws SQLException{
        ArrayList<Proposal> proposals = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `proposals` WHERE profid = ?";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, profid);
        resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            Proposal proposal = new Proposal();
            int profid1 = resultSet.getInt("profid");
            int reqid = resultSet.getInt("reqid");
            proposal.setProfid(resultSet.getInt("profid"));
            proposal.setRequirementid(resultSet.getInt("reqid"));
            proposals.add(proposal);
        }
        return proposals;
        }

     public ArrayList<Proposal>   availableproposals(int reqid) throws SQLException{
         ArrayList<Proposal> availableproposals = new ArrayList<>();
         Connection connection = Database.getConnection();
         PreparedStatement preparedStatement = null;
         String sql ="SELECT * FROM `availableproposals` WHERE reqid = ? and customerReject=0";
         ResultSet resultSet = null;
         preparedStatement = connection.prepareStatement(sql);
         preparedStatement.setInt(1, reqid);
         resultSet = preparedStatement.executeQuery();
         while(resultSet.next()){
             Proposal availableproposal = new Proposal();
             int reqid1 = resultSet.getInt("reqid");
             availableproposal.setRequirementid(reqid1);
             byte[] profimg = resultSet.getBytes("profilepic");
             availableproposal.setProfprofimg(profimg);
             availableproposal.setProfname(resultSet.getString("username"));
             availableproposal.setFilename(resultSet.getString("filename"));
             byte[] proposal = resultSet.getBytes("file");
             availableproposal.setProposal(proposal);
             availableproposal.setCustomeraccept(resultSet.getInt("customerAccept"));
             availableproposal.setCustomerreject(resultSet.getInt("customerReject"));
             availableproposal.setProposal_upload_date(resultSet.getDate("submitDate"));
             availableproposal.setProposal_upload_time(resultSet.getTime("submitTime"));
             availableproposal.setDescription(resultSet.getString("description"));
             availableproposal.setProposalid(resultSet.getInt("proposalid"));
             availableproposal.setProfid(resultSet.getInt("profid"));

             availableproposals.add(availableproposal);

         }


        return availableproposals;
     }
    public ArrayList<Proposal>   displayownproposals(int profid) throws SQLException{
        ArrayList<Proposal> displayownproposals = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql ="SELECT * FROM `proposals` WHERE profid = ?";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, profid);
        resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
            Proposal availableproposal = new Proposal();
            int reqid1 = resultSet.getInt("reqid");
            availableproposal.setRequirementid(reqid1);

            availableproposal.setFilename(resultSet.getString("filename"));
            byte[] proposal = resultSet.getBytes("file");
            availableproposal.setProposal(proposal);
            availableproposal.setCustomeraccept(resultSet.getInt("customerAccept"));
            availableproposal.setCustomerreject(resultSet.getInt("customerReject"));
            availableproposal.setProposal_upload_date(resultSet.getDate("submitDate"));
            availableproposal.setProposal_upload_time(resultSet.getTime("submitTime"));
            availableproposal.setDescription(resultSet.getString("description"));
            availableproposal.setProposalid(resultSet.getInt("proposalid"));
            availableproposal.setCusid(resultSet.getInt("cusid"));
            availableproposal.setIsprojectcreated(resultSet.getInt("isprojectcreated"));

            displayownproposals.add(availableproposal);

        }


        return displayownproposals;
    }

    public void accept_or_reject(int choice, int proposalid)throws SQLException{
             if(choice==1){

                 Connection connection = Database.getConnection();
                 PreparedStatement preparedStatement = null;
                 String sql = "Update proposals SET customerAccept=1 where proposalid=?";
                 preparedStatement = connection.prepareStatement(sql);
                 preparedStatement.setInt(1, proposalid);
                 preparedStatement.executeUpdate();

                 System.out.println("accpet");

             }else{
                 Connection connection = Database.getConnection();
                 PreparedStatement preparedStatement = null;
                 String sql = "Update proposals SET customerReject=1 where proposalid=?";
                 preparedStatement = connection.prepareStatement(sql);
                 preparedStatement.setInt(1, proposalid);
                 System.out.println("reject");
                 preparedStatement.executeUpdate();


             }
      }
    public void createproject (int proposalid ) throws SQLException {
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        int val = 1;
        String sql = "Update proposals SET isprojectcreated=1 where proposalid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, proposalid);
        preparedStatement.executeUpdate();


    }

    }



