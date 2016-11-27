package streaming.model;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.FieldKey;
import org.jaudiotagger.tag.Tag;
import org.jaudiotagger.tag.id3.AbstractID3v2Frame;
import org.jaudiotagger.tag.id3.AbstractID3v2Tag;
import org.jaudiotagger.tag.id3.ID3v24Tag;
import org.jaudiotagger.tag.id3.framebody.FrameBodyAPIC;
import org.jaudiotagger.tag.id3.valuepair.TextEncoding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;

import streaming.pojo.MP3reposit;

@org.springframework.stereotype.Component
public class jAudioServ {
	@Autowired
	streamingServ stream;

	public HashMap jTagger(String artistp, String titlep) {
		HashMap map = new HashMap();
		try {

			String encoding = "utf-8";
			// DB 데이터 가져오기
			List<MP3reposit> li = stream.ListMp3();
			// DB에서 [가수-제목] 으로 파일 이름 설정하기
			String name = artistp + "-" + titlep;
			System.out.println(name);
			// DB에 있는 해당 노래의 url가져오기
			File file = new File(name + ".mp3");
			// 이 밑으로 audio 정보 가져오는거
			// String url = li.get(2).getUrl();
			// System.out.println(url);
			URL u = new URL(
					"https://s3.ap-northeast-2.amazonaws.com/soul82/mp3/" + URLEncoder.encode(name, encoding) + ".mp3");

			FileCopyUtils.copy(u.openStream(), new FileOutputStream(file));
			System.out.println("~~");
			MP3File mp3 = (MP3File) AudioFileIO.read(file);
			System.out.println(mp3);

			Tag tag = mp3.getTag();
			String lr = tag.getFirst(FieldKey.LYRICS);
			String title = tag.getFirst(FieldKey.TITLE);
			String artist = tag.getFirst(FieldKey.ARTIST);
			String album = tag.getFirst(FieldKey.ALBUM);
			String year = tag.getFirst(FieldKey.YEAR);
			String genre = tag.getFirst(FieldKey.GENRE);
			// ===============================================
			
			BufferedImage b= mp3.getTag().getFirstArtwork().getImage();
//			ImageIO.write(b, "jpg", file);
			ImageIO.createImageInputStream(mp3.getTag().getFirstArtwork().getImage());
			System.out.println(b);
			// ==========================================
			map.put("title", title);
			map.put("artist", artist);
			map.put("lyrics", lr);
			map.put("year", year);
			map.put("genre", genre);
			map.put("album", album);
			System.out.println(map.get("title") + "/!!/" + map.get("artist") + "/!!/" + map.get("year") + "/!!/"
					+ map.get("genre") + "/!!/" + map.get("album"));

			// System.out.println("Tag : " + tag2);
			System.out.println("gasa : " + lr);
			System.out.println("Song Name !: " + title);
			System.out.println("Artist !: " + artist);
			System.out.println("Album !: " + album);
			System.out.println("Year !: " + year);
			System.out.println("Genre !: " + genre);
			file.delete();

		} catch (Exception e) {
			// System.out.println(e);
			e.printStackTrace();
		}
		return map;
	}
}
