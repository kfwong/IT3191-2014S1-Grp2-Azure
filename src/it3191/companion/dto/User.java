package it3191.companion.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "USER")
public class User {

	@Expose
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private int id;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "ROLE")
	private Role role;

	@Expose
	@Column(name = "FIRST_NAME")
	private String firstName;
	
	@Expose
	@Column(name = "LAST_NAME")
	private String lastName;

	@Expose
	@Column(name = "GENDER")
	private String gender;

	@Column(name = "PASSWORD_SHA1")
	private String passwordSHA1;

	@Expose
	@Column(name = "EMAIL")
	private String email;

	@Expose
	@Column(name = "LOCATION")
	private String location;
	
	@Expose
	@Column(name = "BIRTHDAY")
	private Date birthday;
	
	@Expose
	@Column(name = "HANDPHONENO")
	private String handphoneNo;
	
	@Column(name = "FACEBOOK_ID")
	private String facebookId;
	
	@Column(name = "SALT")
	private String salt;
	
	@Column(name = "SECURITY_QUESTION")
	private int securityQuestion;
	
	@Column(name = "ANSWER")
	private String answer;
	
	@Column(name = "FORGET_PASSWORD_SESSION_KEY")
	private String forgetPasswordSessionKey;
	
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

	public String getPasswordSHA1() {
		return passwordSHA1;
	}

	public void setPasswordSHA1(String passwordSHA1) {
		this.passwordSHA1 = passwordSHA1;
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
	
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getFacebookId() {
		return facebookId;
	}

	public void setFacebookId(String facebookId) {
		this.facebookId = facebookId;
	}

	public String getHandphoneNo(){
		return handphoneNo;
	}
	
	public void setHandphoneNo(String handphoneNo){
		this.handphoneNo=handphoneNo;
	}

	public String getSalt(){
		return salt;
	}
	
	public void setSalt(String salt){
		this.salt=salt;
	}
	
	
	
	public int getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(int securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public String getAnswer(){
		return answer;
	}
	public void setAnswer(String answer){
		this.answer=answer;
	}

	public String getForgetPasswordSessionKey() {
		return forgetPasswordSessionKey;
	}

	public void setForgetPasswordSessionKey(String forgetPasswordSessionKey) {
		this.forgetPasswordSessionKey = forgetPasswordSessionKey;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	public boolean isRole(Role role){
		if(this.role == role){
			return true;
		}
		else{
			return false;
		}
	}
	
	public boolean isAdmin(){
		if(this.role == Role.ADMIN){
			return true;
		}
		else{
			return false;
		}
	}
	
	public boolean isRegular(){
		if(this.role == Role.REGULAR){
			return true;
		}
		else{
			return false;
		}
	}
	
	public boolean isGuest(){
		if(this.role == Role.GUEST){
			return true;
		}
		else{
			return false;
		}
	}
}
