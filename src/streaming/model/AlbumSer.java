package streaming.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AlbumSer {
	@Autowired
	SqlSessionFactory fac;
	public HashMap songinfo(int num){
		SqlSession sql = fac.openSession();
		HashMap rst = sql.selectOne("mp3.getAlbum", num);
		sql.close();
		return rst;
	}
}
