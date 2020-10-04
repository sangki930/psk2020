package com.psk.imageupload.datastore;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Repository;

import com.psk.imageupload.profile.UserProfile;

/*
 * Create in-memory database
 * 가상 DB
 */
@Repository
public class FakeUserProfileDataStore {

	private static final List<UserProfile> USER_PROFILES = new ArrayList<>();
	
	static {
//		USER_PROFILES.add(new UserProfile(UUID.randomUUID(),
//				"sangki",null));
//		USER_PROFILES.add(new UserProfile(UUID.randomUUID(),
//				"psk",null));
		USER_PROFILES.add(new UserProfile(UUID.fromString("bd1c9a47-fdd4-4c0d-92de-45bc4c43824a"),
				"sangki",null));
		USER_PROFILES.add(new UserProfile(UUID.fromString("99787ce7-574e-4e41-a01a-4b155042ed96"),
				"psk",null));
	}
	
	public List<UserProfile> getUserProfiles(){
		return USER_PROFILES;
	}
}
