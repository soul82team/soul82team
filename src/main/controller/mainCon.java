package main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class mainCon {
	@RequestMapping({ "/", "/index" })
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("t:nav");
		return mav;
	}
}
