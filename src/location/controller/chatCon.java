package location.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class chatCon {

	@RequestMapping("/chat/page")
	public String chatPage(){
		return "body:chatting/locationPage";
	}
}