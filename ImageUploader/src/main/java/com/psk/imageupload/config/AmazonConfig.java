package com.psk.imageupload.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@Configuration
public class AmazonConfig {
	
	//S3 클라이언트 설정
	@Bean
	public AmazonS3 s3() {
		

//본인의 accessKey,secretKey 참고
		String accessKey="";
		String secretKey="";
		
		AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);
		
		
		return AmazonS3ClientBuilder
				.standard()
				.withRegion("ap-northeast-2")
				//Region Config (지역 설정) : Asia Pacific Seoul
				.withCredentials(
						new AWSStaticCredentialsProvider(awsCredentials)
						)
				.build();
	}
}
