package main.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.servlet.ModelAndView;

import net.htmlparser.jericho.Source;

public class testMain {
	public static void main(String[] args) {
		try{
			
			String urlPath = "http://www.mnet.com/chart/top100/";
			String pageContents = "";
			StringBuilder contents = new StringBuilder();
			ModelAndView mv = new ModelAndView();
			
			URL url = new URL(urlPath);
			URLConnection con = (URLConnection) url.openConnection();
			InputStreamReader reader = new InputStreamReader(con.getInputStream(), "utf-8");

			BufferedReader buff = new BufferedReader(reader);

			while ((pageContents = buff.readLine()) != null) {
				contents.append(pageContents);
				contents.append("\r\n");
			}
			buff.close();

			String mnetSite = contents.toString();
			String[] mSplit = mnetSite.split("<td class=\"MMLItemCheck\"");
			
			for(int i=1;i<51;i++){
				//이거 for문 i 넣어주면됨(1부터 시작하는 i)
				String [] stitle=mSplit[i].split("title=\"");
				String [] title=stitle[1].split("-");
				String [] simg=mSplit[i].split("><img src=");
				String [] img=simg[1].split("alt");
				String [] atitle=mSplit[i].split("/artist");
				String [] atitle2=atitle[1].split("title=\"");
				String [] artist=atitle2[1].split("-");
//				System.out.println(title[0]);
//				System.out.println(artist[0]);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
