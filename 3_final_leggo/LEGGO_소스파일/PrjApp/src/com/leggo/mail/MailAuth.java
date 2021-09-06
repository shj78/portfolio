package com.leggo.mail;
 
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class MailAuth extends Authenticator{
    
    PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "2021leggo@gmail.com";
        String mail_pw = "java006$";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}