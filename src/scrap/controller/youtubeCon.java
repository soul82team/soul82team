package scrap.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class youtubeCon {

	@RequestMapping("/youtube/board")
	public String MVboard() {
		return "body:youtube/youtubeSearch";
	}
	
	@RequestMapping("/youtube/mvplay")
	public ModelAndView mvPlay(String key){
		ModelAndView mv=new ModelAndView();
		mv.addObject("key",key);
		mv.setViewName("/youtube/youtubeWatch");
		return mv;
	}

	@RequestMapping("/youtube/search")
	public ModelAndView mvSearch(String urlSearch) {
		try {
			System.out.println("유튭 검색어"+urlSearch);
			String urlPath = "https://www.youtube.com/results?search_query="+URLDecoder.decode(urlSearch,"UTF-8");
			System.out.println("youtube검색?==>"+urlPath);
			System.out.println("=======================");
			String pageContents = "";
			StringBuilder contents = new StringBuilder();
			ModelAndView mv = new ModelAndView();
			
//			URL url = new URL(urlPath);
			URL url = new URL(URLDecoder.decode(urlPath,"utf-8"));
			URLConnection con = (URLConnection) url.openConnection();
			System.out.println(con);
			InputStreamReader reader = new InputStreamReader(con.getInputStream(), "utf-8");

			BufferedReader buff = new BufferedReader(reader);

			while ((pageContents = buff.readLine()) != null) {
				contents.append(pageContents);
				contents.append("\r\n");
			}
			buff.close();
			// 여기까지 검색 결과 받아오기

			String searchSource = contents.toString();
			String[] vSplit = searchSource.split("data-context-item-id=\"");
			String[] video = null;

			String[] iSplit2=searchSource.split(".ytimg.com/vi/");
			 
			String[] image = null;
			String[] himage = null;
			himage=iSplit2[0].split("//");
			
			String[] tSplit = searchSource.split("aria-hidden=\"true\">");
			String[] time = null;
			
			String[] titleSplit=searchSource.split("dir=\"ltr\">");
			String [] title=null;
			ArrayList<HashMap> search = new ArrayList<>();
			
			for (int i = 0; i < 5; i++) {
				HashMap<String,String>map=new HashMap<>();
				video = vSplit[i+1].split("\"");
				time = tSplit[i+1].split("<");
				image = iSplit2[i+5].split(".jpg");
				title= titleSplit[i+4+i].split("<");
				
				System.out.println(image[0]);
				
				map.put("video", video[0]);
				map.put("time", time[0]);
				map.put("image", "//i.ytimg.com/vi/"+image[0]+".jpg");
				map.put("title", title[0]);
				
				search.add(map);
			}
			
			for(int i=0;i<search.size();i++){
				System.out.println(search.get(i));
			}
			
			mv.addObject("search", search);
			mv.setViewName("/youtube/youtubeList");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
