package example;

import java.util.Date;

public class Chat {
	
	int chatNo;
	int chatRoomNo;
	int userNo;

	String chatType;
	String chat;
	
	Date inputDate;
	
	public Chat() {
		// TODO Auto-generated constructor stub
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getChatType() {
		return chatType;
	}

	public void setChatType(String chatType) {
		this.chatType = chatType;
	}

	public String getChat() {
		return chat;
	}

	public void setChat(String chat) {
		this.chat = chat;
	}

	public Date getInputDate() {
		return inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}
	
	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", chatRoomNo=" + chatRoomNo + ", userNo=" + userNo + ", chatType=" + chatType
				+ ", chat=" + chat + ", inputDate=" + inputDate + "]";
	}

}
