package cn.com.mapper;

import cn.com.po.Blog;
import cn.com.po.Comment;
import cn.com.po.Content;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Set;

@Mapper
public interface BlogMapper {

    @Select("select * from news where id !=88  order by id desc limit #{indexPage},6")
    public List<Blog> AllBlog(int indexPage);

    @Select("select count(*) from news where id != 88")
    public int count();

    @Select("select MAX(id)  from news where id != 88")
    public int max();

    @Select("select id  from news where id != 88")
    public List<Integer> ids();

    @Select("select min(id)  from news where id != 88")
    public int min();

    @Select("select * from news where id = #{id}")
    public Blog blogShow(Integer id);

    @Select("select * from news where  type LIKE CONCAT('%',#{type},'%')  limit #{indexPage},6")
    public List<Blog> selectType(@Param("type") String type, @Param("indexPage") int indexPage);

    //用于分页统计
    @Select("select count(*) from news  where  type LIKE CONCAT('%',#{type},'%') ")
    public int numType(String type);

    @Select("select * from news where  title LIKE CONCAT('%',#{search},'%')")
    public List<Blog> searchBlog(String search);

    //用于分页统计
    @Select("select count(*) from news  where  title LIKE CONCAT('%',#{search},'%') ")
    public int numSearch(String search);

    @Select("select * from content where name = #{key}")
    public Content content(String key);

    @Insert("insert into comment (comment,date,username,blog_id) values (#{comment},#{date},#{username},#{blog_id})")
    public int insertConmment(Comment comment);

    @Select("select * from comment where blog_id = #{id}")
    public List<Comment> showComment(Integer id);

    @Select("select * from comment where p_id = #{p_id}")
    public List<Comment> showNextComment(Integer p_id);

    @Select("select count(*) from comment where blog_id = #{id}")
    public int numComment(Integer id);

    @Select(" SELECT blog_id FROM comment WHERE username = #{username}")
    Set<Integer> findBlogByUser(String username);
}