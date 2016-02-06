<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5" import="java.sql.Connection"
	import="java.io.PrintWriter" import="java.sql.ResultSet"
	import="java.sql.Statement" import="javax.naming.Context"
	import="javax.sql.DataSource" import="javax.naming.InitialContext"
	import="java.sql.DriverManager" import="javax.servlet.http.HttpSession" import="org.apache.logging.log4j.LogManager"
    import="org.apache.logging.log4j.Logger"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			String username = request.getParameter("userName");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/myturnitin";
			Connection conn = DriverManager.getConnection(url, "root",
					"9999");
			Statement statement = conn.createStatement();
			String sql = "SELECT * FROM USER_INFO WHERE USER_NAME='"
					+ username + "' AND User_password='"+password+"'";
			System.out.println(sql);
			ResultSet rs = statement.executeQuery(sql);
			if (!rs.next()) {
				response.sendRedirect("login.html");
				
			} else {
				rs.first();
				System.out.println("is First   " + rs.isFirst());
				System.out.println("is last    " + rs.isLast());
				System.out.println("Not null!!!");
				session = request.getSession(true);
				System.out.println(username);
				System.out.println(password);
				email = rs.getString(4);
				System.out.println(email);
				Logger logger = LogManager.getLogger("Texting Log");
                logger.entry();
    
                logger.info("Information level message:UserName:    " + username);
                logger.info("Information level message:Password:   " + password);
                logger.info("Information level message:Email:   " + email);
               
                logger.exit();
				
				session.setAttribute("userName", username);
				session.setAttribute("email", email);
				session.setAttribute("password", password);
			
				response.sendRedirect("turnitin.jsp");
			}
			statement.close();
			conn.close();

		} catch (Exception ex) {
			// ex.printStackTrace();
		}
	%>
</body>
</html>