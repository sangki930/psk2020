package com.psk.imageupload.bucket;

import lombok.Getter;

public enum BucketName {
	//S3 bucket image name
	PROFILE_IMAGE("psk101-image-upload-123");
	
	@Getter
	private final String bucketName;

	
	BucketName(String bucketName) {
		// TODO Auto-generated constructor stub
		this.bucketName=bucketName;
	}

	

}
