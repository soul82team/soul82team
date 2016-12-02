package streaming.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import streaming.model.streamingServ;
import streaming.pojo.MP3reposit;

@Controller
public class clientAlbumCon {
	@Autowired
	SqlSessionFactory fac;
	
	@Autowired
	streamingServ upServ;
	
	//선택한 노래 리스트 받아서 앨범 생성 페이지 띄움
	@RequestMapping("/mp3/pass")
	public ModelAndView passMusic(String mp3, HttpSession session) {
		System.out.println("controller==" + mp3);
		ModelAndView mv = new ModelAndView();
		session.setAttribute("mp3", mp3);
		String userid=(String)session.getAttribute("userId");
		List<String> ar = Arrays.asList(mp3.split("@@"));
		
		List<HashMap> m=upServ.albumList(userid);
		
		if(m!=null){
			mv.addObject("m",m);
		}
		mv.addObject("total", ar.size());
		mv.setViewName("/admin/selectAlbum");
		return mv;
	}
	

	//선택한 노래 받은 앨범생성 페이지 ==> 여기서 앨범 최종 등록
	@RequestMapping("/mp3/makeAlbum")
	public ModelAndView makeAlbum(String name, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		// 로그인된 세션의 아이디(userid)
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		
		// db에 넣을 노래제목(title)
		String title=(String) session.getAttribute("mp3");
		HashMap map=new HashMap();
			map.put("userid", userId);
			map.put("albumname", name);
			map.put("title_num", title);
		int r=upServ.makeAlbum(map);
		List<HashMap> m=upServ.albumList(userId);
		
		if(r==1){
			System.out.println("앨범 생성");
			mv.addObject("m",m);
			mv.addObject("total", m.size());
			mv.addObject("album",map);
			mv.setViewName("/admin/userAlbum");
			return mv;
		}else{
			System.out.println("등록 실패");
			return mv;
		}
	}
	
	//큰 메뉴에서 "내 앨범"
	@RequestMapping("/mp3/myalbum")
	public ModelAndView myalbum(HttpSession session){
		ModelAndView mv =new ModelAndView();
		String userId=(String)session.getAttribute("userId");
		List<HashMap> m=upServ.albumList(userId);
		mv.addObject("m",m);
		mv.addObject("total",m.size());
		mv.setViewName("body:admin/userAlbum");
		return mv;
	}

	//선택한 노래듣기
	@RequestMapping("/mp3/listen")
	public ModelAndView selectList(String mp3) {
		ModelAndView mv = new ModelAndView();
		System.out.println(mp3);
		String[] titles = mp3.split("@@");
		
		ArrayList<HashMap> musicList = new ArrayList<>();
		for (int h = 0; h < titles.length; h++) {
			String title = titles[h];
			int num=Integer.parseInt(title);
			System.out.println("→"+title);
			MP3reposit li = upServ.selectOneMp3(num);
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", li.getTitle());
			map.put("url", li.getUrl());
			musicList.add(map);
		}
		mv.addObject("music", musicList);
		mv.addObject("musicSize", musicList.size());
		mv.setViewName("/soulplayer/player");
		return mv;
	}

	//선택한 한곡 듣기
	@RequestMapping("/mp3/Onelisten")
	public ModelAndView selectOne(int num) {
		ModelAndView mv = new ModelAndView();
		
		MP3reposit li = upServ.selectOneMp3(num);
		
		ArrayList<HashMap> musicList = new ArrayList<>();
		HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", li.getTitle());
			map.put("url", li.getUrl());
			musicList.add(map);
		mv.addObject("music", musicList);
		mv.addObject("musicSize", musicList.size());
		mv.setViewName("/soulplayer/player");
		
		return mv;
	}
	
	//내 앨범 목록
	@RequestMapping("/mp3/albumlist")
	public ModelAndView mp3albumList(int albumNum){
		ModelAndView mv=new ModelAndView();
		HashMap<String,String> li=upServ.myList(albumNum);
		
		String [] split=li.get("TITLE_NUM").split("@@");
		List<MP3reposit> list=new ArrayList<>();
		for(int i=0;i<split.length;i++){
			String titleNum=split[i];
			int num=Integer.parseInt(titleNum);
			MP3reposit mp3=upServ.selectOneMp3(num);
			list.add(mp3);
		}
		mv.addObject("mp3list",list);
		mv.setViewName("/admin/albumList");
		return mv;
	}
	
	//앨범목록에서 앨범 지우기
	@RequestMapping("/mp3/deleteAlbum")
	public ModelAndView delAlbum(int num){
		ModelAndView mv=new ModelAndView();
		System.out.println("넘어온 num값"+num);
		int r=upServ.deleteAlbumList(num);
		mv.setViewName("body:member/deletComplete");
		return mv;
	}
	
	@RequestMapping("/mp3/lyrics")
	public ModelAndView lyricsView(int num){
		System.out.println(num);
		ModelAndView mav = new ModelAndView("/admin/lyricsView");
			List<String> li = upServ.MusicLyrics(num);
				mav.addObject("lyrics", li.get(0));
		return mav;
	}
	
}




















