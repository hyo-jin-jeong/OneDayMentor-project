package apply;

public class Apply {
	private int applyID;
	private int bbsID;
	private int categoryID;
	private String menteeID;
	private String mentorID;
	private String writingTitle;
	private String writingContent;
	private int applyAvailable;
	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public int getApplyID() {
		return applyID;
	}
	public void setApplyID(int applyID) {
		this.applyID = applyID;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public String getMenteeID() {
		return menteeID;
	}
	public void setMenteeID(String menteeID) {
		this.menteeID = menteeID;
	}
	public String getMentorID() {
		return mentorID;
	}
	public void setMentorID(String mentorID) {
		this.mentorID = mentorID;
	}
	public String getWritingContent() {
		return writingContent;
	}
	public void setWritingContent(String writingContent) {
		this.writingContent = writingContent;
	}
	public String getWritingTitle() {
		return writingTitle;
	}
	public void setWritingTitle(String writingTitle) {
		this.writingTitle = writingTitle;
	}
	public int getApplyAvailable() {
		return applyAvailable;
	}
	public void setApplyAvailable(int applyAvailable) {
		this.applyAvailable = applyAvailable;
	}
}
