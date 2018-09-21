package com.guohouxiao.driverexam.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.guohouxiao.driverexam.model.User;
import com.guohouxiao.driverexam.utils.Tools;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 登录 / 注册
 */
@Controller
@Scope(value = "prototype")
public class LoginController extends BaseController {

    @RequestMapping("login")
    public String login(HttpServletRequest request) {
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (Tools.isEmpty(role)) {
            request.setAttribute("message", request.getAttribute("message"));
            return "login";
        }
        if (Tools.isEmpty(username)) {
            request.setAttribute("role", role);
            request.setAttribute("message", "用户名不能为空");
            return "login";
        }
        if (Tools.isEmpty(password)) {
            request.setAttribute("role", role);
            request.setAttribute("username", username);
            request.setAttribute("message", "密码不能为空");
            return "login";
        }

        User user = userService.login(username, password);
        if ("管理员".equals(role)) {
            if (user == null || !"管理员".equals(user.getRole())) {
                request.setAttribute("role", role);
                request.setAttribute("username", username);
                request.setAttribute("message", "管理员名或密码错误");
                return "login";
            }
            HttpSession session = request.getSession();
            session.setAttribute("loguser", user);
            session.setAttribute("type", "admin_");
            return "redirect:admin_index.do";
        } else if ("普通用户".equals(role)) {
            if (user == null || !"普通用户".equals(user.getRole())) {
                request.setAttribute("role", role);
                request.setAttribute("username", username);
                request.setAttribute("message", "用户名或密码错误");
                return "login";
            }
            HttpSession session = request.getSession();
            session.setAttribute("loguser", user);
            session.setAttribute("type", "user_");
            return "redirect:user_index.do";
        } else {
            request.setAttribute("message", "登录出现未知错误");
            return "login";
        }
    }

    @RequestMapping("register")
    public String register(HttpServletRequest request, RedirectAttributes attributes) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String sex = request.getParameter("sex");
        String age = request.getParameter("age");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");

        if (Tools.isEmpty(username) || Tools.isEmpty(password)) {
            return "register";
        }

        User user = new User();
        user.setId(Tools.createID());
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("普通用户");
        user.setSex(sex);
        user.setAge(Integer.valueOf(age));
        user.setMobile(mobile);
        user.setAddress(address);
        user.setCreateTime(new Date());

        if (userService.checkUsername(username)) {
            request.setAttribute("user", user);
            request.setAttribute("message", "用户名已存在");
            return "register";
        }

        userService.addUser(user);
        attributes.addFlashAttribute("message", "注册成功，马上登录");
        return "redirect:login.do";
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest request, HttpSession session) {
        session.removeAttribute("loguser");
        session.removeAttribute("type");
        request.setAttribute("message", "已成功退出登录");
        return "login";
    }

    @RequestMapping("authority")
    public String authority() {
        return "403";
    }

}
