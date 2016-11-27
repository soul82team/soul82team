package board.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class reviewServ {
	@Autowired
	SqlSessionFactory fac;
	public boolean reviewin(HashMap map) {
		SqlSession sql = fac.openSession();
		int r = sql.insert("review.write", map);
		if (r > 0)
			return true;
		else
			return false;
	}
	public List readAll() {
		SqlSession sql = fac.openSession();
		
		List<HashMap> list=sql.selectList("review.getall");
		 
		sql.close();
		return list;
	}
}
