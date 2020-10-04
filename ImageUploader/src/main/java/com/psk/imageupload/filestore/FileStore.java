package com.psk.imageupload.filestore;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;

//FileStore Service
@Service
public class FileStore {

	private final AmazonS3 s3;
	
	@Autowired
	public FileStore(AmazonS3 s3)
	{
		this.s3=s3;
	}
	
	public void save(String path, String fileName, Optional<Map<String,String>> optionalMetadata
			,InputStream inputStream) {
		
		ObjectMetadata objectMetadata = new ObjectMetadata();
		
		//isPresent :
		//map->key : metadata key, value : metadata value
		optionalMetadata.ifPresent(map->{
			if(!map.isEmpty()) {
//				map.forEach((key,value)->{
//					objectMetadata.addUserMetadata(key, value);
//				});
				map.forEach(objectMetadata::addUserMetadata);
			}
		});
		
		try {
			s3.putObject(path, fileName, inputStream, objectMetadata);
			
			
		}catch(AmazonServiceException e) {
			//if Service Failed to store file
			throw new IllegalStateException("Failed to store file to s3",e);
		}
	}

	public byte[] download(String path,String key) {
		// TODO Auto-generated method stub
		try {
			S3Object obj = s3.getObject(path,key);
			S3ObjectInputStream is = obj.getObjectContent();
			return IOUtils.toByteArray(is);
		}catch(AmazonServiceException | IOException e) {
			throw new IllegalArgumentException("Failed to download file to s3",e);
		}
	
	}
}
