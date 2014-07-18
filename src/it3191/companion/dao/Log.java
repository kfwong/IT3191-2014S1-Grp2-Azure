package it3191.companion.dao;

import java.util.Date;

public class Log {
	private String level;
	private Date dateLogged;
	private String action;
	private String message;
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public Date getDateLogged() {
		return dateLogged;
	}
	public void setDateLogged(Date dateLogged) {
		this.dateLogged = dateLogged;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
