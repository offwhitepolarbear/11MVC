package example;

import java.util.Date;

public class ChatRoom {

	int chatRoomNo;
	String chatRoonName;
	int userNo;
	
	Date regDate;
	
	public ChatRoom() {
		// TODO Auto-generated constructor stub
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public String getChatRoonName() {
		return chatRoonName;
	}

	public void setChatRoonName(String chatRoonName) {
		this.chatRoonName = chatRoonName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ChatRoom [chatRoomNo=" + chatRoomNo + ", chatRoonName=" + chatRoonName + ", userNo=" + userNo
				+ ", regDate=" + regDate + "]";
	}
	
}
