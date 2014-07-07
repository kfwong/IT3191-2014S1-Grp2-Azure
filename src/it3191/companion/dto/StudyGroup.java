package it3191.companion.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

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
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "id", cascade = CascadeType.ALL)
	@Column(name="PARTICIPANT")
	private List<User> participant;

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

	public void setStart(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateInString = dateStr;
		Date date = null;
		try {
			date = sdf.parse(dateInString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.start = date;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateInString = dateStr;
		Date date = null;
		try {
			date = sdf.parse(dateInString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.end = date;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(String allDayStr) {
		boolean allDay;
		if(allDayStr != null && allDayStr.equals("true")){
			allDay = true;
		}
		else{
			allDay = false;
		}
		this.allDay = allDay;
	}

	public List<User> getParticipant() {
		return participant;
	}

	public void setParticipant(List<User> participant) {
		this.participant = participant;
	}

	

}
