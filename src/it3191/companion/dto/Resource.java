package it3191.companion.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="RESOURCE")
@PrimaryKeyJoinColumn(name="ACTIVITY_ID")
public class Resource extends Activity{
	
	@Column(name = "TITLE")
	private String title;
	
	@Column(name = "DESCRIPTION")
	private String description;
	
	@Column(name="DROPBOX_LINK")
	private String dropboxLink;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDropboxLink() {
		return dropboxLink;
	}

	public void setDropboxLink(String dropboxLink) {
		this.dropboxLink = dropboxLink;
	}
}
