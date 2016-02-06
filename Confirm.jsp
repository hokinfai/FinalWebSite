<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5" import="java.sql.Connection"
	import="java.io.PrintWriter" import="java.sql.ResultSet"
	import="java.sql.Statement" import="javax.naming.Context"
	import="javax.sql.DataSource" import="javax.naming.InitialContext"
	import="java.sql.DriverManager" import="javax.servlet.http.HttpSession"
	import="fyp.TextBean" import="java.util.List" import="fyp.QueryFile"
	import="fyp.QueryPdfFile" import="fyp.QueryWordFile"
	import="fyp.ConvertPdf" import="fyp.sendEmail"
	import="org.apache.logging.log4j.LogManager"
	import="org.apache.logging.log4j.Logger"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<%
		session = request.getSession(true);

		TextBean bean = null;
		if (session.getAttribute("Bean") != null) {
			bean = (TextBean) session.getAttribute("Bean");

		}
		System.out.println("email in confirm: "
				+ session.getAttribute("email"));
		session.getAttribute("userName");
		Logger logger = LogManager.getLogger("Texting Log");
		logger.entry();

		logger.info("Information level message:"
				+ session.getAttribute("email"));

		if (session.getAttribute("userName") == null) {
			response.sendRedirect("login.html");
		}

		String wordLimit = bean.getWordLimit();
		String path = bean.getFileName();
		String fileName = bean.getUserFile();
		//		response.sendRedirect("index.jsp");
		if (bean.getFileName().endsWith("txt"))
			bean = (new QueryFile(wordLimit, path)).queryFile();
		else if (bean.getFileType() == "pdf")
			bean = (new QueryPdfFile(wordLimit, path)).queryPdfFile();
		else
			bean = (new QueryWordFile(wordLimit, path)).queryWordFile();
		System.out.println("the name of user file: " + fileName);
		logger.info("Information level message:"
				+ "the name of user file: " + fileName);
		// 	      System.out.println("the name of file "+bean.getFileName());
		ConvertPdf.ConvertPdf("C:/Tomcat7/webapps/FinalWebSite/Result.txt",
				bean.getUrlCount(), bean.getUrlFound(), bean.getPercent(),
				fileName, (String) session.getAttribute("userName"));
		sendEmail.sendEmail((String) session.getAttribute("email"));
		response.sendRedirect("index.jsp");
		logger.exit();
	%>
</body>
</html>