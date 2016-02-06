package fyp;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean isMultipart;
	private int maxFileSize = 500 * 1024;
	private int maxMemSize = 4 * 1024;
	private String fileName = "\\";
	private File file;
	private String filePath = "C:\\temp\\";
	private int j = 0;
	private String originalFileName;
	private List<List<String>> table = new ArrayList<List<String>>();
	private static XWPFDocument documentDocx;
	private static HWPFDocument documentDoc;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		try {
			String wordLimit = null;
			TextBean bean = new TextBean();
			isMultipart = ServletFileUpload.isMultipartContent(request);
			response.setContentType("text/html");

			PrintWriter out = response.getWriter();
			if (!isMultipart) {
				out.println("<html>");
				out.println("<head>");
				out.println("<title>Servlet upload</title>");
				out.println("</head>");
				out.println("<body>");
				out.println("<p>No file uploaded</p>");
				out.println("</body>");
				out.println("</html>");
				return;
			}
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// maximum size that will be stored in memory
			factory.setSizeThreshold(maxMemSize);
			// Location to save data that is larger than maxMemSize.
			factory.setRepository(new File("C:\\temp"));
			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			// maximum file size to be uploaded.
			upload.setSizeMax(maxFileSize);
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);
			// Process the uploaded file items
			Iterator item = fileItems.iterator();
			System.out.println();
			System.out.println();
			while (item.hasNext()) {
				FileItem fi = (FileItem) item.next();
				if (!fi.isFormField()) {
					fileName = fi.getName();
					bean.setUserFile(fileName);
					originalFileName = fileName;
					if (new File(filePath + fileName).exists()) {
						fileName = "(" + j + ")" + fileName;
						j++;
					}
					Logger logger = LogManager.getLogger("Texting Log");
					logger.entry();
					logger.info("Information level message:" + "file path: "
							+ filePath);
					logger.info("Information level message:" + "file name: "
							+ fileName);

					System.out.println(filePath);
					System.out.println(fileName);
					file = new File(filePath + fileName);
					fi.write(file);
					System.out.println("Uploaded Filename: " + filePath
							+ fileName);
					logger.info("Information level message:"
							+ "Uploaded Filename: " + filePath + fileName);
					logger.exit();
				} else {
					if (fi.getFieldName().equals("limit")) {
						wordLimit = fi.getString();
						System.out.println("wordLimit: " + wordLimit);
					}
				}
			}

			// Parser method parameters

			// showing pdf metadata
			if (fileName.endsWith("pdf")) {
				bean.setFileName(filePath + fileName);
				bean.setWordLimit(wordLimit);

				bean.setFileType("pdf");
			}
			// showing txt metadata
			else if (fileName.endsWith("txt")) {
				bean.setFileType("txt");
				bean.setFileName(filePath + fileName);
				bean.setWordLimit(wordLimit);

			}

			// showing word metadata
			else if (fileName.endsWith("doc") || fileName.endsWith("docx")) {
				if (fileName.endsWith("doc"))
					bean.setFileType("doc");
				else
					bean.setFileType("txt");
				bean.setFileName(filePath + fileName);
				bean.setWordLimit(wordLimit);

			}

			HttpSession session = request.getSession(true);
			session.setAttribute("Bean", bean);
			System.out.println(bean.getPercent());

			// response.sendRedirect("sendemail.jsp");

			response.sendRedirect("txtProperty.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
