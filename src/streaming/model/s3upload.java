package streaming.model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

@org.springframework.stereotype.Component
public class s3upload {
	Properties config;

	@PostConstruct
	public void init() {
		config = new Properties();
		config.setProperty("AWS_BUCKETNAME", "soul82");
		config.setProperty("AWS_ACCESS_KEY", "AKIAJY74VL4QCPJILHMA");
		config.setProperty("AWS_SECRET_KEY", "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");
	}

	// public static void main(String[] args) throws IOException {
	public void uploadmp3(MultipartFile f, String file_name) {
		File temp = saveTempServer(f);
		
		AWSCredentials credentials = new BasicAWSCredentials(config.getProperty("AWS_ACCESS_KEY"),
				config.getProperty("AWS_SECRET_KEY"));
		AmazonS3 s3 = new AmazonS3Client(credentials);
		try {
			// 파일 업로드 부분 파일 이름과 경로를 동시에 넣어줌.
			
			PutObjectRequest putObjectRequest = new PutObjectRequest(config.getProperty("AWS_BUCKETNAME"),
					"mp3/" + file_name, temp);
			// URL 접근시 권한 읽을 수있도록설정잡아주고.
//			putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);

			s3.putObject(putObjectRequest);
			System.out.println("Upload OK");
			temp.delete();
			
			// 파일 다운로드 다운로드 경로와 파일이름 동시 필요.
//			System.out.println("Downloading an object");
			// S3Object object = s3.getObject(new
			// GetObjectRequest(AWS_BUCKETNAME, file_path + file_name));
			// System.out.println("Content-Type: " +
			// object.getObjectMetadata().getContentType());
			// displayTextInputStream(object.getObjectContent());

		} catch (AmazonServiceException ase) {
			System.out.println("Caught an AmazonServiceException, which means your request made it "
					+ "to Amazon S3, but was rejected with an error response for some reason.");
			System.out.println("Error Message:    " + ase.getMessage());
			System.out.println("HTTP Status Code: " + ase.getStatusCode());
			System.out.println("AWS Error Code:   " + ase.getErrorCode());
			System.out.println("Error Type:       " + ase.getErrorType());
			System.out.println("Request ID:       " + ase.getRequestId());
		} catch (AmazonClientException ace) {
			System.out.println("Caught an AmazonClientException, which means the client encountered "
					+ "a serious internal problem while trying to communicate with S3, "
					+ "such as not being able to access the network.");
			System.out.println("Error Message: " + ace.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	private static File createSampleFile() throws IOException {
//		File file = File.createTempFile("aws-java-sdk-", ".txt");
//		file.deleteOnExit();
//		Writer writer = new OutputStreamWriter(new FileOutputStream(file));
//		writer.write("파일테스트하기\n");
//		writer.close();
//		return file;
//	}

	@Autowired
	ServletContext application;
	
	public File saveTempServer(MultipartFile f) {
		if (f.isEmpty())
			return null;
		try {
			String uID = UUID.randomUUID().toString();
			File mp3 = new File(application.getRealPath("/"), uID);
			f.transferTo(mp3);
			return mp3;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unused")
	private static void displayTextInputStream(InputStream input) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(input));
		while (true) {
			String line = reader.readLine();
			if (line == null)
				break;

			System.out.println("    " + line);
		}
		System.out.println();
	}
}