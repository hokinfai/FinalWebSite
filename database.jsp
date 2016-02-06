<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.Connection"
	import="java.io.PrintWriter" import="java.sql.ResultSet"
	import="java.sql.Statement" import="javax.naming.Context"
	import="javax.sql.DataSource" import="javax.naming.InitialContext"
	import="java.sql.DriverManager" import="javax.servlet.http.HttpSession"
	import="fyp.TextBean" import="org.apache.logging.log4j.LogManager"
    import="org.apache.logging.log4j.Logger"%>
<!DOCTYPE html>
<html>
<head>
<meta name="generator"
	content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
<meta charset="UTF-8" />
<title>My Turnitin</title>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<meta name="description" content="A description of your website" />
<meta name="keywords" content="keyword1, keyword2, keyword3" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">



    // Load the Visualization API and the piechart package.
    google.load('visualization', '1.0', {
        'packages' : [ 'corechart' ]
    });

    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);

    // Callback that creates and populates a data table, 
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Sentence');
        data.addColumn('number', 'Number of words');
<%try {

				Class.forName("com.mysql.jdbc.Driver");

				String url = "jdbc:mysql://localhost:3306/myturnitin";

				Connection conn = DriverManager.getConnection(url, "root",
						"9999");

				Statement statement = conn.createStatement();%>
                
                
                <%String sql = "Select sentences, sentence_appearance from sentence order by sentence_appearance desc limit 10";

				ResultSet rs = statement.executeQuery(sql);

				while (rs.next()) {
					System.out.println(rs.getInt(2));
					String str = rs.getString(1);
					int word = rs.getInt(2);%>
                    var s="<%=str%>";
                    var w =<%=word%>;
        data.addRows([ [ s, w ] ]);
<%}
				statement.close();
				conn.close();
			} catch (Exception ex) {
			}%>
    // Set chart options

        var options = {
            'title' : 'The Most Frequent Used Sentences ',
            'width' : 630,
            'height' : 400,
            'margin-right': '30px' ,
        };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document
                .getElementById('chart_div'));

        function selectHandler() {
            var selectedItem = chart.getSelection()[0];
            if (selectedItem) {
                var topping = data.getValue(selectedItem.row, 0);
                alert('The user selected ' + topping);
            }
        }

        google.visualization.events.addListener(chart, 'select', selectHandler);
        chart.draw(data, options);
    }
</script>
<style>
.google-visualization-table-td {
	text-align: left !important;
}
</style>
<script type="text/javascript">
      google.load("visualization", "1", {packages:["table"]});
      google.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        var data = new google.visualization.DataTable();
        
        data.addColumn('string', 'Sentence');
        data.addColumn('number', 'Frequency');
        data.addColumn('string', 'On Internet');
        data.addColumn('number', 'Words');
<%try {

				Class.forName("com.mysql.jdbc.Driver");

				String url = "jdbc:mysql://localhost:3306/myturnitin";

				Connection conn = DriverManager.getConnection(url, "root",
						"9999");

				Statement statement = conn.createStatement();%>
            
            
            <%String sql = "Select sentences, sentence_appearance,sentence_found,sentence_word from sentence";

				ResultSet rs = statement.executeQuery(sql);

				while (rs.next()) {

					String sent = rs.getString(1);
					int appear = rs.getInt(2);
					String found = rs.getString(3);
					int court = rs.getInt(4);
					
					Logger logger = LogManager.getLogger("Texting Log");
				    logger.entry();
        
				    logger.info("Information level message:"+"database \"sentence\" sentence   " + sent);
				    logger.info("Information level message:"+"database \"sentence\" frequency   " + appear);
				    logger.info("Information level message:"+"database \"sentence\" on internet   " + found);
				    logger.info("Information level message:"+"database \"sentence\" words count   " + court);
				    logger.exit(); %>
				    var s="<%=sent%>";
                    var a =<%=appear%>;
	                var f="<%=found%>";
	                var c =<%=court%>;
		data.addRows([ [ s, a, f, c ] ]);
<%}

				statement.close();
				conn.close();
			} catch (Exception ex) {
			}
