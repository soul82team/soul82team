package member.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;

import javax.servlet.ServletContext;


@Component
public class imgServ {
	@Autowired
	ServletContext app;
	@Autowired
	SqlSessionFactory fac;
	
	public String imgSave(MultipartFile img,String id){
		String imgname ="";
		SqlSession ss = fac.openSession();
		if(img.isEmpty())
		return "no";
		try{
			imgname=img.getOriginalFilename();
			String dir= app.getRealPath("/");
			System.out.println(dir);
			File save = new File(dir,id+imgname);
			String fn=id+imgname;
			img.transferTo(save);
			HashMap map=new HashMap();
			map.put("id", id);
			map.put("course", dir);
			map.put("imgname", fn);
			ss.insert("member.imgsave",map);
			ss.close();
			return imgname;
		}catch (Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
