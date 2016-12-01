package streaming.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import streaming.pojo.MP3reposit;

@Component
public class streamingServ {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	s3upload s3;
	@Autowired
	jAudioServ ja;
	
	public boolean insertmp3(MultipartFile f) {
		try {
			String ori=f.getOriginalFilename();
	         String music=ori.substring(4);
	         String[] Split=music.split("-");
	         
	         String title=Split[1];
	         String artist=Split[0];
	         System.out.println(title+" / "+artist);
	         String oriname = artist + "-" + title + ".mp3";
			
			s3.uploadmp3(f, oriname);
			String url = "https://s3.ap-northeast-2.amazonaws.com/soul82/mp3/" + oriname;

			MP3reposit mp3up = new MP3reposit();
				mp3up.setArtist(artist);
				mp3up.setTitle(title);
				mp3up.setUrl(url);
				mp3up.setOriname(oriname);
				
			SqlSession ss = fac.openSession();
			ss.insert("mp3.insertmp3", mp3up);
			ss.close();
			
			songinfo(artist,title);
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public void songinfo(String artist, String title) {
		SqlSession ss = fac.openSession();
		HashMap map = ja.jTagger(artist, title);
		ss.close();
	}
	
	public List ListMp3() {
		SqlSession ss = fac.openSession();
		List li = ss.selectList("mp3.reglist");
		ss.close();
		return li;
	}


	public int makeAlbum(Map map) {
		SqlSession ss = fac.openSession();
		int b = ss.insert("mp3.insertAlbum", map);

		ss.close();
		return b;
	}

	public MP3reposit selectOneMp3(int num) {
		SqlSession ss = fac.openSession();
		
		// rank 올리는거 update하면 응답만 기다리고 실행되지 않음...이유 모름
		int rst=0;
		rst+=ss.update("mp3.rankUp",num);
		if(rst==0){
			return null;
		}else{
			MP3reposit li = ss.selectOne("mp3.selectOne", num);
			ss.close();
			return li;
		}
	}

	public List<HashMap> albumList(String userid) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = ss.selectList("mp3.callAlbum", userid);
		ss.close();
		return li;
	}
	
	public HashMap myList(int num){
		SqlSession ss=fac.openSession();
		HashMap li=ss.selectOne("mp3.callMyList",num);
		ss.close();
		return li;
	}
	
	public int deleteAlbumList(int num){
		SqlSession ss=fac.openSession();
		int r=ss.delete("mp3.deleteAlbum",num);
		ss.close();
		return r;
	}
	
	public List searchMusic(String search){
		SqlSession ss=fac.openSession();
		List li=ss.selectList("mp3.search", "%"+search+"%");
		ss.close();
		
		return li;
	}
	
	public List allListMp3(int page){
		SqlSession ss=fac.openSession();
		int block=12;
		HashMap map=new HashMap();
			map.put("start",(page*block)-11);
			map.put("end",page*block);
		List li=ss.selectList("mp3.albumPaging",map);
		ss.close();
		return li;
	}
	
	public int LastPage(){
		SqlSession ss=fac.openSession();
		int page=ss.selectOne("mp3.getCount");
		ss.close();
		
		int s=page%12;
		int div=page/12;

		if(s>=1){
			return div+=1;
		}
			return div;
	}
	
	public List RankallListMp3(int page){
		SqlSession ss=fac.openSession();
		int block=50;
		HashMap map=new HashMap();
			map.put("start",(page*block)-49);
			map.put("end",page*block);
		List li=ss.selectList("mp3.albumPaging",map);
		ss.close();
		return li;
	}
	
	public int RankLastPage(){
		SqlSession ss=fac.openSession();
		int page=ss.selectOne("mp3.getCount");
		ss.close();
		
		int s=page%50;
		int div=page/50;

		if(s>=1){
			return div+=1;
		}
			return div;
	}
	
}
