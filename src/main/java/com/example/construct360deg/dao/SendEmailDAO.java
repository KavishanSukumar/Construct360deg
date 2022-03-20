package com.example.construct360deg.dao;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmailDAO {
    final String username="construct360deg@gmail.com";
    final String password="kqssdphenyqerfsr";

    public int  sendEmail(String email,String subject,String content) throws MessagingException {
        int status=0;
        Properties props=new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session=Session.getDefaultInstance(props,
                    new javax.mail.Authenticator(){
                           protected PasswordAuthentication getPasswordAuthentication(){
                               return new PasswordAuthentication(username,password);
                           }
                    }
                );

        Message message=new MimeMessage(session);
        message.setFrom(new InternetAddress("Construct360ConstructionManagement"));
        message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(email)
        );
        message.setSubject(subject);
        message.setContent(content,"text/html");
        Transport.send(message);
        return status;
    }
}
