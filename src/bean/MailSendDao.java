/*
 *  작성자 : 박민수 
 *  작성일 : 2016-07-09
 *  설명 : java mailing 모듈.
 * 
 */

package bean;

import javax.mail.*;
import javax.mail.internet.*;

import java.net.Authenticator;
import java.util.Properties;

public class MailSendDao extends Authenticator{
	
	Properties props = System.getProperties();
	Session session = null;
	String hostMail;
	String hostPass;
	
	// host, port, hostMail, hostPass 설정.
	public void setProperty(String host, int port,String hostMail, String hostPass){
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		this.hostMail = hostMail;
		this.hostPass = hostPass;
		setHostMail(hostMail, hostPass);
	}
	
	public void setHostMail(String hostMail, String hostPass){
		session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(hostMail, hostPass);
			}
		});
	}
	
	public void sendMail(String recipient, String title, String content){
		try{
			Message sendMessage = new MimeMessage(session);
			sendMessage.setFrom(new InternetAddress(hostMail));
			sendMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			sendMessage.setSubject(title);
			sendMessage.setText(content);
			
			Transport.send(sendMessage);
		}catch(Exception err){
			err.printStackTrace();
		}
	}
	
	
}
