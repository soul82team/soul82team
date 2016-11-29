package member.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class logServ {
	@Autowired
	SqlSessionFactory fac;
	
	public int logCheck(String id, String pass) {
		SqlSession sql = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("pass", pass);
		List<HashMap> rst = sql.selectList("member.log", map);
		sql.close();
		return rst.size();
	}
	public HashMap infoCheck(String id, String mail, String name, String birth) {
		SqlSession sql = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("mail", mail);
			map.put("name", name);
			map.put("birth",birth);
		HashMap rst = sql.selectOne("member.passfind", map);
		sql.close();
		return rst;
	}
	public HashMap imgnameGet(String id){
		HashMap map=new HashMap();
		SqlSession sql = fac.openSession();
		map=sql.selectOne("member.imgnameget",id);
		sql.close();
		return map;
	}
	
	
}
