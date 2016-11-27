package scrap.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class naverCon {
	
		@RequestMapping("/naver/channelSSK")
		public ModelAndView sskScrap(HttpSession session){
		String urlPath = "http://tvcast.naver.com/cjenm.superstark2016";
//		String urlPath = "http://tvcast.naver.com/search?query=%EB%B3%B5%EB%A9%B4%EA%B0%80%EC%99%95&page=1";
		
		String pageContents = "";
		StringBuilder contents = new StringBuilder();
		ModelAndView mv = new ModelAndView();
		
		try{
			URL url = new URL(urlPath);
			URLConnection con = (URLConnection) url.openConnection();
			InputStreamReader reader = new InputStreamReader(con.getInputStream(), "utf-8");
		
			BufferedReader buff = new BufferedReader(reader);
		
			while ((pageContents = buff.readLine()) != null) {
				contents.append(pageContents);
				contents.append("\r\n");
			}
			buff.close();
			// 여기까지 검색 결과 받아오기
		
			String searchSource = contents.toString();
			//이 아래로 스플릿...
			
			//슈스케
			String[] vSplit = searchSource.split("<div class=\"cds _MM_CARD \">");
			//복면가왕
//			String[] vSplit = searchSource.split("<div class=\"thl_a\">");

			ArrayList<HashMap> ssk=new ArrayList<>();
			for(int i=1;i<6;i++){
				String [] sImg = vSplit[i].split("<img src=\"");
				String [] sTitle=vSplit[i].split("alt=\"");
				String [] sTime=vSplit[i].split("<span class=\"tm_b\">");
				String [] sLink=vSplit[i].split("<a href=\"");
				String [] img=sImg[1].split("\"");
				String [] title=sTitle[1].split("\"");
				String [] time=sTime[1].split("<");
				String [] link=sLink[1].split("\"");
				String urlLink="http://tvcast.naver.com"+link[0];
				
				HashMap<String, String> map=new HashMap<>();
					map.put("link",urlLink);
					map.put("title", title[0]);
					map.put("img", img[0]);
					map.put("time", time[0]);
				ssk.add(map);
			}
			mv.addObject("ssk",ssk);
			mv.setViewName("body:naver/superstar");
			return mv;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
		
	@RequestMapping("/naver/cast")
	public ModelAndView castPlay(String link){
		ModelAndView mv=new ModelAndView();

		String pageContents = "";
		StringBuilder contents = new StringBuilder();
		
		try{
			URL url = new URL(link);
			URLConnection con = (URLConnection) url.openConnection();
			InputStreamReader reader = new InputStreamReader(con.getInputStream(), "utf-8");
		
			BufferedReader buff = new BufferedReader(reader);
		
			while ((pageContents = buff.readLine()) != null) {
				contents.append(pageContents);
				contents.append("\r\n");
			}
			buff.close();
			// 여기까지 검색 결과 받아오기
		
			String searchSource = contents.toString();
			
			//이 아래로 스플릿...
			String[] vSplit = searchSource.split("https://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?");
			String [] playUrl=vSplit[1].split("'");
			String castUrl="https://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn"+playUrl[0];
			
			mv.addObject("castUrl",castUrl);
			mv.setViewName("body:naver/naverCast");
			return mv;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("/naver/channelYHY")
	public ModelAndView yyhScrap(){
		String urlPath = "http://tvcast.naver.com/search?query=%EC%9C%A0%ED%9D%AC%EC%97%B4%20%EC%8A%A4%EC%BC%80%EC%B9%98%EB%B6%81&page=1";
		
		String pageContents = "";
		StringBuilder contents = new StringBuilder();
		ModelAndView mv = new ModelAndView();
		
		try{
			URL url = new URL(urlPath);
			URLConnection con = (URLConnection) url.openConnection();
			InputStreamReader reader = new InputStreamReader(con.getInputStream(), "utf-8");
		
			BufferedReader buff = new BufferedReader(reader);
		
			while ((pageContents = buff.readLine()) != null) {
				contents.append(pageContents);
				contents.append("\r\n");
			}
			buff.close();
			// 여기까지 검색 결과 받아오기
		
			String searchSource = contents.toString();
			//이 아래로 스플릿...
			
			//유희열 유스케
			String[] vSplit = searchSource.split("<div class=\"thl\">");
			
			ArrayList<HashMap> yhy=new ArrayList<>();
			for(int i=1;i<6;i++){
				String [] sImg = vSplit[i].split("src='");
				String [] sTitle=vSplit[i].split("alt=\"");
				String [] sTime=vSplit[i].split("<span class=\"tm_b\">");
				String [] sLink=vSplit[i].split("<a href=\"");
				String [] img=sImg[1].split("'");
				String [] title=sTitle[1].split("\"");
				String [] time=sTime[1].split("<");
				String [] link=sLink[1].split("\"");
				String urlLink="http://tvcast.naver.com"+link[0];
				HashMap<String, String> map=new HashMap<>();
					map.put("link",urlLink);
					map.put("title", title[0]);
					map.put("img", img[0]);
					map.put("time", time[0]);
				yhy.add(map);
			}
			mv.addObject("yhy",yhy);
			mv.setViewName("body:naver/sketchbook");
			return mv;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
}