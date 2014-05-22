package it3191.companion.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "USER")
public class User {

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private int id;

	@Column(name = "FIRST_NAME")
	private String firstName;
	
	@Column(name = "LAST_NAME")
	private String lastName;

	@Column(name = "GENDER")
	private String gender;

	@Column(name = "USERNAME")
	private String userName;

	@Column(name = "PASSWORD_SHA1")
	private String passwordSHA1;
	
	@Column(name = "PASSWORD_MD5")
	private String passwordMD5;
	
	@Column(name = "PASSWORD_HASH")
	private String passwordHash;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "LOCATION")
	private String location;
	
	@Column(name = "DOB")
	private String dob;
	
	@Column(name = "HANDPHONENO")
	private String handphoneNo;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPasswordSHA1() {
		return passwordSHA1;
	}

	public void setPasswordSHA1(String passwordSHA1) {
		this.passwordSHA1 = passwordSHA1;
	}

	public String getPasswordMD5() {
		return passwordMD5;
	}

	public void setPasswordMD5(String passwordMD5) {
		this.passwordMD5 = passwordMD5;
	}
	
	public void setPasswordHash(String passwordHash){
		this.passwordHash= passwordHash;
	}
	
	public String getPasswordHash(){
		return passwordHash;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getDob(){
		return dob;
	}
	
	public void setDob(String dob){
		this.dob=dob;
	}
	
	public String getHandphoneNo(){
		return handphoneNo;
	}
	
	public void setHandphoneNo(String handphoneNo){
		this.handphoneNo=handphoneNo;
	}
	
}
