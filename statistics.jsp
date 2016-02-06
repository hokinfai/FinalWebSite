<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.Connection"
	import="java.io.PrintWriter" import="java.sql.ResultSet"
	import="java.sql.Statement" import="javax.naming.Context"
	import="javax.sql.DataSource" import="javax.naming.InitialContext"
	import="java.sql.DriverManager" import="javax.servlet.http.HttpSession"
	import="fyp.TextBean"%>
<!DOCTYPE html>
<html>
<head>
<meta name="generator"
	content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
<meta charset="UTF-8" />
<title>My Turnitin</title>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("visualization", "1.1", {
		packages : [ "line" ]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Year');
		data.addColumn('number', 'Internet');
		data.addColumn('number', 'Media');

		data.addRows([ [ '2004', 49, 20 ], [ '2005', 50, 25 ],
				[ '2006', 40, 40 ], [ '2007', 100, 55 ], [ '2008', 150, 125 ],
				[ '2009', 248, 200 ], [ '2010', 320, 300 ],
				[ '2011', 325, 200 ], [ '2012', 460, 310 ]

		]);

		var options = {
			chart : {
				title : "The Trend of Plagriarism (Contents found on Internet/Media)",
				subtitle : 'in millions'
			},
			'width' : 630,
			'height' : 400,
		};

		var chart = new google.charts.Line(document
				.getElementById('chart_div1'));

		chart.draw(data, options);
	}
</script>
<meta name="description" content="A description of your website" />
<meta name="keywords" content="keyword1, keyword2, keyword3" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

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
						//System.out.println("hello " + session.getAttribute("email"));
						session.getAttribute("userName");
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
					<h2>Plagiarism Trend</h2>

					<p>The rapid development of Internet has increased
						plagiarism in academic field in current years. According to a 2011 study titled The
						Digital Revolution and Higher Education, “Most college presidents
						(55%) say that plagiarism in students' papers has increased over
						the past 10 years.” Of those who say plagiarism is on the rise,
						the overwhelming majority (89%) believe that computers and the
						Internet have played a major role in this trend.</p>
					<br />

					<div id="chart_div1" style="width: 630px; height: 300px;"></div>


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
