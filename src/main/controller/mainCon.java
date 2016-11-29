package main.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.htmlparser.jericho.Source;
import streaming.model.AlbumSer;
import streaming.model.streamingServ;
import streaming.pojo.MP3reposit;

@Controller
public class mainCon {
	@Autowired
	streamingServ upServ;
	@Autowired
	AlbumSer as;
	
	@RequestMapping({ "/", "/index" })
	public ModelAndView main() {
		try {
			ModelAndView mv = new ModelAndView();
			// 링크연결
			String bugsStie = "http://music.bugs.co.kr/chart/track/day/total";
			String mnetSite = "http://www.mnet.com/chart/TOP100/20161118";

			// bugs
			Source bugSource = new Source(new URL(bugsStie));
			bugSource.getAllTags();
			bugSource.fullSequentialParse();

			String sourBugs = bugSource.toString();
			String[] bugsTitle = sourBugs.split("name=\"check\" disc_id=\"1\" title=\"");
			String[] title = null;

			String[] bugsArtist = sourBugs.split("\" artist_disp_nm=\"");
			String[] artist = null;

			String[] bugsAlbum = sourBugs.split("\"http://image.bugsm.co.kr/album/images/");
			String[] album = null;

			ArrayList<HashMap> bugs = new ArrayList<>();

			for (int i = 1; i < 101; i++) {
				HashMap map = new HashMap();
				title = bugsTitle[i].split("\"");
				artist = bugsArtist[i].split("\"");
				album = bugsAlbum[i].split("\"");
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", "http://image.bugsm.co.kr/album/images/" + album[0]);
				bugs.add(map);
			}
			// =====================================================================
			String bugsStie2 = "http://music.bugs.co.kr/chart/track/day/total";

			// bugs
			Source bugSource2 = new Source(new URL(bugsStie2));
			bugSource2.getAllTags();
			bugSource2.fullSequentialParse();

			String sourBugs2 = bugSource2.toString();
			String[] bugsTitle2 = sourBugs2.split("name=\"check\" disc_id=\"1\" title=\"");
			String[] title2 = null;

			String[] bugsArtist2 = sourBugs2.split("\" artist_disp_nm=\"");
			String[] artist2 = null;

			String[] bugsAlbum2 = sourBugs2.split("\"http://image.bugsm.co.kr/album/images/");
			String[] album2 = null;

			ArrayList<HashMap> bugs2 = new ArrayList<>();

			for (int i = 1; i < 9; i++) {
				HashMap map2 = new HashMap();
				title2 = bugsTitle2[i].split("\"");
				artist2 = bugsArtist2[i].split("\"");
				album2 = bugsAlbum2[i].split("\"");
				map2.put("title", title2[0]);
				map2.put("artist", artist2[0]);
				map2.put("album", "http://image.bugsm.co.kr/album/images/" + album2[0]);
				bugs2.add(map2);
			}

			// ========================================================================
			
			String urlPath = "http://www.mnet.com/chart/top100/";
			String pageContents = "";
			StringBuilder contents = new StringBuilder();
			
			
			URL url = new URL(urlPath);
			URLConnection con = (URLConnection) url.openConnection();
			InputStreamReader reader = new InputStreamReader(con.getInputStream(), "utf-8");

			BufferedReader buff = new BufferedReader(reader);

			while ((pageContents = buff.readLine()) != null) {
				contents.append(pageContents);
				contents.append("\r\n");
			}
			buff.close();

			String mnetSite2 = contents.toString();
			String[] mSplit = mnetSite2.split("<td class=\"MMLItemCheck\"");
			ArrayList<HashMap> mnet = new ArrayList<>();
			for(int i=1;i<11;i++){
				HashMap map = new HashMap();
				//이거 for문 i 넣어주면됨(1부터 시작하는 i)
				String [] stitle=mSplit[i].split("title=\"");
				String [] title3=stitle[1].split("-");
				String [] simg=mSplit[i].split("><img src=");
				String [] img=simg[1].split("alt");
				String [] atitle=mSplit[i].split("/artist");
				String [] atitle2=atitle[1].split("title=\"");
				String [] artist3=atitle2[1].split("-");
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", img[0]);
				mnet.add(map);
//				System.out.println(title[0]);
//				System.out.println(artist[0]);
			}
			//==========================================================================
			

			List<MP3reposit> ls=upServ.ListMp3();
			
			mv.addObject("mp3",ls );

			mv.addObject("bugs", bugs);
			mv.addObject("bugs2", bugs2);
			mv.addObject("mnet", mnet);
			mv.setViewName("t:nav");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("/soulPlayer")
	public ModelAndView soulPlayer() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/soulplayer/player");
		// mv.setViewName("#");
		return mv;
	}
	
	@RequestMapping("/musicchart")
	public ModelAndView chartView() {
		try {
			ModelAndView mv = new ModelAndView();
			// 링크연결
			String bugsStie = "http://music.bugs.co.kr/chart/track/day/total";
			String mnetSite = "http://www.mnet.com/chart/TOP100/20161118";

			// bugs
			Source bugSource = new Source(new URL(bugsStie));
			bugSource.getAllTags();
			bugSource.fullSequentialParse();

			String sourBugs = bugSource.toString();
			String[] bugsTitle = sourBugs.split("name=\"check\" disc_id=\"1\" title=\"");
			String[] title = null;

			String[] bugsArtist = sourBugs.split("\" artist_disp_nm=\"");
			String[] artist = null;

			String[] bugsAlbum = sourBugs.split("\"http://image.bugsm.co.kr/album/images/");
			String[] album = null;

			ArrayList<HashMap> bugs = new ArrayList<>();

			for (int i = 1; i < 101; i++) {
				HashMap map = new HashMap();
				title = bugsTitle[i].split("\"");
				artist = bugsArtist[i].split("\"");
				album = bugsAlbum[i].split("\"");
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", "http://image.bugsm.co.kr/album/images/" + album[0]);
				bugs.add(map);
			}
			// =====================================================================
			String bugsStie2 = "http://music.bugs.co.kr/chart/track/day/total";

			// bugs
			Source bugSource2 = new Source(new URL(bugsStie2));
			bugSource2.getAllTags();
			bugSource2.fullSequentialParse();

			String sourBugs2 = bugSource2.toString();
			String[] bugsTitle2 = sourBugs2.split("name=\"check\" disc_id=\"1\" title=\"");
			String[] title2 = null;

			String[] bugsArtist2 = sourBugs2.split("\" artist_disp_nm=\"");
			String[] artist2 = null;

			String[] bugsAlbum2 = sourBugs2.split("\"http://image.bugsm.co.kr/album/images/");
			String[] album2 = null;

			ArrayList<HashMap> bugs2 = new ArrayList<>();

			for (int i = 1; i < 9; i++) {
				HashMap map2 = new HashMap();
				title2 = bugsTitle2[i].split("\"");
				artist2 = bugsArtist2[i].split("\"");
				album2 = bugsAlbum2[i].split("\"");
				map2.put("title", title2[0]);
				map2.put("artist", artist2[0]);
				map2.put("album", "http://image.bugsm.co.kr/album/images/" + album2[0]);
				bugs2.add(map2);
			}

			// ========================================================================

			// Mnet
			Source mnetSource = new Source(new URL(mnetSite));
			mnetSource.getAllTags();
			mnetSource.fullSequentialParse();
			String sourMnet = mnetSource.toString();
			String[] mnetTitle = sourMnet.split("class=\"btn_recom\" title=\"");

			String[] mnetArtist1 = sourMnet.split("class=\"MMLIInfo_Artist\"");
			String[] mnetArtist2 = mnetArtist1[1].split(">");

			String[] mnetAlbum = sourMnet.split("target=\"_self\"><img src=");
			// String []mnetArtist2=null;
			ArrayList<HashMap> mnet = new ArrayList<>();

			for (int i = 1; i < 51; i++) {
				HashMap map = new HashMap();
				title = mnetTitle[i].split("-");
				artist = mnetArtist2[i].split("<");
				album = mnetAlbum[i].split("alt");
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", album[0]);
				
				mnet.add(map);
			}

			String urlPath = "http://music.naver.com/listen/top100.nhn?domain=TOTAL&duration=1d";
			String pageContents = "";
			StringBuilder contents = new StringBuilder();

			URL url = new URL(urlPath);
			URLConnection con = (URLConnection) url.openConnection();
			InputStreamReader reader = new InputStreamReader(con.getInputStream(), "utf-8");

			BufferedReader buff = new BufferedReader(reader);

			while ((pageContents = buff.readLine()) != null) {
				contents.append(pageContents);
				contents.append("\r\n");
			}
			buff.close();

			String naverSource = contents.toString();
			String[] naverTitle = naverSource.split("><span class=\"ellipsis\">");
			String[] title1 = null;

			String[] naverArtist = naverSource.split("<span class=\"ellipsis\" >");
			String[] artist1 = null;

			String[] navernAlbum = naverSource.split("http://musicmeta.phinf.naver.net");
			String[] album1 = null;

			ArrayList<HashMap> naverMusic = new ArrayList<>();

			for (int i = 1; i < 45; i++) {
				HashMap map = new HashMap();
				title = naverTitle[i].split("\\<");
				artist = naverArtist[i].split("\\<");
				artist[0] = artist[0].replaceAll("\\s+", "");
				album = navernAlbum[i].split("\\?");
				album[0] = "http://musicmeta.phinf.naver.net" + album[0];
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", album[0]);
				naverMusic.add(map);
			}

			mv.addObject("bugs", bugs);
			mv.addObject("bugs2", bugs2);
			mv.addObject("mnet", mnet);
			mv.setViewName("body:chart/bugsChart");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("/albuminfo")
	public ModelAndView albuminfo(int num){
		ModelAndView mv = new ModelAndView();
		
		HashMap info=as.songinfo(num);
		
		mv.addObject("mp3",info );
		mv.setViewName("/common/albuminfo");
		return mv;
	}
	
	@RequestMapping("/soulSearch")
	public ModelAndView soulSearch(String search){
		ModelAndView mv=new ModelAndView();
		System.out.println(search);
		List<MP3reposit> li=upServ.searchMusic(search);
		mv.addObject("list",li);
		mv.setViewName("body:admin/mp3list");
		return mv;
	}
	
	@RequestMapping("/search/word")
	@ResponseBody
	public List searchWord(String search){
		List<MP3reposit> li=upServ.searchMusic(search);
		
		ArrayList<HashMap> ar=new ArrayList<>();
		for(int i=0;i<ar.size();i++){
			HashMap<String,String> map=new HashMap<>();
			map.put("title", li.get(i).getTitle());
			map.put("artist", li.get(i).getArtist());
			ar.add(map);
		}
		
		return li;

	}
	
}
