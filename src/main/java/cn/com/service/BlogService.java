package cn.com.service;
import cn.com.po.*;

import java.util.List;

public interface BlogService {

   public List<Blog> selectTest(int indexPage) ;
   
   public  BlogState state();
   
   //统计总页数用于分页逻辑
   public int countPage();
   
   public int count();
   
   public BlogExtends blogShow(Integer id);

   public List<Blog> selectType(String type, int indexPage);
   
   public int numType(String type);
   
   public List<Blog> searchBlog(String search) ; 
   
   public int numSearch(String search);
   
   public Content content(String key);
   
   public int insertConmment(Comment comment);
   
   public List<Comment> showComment(Integer id);

   List<Blog> showCommentAboutBlog(String username);

}