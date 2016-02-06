package fyp;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.FontSelector;
import com.itextpdf.text.pdf.PdfWriter;

public class ConvertPdf {

	public static void ConvertPdf(String path, int urlCount, int urlFound,
			double percent, String file, String userName) {
		try {

			String size;
			Path location = Paths.get(path);

			BasicFileAttributes basicAttributes = Files.readAttributes(
					location, BasicFileAttributes.class);
			if (file.equalsIgnoreCase("Not Suitable")) {
				size = "Not Suitable";
			} else {
				size = String.valueOf(basicAttributes.size() + " bits");
			}
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Document document = new Document(PageSize.A4, 35, 35, 40, 60);
			PdfWriter writer = PdfWriter.getInstance(document,
					new FileOutputStream(
							"C:/Tomcat7/webapps/FinalWebSite/Result.pdf"));

			document.open();
			FileReader fr = new FileReader(path);
			FileReader confr = new FileReader(
					"C:/Tomcat7/webapps/FinalWebSite/Content.txt");

			// change title color and size
			FontSelector selectTitle = new FontSelector();
			com.itextpdf.text.Font title = FontFactory.getFont(
					FontFactory.TIMES_ROMAN, 26, Font.BOLD | Font.UNDERLINE);
			title.setColor(BaseColor.ORANGE);
			selectTitle.addFont(title);
			Paragraph resultTitle = new Paragraph(
					selectTitle
							.process("                             My Turnitin\u00a9                           "));
			resultTitle.setAlignment(Element.ALIGN_CENTER);
			document.add(resultTitle);
			document.add(Chunk.NEWLINE);

			// Insert file property

			FontSelector property = new FontSelector();
			com.itextpdf.text.Font pro = FontFactory.getFont(
					FontFactory.TIMES_ROMAN, 14);
			pro.setColor(BaseColor.GRAY);
			property.addFont(pro);
			Paragraph showProperty = new Paragraph(property.process("User: "
					+ userName + "\nFile Name: " + file + "\nFile Size: "
					+ size + "\nUpload Time: " + dateFormat.format(new Date())));
			showProperty.setAlignment(Element.ALIGN_RIGHT);
			document.add(showProperty);
			document.add(Chunk.NEWLINE);

			// change Content color and size
			FontSelector content = new FontSelector();
			com.itextpdf.text.Font con = FontFactory.getFont(
					FontFactory.TIMES_ROMAN, 16, Font.BOLD);
			con.setColor(BaseColor.DARK_GRAY);
			content.addFont(con);
			Paragraph showContent = new Paragraph(
					content.process("The Content of the Document"));
			showContent.setAlignment(Element.ALIGN_LEFT);
			document.add(showContent);

			// writing content of the document
			BufferedReader brr = new BufferedReader(confr);
			String recordd = new String();
			document.add(Chunk.NEWLINE);
			while ((recordd = brr.readLine()) != null) {

				Paragraph para = new Paragraph(recordd + "\n");
				para.setAlignment(Element.ALIGN_JUSTIFIED);
				document.add(para);
			}
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE);

			// change result title color and size
			FontSelector internetTitle = new FontSelector();
			com.itextpdf.text.Font inter = FontFactory.getFont(
					FontFactory.TIMES_ROMAN, 16, Font.BOLD);
			inter.setColor(BaseColor.DARK_GRAY);
			internetTitle.addFont(inter);
			Paragraph showTitle = new Paragraph(
					internetTitle
							.process("The Result returned form My Turnitin"));
			showTitle.setAlignment(Element.ALIGN_LEFT);
			document.add(showTitle);
			document.add(Chunk.NEWLINE);
			// writing result
			BufferedReader br = new BufferedReader(fr);
			String record = new String();

			while ((record = br.readLine()) != null) {

				Paragraph para = new Paragraph(record + "\n");
				para.setAlignment(Element.ALIGN_JUSTIFIED);
				document.add(para);
			}
			document.add(Chunk.NEWLINE);

			// change Number of Url color
			FontSelector noOfSen = new FontSelector();
			com.itextpdf.text.Font fontNum = FontFactory.getFont(
					FontFactory.TIMES_ROMAN, 12);
			fontNum.setColor(BaseColor.BLUE);
			noOfSen.addFont(fontNum);
			Phrase phrase = noOfSen.process("Number of Sentences:   "
					+ urlCount + "     Number of Sentences found:    "
					+ urlFound);
			Paragraph url = new Paragraph(phrase);
			url.setAlignment(Element.ALIGN_CENTER);
			document.add(url);

			// change percentage color
			FontSelector selector = new FontSelector();
			com.itextpdf.text.Font fontper = FontFactory.getFont(
					FontFactory.TIMES_ROMAN, 12);
			if (percent > 50.00)
				fontper.setColor(BaseColor.RED);
			else
				fontper.setColor(BaseColor.GREEN);
			selector.addFont(fontper);
			Phrase ph = selector.process("Percentage of Plagiarism:   "
					+ percent + "%");
			Paragraph percentage = new Paragraph(ph);
			percentage.setAlignment(Element.ALIGN_CENTER);
			document.add(percentage);

			// Finish adding document
			fr.close();
			confr.close();
			br.close();
			brr.close();
			document.close();

			System.out.println("closed");
			Runtime.getRuntime().exec(
					"rundll32 url.dll,FileProtocolHandler "
							+ "C:/Tomcat7/webapps/FinalWebSite/Result.pdf");
		} catch (Exception e) {
			System.out.println("Error  " + e.getMessage());
			e.printStackTrace();// print the error
		}
	}
}