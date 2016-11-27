package member.controller;

import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.model.imgServ;
import member.model.joinServ;
import member.pojo.Member;

@Controller
public class joinCon {
	@Autowired
	joinServ js;
	@Autowired
	imgServ imgser;
	
	@RequestMapping("/member/joinPage")
	public String joinPage() {
		return "body:member/join";
	}
	
	@RequestMapping("/member/joinConfirm")
	public ModelAndView join(@RequestParam(name="img") MultipartFile img,String id,String pass1, String mail, String name, String gender, String birthYear, String birthMonth, String birthDay){
		ModelAndView mv=new ModelAndView();
		System.out.println(id+" / "+pass1+" / "+mail+" / "+name+" / "+gender+" / "+birthYear+" / "+birthMonth+" / "+birthDay);
		String birth=birthYear+birthMonth+birthDay;
		int notice=0;
		String is= imgser.imgSave(img,id);
		System.out.println(is);
		Member mem=new Member();
			mem.setId(id);
			mem.setPass(pass1);
			mem.setBirth(birth);
			mem.setGender(gender);
			mem.setImg(is);
			mem.setMail(mail);
			mem.setName(name);
			mem.setNotice(notice);
		int r=js.joinVO(mem);
		
		if(r==1){
			mv.setViewName("body:member/joinComplete");
			mv.addObject("joinCom",mem);
		}else{
			System.out.println("회원가입실패요");
		}
		
		return mv;
	}
	
	@RequestMapping("/member/joinAjax.it")
	public ModelAndView existCheck(String id){
		boolean b = js.exist(id);
		ModelAndView mav = new ModelAndView("/member/checkResult");
		mav.addObject("rst", b);
		
		return mav;
	}
	
	@RequestMapping("/member/mailConfirm")
	public ModelAndView sendEmail(String authmail, HttpServletResponse resp){
		ModelAndView mav = new ModelAndView("/member/auth");
		
		String uid = UUID.randomUUID().toString().substring(0,6);
		
		Cookie authNumber = new Cookie("authNumber"+uid, uid);
			authNumber.setPath("/");
			authNumber.setMaxAge(60*3);
		resp.addCookie(authNumber);
	
		boolean r =	js.sendEmail(authmail, uid);
			mav.addObject("auth", r);
			mav.addObject("uid", uid);
			
		return mav;
			
	}
	
}