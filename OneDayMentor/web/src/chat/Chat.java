package chat;

public class Chat {
	private String startTime;
	private int applyID;
	private int chatUnavailable;
	private int EthReceipt;
	
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public int getApplyID() {
		return applyID;
	}

	public void setApplyID(int applyID) {
		this.applyID = applyID;
	}

	public int getChatUnavailable() {
		return chatUnavailable;
	}

	public void setChatUnavailable(int chatUnavailable) {
		this.chatUnavailable = chatUnavailable;
	}

	public int getEthReceipt() {
		return EthReceipt;
	}

	public void setEthReceipt(int ethReceipt) {
		EthReceipt = ethReceipt;
	}

}