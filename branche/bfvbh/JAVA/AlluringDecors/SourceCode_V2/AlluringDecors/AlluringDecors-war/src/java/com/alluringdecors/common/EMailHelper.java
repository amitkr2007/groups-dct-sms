/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.common;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Administrator
 */
public class EMailHelper {

    public static boolean sendingMail(String subject, String emailContent, String to) {
        boolean result = false;
        try {
            final String login = WebConfig.getValue(WebConfig.USERNAME);
            final String pwd = WebConfig.getValue(WebConfig.PASSWORD);
            final String emailAddress = WebConfig.getValue(WebConfig.EMAIL);

            Properties props = System.getProperties();
            // –
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.starttls.enable", "true");

            Authenticator pa = null; //default: no authentication
            if (login != null && pwd != null) { //authentication required?
                props.put("mail.smtp.auth", "true");
                pa = new Authenticator() {

                    @Override
                    public PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(login, pwd);
                    }
                };
            }
            
            Session session = Session.getInstance(props, pa);
            // Create a new message –
            Message msg = new MimeMessage(session);
            // Set the FROM and TO fields –
            msg.setFrom(new InternetAddress(emailAddress));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Set the subject and body text
            msg.setSubject(subject);
            msg.setContent(emailContent, "text/html; charset=utf-8");
            // Set some other header information –
            msg.setSentDate(new java.util.Date());
            msg.saveChanges();

            // Send the message
            Transport.send(msg);
            result = true;
        } catch (MessagingException ex) {
            Logger.getLogger(EMailHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
