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
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

@Entity
@Table(name = "STUDY_GROUP")
@PrimaryKeyJoinColumn(name = "ID")
public class StudyGroup extends Activity{

	@Column(name="TITLE")
	private String title;
	
	@Column(name="START")
	private Date start;
	
	@Column(name="END")
	private Date end;
	
	@Column(name="ALL_DAY")
	private boolean allDay;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
			name = "STUDY_GROUP_PARTICIPANT", 
			joinColumns = {	@JoinColumn(name = "STUDY_GROUP_ID")}, 
			inverseJoinColumns = { @JoinColumn(name = "PARTICIPANT_ID") })
	private List<User> participants;

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

	public List<User> getParticipants() {
		return participants;
	}

	public void setParticipants(List<User> participants) {
		this.participants = participants;
	}
	
	public boolean isParticipantExist(User user){
		boolean participantExist = false;
		
		for(User participant:participants){
			if(participant.getId() == user.getId()){
				participantExist = true;
				break;
			}
			else{
				participantExist = false;
			}
		}
		
		return participantExist;
	}
	
	public boolean addParticipant(User user){
		boolean success = false;
		
		if(!isParticipantExist(user)){
			participants.add(user);
			success = true;
		}
		
		return success;
	}
	
	public boolean removeParticipant(User user){
		boolean success = false;
		
		if(isParticipantExist(user)){
			for(int i=0; i<participants.size(); i++){
				User participant = participants.get(i);
				if(participant.getId() == user.getId()){
					participants.remove(i);
					success = true;
					break;
				}
			}
		}
		
		return success;
	}
	
	public boolean isOwner(User user){
		boolean success = false; 
		
		if(getCreatedBy().getId() == user.getId()){
			success = true;
		}
		else{
			success = false;
		}
		
		return success;
	}
}
