package it3191.companion.dto;

public enum Role {
	//Administrator, restricted to administrator accounts only
	ADMIN,
	//Regular user, most accounts should be assigned this role by default
	REGULAR,
	//Guest, for temporary visitors
	GUEST,
	//Special role for the almighty AmuletxHeart only
	AMULETXHEART
}
