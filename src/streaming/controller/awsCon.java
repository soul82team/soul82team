package streaming.controller;
//package Streaming.controller;
//
//import java.io.ByteArrayInputStream;
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.amazonaws.ClientConfiguration;
//import com.amazonaws.Protocol;
//import com.amazonaws.auth.AWSCredentials;
//import com.amazonaws.auth.BasicAWSCredentials;
//import com.amazonaws.services.s3.AmazonS3;
//import com.amazonaws.services.s3.AmazonS3Client;
//import com.amazonaws.services.s3.model.Bucket;
//import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
//import com.amazonaws.services.s3.model.ObjectMetadata;
//
//@Controller
//public class awsCon {
//	@Autowired
//	AmazonS3 conn;
//
//	
//	public class S3Util {
//
//		String accessKey = "AKIAIP2W56CA67LS4J7Q";
//		String secretKey = "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";
//
//		private AmazonS3 conn;
//
//		public S3Util() {
//			AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
//			ClientConfiguration clientConfig = new ClientConfiguration();
//			clientConfig.setProtocol(Protocol.HTTP);
//			this.conn = new AmazonS3Client(credentials, clientConfig);
//			conn.setEndpoint("s3-ap-northeast-1.amazonaws.com");
//		}
//
//		// Bucket List
//		public List<Bucket> getBucketList() {
//			return conn.listBuckets();
//		}
//
//		// Bucket 생성
//		public Bucket createBucket(String bucketName) {
//			return conn.createBucket(bucketName);
//		}
//
//		// 폴더 생성 (폴더는 파일명 뒤에 "/"를 붙여야한다.)
//		public void createFolder(String bucketName, String folderName) {
//			conn.putObject(bucketName, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
//		}
//
//		// 파일 업로드
//		public void fileUpload(String bucketName, File file) throws FileNotFoundException {
//			conn.putObject(bucketName, file.getName(), new FileInputStream(file), new ObjectMetadata());
//		}
//
//		// 파일 삭제
//		public void fileDelete(String bucketName, String fileName) {
//			conn.deleteObject(bucketName, fileName);
//		}
//
//		// 파일 URL
//		public String getFileURL(String bucketName, String fileName) {
//			return conn.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, fileName)).toString();
//		}
//
//	}
//
//	
//	@RequestMapping("/aws")
//	public void s3() {
//		S3Util s3 = new S3Util();
//
//		List<Bucket> list = s3.getBucketList();
//
//		// 첫번째 Bucket
//		String bucketName = list.get(0).getName().toString();
//		System.out.println("Bucket Name : " + bucketName);
//
//		// Bucket 생성(대문자는 포함되면 안됨.)
//		for (int i = 0; i < 3; i++) {
//			s3.createBucket("wonier-test-bucket" + i);
//		}
//
//		// 폴더 생성
//		for (int i = 0; i < 3; i++) {
//			s3.createFolder(bucketName, "woniper-test-folder" + i);
//		}
//
//		// 파일 업로드
//		String fileName = "/Users/woniper/Downloads/aws-java-sdk-1.8.4.zip";
//		try {
//			s3.fileUpload(bucketName, new File(fileName));
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println(s3.getFileURL(bucketName, "aws-java-sdk-1.8.4.zip"));
//
//	}
//}
