package member.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class modifyServ {
	@Autowired
	SqlSessionFactory fac;

	public HashMap idData(String id) {
		SqlSession sql = fac.openSession();
		
			
		HashMap r = sql.selectOne("member.logcheck",id);
		sql.close();
		return r;
	}
	public int memset(String img, String pass, String mail,String id) {
		SqlSession sql = fac.openSession();
		HashMap map= new HashMap();
		map.put("img", img);
		map.put("pass", pass);
		map.put("mail", mail);
		map.put("id", id);
			
		int r = sql.update("member.memup", map);
		sql.close();
		return r;
	}
	
	public HashMap imgGet(String id){
		HashMap map=new HashMap();
		SqlSession sql = fac.openSession();
		map=sql.selectOne("member.imgget",id);
		sql.close();
		return map;
	}
	public int memdelet(String id){
		SqlSession sql = fac.openSession();
		int r=sql.delete("member.memdel",id);
		
		return r;
		
	}

	
}
