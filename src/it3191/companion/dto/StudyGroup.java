package it3191.companion.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "STUDY_GROUP")
public class StudyGroup {

	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;

	@Column(name="TITLE")
	private String title;
	
	@Column(name="START")
	private Date start;
	
	@Column(name="END")
	private Date end;
	
	@Column(name="ALL_DAY")
	private boolean allDay;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	
	
}