%>
	var options = {
			'width' : 630,
			'height' : 300,
			showRowNumber : true
		};

		var table = new google.visualization.Table(document
				.getElementById('table_div'));

		table.draw(data, options);
	}
</script>
</head>
<body>
	<div id="wrapper">
		<div id="header">

			<div class="top_banner">
				<h1>My Turnitin</h1>
				<p>Alan Ho (Macao Polytechnic Institute)</p>
			</div>
		</div>
		<div id="page_content">

			<div class="navigation"
				<%session = request.getSession(true);

			TextBean bean = null;
			if (session.getAttribute("Bean") != null) {
				bean = (TextBean) session.getAttribute("Bean");
			}
			if (session.getAttribute("userName") != null) {
				out.println("style=\"padding-left:70px\"");
			}%>>
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="statistics.jsp">Plagiarism Trend</a></li>
					<li><a href="database.jsp">Sentence Inventory</a></li>
					<li><a href="turnitin.jsp">My Turnitin</a></li>
					<%
						if (session.getAttribute("userName") == null) {
							out.println("<li><a href=\"login.html\">Login</a></li><li><a href=\"registration.html\">Register</a>");
						} else
							out.println("<li><a href=\"Logout.jsp\">Logout</a></li>");
					
					%>


				</ul>
			</div>
			<div class="left_side_bar">
				<div class="col_1">
					<h1>Websites</h1>
					<div class="box">
						<ul>
							<li><a
								href="http://www.inf.unideb.hu/~sajolevente/Head%20First%20Servlets%20and%20JSP,%20Second%20Edition.pdf">JavaServer
									Page (e-book)</a></li>
							<li><a
								href="https://developers.google.com/custom-search/json-api/v1/overview">Google
									Search API</a></li>
							<li><a href="http://www.turnitin.com/">Turnitin
									(official)</a></li>
							<li><a href="http://filepi.com/i/LI9l7v5">Java Servlet</a></li>
							<li><a href="http://poi.apache.org/">Apache POI</a></li>
							<li><a href="http://tomcat.apache.org/download-70.cgi">Tomcat</a>
							</li>
							<li><a href="http://itextpdf.com/">iText</a></li>
						</ul>
					</div>
				</div>
				<div class="col_1">
					<h1>Introduction</h1>
					<div class="box">

						<p>The rapid development of technology brings about tremendous
							changes to our lives. In today's high-tech world, internet has
							come to a huge resource pool for information gathering. In terms
							of copyright infringement, many problems can occur in the
							academic area and society. Therefore, new techniques is be
							developed to effectively solve this problem.</p>
					</div>
				</div>
			</div>
			<div class="right_section">
				<div class="common_content">
					<h2>Sentences stored in database</h2>


					<p>Some English phrases and certain sentences especially
						shorter easily violate plagiarism issue. Any system would
						misunderstand the situation. Since computer program can only
						follow some kind of logical pattern, mismatch is always a case.
						For this reason, my system use the real-time statistical analysis
						data to indicate whether or not those sentences are regarded as
						plagiarised materials. There are a lot of sentences stored in my database,
						this pie chart showing which sentences are being used usually.</p>
					<br />


					<div class="list" id="chart_div"></div>
					<br />
					<p>All the sentences in the database are displayed below:</p>
					<div id="table_div" style="width: 630px; height: 300px;"></div>



				</div>
			</div>
			<div class="clear"></div>
			<!--start footer from here-->
			<div id="footer">
				&copy; Copyright 2015. Design by<a
					href="https://www.facebook.com/faih3" target="_blank">Alan Ho</a> <br />
				<!--DO NOT remove footer link-->

				<!--Template designed by-->

				<a href="http://www.casino.biz"> <img
					src="images/design_img.gif" class="copyright"
					alt="http://www.casino.biz" />
				</a>
			</div>
			<!--/. end footer from here-->
		</div>
	</div>
</body>
</html>
