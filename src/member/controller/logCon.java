package member.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.model.joinServ;
import member.model.logServ;
import member.model.modifyServ;

@Controller
public class logCon {
	@Autowired
	logServ ls;
	@Autowired
	modifyServ ms;
	@Autowired
	joinServ js;
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	@RequestMapping("/member/logview")
	public String loginView() {
		return "body:member/login";
	}
	@RequestMapping("/member/passFindView")
	public String passFindView() {
		return "body:member/passFind";
	}
	@RequestMapping("/member/passf")
	public ModelAndView passfind(String id, String mail, String name){
		ModelAndView mav = new ModelAndView();
		
		HashMap map= ls.infoCheck(id, mail, name);
		
		if(map==null){
			mav.setViewName("body:member/passFail");
		}else{
		String pass=(String)map.get("PASS");
		System.out.println(pass);
		 boolean r=js.sendPassEmail(mail, pass);
		if(r==true){
		mav.setViewName("body:member/pass");
		}else{
			mav.setViewName("body:member/passFail");
		}
		}
		return mav;
	}
	
	
	@RequestMapping("/member/login")
	public ModelAndView proceed(HttpSession session, @RequestParam(name="id")String id, String pass ,String idcheck, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		System.out.println(id+"@@"+ pass);
		int rst = ls.logCheck(id, pass);
		
		if(rst==1) {
			session.setAttribute("userId", id);
			 if(idcheck != null){
		            Cookie ck = new Cookie("saveId", id);
		            ck.setPath("/");
		            ck.setMaxAge(60*60*24*30);
		            response.addCookie(ck);
		            
		     }
			 System.out.println(id);
			 String name=ms.imgnameGet(id);
			 
			 
			 System.out.println(name);
			 session.setAttribute("imgname", name);
			mav.setViewName("redirect:/index");	// redirect:   경로는 뷰설정이 애초에 다른 매핑잡아둔 경로로 요청 전환
		}else {
			mav.setViewName("body:member/loginFail");
		}
		return mav;
	}
	
	@RequestMapping("/memberImg")
	@ResponseBody
	public String memberImg(HttpSession session) {
		String id = (String)session.getAttribute("userId");
		System.out.println(id+"+++++++++");
		
		HashMap map=ls.imgnameGet(id);
		String name=(String)map.get("IMGNAME");
		System.out.println("!!!!!!!!"+name);
		return name;
	}
}
