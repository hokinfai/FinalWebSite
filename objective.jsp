<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5" import="fyp.TextBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="generator"
	content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
<meta charset="UTF-8" />
<title>My Turnitin</title>
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
							changes to our lives. In today��s high-tech world, internet has
							come to a huge resource pool for information gathering. In terms
							of copyright infringement, many problems can occur in the
							academic area and society. Therefore, new techniques is be
							developed to effectively solve this problem.</p>
					</div>
				</div>
			</div>
			<div class="right_section">
				<div class="common_content">
					<h2>Objective</h2>
					<p>The aim of this project is to build up a plagiarism
						detection test bed. With the wide spread of internet, an
						increasing number of people are using web resources as references
						to help with their reports, publications, programs, and other
						documents. However, this also raises a serious concern about
						cheating and copyright, especially in the field of education.
						College students spend times on searching the internet instead of
						books. This project aims to provide a simple tool to help people
						to detect and verify if a document is similar to some other
						existing documents. Without this kind of product, a lot of people
						would tend to steal other people��s works from Internet. In this
						project, the major function of ��Turnitin�� will be implemented as
						expected. In addition, several auxiliary functions will also be
						performed if necessary.</p>
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
