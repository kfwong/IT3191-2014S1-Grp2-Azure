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

import com.google.gson.annotations.Expose;


@Entity
@Table(name="COMMENT")
public class Comment{
	
	@Expose
	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@Expose
	@Column(name="CONTENT")
	private String content;
	
	@Expose
	@Column(name="DATE_COMMENTED")
	private Date commentedOn;
	
	@Expose
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="USER_ID")
	private User commentedBy;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="ACTIVITY_ID")
	private Activity activity;
	
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

	public User getCommentedBy() {
		return commentedBy;
	}

	public void setCommentedBy(User commentedBy) {
		this.commentedBy = commentedBy;
	}

	public Date getCommentedOn() {
		return commentedOn;
	}

	public void setCommentedOn(Date commentedOn) {
		this.commentedOn = commentedOn;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}


	
}
