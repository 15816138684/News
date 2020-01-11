package cn.com.controller;

import cn.com.po.AddNews;
import cn.com.po.User;
import cn.com.service.AddnewService;
import cn.com.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AddNewController {
    @Autowired
    private AddnewService addnewService;

    @RequestMapping("/addnews")
    public String login() {
        return "addnews";
    }

    @RequestMapping("/addnewsinto")
    public String addnewsinto(String title, String type, String content, String datail, Model model, HttpSession session) {
        AddNews addNews = new AddNews();

        addNews.setTitle(title);

        addNews.setData(DateUtils.getDate());

        addNews.setSrc_show("assets/images/blog/0.PNG");

        addNews.setType(type);

        addNews.setContent(content);

        addNews.setDatail(datail);

        User user = (User) session.getAttribute("user");
        addNews.setAuthor(user.getName());
        System.out.println(addNews);
        System.out.println(addNews.getType().equals("4"));
        if (addNews.getTitle() == "" || addNews.getContent() == "" || addNews.getDatail() == "" || addNews.getType().equals("4")) {
            if (addNews.getType().equals("4")) {
                model.addAttribute("msg", "请重新选择类型");
            } else {
                model.addAttribute("msg", "添加失败");
            }
            return "addnews";
        }

        int text = addnewService.addnew(addNews);
        if (text > 0) {
            model.addAttribute("msg", "添加成功");
            return "redirect:/";
        }
        return "addnews";
    }
}