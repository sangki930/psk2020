package com.psk.imageupload.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.psk.imageupload.datastore.FakeUserProfileDataStore;
import com.psk.imageupload.profile.UserProfile;

//UserProfileDataAccessService
@Repository
public class UserProfileRepository {
	private final FakeUserProfileDataStore fakeUserProfileDataStore;

	@Autowired
	public UserProfileRepository(FakeUserProfileDataStore fakeUserProfileDataStore) {
		this.fakeUserProfileDataStore = fakeUserProfileDataStore;
	}
	
	public List<UserProfile> getUserProfiles(){
		return fakeUserProfileDataStore.getUserProfiles();
	}
	
	
}
