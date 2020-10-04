package com.psk.imageupload.profile;

import java.util.Objects;
import java.util.Optional;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class UserProfile {

	private UUID userProfileId;
	private String username;
	private String userProfileImageLink;//S3 Key
	
	//getter
	public Optional<String> getUserProfileImageLink(){
		return Optional.ofNullable(userProfileImageLink);
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userProfileId == null) ? 0 : userProfileId.hashCode());
		result = prime * result + ((userProfileImageLink == null) ? 0 : userProfileImageLink.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserProfile other = (UserProfile) obj;
		return Objects.equals(userProfileId, other.userProfileId) &&
				Objects.equals(username, other.username) &&
				Objects.equals(userProfileImageLink,other.userProfileImageLink);
		
		/*
		 * Objects.equals(Object a, Object b){
		 * 
		 * return (a==b) || (a!=null && a.equals(b));
		 * }
		 * 
		 * */
	}
	
	
}
