<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5" import="javax.activation.DataHandler"
	import="javax.activation.DataSource"
	import="javax.activation.FileDataSource" import="javax.mail.Message"
	import="javax.mail.Multipart" import="javax.mail.Session"
	import="javax.mail.Transport"
	import="javax.mail.internet.InternetAddress"
	import="javax.mail.internet.MimeBodyPart"
	import="javax.mail.internet.MimeMessage"
	import="javax.mail.internet.MimeMultipart"
	import="java.util.Properties"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<%
		session = request.getSession(true);
		String mail = (String) session.getAttribute("email");
		System.out.println("how are you :::::::::::" + mail);
		
		String to = mail;

		// Sender's email ID needs to be mentioned
		String from = "p1104347@ipm.edu.mo";

		// Assuming you are sending email from localhost
		String host = "mail.ipm.edu.mo";

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.setProperty("mail.smtp.host", host);

		// Get the default Session object.
		Session Gsession = Session.getDefaultInstance(properties);

		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(Gsession);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO,
					new InternetAddress(to));

			// Set Subject: header field
			message.setSubject("Result from My Turnitin!");

			// Create the message part
			MimeBodyPart messageBodyPart = new MimeBodyPart();

			// Fill the message
			messageBodyPart.setText("Thank you for waiting!");

			// Create a multipar message
			Multipart multipart = new MimeMultipart();

			// Part two is attachment
			messageBodyPart = new MimeBodyPart();
			String filename = "C:/Tomcat7/webapps/FinalWebSite/Result.pdf";
			DataSource source = new FileDataSource(filename);
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName("Result.pdf");
			multipart.addBodyPart(messageBodyPart);

			// Send the complete message parts
			message.setContent(multipart);

			// Send message
			Transport.send(message);
			System.out.println("Sent message successfully....");
			response.sendRedirect("index.jsp");
		} catch (Exception mex) {
			mex.printStackTrace();
		}
	%>


</body>
</html>