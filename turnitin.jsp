<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="fyp.TextBean" import="java.util.List"
	import="org.apache.logging.log4j.LogManager"
	import="org.apache.logging.log4j.Logger"%>
<!DOCTYPE html>
<html>
<head>
<meta name="generator"
	content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
<meta charset="UTF-8" />
<title>My Turnitin</title>
<meta name="description" content="A description of your website" />
<meta name="keywords" content="keyword1, keyword2, keyword3" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script>
	function confirmFunction() {
		alert("Upload successfully!  The result will be delivered via E-mail!");
	}
	function changeLimit() {
		var limit = document.getElementById("limit_id").value;
		document.TextForm.limit.value = limit;

	}

	function validation() {
		if (document.FileForm.file.value == "") {
			window.alert('Please upload a document.');
			console.log("testing");
			document.FileForm.file.focus();
			return false;
		}
		return true;
	}

	function myFunction() {
		document.execCommand('SaveAs', 'true', 'C:/Tomcat7/webapps/Result.txt');
	}
</script>
<style>
table#inputfield   tr:last-child td {
	color: red;
	text-align: right;
	bottom: 0;
}

strong {
	color: #FC6F03
}

#limit_id {
	font-size: 11px
}

.myButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #fce2c1;
	-webkit-box-shadow: inset 0px 1px 0px 0px #fce2c1;
	box-shadow: inset 0px 1px 0px 0px #fce2c1;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffc477
		), color-stop(1, #fb9e25));
	background: -moz-linear-gradient(center top, #ffc477 5%, #fb9e25 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffc477',
		endColorstr='#fb9e25');
	background-color: #ffc477;
	-webkit-border-top-left-radius: 14px;
	-moz-border-radius-topleft: 14px;
	border-top-left-radius: 14px;
	-webkit-border-top-right-radius: 14px;
	-moz-border-radius-topright: 14px;
	border-top-right-radius: 14px;
	-webkit-border-bottom-right-radius: 14px;
	-moz-border-radius-bottomright: 14px;
	border-bottom-right-radius: 14px;
	-webkit-border-bottom-left-radius: 14px;
	-moz-border-radius-bottomleft: 14px;
	border-bottom-left-radius: 14px;
	text-indent: 0.69px;
	border: 1px solid #eeb44f;
	display: inline-block;
	color: #ffffff;
	font-family: Comic Sans MS;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 32px;
	line-height: 32px;
	width: 69px;
	text-decoration: none;
	text-align: center;
	text-shadow: 0px -2px 0px #cc9f52;
}

table, th, td {
	border: none;
	border-collapse: collapse;
}

.myButton:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fb9e25
		), color-stop(1, #ffc477));
	background: -moz-linear-gradient(center top, #fb9e25 5%, #ffc477 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fb9e25',
		endColorstr='#ffc477');
	background-color: #fb9e25;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>


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
			<div class="navigation" style="padding-left: 70px">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="statistics.jsp">Plagiarism Trend</a></li>
					<li><a href="database.jsp">Sentence Inventory</a></li>

					<li><a href="turnitin.jsp">My Turnitin</a></li>

					<li><a href="Logout.jsp">Logout</a></li>

				</ul>
			</div>
			<div class="left_side_bar">
				<div class="col_1">
					<h1>Websites</h1>
					<div class="box" style="padding-bottom: 20px">
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
							changes to our lives. In todayâs high-tech world, internet has
							come to a huge resource pool for information gathering. In terms
							of copyright infringement, many problems can occur in the
							academic area and society. Therefore, new techniques is be
							developed to effectively solve this problem.</p>
					</div>
				</div>
			</div>
			<div class="right_section">
				<div class="common_content">
					<%
						session = request.getSession(true);

									TextBean bean = null;
									if (session.getAttribute("Bean") != null) {
										bean = (TextBean) session.getAttribute("Bean");
									}
									System.out.println("email in turnitin.jsp "
											+ session.getAttribute("email"));

						Logger logger = LogManager.getLogger("Texting Log");
						logger.entry();

						logger.info("Information level message:" + "email in turnitin.jsp "
								+ session.getAttribute("email"));

						logger.exit();
						session.getAttribute("userName");
						if (session.getAttribute("userName") == null) {
							response.sendRedirect("login.html");
						}

						session.getAttribute("email");
					%>




					<table id='inputfield' style="margin-left: 50px">
						<tr>
							<form name="TextForm" action="MainServlet" method="post" onsubmit="confirmFunction()">
								<td><strong> Query Sentence:</strong> <br /> <textarea
										name="querySentence" cols="60" rows="10">How are You</textarea>
								</td>
								<td style="margin-top: 50px"><br /> <br /> <br />
									<button type="Submit" name="submitText" class="myButton"
										id='submitButton'>Submit</button> <input type="hidden"
									name="limit" value="1"></td>
							</form>

						</tr>
						<form name="FileForm" onsubmit="return (validation())"
							action="FileServlet" method="post" enctype="multipart/form-data">
							<tr>

								<td height="60"><br /> <strong>File Query:</strong> <input
									type="file" name="file" class="upload"
									accept=".txt, .pdf, .doc, .docx" id="validateButton" /></td>
								<td><br />
									<button type="Submit" name="submitFile" class="myButton">Submit</button>
								</td>
							</tr>
							<tr>
								<td><font size="2">Word Limitation:</font></td>
								<td><select id='limit_id' name='limit'
									onChange="changeLimit()">
										<option value='1' selected="selected">No limit</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										<option value='6'>6</option>
										<option value='7'>7</option>
										<option value='8'>8</option>
										<option value='9'>9</option>
								</select></td>

							</tr>
						</form>
					</table>
					<br />

				</div>
			</div>
			<div class="clear"></div>
			<!--start footer from here-->
			<div id="footer">
				&copy; Copyright 2015. Design by <a
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
