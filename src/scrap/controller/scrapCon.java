package scrap.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.htmlparser.jericho.Source;
import scrap.model.scrapServ;

@Controller
public class scrapCon {

	@Autowired
	scrapServ ss;

	// @RequestMapping("/naver")
	// public String getNaverChart() {
	// String urlPath =
	// "http://music.naver.com/listen/top100.nhn?domain=TOTAL&duration=1d";
	// String pageContents = "";
	// StringBuilder contents = new StringBuilder();
	//
	// try {
	// URL url = new URL(urlPath);
	// URLConnection con = (URLConnection) url.openConnection();
	// InputStreamReader reader = new InputStreamReader(con.getInputStream(),
	// "utf-8");
	//
	// BufferedReader buff = new BufferedReader(reader);
	//
	// while ((pageContents = buff.readLine()) != null) {
	// contents.append(pageContents);
	// contents.append("\r\n");
	// }
	// buff.close();
	//
	// String naverSource=contents.toString();
	// String[] naverTitle = naverSource.split("><span class=\"ellipsis\">");
	// String[] title = null;
	//
	// String[] naverArtist = naverSource.split("<span class=\"ellipsis\" >");
	// String[] artist = null;
	//
	// String[] navernAlbum =
	// naverSource.split("http://musicmeta.phinf.naver.net");
	// String[] album = null;
	//
	// ArrayList<HashMap> naverMusic = new ArrayList<>();
	//
	// for (int i = 1; i < 45; i++) {
	// HashMap map = new HashMap();
	// title = naverTitle[i].split("\\<");
	// artist = naverArtist[i].split("\\<");
	// artist[0]=artist[0].replaceAll("\\s+", "");
	// album = navernAlbum[i].split("\\?");
	// album[0]="http://musicmeta.phinf.naver.net"+album[0];
	// map.put("title", title[0]);
	// map.put("artist", artist[0]);
	// map.put("album", album[0]);
	// naverMusic.add(map);
	// System.out.println(map.get("title")+" / "+map.get("artist")+" /
	// "+map.get("album"));
	// }
	//
	// return null;
	// } catch (Exception e) {
	// e.printStackTrace();
	// return null;
	// }
	// }
	@RequestMapping("/top10")
	public ModelAndView top10() {
		try {
			String urlPath = "http://music.naver.com/listen/top100.nhn?domain=TOTAL&duration=1d";
			String pageContents = "";
			StringBuilder contents = new StringBuilder();
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

			for (int i = 1; i < 11; i++) {
				HashMap map = new HashMap();
				title = bugsTitle[i].split("\"");
				artist = bugsArtist[i].split("\"");
				album = bugsAlbum[i].split("\"");
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", "http://image.bugsm.co.kr/album/images/" + album[0]);
				bugs.add(map);
			}

			// Mnet=====================================================================
			Source mnetSource = new Source(new URL(mnetSite));
			mnetSource.getAllTags();
			mnetSource.fullSequentialParse();
			String sourMnet = mnetSource.toString();
			String[] mnetTitle = sourMnet.split("class=\"btn_recom\" title=\"");

			String[] mnetArtist1 = sourMnet.split("class=\"MMLIInfo_Artist\"");
			String[] mnetArtist2 = mnetArtist1[1].split(">");

			String[] mnetAlbum = sourMnet.split("target=\"_self\"><img src=");

			String[] title1 = null;
			String[] artist1 = null;
			String[] album1 = null;
			// String []mnetArtist2=null;
			ArrayList<HashMap> mnet = new ArrayList<>();

			for (int i = 1; i < 11; i++) {
				HashMap map = new HashMap();
				title1 = mnetTitle[i].split("-");
				artist1 = mnetArtist2[i].split("<");
				album1 = mnetAlbum[i].split("alt");
				map.put("title", title1[0]);
				map.put("artist", artist1[0]);
				map.put("album", album1[0]);
				mnet.add(map);
			}

			// =================================================================
			// URL url = new URL(urlPath);
			// URLConnection con = (URLConnection) url.openConnection();
			// InputStreamReader reader = new
			// InputStreamReader(con.getInputStream(), "utf-8");
			//
			// BufferedReader buff = new BufferedReader(reader);
			//
			// while ((pageContents = buff.readLine()) != null) {
			// contents.append(pageContents);
			// contents.append("\r\n");
			// }
			// buff.close();
			// String naverSource=contents.toString();
			// String[] naverTitle = naverSource.split("><span
			// class=\"ellipsis\">");
			// String[] title11 = null;
			//
			// String[] naverArtist = naverSource.split("<span
			// class=\"ellipsis\" >");
			// String[] artist11 = null;
			//
			// String[] navernAlbum =
			// naverSource.split("http://musicmeta.phinf.naver.net");
			// String[] album11 = null;
			//
			// ArrayList<HashMap> naverMusic = new ArrayList<>();
			//
			// for (int i = 1; i < 11; i++) {
			// HashMap map = new HashMap();
			// title = naverTitle[i].split("\\<");
			// artist = naverArtist[i].split("\\<");
			// artist[0]=artist[0].replaceAll("\\s+", "");
			// album = navernAlbum[i].split("\\?");
			// album[0]="http://musicmeta.phinf.naver.net"+album[0];
			// map.put("title", title[0]);
			// map.put("artist", artist[0]);
			// map.put("album", album[0]);
			// naverMusic.add(map);
			// System.out.println(map.get("title")+" / "+map.get("artist")+" /
			// "+map.get("album"));
			// }
			mv.addObject("bugs", bugs);
			mv.addObject("mnet", mnet);
			// mv.setViewName("t:nav");
			mv.setViewName("/chart/top10");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping("/top6")
	public ModelAndView top6() {
		try {
			String urlPath = "http://music.naver.com/listen/top100.nhn?domain=TOTAL&duration=1d";
			String pageContents = "";
			StringBuilder contents = new StringBuilder();
			ModelAndView mv = new ModelAndView();
			// 링크연결
			String bugsStie = "http://music.bugs.co.kr/chart/track/day/total";
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

			for (int i = 1; i < 7; i++) {
				HashMap map = new HashMap();
				title = bugsTitle[i].split("\"");
				artist = bugsArtist[i].split("\"");
				album = bugsAlbum[i].split("\"");
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", "http://image.bugsm.co.kr/album/images/" + album[0]);
				bugs.add(map);
			}

			mv.addObject("bugs", bugs);

			mv.setViewName("/album");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@RequestMapping("/choice/list")
	public ModelAndView choiceList(String tt){
		ModelAndView mav = new ModelAndView("/chart/choicelist");
		
			mav.addObject("title", tt);
			
		System.out.println(tt);
		return mav;
	}
	
	@RequestMapping("/choice/createAlbum")
	@ResponseBody
	public String createAlbum(String albumName, String title, String userId){
		
		System.out.println("**"+title);
		
		boolean r = ss.create(albumName, title, userId);
		if (r) {
			return "true";
		} else {
			return "false";
		}
		
	}
	
}
