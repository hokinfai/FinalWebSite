package fyp;

public class TextBean {
	private double percent;
	private int urlCount, urlFound;
	private String fileName, fileType, wordLimit, userFile, email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getPercent() {
		return percent;
	}

	public String getUserFile() {
		return userFile;
	}

	public void setUserFile(String userFile) {
		this.userFile = userFile;
	}

	public void setPercent(double percent) {
		this.percent = percent;
	}

	public int getUrlCount() {
		return urlCount;
	}

	public void setUrlCount(int urlCount) {
		this.urlCount = urlCount;
	}

	public int getUrlFound() {
		return urlFound;
	}

	public void setUrlFound(int urlFound) {
		this.urlFound = urlFound;
	}

	public String getWordLimit() {
		return wordLimit;
	}

	public void setWordLimit(String wordLimit) {
		this.wordLimit = wordLimit;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
}