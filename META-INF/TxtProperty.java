package fyp;


import java.io.File;
import java.nio.file.Path;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Parser;

public class TxtProperty {
	public static void Txtproperty(String path,String name) {

		try {
			List<List<String>> table = new ArrayList<List<String>>();
			List<String> record = new ArrayList<String>();
			File file = new File(path);
			  //Parser method parameters
		     
		      
		     
			
			record.add("<font face=\"verdana\" color=\"#0F5A54\" font size=\"4\"><b>"
+"fsdafsadfasdf"
					+ "</b></font>");
			record.add("<font face=\"verdana\" color=\"#8908E6\" font size=\"3\"><b>Title:&nbsp; </b></font>");
			record.add("<font face=\"verdana\" color=\"#E608C4\" font size=\"3\"><b>URL:&nbsp; </b></font>");
			record.add("<font face=\"verdana\" color=\"#08AEE6\" font size=\"3\"><b>Content:&nbsp; </b></font>"

					+ "\n\n");
			table.add(record);
		} catch (Exception e) {
			System.out.println("Error  " + e.getMessage());
			e.printStackTrace();// print the error
		}
	}

}