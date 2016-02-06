package fyp;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jsoup.Jsoup;

import com.google.gson.Gson;

import fyp.QuerySentence.Cursor;
import fyp.QuerySentence.ResponseData;
import fyp.QuerySentence.Result;

public class QueryFile {
	static int wordCount;
	static String source;

	public QueryFile(String limit, String source) {
		wordCount = Integer.parseInt(limit);
		this.source = source;
	}

	public TextBean queryFile() {
		TextBean bean = new TextBean();
		setPercentage(0);
		searchGoogle(bean);
		return bean;
	}

	private Cursor cursor;
	private ResponseData responseData;
	public static BufferedReader in;
	public static int countSpace;
	public static double urlCount;
	public static double urlFound;
	public static double d;
	static DecimalFormat df = new DecimalFormat("#.00");

	// public static String query = "\"nothing is impossible\"";
	public static void setWordCount(int i) {
		wordCount = i + 1;
	}

	public static void searchGoogle(TextBean bean) {
		try {
			Logger logger = LogManager.getLogger("Texting Log");
			logger.entry();
			Class.forName("com.mysql.jdbc.Driver");
			String db = "jdbc:mysql://localhost:3306/myturnitin";
			Connection conn = DriverManager.getConnection(db, "root", "9999");
			Statement statement = conn.createStatement();
			BufferedWriter out = new BufferedWriter(new FileWriter(
					"C:/Tomcat7/webapps/FinalWebSite/Result.txt"));
			BufferedWriter content = new BufferedWriter(new FileWriter(
					"C:/Tomcat7/webapps/FinalWebSite/Content.txt"));
			source = source.trim();
			// FileReader
			in = new BufferedReader(new FileReader(source));
			String text;
			while ((text = in.readLine()) != null) {
				content.write(text + " ");
				// sentence segmentation
				StringTokenizer info = new StringTokenizer(text,
						"\f\n\r\t.:;?![]'\"");
				while (info.hasMoreTokens()) {
					String query = "\"" + info.nextToken().trim() + "\"";

					// Word counting
					for (int k = 0; k < query.length(); k++) {
						if (query.substring(k, k + 1).equals(" "))
							countSpace++;
					}
					if (countSpace > 0)
						countSpace++;

					System.out.println("countSpace" + countSpace);
					System.out.println("wordCount" + wordCount);
					logger.info("Information level message:"
							+ "countSpace" + countSpace);
					logger.info("Information level message:"
							+ "wordSpace" + wordCount);
					if (countSpace >= wordCount) {

						// Testing url address
						// String address =
						// "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=";
						String address = "http://ajax.googleapis.com/ajax/services/search/patent?v=1.0&q=";
						String charset = "UTF-8";

						URL url = new URL(address
								+ URLEncoder.encode(query, charset));
						System.out.println(url);

						urlCount++;

						if (urlCount % 1 == 0)
							// // To avoid being regarded as an attack, the
							// // system
							// // will pause every 30 seconds.
							Thread.sleep(30000);

						if (urlCount % 10 == 0)
							// To avoid being regarded as an attack, the
							// system
							// will pause every 3 minutes.
							Thread.sleep(300000);

						Reader reader = new InputStreamReader(url.openStream(),
								charset);
						QueryFile results = new Gson().fromJson(reader,
								QueryFile.class);

						// Show title and URL of each results
						if (results.getResponseData().getResults().size() != 0) {
							// create sql
							String sql = "SELECT * FROM sentence WHERE sentences="
									+ query.toUpperCase();

							System.out.println(sql);
							ResultSet rs = statement.executeQuery(sql);
							if (!rs.next()) {

								conn.setAutoCommit(false);
								String insert = "insert into sentence(sentences, sentence_appearance,sentence_found,sentence_word) values(?,?,?,?)";
								PreparedStatement pStmt = conn
										.prepareStatement(insert);
								pStmt.setString(1,
										query.substring(1, query.length() - 1)
												.toUpperCase());
								pStmt.setInt(2, 1);
								pStmt.setString(3, results.getResponseData()
										.getCursor().getResultCount());
								pStmt.setInt(4, countSpace);
								pStmt.addBatch();
								int[] updateCounter = pStmt.executeBatch();
								conn.commit();
								pStmt.close();

							} else {
								conn.setAutoCommit(false);
								String update = "update sentence set sentence_appearance = sentence_appearance+1 where sentences=?";
								PreparedStatement pStmt = conn
										.prepareStatement(update);
								pStmt.setString(1,
										query.substring(1, query.length() - 1)
												.toUpperCase());
								pStmt.executeUpdate();
								int[] updateCounter = pStmt.executeBatch();
								conn.commit();

								pStmt.close();

							}
							countSpace = 0;
							urlFound++;
							for (int i = 0; i <= 0; i++) {
								logger.info("Information level message:"
										+ query
										+ "\nTitle: "
										+ Jsoup.parse(
												results.getResponseData()
														.getResults().get(i)
														.getTitle()).text());
								System.out.println(query
										+ "\nTitle: "
										+ Jsoup.parse(
												results.getResponseData()
														.getResults().get(i)
														.getTitle()).text());

								out.write((int) urlFound + ".   " + query);
								out.newLine();

								out.write("> Here are \""
										+ results.getResponseData().getCursor()
												.getResultCount()
										+ "\" the same sentence that can be found on the Internet.");
								out.newLine();
								out.write("\nOne of those sources shown below:");

								out.write("\nTitle: "
										+ Jsoup.parse(
												results.getResponseData()
														.getResults().get(i)
														.getTitle()).text());

								out.write("\nURL: \n"
										+ results.getResponseData()
												.getResults().get(i).getUrl());

								out.write("\nContent: "
										+ Jsoup.parse(
												results.getResponseData()
														.getResults().get(i)
														.getContent()).text()
										+ "\n");
								out.newLine();
								out.write("----------------------------------------------------------------------------------------------------------------------------------");
							}
						} else {
							// create sql
							String sql = "SELECT * FROM sentence WHERE sentences="
									+ query.toUpperCase();
							System.out.println(sql);
							logger.info("Information level message:"
									+ sql);
							logger.info("Information level message:" + sql);
							ResultSet rs = statement.executeQuery(sql);
							if (!rs.next()) {

								conn.setAutoCommit(false);
								String insert = "insert into sentence(sentences, sentence_appearance,sentence_found,sentence_word) values(?,?,?,?)";
								PreparedStatement pStmt = conn
										.prepareStatement(insert);
								pStmt.setString(1,
										query.substring(1, query.length() - 1)
												.toUpperCase());
								pStmt.setInt(2, 1);
								pStmt.setString(3, "null");
								pStmt.setInt(4, countSpace);
								pStmt.addBatch();
								int[] updateCounter = pStmt.executeBatch();
								conn.commit();
								pStmt.close();

							} else {
								conn.setAutoCommit(false);
								String update = "update sentence set sentence_appearance = sentence_appearance+1 where sentences=?";
								PreparedStatement pStmt = conn
										.prepareStatement(update);
								pStmt.setString(1,
										query.substring(1, query.length() - 1)
												.toUpperCase());
								pStmt.executeUpdate();
								int[] updateCounter = pStmt.executeBatch();
								conn.commit();

								pStmt.close();

							}

							System.out
									.println("The string can not be found on Google.\n");
							logger.info("Information level message:"
									+ "The string can not be found on Google.\n");
							out.write(query);
							// out.newLine();
							out.write("\n> Original Sentence.\n");
							out.newLine();
							out.write("----------------------------------------------------------------------------------------------------------------------------------");
						}
						logger.info("Information level message:"
								+ "Court Result:"
								+ results.getResponseData().getCursor()
										.getResultCount());
						System.out.println("Court Result:"
								+ results.getResponseData().getCursor()
										.getResultCount());
					} else if (countSpace != 0) {
						logger.info("Information level message:"
								+ "The sentence has to be more than or equal to three words.\n");
						System.out
								.println("The sentence has to be more than or equal to three words.\n");
						out.write(query);
						// out.newLine();
						out.write("\n> The sentence has to be more than or equal to "
								+ wordCount + " words.\n");
						out.newLine();
						out.write("----------------------------------------------------------------------------------------------------------------------------------");
					}
					countSpace = 0;
				}
				System.out.println(urlFound);
				System.out.println(urlCount);
				logger.info("Information level message: urlFound" + urlFound);
				logger.info("Information level message: urlCount" + urlCount);
				d = (urlFound / urlCount) * 100;
				logger.info("Information level message: percentage " + d);
				System.out.println(d);
				if (d == 0) {
					bean.setPercent(0.00);
				} else if ((urlCount == 0) && (urlFound == 0)) {
					bean.setPercent(0.00);
				} else {
					bean.setPercent(Double.parseDouble(df.format(d)));
				}
			}
			out.flush();
			out.close();
			content.flush();
			content.close();
			in.close();
			bean.setUrlCount((int) urlCount);
			bean.setUrlFound((int) urlFound);
			conn.close();
			statement.close();
			logger.exit();
		} catch (Exception ex) {
			StringWriter errors = new StringWriter();
			ex.printStackTrace(new PrintWriter(errors));
			
			Logger logger = LogManager.getLogger("Texting Log");
			logger.entry();
			
			logger.error((errors.toString()));
			
			logger.exit();
		}
	}

