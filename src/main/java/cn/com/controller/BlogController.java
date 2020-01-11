package cn.com.controller;

import cn.com.mapper.BlogMapper;
import cn.com.po.*;
import cn.com.service.BlogService;
import cn.com.utils.DateUtils;
import cn.com.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@CrossOrigin
public class BlogController {

    @Autowired
    private BlogService firstService1;

    @Autowired
    private BlogMapper blogMapper;

    @RequestMapping(value = "/")

    public String start(HttpServletRequest request, Model model, HttpSession session) throws IOException {

        int indexPage = 0;

        List<Blog> blogs = firstService1.selectTest(indexPage);

        session.setAttribute("sessionNum", firstService1.count());

        model.addAttribute("countPage", Page.getCountPage(firstService1.count()));

        model.addAttribute("listBlog", blogs);

        session.setAttribute("sessionHead", firstService1.content("head"));

        session.setAttribute("sessionEnd", firstService1.content("end"));
        return "index";
    }

    @RequestMapping(value = "/blog-show", method = RequestMethod.GET)
    public ModelAndView blogShow(Integer id) {
        //下一篇和上一遍操作
        /*1、获取全部数据列表
         * 2取出当前id的下一个
         * 3设置值到前台
         * 4设置id
         *
         */
        ModelAndView mv = new ModelAndView();
        System.out.println("...." + id);

        BlogState blogState = firstService1.state();
        if (id == blogState.getMax() || id == blogState.getMin()) {
            mv.addObject("max", blogState.getMax());
            mv.addObject("min", blogState.getMin());
        }
        for (int i = id + 1; i <= blogState.getMax(); i++) {
            if (blogState.getIDS().contains(i) == true) {
                BlogExtends blogExtendsNext = firstService1.blogShow(i);
                mv.addObject("NextBlog", blogExtendsNext.getBlog());
                break;
            }
        }
        for (int i = id - 1; i >= blogState.getMin(); i--) {
            if (blogState.getIDS().contains(i) == true) {
                BlogExtends blogExtendsPre = firstService1.blogShow(i);
                mv.addObject("PreBlog", blogExtendsPre.getBlog());
                break;
            }
        }


        BlogExtends blogExtends = firstService1.blogShow(id);

        List<Comment> comments = firstService1.showComment(id);
        for (Comment comment : comments) {//父
            for (Comment comment1 : comments) {//子

                if (comment.getP_id() == 0) {
                    if (comment1.getP_id() == comment.getId()) {
                        List<Comment> comment2 = blogMapper.showNextComment(comment.getId());
                        comment.setNextComment(comment2);
                    }


                }
            }
        }
        System.out.println(comments);
        mv.addObject("listComment", comments);

        mv.addObject("blog", blogExtends.getBlog());

        mv.addObject("numComtent", blogExtends.getNumComment());

        mv.setViewName("blog-show");
        return mv;

    }

    @RequestMapping("/type")
    public String blogType(Integer indexPage, String type, Model model) {

        List<Blog> blogs = firstService1.selectType(type, indexPage);
        int countPage = Page.getCountPage(firstService1.numType(type));
        // 计算
        int endIndex = 6 * (countPage - 1);

        // 2、判断接收的indexPage是否为最后的索引
        if (endIndex < 0) {
            model.addAttribute("endIndex", 0);
        }
        if (endIndex == indexPage) {
            model.addAttribute("endIndex", endIndex);
        }

        int num = firstService1.numType(type);

        model.addAttribute("typeNum", num);

        model.addAttribute("listBlog", blogs);

        model.addAttribute("type", type);

        model.addAttribute("indexPage", indexPage);

        return "type-list";
    }

    @RequestMapping("/search")
    public String searchBlog(String search, Model model) {
        // 获取数目
        int num = firstService1.numSearch(search);
        // 获取插叙内容
        List<Blog> blogs = firstService1.searchBlog(search);

        model.addAttribute("typeNums", num);

        model.addAttribute("listBlog", blogs);

        model.addAttribute("title", "搜索-");
        // 重用类型列的页面，但是一页全部显示查找的内容
        return "type-list";
    }

    @RequestMapping("/comment")
    @ResponseBody
    public String postComment(String comment, Integer id, HttpSession session) {

        if (id == null) {
            id = 88;
        }
        Comment comments = new Comment();

        comments.setBlog_id(id);

        comments.setComment(comment);

        comments.setDate(DateUtils.getDate());

        User user = (User) session.getAttribute("user");
        comments.setUsername(user.getName());
        int num = firstService1.insertConmment(comments);
        if (num > 0) {
            return "評論成功";
        }
        return "評論失敗";
    }

    @RequestMapping("/about")
    public String blogAbout(Model model, HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            model.addAttribute("msg", "请先登录再查看");
            return "login";
        }
        List<Blog> blogList = firstService1.showCommentAboutBlog(user.getName());

        model.addAttribute("listBlog", blogList);
        return "comment-blog";
    }

}