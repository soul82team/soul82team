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
		if (r > 0){
			System.out.println("서비스 등록완료");
			return true;
		}else
			return false;
	}
	public List selectAlbum(int num) {
		SqlSession sql = fac.openSession();
		
		List<HashMap> list=sql.selectList("review.selectOne", num);
		 
		sql.close();
		return list;
	}
	
	public List readTitle(String title) {
		SqlSession sql = fac.openSession();
		
		List<HashMap> list=sql.selectList("review.gettitle", title);
		 
		sql.close();
		return list;
	}
}