	public static void setPercentage(int per) {
		urlCount = per;
		urlFound = per;
		countSpace = per;

	}

	public ResponseData getResponseData() {
		return responseData;
	}

	public void setResponseData(ResponseData responseData) {
		this.responseData = responseData;
	}

	public Cursor getCursor() {
		return cursor;
	}

	public void setCursor(Cursor cursor) {
		this.cursor = cursor;
	}

	public String toString() {
		return "ResponseData[" + responseData + "]";
	}

	static class ResponseData {
		private List<Result> results;
		private Cursor cursor;

		public Cursor getCursor() {
			return cursor;
		}

		public void setCursor(Cursor cursor) {
			this.cursor = cursor;
		}

		public List<Result> getResults() {
			return results;
		}

		public void setResults(List<Result> results) {
			this.results = results;
		}

		public String toString() {
			return "Results[" + results + "]";
		}
	}

	static class Cursor {
		private String estimatedResultCount;

		public String getResultCount() {
			return estimatedResultCount;
		}

		public void setResultCount(String estimatedResultCount) {
			this.estimatedResultCount = estimatedResultCount;
		}
	}

	static class Result {
		private String url;
		private String title;
		private String content;

		public String getUrl() {
			return url;
		}

		public String getTitle() {
			return title;
		}

		public String getContent() {
			return content;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String toString() {
			return "Result[url:" + url + ",title:" + title + "]";
		}
	}

}
