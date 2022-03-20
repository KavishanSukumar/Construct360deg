package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RequirementDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/sendreqtochooseprof")
public class SendReqToChooseProfServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    PrintWriter out = resp.getWriter();
    HttpSession session = req.getSession();
    String userrole= (String) session.getAttribute("userrole");
    int profid = Integer.parseInt(req.getParameter("profid"));
    int userid = Integer.parseInt(req.getParameter("userid"));
    int reqid = Integer.parseInt(req.getParameter("reqid"));
    System.out.println(" i am in sendreqtochooseprof servlet "+"profid-"+profid+" reqid-"+reqid+" userid-"+userid);
    RequirementDAO requirementDAO = new RequirementDAO();

    try{
        requirementDAO.uploadRequirementToChooseProf(reqid,profid,userid);
        out.println("<script type='text/javascript'>");
        out.println("alert('Your Requirement is sent successfully');");
        out.println("location='"+req.getContextPath()+"/viewproject?profid="+profid+"&reqid="+reqid+"&userrole="+userrole+"';");
        out.println("</script>");
    }catch (Exception e){
        e.printStackTrace();
        out.println("<script type='text/javascript'>");
        out.println("alert('You already upload your requirement to relevant professional');");
        out.println("location='"+req.getContextPath()+"/viewproject?profid="+profid+"&reqid="+reqid+"&userrole="+userrole+"';");
        out.println("</script>");
    }


}
}
