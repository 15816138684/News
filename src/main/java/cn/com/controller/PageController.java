package cn.com.controller;

import cn.com.po.Blog;
import cn.com.service.BlogService;
import cn.com.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller

public class PageController {

    @Autowired
    private BlogService firstService2;

    @RequestMapping(value = "/next-list")
    public String toNext(Integer indexPage, Model model) {

        int countPage = firstService2.countPage();

        // 计算
        int endIndex = 6 * (countPage - 1);

        // 2、判断接收的indexPage是否为最后的索引
        // 或者只有一页的时候

        if (endIndex == indexPage) {

            model.addAttribute("endIndex", endIndex);

        }

        List<Blog> blogs = firstService2.selectTest(indexPage);

        model.addAttribute("listBlog", blogs);

        model.addAttribute("indexPage", indexPage);

        return "blog-list";

    }

    @RequestMapping(value = "/previous-list")
    public String toPrevious(Integer indexPage, Model model) throws Exception {

        List<Blog> blogs = null;
        if (indexPage == 0) {
            blogs = firstService2.selectTest(indexPage);

            model.addAttribute("listBlog", blogs);

            model.addAttribute("indexPage", indexPage);

            return "index";

        } else
            blogs = firstService2.selectTest(indexPage);

        model.addAttribute("listBlog", blogs);

        model.addAttribute("indexPage", indexPage);

        return "blog-list";
    }

    @RequestMapping(value = "/next-type-list")
    public String toNextType(Integer indexPage, Model model, String type) {

        int countPage = Page.getCountPage(firstService2.numType(type));

        int endIndex = 6 * (countPage - 1);
        if (endIndex == indexPage) {

            model.addAttribute("endIndex", endIndex);

        }

        List<Blog> blogs = firstService2.selectType(type, indexPage);

        model.addAttribute("type", type);

        model.addAttribute("listBlog", blogs);

        model.addAttribute("indexPage", indexPage);

        return "type-list";

    }

    @RequestMapping(value = "/previous-type-list")
    public String toPreviousType(Integer indexPage, Model model, String type) throws Exception {

        List<Blog> blogs = null;

        blogs = firstService2.selectType(type, indexPage);

        model.addAttribute("listBlog", blogs);

        model.addAttribute("type", type);

        model.addAttribute("indexPage", indexPage);

        return "type-list";
    }
}
