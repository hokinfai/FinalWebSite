package fyp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String wordLimit = request.getParameter("limit") == null ? "1"
					: request.getParameter("limit");
			String text = request.getParameter("querySentence") == null ? "nothing"
					: request.getParameter("querySentence");
			TextBean bean = (new QuerySentence(wordLimit, text))
					.querySentence();
			HttpSession session = request.getSession(true);
			session.setAttribute("Bean", bean);
			System.out.println(bean.getPercent());
			ConvertPdf.ConvertPdf("C:/Tomcat7/webapps/FinalWebSite/Result.txt",
					bean.getUrlCount(), bean.getUrlFound(), bean.getPercent(), "Not Suitable",(String) session.getAttribute("userName"));
			sendEmail.sendEmail((String) session.getAttribute("email"));
			response.sendRedirect("index.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
