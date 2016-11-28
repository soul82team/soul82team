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

	// ������ mp3 ���������
	@RequestMapping("/admin/reg")
	public String soundCould() {
		return "body:admin/adminpage";
	}
	
	//��� �� ��µǴ� ����Ʈ ������
	@RequestMapping("/admin/reglist")
	public ModelAndView mp3list() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", upServ.ListMp3());
		mav.setViewName("body:admin/mp3list");

		return mav;
	}
	
	@RequestMapping("/admin/allalbum")
	public ModelAndView mp3alllist() {
		ModelAndView mav = new ModelAndView();
		List<HashMap> li =upServ.allListMp3();
		mav.addObject("allAlbum", li);
		mav.setViewName("body:admin/allAlbum");

		return mav;
	}

	// ������ ��� ���� (insert mp3 file)
	@RequestMapping("/admin/mp3up")
	public ModelAndView uploadPage(@RequestParam(name = "mp3") MultipartFile f, 
			String artist, String title, String mv) {
		ModelAndView mav = new ModelAndView();
		boolean r = upServ.insertmp3(f, artist, title, mv);
		if (r == true) {
			System.out.println("��� ���� ���ٷ�̤̤̤�");
			upServ.songinfo(artist,title);
			mav.addObject("list", upServ.ListMp3());
			mav.setViewName("/admin/mp3list");
		} else {
			System.out.println("����");
		}
		return mav;
	}
	
	//List �������� Play Music ����
	@RequestMapping("/playmusic")
	public ModelAndView playmusic(){
		ModelAndView mav = new ModelAndView();
		List<MP3reposit> li=upServ.ListMp3();
		
		ArrayList<HashMap> musicList = new ArrayList<>();
		for(int i=0;i<li.size();i++){
			HashMap<String, String> map=new HashMap<String, String>();
				map.put("title", li.get(i).getTitle());
				map.put("url", li.get(i).getUrl());
				musicList.add(map);
		}
		mav.addObject("music",musicList);
		mav.addObject("musicSize",musicList.size());
		mav.addObject("list",li);
		mav.setViewName("/soulplayer/player");
		return mav;
	}
	
	@Autowired
	jAudioServ audio;
	
	//jAudioTagger mp3���� ���� �ҷ�����
	@RequestMapping("/loadmp3")
	public ModelAndView loadFile(){
		ModelAndView mv=new ModelAndView();
		
		audio.jTagger("","");
		mv.setViewName("#");
		return mv;
	}
}