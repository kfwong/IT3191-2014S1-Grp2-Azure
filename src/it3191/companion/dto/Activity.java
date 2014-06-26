package it3191.companion.dto;

import java.util.Date;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.InheritanceType;

@Entity
@Table(name = "ACTIVITY")
@Inheritance(strategy=InheritanceType.JOINED)
public class Activity {

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private int id;
	
	@ElementCollection(fetch=FetchType.EAGER)
	@CollectionTable(name="ACTIVITY_TAG", joinColumns=@JoinColumn(name="ACTIVITY_ID"))
	@Column(name="TAG")
	private List<String> tags;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="USER_ID")
	private User createdBy;
	
	@Column(name="DATE_CREATED")
	private Date createdOn;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<String> getTags() {
		return tags;
	}

	public void setTags(List<String> tags) {
		this.tags = tags;
	}

	public User getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	
	
}
