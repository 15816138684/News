package cn.com.controller;

import cn.com.po.User;
import cn.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/logininto")
    public String logininto(User user, Model model, HttpSession session) {
        if (user == null) {
            model.addAttribute("msg", "登录失败");
            return "login";
        }
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));

        System.out.println(user);

        User loginUser = userService.login(user);
        if (loginUser != null) {
            session.setAttribute("user", loginUser);
            return "redirect:/";
        }
        model.addAttribute("msg", "登录失败");
        return "login";
    }

    @RequestMapping("/regist")
    public String regist() {
        return "regist";
    }

    @RequestMapping("/registinto")
    public String registinto(User user, Model model) {

        if (user.getName() == "" || user.getPassword() == "") {
            model.addAttribute("msg", "注册失败");
            return "regist";
        }

        String test = userService.rename(user.getName());
        System.out.println(test);
        if (test != null) {
            model.addAttribute("msg", "用户已存在，请重新注册");
            return "regist";
        }

        String str = user.getPassword();
        String pattern = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";

        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(str);

        if (!m.matches()) {
            model.addAttribute("msg", "密码输入错误");
            return "regist";
        }

        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        System.out.println(user);
        int i = userService.add(user);
        if (i > 0) {
            return "redirect:/";
        }
        model.addAttribute("msg", "注册失败");
        return "regist";

    }

    @RequestMapping("/loginout")
    public String loginout(Model model, HttpSession session) {
        session.removeAttribute("user");
        model.addAttribute("msg", "退出成功");
        return "redirect:/";

    }
}