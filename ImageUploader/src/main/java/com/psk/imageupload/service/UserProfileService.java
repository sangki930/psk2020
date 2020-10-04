package com.psk.imageupload.service;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.apache.http.entity.ContentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.psk.imageupload.bucket.BucketName;
import com.psk.imageupload.filestore.FileStore;
import com.psk.imageupload.profile.UserProfile;
import com.psk.imageupload.repository.UserProfileRepository;

@Service
public class UserProfileService {

	private final UserProfileRepository userProfileRepository;
	private final FileStore fileStore;
	
	@Autowired
	public UserProfileService(UserProfileRepository userProfileRepository
			,FileStore fileStore) {
		this.userProfileRepository = userProfileRepository;
		this.fileStore=fileStore;
	}
	
	public List<UserProfile> getUserProfiles(){
		return userProfileRepository.getUserProfiles();
	}

	public void uploadUserProfileImage(UUID userProfileId, MultipartFile file) {
		// TODO Auto-generated method stub
		// 1. Check if image is not empty
		if(file.isEmpty())
			throw new IllegalStateException("Cannot upload empty file ["+file.getSize()+"]");
		
		List<ContentType> imgformat = Arrays.asList(
				ContentType.IMAGE_JPEG,
				ContentType.IMAGE_BMP,
				ContentType.IMAGE_PNG,
				ContentType.IMAGE_GIF
				);
		
		// 2. If file is an image
		if(!Arrays.asList(
				ContentType.IMAGE_JPEG.getMimeType(),
				ContentType.IMAGE_BMP.getMimeType(),
				ContentType.IMAGE_PNG.getMimeType(),
				ContentType.IMAGE_GIF.getMimeType()
				).contains(file.getContentType()))
			throw new IllegalStateException("File must be image ["
				+file.getContentType()+"]");
		
		
		// 3. The user exists in our database
		UserProfile user = userProfileRepository.getUserProfiles()
		.stream()
		.filter(userProfile->userProfile.getUserProfileId().equals(userProfileId))
		.findFirst()
		.orElseThrow(()->
		new IllegalStateException(
				String.format("User profile %s not found", 
						userProfileId)));
		
		
		// 4. Grab some metadata from file if any
		
		Map<String,String> metadata = new HashMap<>();
		
		metadata.put("Content-Type", file.getContentType());
		metadata.put("Content-Length", String.valueOf(file.getSize()));
		
		
		// 5. Store the image in s3 and update database (userProfileImageLink) with s3 image link
		String path=
				String.format("%s/%s", BucketName.PROFILE_IMAGE.getBucketName(),user.getUserProfileId());
//		String fileName=
//				String.format("%s-%s", file.getName(),UUID.randomUUID());
		String fileName=
				String.format("%s-%s", file.getOriginalFilename(),UUID.randomUUID());
		
		try {
			fileStore.save(path, fileName, Optional.of(metadata), 
					file.getInputStream());
			user.setUserProfileImageLink(fileName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new IllegalStateException(e);
		}
		
		
	}

	public byte[] downloadUserProfileImage(UUID userProfileId) {
		// TODO Auto-generated method stub
		UserProfile user = getUserProfileOrThrow(userProfileId);
		String path=
				String.format("%s/%s", BucketName.PROFILE_IMAGE.getBucketName()
						,user.getUserProfileId()
						,user.getUserProfileImageLink());
		
        return user.getUserProfileImageLink()
                .map(key -> fileStore.download(path, key))
                .orElse(new byte[0]);	
        }
	
	private UserProfile getUserProfileOrThrow(UUID userProfileId) {
        return userProfileRepository
                .getUserProfiles()
                .stream()
                .filter(userProfile -> userProfile.getUserProfileId().equals(userProfileId))
                .findFirst()
                .orElseThrow(() -> new IllegalStateException(String.format("User profile %s not found", userProfileId)));
    }
	
}
