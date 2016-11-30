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
import org.springframework.web.bind.annotation.CookieValue;
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
	public ModelAndView main(@CookieValue(name="savaId", required=false)String id) {
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

			for (int i = 1; i < 11; i++) {
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
			// ModelAndView mv = new ModelAndView();

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
			for (int i = 1; i < 11; i++) {
				// 이거 for문 i 넣어주면됨(1부터 시작하는 i)
				HashMap map2 = new HashMap();
				String[] stitle = mSplit[i].split("title=\"");
				String[] title3 = stitle[1].split("-");
				String[] simg = mSplit[i].split("><img src=");
				String[] img = simg[1].split("alt");
				String[] atitle = mSplit[i].split("/artist");
				String[] atitle2 = atitle[1].split("title=\"");
				String[] artist3 = atitle2[1].split("-");
				map2.put("title", title3[0]);
				map2.put("artist", artist3[0]);
				map2.put("album", img[0]);
				mnet.add(map2);

			}
			// ==========================================================================

			List<MP3reposit> ls = upServ.ListMp3();

			mv.addObject("mp3", ls);

			mv.addObject("bugs", bugs);
			mv.addObject("bugs2", bugs2);
			mv.addObject("mnet", mnet);
			mv.addObject("cid", id);
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

			for (int i = 1; i < 11; i++) {
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
			// ModelAndView mv = new ModelAndView();

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
			for (int i = 1; i < 51; i++) {
				// 이거 for문 i 넣어주면됨(1부터 시작하는 i)
				HashMap map2 = new HashMap();
				String[] stitle = mSplit[i].split("title=\"");
				String[] title3 = stitle[1].split("-");
				String[] simg = mSplit[i].split("><img src=");
				String[] img = simg[1].split("alt");
				String[] atitle = mSplit[i].split("/artist");
				String[] atitle2 = atitle[1].split("title=\"");
				String[] artist3 = atitle2[1].split("-");
				map2.put("title", title3[0]);
				map2.put("artist", artist3[0]);
				map2.put("album", img[0]);
				mnet.add(map2);

			}
			// ==========================================================================

			String urlPath4 = "http://www.mnet.com/chart/TOP100/20161128?pNum=2";
			String pageContents4 = "";
			StringBuilder contents4 = new StringBuilder();

			URL url4 = new URL(urlPath4);
			URLConnection con4 = (URLConnection) url4.openConnection();
			InputStreamReader reader4 = new InputStreamReader(con4.getInputStream(), "utf-8");

			BufferedReader buff4 = new BufferedReader(reader4);

			while ((pageContents4 = buff4.readLine()) != null) {
				contents4.append(pageContents4);
				contents4.append("\r\n");
			}
			buff4.close();

			String mnetSite4 = contents.toString();
			String[] mSplit4 = mnetSite4.split("<td class=\"MMLItemCheck\"");

			for (int i = 1; i < 51; i++) {
				// 이거 for문 i 넣어주면됨(1부터 시작하는 i)
				HashMap map2 = new HashMap();
				String[] stitle = mSplit4[i].split("title=\"");
				String[] title3 = stitle[1].split("-");
				String[] simg = mSplit4[i].split("><img src=");
				String[] img = simg[1].split("alt");
				String[] atitle = mSplit4[i].split("/artist");
				String[] atitle2 = atitle[1].split("title=\"");
				String[] artist3 = atitle2[1].split("-");
				map2.put("title", title3[0]);
				map2.put("artist", artist3[0]);
				map2.put("album", img[0]);
				mnet.add(map2);

			}
			// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			List<MP3reposit> ls = upServ.ListMp3();

			mv.addObject("mp3", ls);

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
	public ModelAndView albuminfo(int num) {
		ModelAndView mv = new ModelAndView();

		HashMap info = as.songinfo(num);

		mv.addObject("mp3", info);
		mv.setViewName("/common/albuminfo");
		return mv;
	}

	@RequestMapping("/soulSearch")
	public ModelAndView soulSearch(String search) {
		ModelAndView mv = new ModelAndView();
		System.out.println(search);
		List<MP3reposit> li = upServ.searchMusic(search);
		mv.addObject("list", li);
		mv.setViewName("body:admin/mp3list");
		return mv;
	}

	@RequestMapping("/search/word")
	@ResponseBody
	public List searchWord(String search) {
		List<MP3reposit> li = upServ.searchMusic(search);

		ArrayList<HashMap> ar = new ArrayList<>();
		for (int i = 0; i < ar.size(); i++) {
			HashMap<String, String> map = new HashMap<>();
			map.put("title", li.get(i).getTitle());
			map.put("artist", li.get(i).getArtist());
			ar.add(map);
		}

		return li;

	}

}
