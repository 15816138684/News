package cn.com.mapper;

import cn.com.po.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
@Mapper
public interface UserMapper {
    @Select("select id,name,password from user where name = #{name} and password = #{password}")
    public User login(User user);

    @Insert("insert into user (name,password) values (#{name},#{password})")
    public int add(User user);

    @Select("select name from user where name = #{name}")
    public String rename(String name);
}
