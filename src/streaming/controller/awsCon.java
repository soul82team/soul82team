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
//		// Bucket ����
//		public Bucket createBucket(String bucketName) {
//			return conn.createBucket(bucketName);
//		}
//
//		// ���� ���� (������ ���ϸ� �ڿ� "/"�� �ٿ����Ѵ�.)
//		public void createFolder(String bucketName, String folderName) {
//			conn.putObject(bucketName, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
//		}
//
//		// ���� ���ε�
//		public void fileUpload(String bucketName, File file) throws FileNotFoundException {
//			conn.putObject(bucketName, file.getName(), new FileInputStream(file), new ObjectMetadata());
//		}
//
//		// ���� ����
//		public void fileDelete(String bucketName, String fileName) {
//			conn.deleteObject(bucketName, fileName);
//		}
//
//		// ���� URL
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
//		// ù��° Bucket
//		String bucketName = list.get(0).getName().toString();
//		System.out.println("Bucket Name : " + bucketName);
//
//		// Bucket ����(�빮�ڴ� ���ԵǸ� �ȵ�.)
//		for (int i = 0; i < 3; i++) {
//			s3.createBucket("wonier-test-bucket" + i);
//		}
//
//		// ���� ����
//		for (int i = 0; i < 3; i++) {
//			s3.createFolder(bucketName, "woniper-test-folder" + i);
//		}
//
//		// ���� ���ε�
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
