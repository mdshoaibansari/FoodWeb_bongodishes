package com.foodapp.loginServlet;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.Dao.UserDao;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
	private Object put;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String email = request.getParameter("email");
		RequestDispatcher dispatcher = null;
		int otpvalue = 0;
		HttpSession mySession = request.getSession();
		System.out.println(email+"it is start working");
		UserDao ud=new UserDao();
		
		if(email!=null || !email.equals("")) {
			
			String uid=ud.validUser(email);
			if(uid!=null){
			// sending otp
			Random rand = new Random();
			otpvalue = rand.nextInt(1255650);
			
			String to = email;// change accordingly
			// Get the session object
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("bongodishesindia@gmail.com", "xutqctkncwttjngv");// Put your email
																									// id and
																									// password here
				}
			});
			
			// compose message
		
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));// change accordingly
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("Hello");
				message.setText("your OTP is: " + otpvalue);
				// send message
				Transport.send(message);
				System.out.println("message sent successfully");
			

			
			dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
			request.setAttribute("message","OTP is sent to your email id");
			//request.setAttribute("connection", con);
			mySession.setAttribute("name", uid);
			mySession.setAttribute("otp",otpvalue); 
			mySession.setAttribute("email",email); 
			dispatcher.forward(request, response);
			//request.setAttribute("status", "success");
			}
			else{
				mySession.setAttribute("error", "Invalid Email");
				request.getRequestDispatcher("inin.jsp").forward(request, response);
			}
		}
	     }catch (Exception e) {
				e.printStackTrace();
			}
		
	}

}
