package streaming.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import streaming.model.jAudioServ;
import streaming.model.streamingServ;
import streaming.pojo.MP3reposit;

@Controller
public class streamingCon {
	@Autowired
	streamingServ upServ;

	@Autowired
	jAudioServ audio;

	// 관리자 mp3 등록페이지
	@RequestMapping("/admin/reg")
	public String soundCould() {
		return "body:admin/adminpage";
	}

	// 등록 후 출력되는 리스트 페이지
	@RequestMapping("/admin/reglist")
	public ModelAndView mp3list(int page) {
		ModelAndView mav = new ModelAndView();
		
		List<HashMap> li = upServ.RankallListMp3(page);
			mav.addObject("list", li);
			mav.addObject("last",upServ.RankLastPage());
		mav.setViewName("body:admin/mp3list");

		return mav;
	}

	// 관리자 등록 로직 (insert mp3 file)
	@RequestMapping("/admin/mp3up")
	public ModelAndView uploadPage(@RequestParam(name = "mp3") MultipartFile f) {
		ModelAndView mav = new ModelAndView();
		boolean r = upServ.insertmp3(f);
		if (r == true) {
//			upServ.songinfo(artist, title);
			mav.addObject("list", upServ.ListMp3());
			mav.setViewName("body:admin/adminpage");
		} else {
			System.out.println("망함");
		}
		return mav;
	}

	// List 형식으로 Play Music 실행
	@RequestMapping("/playmusic")
	public ModelAndView playmusic() {
		ModelAndView mav = new ModelAndView();
		List<MP3reposit> li = upServ.ListMp3();

		ArrayList<HashMap> musicList = new ArrayList<>();
		for (int i = 0; i < li.size(); i++) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", li.get(i).getTitle());
			map.put("url", li.get(i).getUrl());
			musicList.add(map);
		}
		mav.addObject("music", musicList);
		mav.addObject("musicSize", musicList.size());
		mav.addObject("list", li);
		mav.setViewName("/soulplayer/player");
		return mav;
	}

	// jAudioTagger mp3파일 정보 불러오기
	@RequestMapping("/loadmp3")
	public ModelAndView loadFile() {
		ModelAndView mv = new ModelAndView();

		audio.jTagger("", "");
		mv.setViewName("#");
		return mv;
	}

	@RequestMapping("/admin/allalbum")
	public ModelAndView mp3alllist(int page) {
		ModelAndView mav = new ModelAndView();
		
		List<HashMap> li = upServ.allListMp3(page);
			mav.addObject("allAlbum", li);
			mav.addObject("last",upServ.LastPage());
			mav.setViewName("body:admin/allAlbum");

		return mav;
	}
}
