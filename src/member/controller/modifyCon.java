package member.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.logServ;
import member.model.modifyServ;

@Controller
public class modifyCon {
	@Autowired
	modifyServ ms;
	@Autowired
	logServ ls;

	
	@RequestMapping("/member/modifyPage")
	public ModelAndView modifyPage(HttpSession session) {
		
		ModelAndView mav= new ModelAndView();
		String id=(String)session.getAttribute("userId");
		mav.addObject("id", id);
		mav.setViewName("body:member/modify");
		return mav;
	}
	

	@RequestMapping("/member/modify")
	public ModelAndView modify(HttpSession session,String pass) {
		ModelAndView mav= new ModelAndView();
		String id=(String)session.getAttribute("userId");
		int rst = ls.logCheck(id, pass);
		mav.setViewName("body:member/modify");
		
		if(rst==1) {
			HashMap map=new HashMap();
			HashMap map2=new HashMap();
			map =ms.idData(id);
			mav.addObject("data",map );
			map2=ms.imgGet(id);
			mav.addObject("img",map2 );
			mav.setViewName("body:member/modifyList");
		}
		return mav;
	}
	@RequestMapping("/member/memUp")
	public ModelAndView memUp(String img, String pass, String mail,HttpSession session) {
		ModelAndView mav= new ModelAndView();
		String id=(String)session.getAttribute("userId");
		System.out.println(img+"//"+ pass+"//"+ mail+"//"+ id);
		int r=ms.memset(img, pass, mail, id);
		
		if(r==1){
			mav.setViewName("body:member/modifyComplete");
		}else{
			mav.setViewName("body:member/modifyList");
		}
		return mav;
	}
	@RequestMapping("/member/leave")
	public ModelAndView leave(HttpSession session,String pass){
		ModelAndView mav= new ModelAndView();
		String id=(String)session.getAttribute("userId");
		int rst = ls.logCheck(id, pass);
		if(rst==1) {
			int rr=ms.memdelet(id);
			if(rr==1){
				session.invalidate();
				mav.setViewName("body:member/deletComplete");
			}else{
				mav.setViewName("body:member/modify");
				
			}
		}
		
		return mav;
	}
}
