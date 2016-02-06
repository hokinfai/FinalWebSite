<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="fyp.TextBean" import="java.util.List"
	import="java.io.File" import="java.io.IOException"
	import="java.nio.file.Files" import="java.nio.file.Path"
	import="java.nio.file.Paths"
	import="java.nio.file.attribute.BasicFileAttributes"
	import="java.util.Date" import="java.text.DateFormat"
	import="java.text.SimpleDateFormat" import="java.io.FileInputStream"
	import="java.io.IOException"
	import="org.apache.poi.hpsf.PropertySetFactory"
	import="org.apache.poi.hpsf.SummaryInformation"
	import="org.apache.poi.poifs.eventfilesystem.POIFSReader"
	import="org.apache.poi.poifs.eventfilesystem.POIFSReaderEvent"
	import="org.apache.poi.poifs.eventfilesystem.POIFSReaderListener"
	import="java.io.File" import="java.io.FileNotFoundException"
	import="java.io.IOException"
	import="org.apache.poi.hpsf.MarkUnsupportedException"
	import="org.apache.poi.hpsf.NoPropertySetStreamException"
	import="org.apache.poi.hpsf.PropertySetFactory"
	import="org.apache.poi.hpsf.SummaryInformation"
	import="org.apache.poi.hpsf.UnexpectedPropertySetTypeException"
	import="org.apache.poi.poifs.filesystem.DirectoryEntry"
	import="org.apache.poi.poifs.filesystem.NPOIFSFileSystem"
	import="java.util.HashMap" import="java.util.Iterator"
	import="com.itextpdf.text.pdf.PdfReader"%>
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
	border: 1px solid black;
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
						System.out.println("hello " + session.getAttribute("email"));
						session.getAttribute("userName");
						if (session.getAttribute("userName") == null) {
							response.sendRedirect("login.html");
						}
					    System.out.println("the user file name in txtProperty : " + bean.getUserFile());
						session.getAttribute("email");
					%>
					<%
						Path path = Paths.get(bean.getFileName());

						BasicFileAttributes basicAttributes = Files.readAttributes(path,
								BasicFileAttributes.class);

						DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					%>

					<table border="1" style="width: 100%">
						<tr>
							<td>Document Name:</td>
							<td><%=bean.getUserFile()%></td>
						</tr>
						<tr>
							<td>Word Limitation:</td>
							<td><%=bean.getWordLimit()%></td>
						</tr>
						<%
							if (bean.getFileType() == "txt")
								out.println("<tr><td>Creation Time:</td><td>"
										+ basicAttributes.creationTime() + "</td></tr>");
						%>
						<tr>
							<td>Last AccesseTime:</td>
							<td><%=basicAttributes.lastAccessTime()%></td>
						</tr>

						<tr>
							<td>Last Modify Time:</td>
							<td><%=basicAttributes.lastModifiedTime()%></td>
						</tr>
						<tr>
							<td>Upload Time:</td>
							<td><%=dateFormat.format(new Date())%></td>
						</tr>

						<tr>
							<td>File Size:</td>
							<td><%=basicAttributes.size() + "&nbsp;bits"%></td>
						</tr>
						<%
							if (bean.getFileType() == "doc") {
								File summaryFile = new File(bean.getFileName());

								/* Open the POI filesystem. */
								NPOIFSFileSystem poifs = new NPOIFSFileSystem(summaryFile,
										false);

								/* Read the summary information. */
								DirectoryEntry dir = poifs.getRoot();
								SummaryInformation si;
								try {
									si = (SummaryInformation) PropertySetFactory.create(dir,
											SummaryInformation.DEFAULT_STREAM_NAME);
								} catch (FileNotFoundException ex) {
									// There is no summary information yet. We have to create a new one
									si = PropertySetFactory.newSummaryInformation();
								}

								out.println("<tr><td>Application Name:</td><td>"
										+ si.getApplicationName() + "</td></tr>");
								out.println("<tr><td>Author:</td><td>" + si.getAuthor()
										+ "</td></tr>");
								out.println("<tr><td>Number of Pages:</td><td>"
										+ si.getPageCount() + "</td></tr>");
								out.println("<tr><td>Number of Words:</td><td>"
										+ si.getWordCount() + "</td></tr>");
								out.println("<tr><td>Character Count:</td><td>"
										+ si.getCharCount() + "</td></tr>");
							} else if (bean.getFileType() == "pdf") {

								PdfReader ReadInputPDF;
								ReadInputPDF = new PdfReader(bean.getFileName());
								HashMap hMap = new HashMap();
								hMap = ReadInputPDF.getInfo();
								Iterator iterator = hMap.keySet().iterator();
								out.println("<tr><td>Page Length:</td><td>"
										+ ReadInputPDF.getFileLength() + "bit</td></tr>");
								out.println("<tr><td>Page Count:</td><td>"
										+ ReadInputPDF.getNumberOfPages() + "</td></tr>");
								out.println("<tr><td>PDF Version:</td><td>"
										+ ReadInputPDF.getPdfVersion() + "</td></tr>");

								while (iterator.hasNext()) {
									String key = (String) iterator.next();
									out.println("<tr><td>" + key + ":</td><td>" + hMap.get(key)
											+ "</td></tr>");

								}

							}
						%>
						<tr>
							<td>Directory:</td>
							<td>
								<%
									if (basicAttributes.isDirectory() == false) {
										out.println("&#10006");
									} else
										out.println("&#10004");
								%>
							</td>
						</tr>
						<tr>
							<td>File:</td>
							<td>
								<%
									if (basicAttributes.isRegularFile() == false) {
										out.println("&#10006");
									} else
										out.println("&#10004");
								%>
							</td>
						</tr>







						<tr>
							<td></td>
							<td><form action="Confirm.jsp">
									<button type="Submit" name="submitFile" class="myButton"
										onclick="confirmFunction()">Confirm</button>
								</form></td>
						</tr>
					</table>




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
