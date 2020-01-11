package cn.com.controller;

import cn.com.mapper.BlogDao;
import cn.com.po.Blog;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@CrossOrigin
@Controller
public class EditController {

    @Autowired
    private BlogDao blogDao;

    @RequestMapping("/toEdit")
    public String toEdit(HttpSession session, Model model) {
        if (session.getAttribute("token") != null) {
            return "edit";
        } else {
            model.addAttribute("msg", "密码错误");
            return "blogList";
        }
    }

    @ResponseBody
    @PostMapping(value = "/addBlog")
    public Blog addBlog(Blog blog, HttpSession session, ModelAndView mv) {
        Object token = session.getAttribute("token");

        if (token.toString().isEmpty()) {
            mv.setViewName("blogList");
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        blog.setData(sdf.format(new Date()).toString());
        System.out.println(blog);
        blogDao.addBlog(blog);
        return blog;
    }

    @ResponseBody
    @GetMapping("/deleteBlog/{id}")
    public String deleteBlog(@PathVariable Integer id) {
        System.out.println(id);
        blogDao.deleteById(id);

        return "删除成功";
    }

    @GetMapping(value = "/blogPage/{thisPage}")
    public Object BlogPage(Model model, @PathVariable int thisPage) {
        //1      0
        //2      5
        //3      10
        //offset=（页数-1）*5
        if (thisPage == 0) {
            thisPage = 1;
        }
        List<Blog> blogs = blogDao.queryBlogByPage(new RowBounds((thisPage - 1) * 5, 5));

        int ceil = 0;
        if (blogDao.count() % 5 == 0) {
            ceil = blogDao.count() / 5;
        } else {
            ceil = blogDao.count() / 5 + 1;
        }

        List<Integer> pageNum = new ArrayList<Integer>();
        for (int i = 1; i <= ceil; i++) {
            pageNum.add(i);
        }
        model.addAttribute("thisPage", "当前页：第" + thisPage + "页");

        model.addAttribute("page", pageNum);

        model.addAttribute("blogList", blogs);
        return "blogList";
    }

    @GetMapping("/editBlog/{id}")
    public String editBlog(@PathVariable Integer id, Model model) {

        Blog blog = blogDao.queryBlogById(id);
        if (blog != null) {
            model.addAttribute("blog", blog);
            return "editBlog";
        }
        return "edit";
    }

    @RequestMapping("/edit/updateNews")
    public String updateNews(Model mv, Blog blog) {
        blog.setData(new Date().toString());
        if (blog.getId() == ""
                || blog.getContent() == ""
                || blog.getDatail() == ""
                || blog.getSrc_show() == ""
                || blog.getTitle() == ""
                || blog.getType() == "") {
            mv.addAttribute("msg", "以上数据均不能为空");
            return "editBlog";

        }
        blogDao.updateNews(blog);
        return "redirect:/blogPage/1";
    }
}