package com.guohouxiao.driverexam.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.guohouxiao.driverexam.model.Configuration;
import com.guohouxiao.driverexam.model.Knowledge;
import com.guohouxiao.driverexam.model.User;
import com.guohouxiao.driverexam.utils.Tools;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.guohouxiao.driverexam.model.Problem;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 管理员
 */
@Controller
@Scope(value = "prototype")
public class AdminController extends BaseController {

    @RequestMapping("admin_index")
    public String index() {
        return "admin/index";
    }

    @RequestMapping("admin_user")
    public String user(HttpServletRequest request) {
        String page = request.getParameter("page");
        if (Tools.isEmpty(page)) {
            page = "1";
        }
        PageHelper.startPage(Integer.valueOf(page), 10);
        List<User> list = userService.getUserAll();
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        request.setAttribute("pages", pageInfo);
        request.setAttribute("message", request.getAttribute("message"));
        return "admin/user";
    }

    @RequestMapping("admin_addUser")
    public String addUser(HttpServletRequest request, RedirectAttributes attributes) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String sex = request.getParameter("sex");
        String age = request.getParameter("age");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");

        if (Tools.isEmpty(username) || Tools.isEmpty(password)) {
            return "admin/user_add";
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
            request.setAttribute("message", "失败：用户（" + user.getUsername() + "）已存在");
            return "admin/user_add";
        }
        userService.addUser(user);
        attributes.addFlashAttribute("message", "新增用户（" + user.getUsername() + "）成功");
        return "redirect:admin_user.do";
    }

    @RequestMapping("admin_modifyUser")
    public String modifyUser(HttpServletRequest request) {
        String userId = request.getParameter("user_id");
        if (Tools.isEmpty(userId)) {
            return "redirect:admin_user.do";
        }
        User user = userService.getUser(userId);
        if (user == null) {
            return "redirect:admin_user.do";
        }
        request.setAttribute("user", user);
        return "admin/user_modify";
    }

    @RequestMapping("admin_modifyUserSave")
    public String modifyUserSave(HttpServletRequest request, RedirectAttributes attributes) {
        String userId = request.getParameter("user_id");
        String sex = request.getParameter("sex");
        String age = request.getParameter("age");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");

        if (Tools.isEmpty(userId)) {
            return "redirect:admin_user.do";
        }
        User user = userService.getUser(userId);
        if (user == null) {
            return "redirect:admin_user.do";
        }
        request.setAttribute("user", user);

        user.setSex(sex);
        user.setAge(Integer.valueOf(age));
        user.setMobile(mobile);
        user.setAddress(address);
        userService.updateUser(user);
        userService.updateUser(user);

        attributes.addFlashAttribute("message", "用户（" + user.getUsername() + "）个人资料已更新");
        return "redirect:admin_user.do";
    }

    @RequestMapping("admin_resetPassword")
    public String resetPassword(HttpServletRequest request, RedirectAttributes attributes) {
        String userId = request.getParameter("user_id");
        if (Tools.isEmpty(userId)) {
            return "redirect:admin_user.do";
        }
        User user = userService.getUser(userId);
        if (user == null) {
            return "redirect:admin_user.do";
        }
        userService.updateResetPassword(user);
        attributes.addFlashAttribute("message", "用户（" + user.getUsername() + "）密码已重置(初始化：123456)");
        return "redirect:admin_user.do";
    }

    @RequestMapping("admin_deleteUser")
    public String deleteUser(HttpServletRequest request, RedirectAttributes attributes) {
        String userId = request.getParameter("user_id");
        if (Tools.isEmpty(userId)) {
            return "redirect:admin_user.do";
        }

        User user = userService.getUser(userId);
        if (user == null) {
            return "redirect:admin_user.do";
        }
        userService.deleteUser(user.getId());
        attributes.addFlashAttribute("message", "用户（" + user.getUsername() + "）已删除");
        return "redirect:admin_user.do";
    }

    @RequestMapping("admin_problem")
    public String problem(HttpServletRequest request) {
        String page = request.getParameter("page");
        if (Tools.isEmpty(page)) {
            page = "1";
        }
        PageHelper.startPage(Integer.valueOf(page), 10);
        List<Problem> list = problemService.getProblemAll();
        PageInfo<Problem> pageInfo = new PageInfo<Problem>(list);
        request.setAttribute("pages", pageInfo);
        request.setAttribute("message", request.getAttribute("message"));
        return "admin/problem";
    }

    @RequestMapping("admin_addProblem")
    public String addProblem(HttpServletRequest request, RedirectAttributes attributes) {
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String difficulty = request.getParameter("difficulty");
        String knowledge = request.getParameter("knowledge");

        List<Knowledge> knowledges = knowledgeService.getKnowledgeAll();
        request.setAttribute("knowledges", knowledges);

        if (Tools.isEmpty(question)) {
            return "admin/problem_add";
        }
        if (Tools.isEmpty(optionA) || Tools.isEmpty(optionB) || Tools.isEmpty(optionC) || Tools.isEmpty(optionD)) {
            request.setAttribute("message", "选项不能为空");
            return "admin/problem_add";
        }

        Problem problem = new Problem();
        problem.setId(Tools.createID());
        problem.setQuestion(question);
        problem.setAnswer(answer);
        problem.setOptionA(optionA);
        problem.setOptionB(optionB);
        problem.setOptionC(optionC);
        problem.setOptionD(optionD);
        problem.setDifficulty(difficulty);
        problem.setKnowledge(knowledge);
        problem.setCreateTime(new Date());

        problemService.addProblem(problem);
        attributes.addFlashAttribute("message", "题目（" + problem.getQuestion() + "）新增成功");
        return "redirect:admin_problem.do";
    }

    @RequestMapping("admin_problemDetails")
    public String ProblemDetails(HttpServletRequest request) {
        String problemId = request.getParameter("problem_id");
        if (Tools.isEmpty(problemId)) {
            return "redirect:admin_problem.do";
        }
        Problem problem = problemService.getProblem(problemId);
        if (problem == null) {
            return "redirect:admin_problem.do";
        }
        request.setAttribute("problem", problem);
        return "admin/problem_details";
    }

    @RequestMapping("admin_modifyProblem")
    public String modifyProblem(HttpServletRequest request) {
        String problemId = request.getParameter("problem_id");
        if (Tools.isEmpty(problemId)) {
            return "redirect:admin_problem.do";
        }
        Problem problem = problemService.getProblem(problemId);
        List<Knowledge> knowledges = knowledgeService.getKnowledgeAll();
        request.setAttribute("knowledges", knowledges);
        request.setAttribute("problem", problem);
        return "admin/problem_modify";
    }

    @RequestMapping("admin_modifyProblemSave")
    public String modifyProblemSave(HttpServletRequest request, RedirectAttributes attributes) {
        String problemId = request.getParameter("problem_id");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String difficulty = request.getParameter("difficulty");
        String knowledge = request.getParameter("knowledge");

        List<Knowledge> knowledges = knowledgeService.getKnowledgeAll();
        request.setAttribute("knowledges", knowledges);

        if (Tools.isEmpty(problemId)) {
            return "redirect:admin_problem.do";
        }

        Problem problem = problemService.getProblem(problemId);
        if (problem == null) {
            return "redirect:admin_problem.do";
        }
        request.setAttribute("problem", problem);
        if (Tools.isEmpty(question)) {
            return "admin/problem_modify";
        }
        if (Tools.isEmpty(optionA) || Tools.isEmpty(optionB) || Tools.isEmpty(optionC) || Tools.isEmpty(optionD)) {
            request.setAttribute("message", "选项不能为空");
            return "admin/problem_modify";
        }

        problem.setQuestion(question);
        problem.setAnswer(answer);
        problem.setOptionA(optionA);
        problem.setOptionB(optionB);
        problem.setOptionC(optionC);
        problem.setOptionD(optionD);
        problem.setDifficulty(difficulty);
        problem.setKnowledge(knowledge);

        problemService.updateProblem(problem);
        attributes.addFlashAttribute("message", "题目（" + problem.getQuestion() + "）更新成功");
        return "redirect:admin_problem.do";
    }

    @RequestMapping("admin_deleteProblem")
    public String deleteProblem(HttpServletRequest request, RedirectAttributes attributes) {
        String problemId = request.getParameter("problem_id");
        if (Tools.isEmpty(problemId)) {
            return "redirect:admin_problem.do";
        }
        Problem problem = problemService.getProblem(problemId);
        if (problem == null) {
            return "redirect:admin_problem.do";
        }
        problemService.deleteProblem(problem.getId());
        attributes.addFlashAttribute("message", "题目（" + problem.getQuestion() + "）删除成功");
        return "redirect:admin_problem.do";
    }

    @RequestMapping("admin_configuration")
    public String configuration(HttpServletRequest request, RedirectAttributes attributes) {
        String flag = request.getParameter("flag");
        String simple = request.getParameter("simple");
        String medium = request.getParameter("medium");
        String difficulty = request.getParameter("difficulty");
        String knowledge[] = request.getParameterValues("knowledge");
        Configuration configuration = configurationService.getConfiguration();
        List<Knowledge> knowledges = knowledgeService.getKnowledgeAll();
        request.setAttribute("knowledges", knowledges);
        request.setAttribute("configuration", configuration);
        request.setAttribute("message", request.getAttribute("message"));
        if (Tools.isEmpty(flag)) {
            return "admin/configuration";
        }
        if (knowledge == null || knowledge.length == 0) {
            request.setAttribute("message", "知识点至少选择一个");
            return "admin/configuration";
        }
        String knowledgePoint = "";
        for (int i = 0; i < knowledge.length; i++) {
            if (i < knowledge.length - 1) {
                knowledgePoint += knowledge[i] + ",";
            } else {
                knowledgePoint += knowledge[i];
            }
        }
        User user = (User) request.getSession().getAttribute("loguser");
        if (configuration == null) {
            configuration = new Configuration();
            configuration.setId(Tools.createID());
            configuration.setSimple(Integer.valueOf(simple));
            configuration.setMedium(Integer.valueOf(medium));
            configuration.setDifficulty(Integer.valueOf(difficulty));
            configuration.setKnowledge(knowledgePoint);
            configuration.setOperator(user.getUsername());
            configuration.setDateTime(new Date());
            configurationService.addConfiguration(configuration);
        } else {
            configuration.setSimple(Integer.valueOf(simple));
            configuration.setMedium(Integer.valueOf(medium));
            configuration.setDifficulty(Integer.valueOf(difficulty));
            configuration.setKnowledge(knowledgePoint);
            configuration.setOperator(user.getUsername());
            configuration.setDateTime(new Date());
            configurationService.updateConfiguration(configuration);
        }
        attributes.addFlashAttribute("message", "修改配置成功");
        return "redirect:admin_configuration.do";
    }

    @RequestMapping("admin_password")
    public String password(HttpServletRequest request) {
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        User user = (User) request.getSession().getAttribute("loguser");

        if (Tools.isEmpty(password)) {
            return "admin/password";
        }
        if (Tools.isEmpty(newPassword)) {
            return "admin/password";
        }
        user = userService.getUser(user.getId());
        if (!user.getPassword().equals(password)) {
            request.setAttribute("message", "密码修改失败，原密码输入错误");
            return "admin/password";
        }
        user.setPassword(newPassword);
        if (!userService.updatePassword(user)) {
            request.setAttribute("message", "密码修改失败，请重试");
            return "admin/password";
        }
        request.setAttribute("message", "密码修改成功，下次请用新密码登录");
        return "admin/password";
    }

    @RequestMapping("admin_TestUser")
    public String TestUser(HttpServletRequest request, RedirectAttributes attributes) {
        for (int i = 0; i < 50; i++) {
            User user = new User();
            user.setId(Tools.createID());
            user.setUsername("TestUser" + i);
            user.setPassword("123456");
            user.setRole("普通用户");
            if (i % 2 == 0) {
                user.setSex("男");
            } else {
                user.setSex("女");
            }
            user.setAge(i + 1);
            user.setMobile("19988886666");
            user.setAddress("某某地区某某街道" + (i + 1) + "号");
            user.setCreateTime(new Date());
            if (!userService.checkUsername(user.getUsername())) {
                userService.addUser(user);
            }
        }
        attributes.addFlashAttribute("message", "测试用户添加成功");
        return "redirect:admin_user.do";
    }

}
