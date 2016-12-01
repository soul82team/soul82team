package member.model;

import java.util.HashMap;
import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import member.pojo.Member;

@Component
public class joinServ {
   @Autowired
   JavaMailSender sender;
   
   @Autowired
   SqlSessionFactory fac;
   
   public int joinVO(Member m){
      SqlSession ss = fac.openSession();
      int r=0;
      try{
         r+=ss.insert("member.join",m);   
         if(r==1){
            ss.commit();
         }else{
            ss.rollback();
         }
      }catch(Exception e){
         e.printStackTrace();
         ss.rollback();
         System.out.println("Exception error발생!!");
      }finally{
         ss.close();
      }
      return r;
   }
   
   public boolean exist(String id){
      SqlSession sql = fac.openSession();
      List li = sql.selectList("member.logcheck", id);
      sql.close();
      if(li.size()==1){
         return true;
      }else{
         return false;
      }
   }
   
   public boolean sendEmail(String authmail, String uid){
      MimeMessage mail = sender.createMimeMessage();   
      
      System.out.println(authmail);
      System.out.println(uid);
      
      try{
         mail.setRecipient(RecipientType.TO, new InternetAddress(authmail));
         mail.setSender(new InternetAddress("test@group.kr"));
         mail.setSubject("Soul82-인증메일");
         
         String text = "<h3>인증메일 입니다 !</h3>";
         text += "아래의 인증번호를 홈페이지에 입력해주세요<br/>";
         text += "인증번호 : ";
         text += uid;
         mail.setText(text, "utf-8", "html");
         
         sender.send(mail);
         System.out.println("발송 성공 !");
         return true;
         
      }catch (Exception e) {
         System.out.println("발송 에러 !");
         e.printStackTrace();
         return false;
      }   
      
   }
   
   public String authMail(String id){
      SqlSession sql = fac.openSession();
      List li = sql.selectList("member.findId", id);
         HashMap map = (HashMap)li.get(0);
         String pass = map.get("PASS").toString();
         
      return pass;
   }
   
}