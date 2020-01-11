package cn.com.mapper;

import cn.com.po.AddNews;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AddnewMapper {

    @Insert("insert into news (title,data,src_show,type,content,datail,author) values (#{title},#{data},#{src_show},#{type},#{content},#{datail},#{author})")
    public int addnew(AddNews addNews);
}
