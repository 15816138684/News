package cn.com.mapper;

import cn.com.po.Blog;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

@Mapper
public interface BlogDao {

    @Insert("insert into news (title,data,src_show,type,content,datail) "
            + "values "
            + "(#{title},#{data},#{src_show},#{type},#{content},#{datail})")
    public void addBlog(Blog news);

    @Select("select * from news ")
    public List<Blog> findAll();

    @Delete("delete from news where id = #{id}")
    public void deleteById(Integer id);

    @Select("select * from news ")
    public List<Blog> queryBlogByPage(RowBounds rowBounds);

    @Select("select * from news where id = #{id} ")
    public Blog queryBlogById(Integer id);

    @Select("select count(*) from news ")
    public int count();

    @Update("UPDATE news " +
            "SET title=#{title},type=#{type},content=#{content},datail=#{datail}, src_show=#{src_show}, data=#{data} " +
            "WHERE news.id = #{id}")
    int updateNews(Blog news);
}