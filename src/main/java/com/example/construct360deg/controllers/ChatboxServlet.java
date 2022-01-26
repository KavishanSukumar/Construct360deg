package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ChatDAO;
import com.example.construct360deg.model.Chat;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet("/chat")
public class ChatboxServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int sender= (int) session.getAttribute("userid");
        int receiver=Integer.parseInt(req.getParameter("receiver"));

        if(Integer.parseInt(req.getParameter("task"))==1){
            String message=req.getParameter("message");
            ChatDAO chatDAO=new ChatDAO();
            Chat chat=new Chat();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String date=dtf.format(now);
            System.out.println(date);

            chat.setDatetime(date);
            chat.setMessage(message);
            chat.setReceiver(receiver);
            chat.setSender(sender);

            try {
                chatDAO.sendMessage(chat);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (Integer.parseInt(req.getParameter("task"))==0){
            ArrayList<Chat> chats=new ArrayList<>();
            ChatDAO chatDAO=new ChatDAO();

            try {
                chats=chatDAO.viewMessage(sender,receiver);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            String chatstring=new Gson().toJson(chats);
            PrintWriter out=resp.getWriter();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            out.print(chatstring);
        }

    }
}
