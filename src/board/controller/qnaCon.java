package board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.model.qnaServ;
import board.pojo.qnaVO;

@Controller
public class qnaCon {
	
	@Autowired
	qnaServ qs;
	
	@RequestMapping("/qna/qnaList")
	public ModelAndView qnaList(HttpSession session, int page){
		ModelAndView mv=new ModelAndView();
//		List li=qs.allView();
		List li=qs.pagingQna(page);
		
		mv.setViewName("board:board/qnaboard/qnalist");
		mv.addObject("data",li); // ��ü �Խñ� ����
		mv.addObject("last",qs.LastPage()); //����¡ ó��(�ִ� �Խñ� ���� �����ؼ� ��ü ����)
		mv.addObject("logCheck",session.getAttribute("userId")); // �α���üũ���� Ȯ���ϱ� - null�ΰ�� �� ��� �Ұ� ó��
		return mv;
	}
	
	@RequestMapping("/qna/regpage")
	public ModelAndView wirtePage(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("board:board/qnaboard/qnawrite");
		return mv;
	}
	
	@RequestMapping("/qna/regqna")
	public ModelAndView qnaWrite(HttpSession session,String cate,String title,String content){
		ModelAndView mv=new ModelAndView();
		String writer=(String)session.getAttribute("userId");
		qnaVO qvo=new qnaVO();
			qvo.setCate(cate);
			qvo.setWriter(writer);
			qvo.setTitle(title);
			qvo.setContent(content);
			
		int r=qs.regMemo(qvo);
		if(r==1){
			mv.setViewName("redirect:/qna/qnaList?page=1");
		}else {
			mv.setViewName("body:board/errorpage");
		}
		return mv;
	}
	
	@RequestMapping("/qna/view")
	public ModelAndView qnaHit(int num){
		ModelAndView mv=new ModelAndView();
		qnaVO qna=qs.clickQna(num);
		if(qna==null){
			mv.setViewName("body:board/errorpage");
			return mv;
		}else{
			mv.setViewName("board:board/qnaboard/qnaview");
			mv.addObject("obj",qna);
			return mv;
		}
	}
	
	@RequestMapping("/qna/search")
	public ModelAndView qnaSearch(String search){
		ModelAndView mv=new ModelAndView();
		List li=qs.searching(search);
		mv.addObject("search",li);
		mv.setViewName("board:board/qnaboard/qnalist_search");
		return mv;
	}
}