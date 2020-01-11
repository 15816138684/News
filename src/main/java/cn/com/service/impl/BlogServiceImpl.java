package cn.com.service.impl;

import cn.com.mapper.BlogMapper;
import cn.com.po.*;
import cn.com.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Transactional
@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper blogMapper;
    //1、注入模板

    /*@Resource
    private RedisTemplate<String, Object> redisTemplate;*/
    @Override
    public List<Blog> selectTest(int indexPage) {
        return this.blogMapper.AllBlog(indexPage);
    }

    //返回分页数目
    @Override
    public int countPage() {
        int count = this.blogMapper.count();
        int countPage;
        if (count % 6 != 0) {
            countPage = count / 6 + 1;
        } else {
            countPage = count / 6;
        }
        return countPage;
    }


    @Override
    public BlogExtends blogShow(Integer id) {
        // TODO 自动生成的方法存根
        BlogExtends blogExtends = new BlogExtends();
        blogExtends.setNumComment(blogMapper.numComment(id));
        blogExtends.setBlog(blogMapper.blogShow(id));
        return blogExtends;
    }


    public List<Blog> selectType(String type, int indexPage) {

        return this.blogMapper.selectType(type, indexPage);
    }

    public int numType(String type) {
        // TODO 自动生成的方法存根
        return this.blogMapper.numType(type);
    }

    @Override
    public List<Blog> searchBlog(String search) {
        // TODO 自动生成的方法存根
        return this.blogMapper.searchBlog(search);
    }

    public int numSearch(String search) {
        // TODO 自动生成的方法存根
        return this.blogMapper.numSearch(search);
    }

    public int count() {
        // TODO 自动生成的方法存根
        return this.blogMapper.count();
    }

    public Content content(String key) {
        // TODO 自动生成的方法存根
        return this.blogMapper.content(key);
    }

    public int insertConmment(Comment comment) {
        // TODO 自动生成的方法存根
        return this.blogMapper.insertConmment(comment);
    }

    public List<Comment> showComment(Integer id) {
        // TODO 自动生成的方法存根
        return this.blogMapper.showComment(id);
    }

    @Override
    public List<Blog> showCommentAboutBlog(String username) {
        Set<Integer> blogId = blogMapper.findBlogByUser(username);
        List<Blog> blogList = new ArrayList<>();
        for (Integer id : blogId){
            Blog blog = blogMapper.blogShow(id);
            blogList.add(blog);
        }

        return blogList;
    }

    public BlogState state() {
        // TODO 自动生成的方法存根
        BlogState blogState = new BlogState();
        blogState.setIDS(blogMapper.ids());
        blogState.setMax(blogMapper.max());
        blogState.setMin(blogMapper.min());
        return blogState;
    }
}