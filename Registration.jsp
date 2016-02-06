<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5" import="java.sql.Connection"
	import="java.io.PrintWriter" import="java.sql.ResultSet"
	import="java.sql.Statement" import="javax.naming.Context"
	import="javax.sql.DataSource" import="javax.naming.InitialContext"
	import="java.sql.DriverManager" import="javax.servlet.http.HttpSession"
	import="java.sql.PreparedStatement" import="org.apache.logging.log4j.LogManager"
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
			String sql = "insert into user_info(User_name,User_password,User_email) values('" + username
					+ "','" + password + "','" + email + "')";


            Logger logger = LogManager.getLogger("Texting Log");
            logger.entry();

            logger.info("Information level message:"+"SQL in registration.jsp   " + sql);
            logger.info("Information level message:"+"email in registraion.jsp    " + email);
            logger.info("Information level message:"+"password in registraion.jsp    " + password);

            logger.exit();
			System.out.println("I am " + username);

			System.out.println(sql);
			System.out.println(email);
			
			statement.executeUpdate(sql);
			System.out.println(password);

			session = request.getSession(true);
			session.setAttribute("userName", username);
			session.setAttribute("email", email);
			session.setAttribute("password", password);

			response.sendRedirect("turnitin.jsp");
			conn.close();
			statement.close();
		} catch (Exception ex) {
			// ex.printStackTrace();
		}
	%>
</body>
</html>