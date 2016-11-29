package board.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.model.reviewServ;
import streaming.model.AlbumSer;

@Controller
public class reviewCon {
	@Autowired
	reviewServ rs;
	@Autowired
	AlbumSer as;
//아이디 넘기면서 리뷰작성 페이지
	@RequestMapping("/board/review")
	public ModelAndView sasd(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String Id = (String) session.getAttribute("userId");
			mav.addObject("userid", Id);
		mav.setViewName("board:board/review/write");
		return mav;
	}
	
	@RequestMapping("music/inform")
	public ModelAndView albuminform(int num , String title){
		ModelAndView mav = new ModelAndView();
		List li= rs.readTitle(title);
		HashMap li2 = as.songinfo(num);
			mav.addObject("data",li);
			mav.addObject("mp3",li2);
			mav.addObject("num", num);
			System.out.println(title);
			System.out.println(num);
			mav.setViewName("body:common/albuminfo");
		return mav; 
	}
	
//리뷰내용 insert
	@RequestMapping("/music/review")
	public ModelAndView write(HttpServletRequest req, HttpSession session) {
		String Id = (String) session.getAttribute("userId");
		int g = Integer.parseInt(req.getParameter("star-input"));
		String t = req.getParameter("title");
		String c = req.getParameter("comment");
		System.out.println(g + "//" + c);
		HashMap map = new HashMap();
			map.put("id", Id);
			map.put("musictitle", t);
			map.put("comments", c);
			map.put("grade", g);
		boolean b = rs.reviewin(map);
		ModelAndView mav = new ModelAndView();
		if (b == true) {
			mav.setViewName("board:board/review/reviewc");
		} else {
			mav.setViewName("board:board/review/reviewf");
		}
		return mav;
	}
	
//	@RequestMapping("/review/list")
//	public ModelAndView list(){
//		ModelAndView mav = new ModelAndView();
//		List li=rs.readAll();
//		mav.addObject("data",li);
//	
//		mav.setViewName("board:board/review/reviewList");
//		return mav;
//	}

}
