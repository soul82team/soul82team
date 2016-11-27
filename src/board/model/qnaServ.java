package board.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.pojo.qnaVO;

@Component
public class qnaServ {

	@Autowired
	SqlSessionFactory fac;
	
	public int writeMemo(qnaVO qna){
		SqlSession ss=fac.openSession();
		int r=0;
		r=ss.insert("files.insertReview",qna);
		ss.close();
		return r;
	}
	
	public int regMemo(qnaVO qvo){
		SqlSession ss=fac.openSession();
		int r=0;

		r=ss.insert("qnaboard.insertMemo",qvo);
		ss.close();
		return r;
	}
	
	public List allView(){
		SqlSession ss=fac.openSession();
		List li=ss.selectList("qnaboard.getList");
		ss.close();
		return li;
	}
	
	public qnaVO clickQna(int num){
		SqlSession ss=fac.openSession();
		int rst=0;
		rst+=ss.update("qnaboard.count",num);
		if(rst==0){
			return null;
		}else{
			qnaVO li=ss.selectOne("qnaboard.getView",num);
			ss.close();
			return li;
		}
	}
	
	public List pagingQna(int page){
		SqlSession ss=fac.openSession();
		int block=5;
		HashMap map=new HashMap();
			map.put("start",(page*block)-4);
			map.put("end",page*block);
		List li=ss.selectList("qnaboard.qnaPaging",map);
		ss.close();
		return li;
	}
	
	public int LastPage(){
		SqlSession ss=fac.openSession();
		int page=ss.selectOne("qnaboard.getCount");
		ss.close();
		
		int s=page%5;
		int div=page/5;

		if(s>=1){
			return div+=1;
		}
			return div;
	}
	
	public List searching(String search){
		SqlSession ss=fac.openSession();
		List li=ss.selectList("qnaboard.search","%"+search+"%");
		ss.close();
		return li;
	}
	
}
