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
         System.out.println("Exception error�߻�!!");
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
         mail.setSubject("Soul82-��������");
         
         String text = "<h3>�������� �Դϴ� !</h3>";
         text += "�Ʒ��� ������ȣ�� Ȩ�������� �Է����ּ���<br/>";
         text += "������ȣ : ";
         text += uid;
         mail.setText(text, "utf-8", "html");
         
         sender.send(mail);
         System.out.println("�߼� ���� !");
         return true;
         
      }catch (Exception e) {
         System.out.println("�߼� ���� !");
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