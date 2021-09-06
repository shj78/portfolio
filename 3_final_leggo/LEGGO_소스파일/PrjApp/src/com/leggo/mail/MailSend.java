package com.leggo.mail;
 
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class MailSend {
    
	public MailSend() {}
	
    public void MailSend(String mem_id) {
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        
        Authenticator auth = new MailAuth();
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
    
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("2021leggo@gmail.com", "LEGGO"));
            InternetAddress to = new InternetAddress(mem_id);  
            
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject("테스트 중", "UTF-8");            
            msg.setContent("<a href=\"http://localhost:8090/PrjApp/loginpage.action?mem_id="+mem_id+"&success_message=이메일 인증이 완료되었습니다.\" style=\"font-size: 20px;\">이메일 인증</a>","text/html; charset=UTF-8");          
            
            Transport.send(msg);
            
        } catch(AddressException ae) {            
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
        }
                
    }
}