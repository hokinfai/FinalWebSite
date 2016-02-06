package fyp;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TestLog {
	public static void main(String args[]) {
		Logger logger = LogManager.getLogger("Texting Log");
		logger.entry();
		logger.debug("Debug level message:");
		logger.error("Error level message:");
		logger.info("Information level message:");
		logger.exit();
	}
}
