package it3191.companion.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ACTIVITY")
public class Activity {
	
	public static final int LOOKING_FOR_TUTOR = 1;
	public static final int FORMED_A_STUDY_GROUP = 2;
	public static final int SHARED_A_PROJECT = 3;
	public static final int SHARED_A_WRITTEN_ASSIGNENT = 4;
	public static final int SHARED_A_STUDY_NOTE = 5;

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private int id;
	
	@Column(name = "CONTENT")
	private String content;
	
	@Column(name = "TYPE")
	private int type;
	
	@Column(name = "DROPBOX_PUBLIC_URL")
	private String dropboxPublicUrl;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="USER_ID")
	private User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getDropboxPublicUrl() {
		return dropboxPublicUrl;
	}

	public void setDropboxPublicUrl(String dropboxPublicUrl) {
		this.dropboxPublicUrl = dropboxPublicUrl;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
