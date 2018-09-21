package com.guohouxiao.driverexam.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.guohouxiao.driverexam.model.Configuration;
import com.guohouxiao.driverexam.model.User;
import com.guohouxiao.driverexam.utils.Tools;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guohouxiao.driverexam.model.ErrorProblem;
import com.guohouxiao.driverexam.model.Problem;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 普通用户
 */
@Controller
@Scope(value = "prototype")
public class UserController extends BaseController {

    @RequestMapping("user_index")
    public String index() {
        return "user/index";
    }

    @RequestMapping("user_info")
    public String info(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("loguser");
        user = userService.getUser(user.getId());
        request.setAttribute("user", user);
        return "user/user_info";
    }

    @RequestMapping("user_modifyUser")
    public String modifyUser(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("loguser");
        user = userService.getUser(user.getId());
        request.setAttribute("user", user);
        return "user/user_modify";
    }

    @RequestMapping("user_modifyUserSave")
    public String modifyUserSave(HttpServletRequest request) {
        String sex = request.getParameter("sex");
        String age = request.getParameter("age");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");

        User user = (User) request.getSession().getAttribute("loguser");
        request.setAttribute("user", user);

        if (Tools.isEmpty(age)) {
            request.setAttribute("message", "年龄不能为空");
            return "user/user_modify";
        }
        if (Tools.isEmpty(mobile)) {
            request.setAttribute("message", "手机号不能为空");
            return "user/user_modify";
        }
        if (Tools.isEmpty(address)) {
            request.setAttribute("message", "地址不能为空");
            return "user/user_modify";
        }

        user = userService.getUser(user.getId());
        user.setSex(sex);
        user.setAge(Integer.valueOf(age));
        user.setMobile(mobile);
        user.setAddress(address);
        userService.updateUser(user);
        request.setAttribute("user", user);
        request.setAttribute("message", "修改个人资料成功");
        return "user/user_info";
    }

    @RequestMapping("user_practice")
    public String practice(HttpServletRequest request) {
        String page = request.getParameter("page");
        String problemId = request.getParameter("problem_id");
        String problemValue = request.getParameter("problem_value");
        if (Tools.isEmpty(page)) {
            page = "1";
        }
        if (Tools.isNotEmpty(problemId) && Tools.isNotEmpty(problemValue)) {
            Problem problem = problemService.getProblem(problemId);
            if (problem != null) {
                if (problem.getAnswer().equals(problemValue)) {
                    page = String.valueOf(Integer.valueOf(page) + 1);
                } else {
                    request.setAttribute("message", "正确答案：" + problem.getAnswer());
                    request.setAttribute("problemValue", problemValue);
                }
            }
        }
        PageHelper.startPage(Integer.valueOf(page), 1);
        List<Problem> list = problemService.getProblemAll();
        PageInfo<Problem> pageInfo = new PageInfo<Problem>(list);
        request.setAttribute("pages", pageInfo);
        return "user/practice";
    }

    @RequestMapping("user_mockExam")
    public String mockExam(HttpServletRequest request) {
        Configuration configuration = configurationService.getConfiguration();
        List<Problem> simpleProblem = problemService.getProblemAll("简单");
        List<Problem> mediumProblem = problemService.getProblemAll("中等");
        List<Problem> difficultyProblem = problemService.getProblemAll("困难");
        List<Problem> simpleList = new ArrayList<>();
        List<Problem> mediumList = new ArrayList<>();
        List<Problem> difficultyList = new ArrayList<>();
        for (Problem problem : simpleProblem) {
            if (configuration.getKnowledge().contains(problem.getKnowledge())) {
                simpleList.add(problem);
            }
        }
        for (Problem problem : mediumProblem) {
            if (configuration.getKnowledge().contains(problem.getKnowledge())) {
                mediumList.add(problem);
            }
        }
        for (Problem problem : difficultyProblem) {
            if (configuration.getKnowledge().contains(problem.getKnowledge())) {
                difficultyList.add(problem);
            }
        }
        int[] simple = new int[0];
        int[] medium = new int[0];
        int[] difficulty = new int[0];
        if (simpleList.size() < configuration.getSimple()) {
            simple = Tools.randomCommon(0, simpleList.size(), simpleList.size());
        } else {
            simple = Tools.randomCommon(0, simpleList.size(), configuration.getSimple());
        }
        if (mediumList.size() < configuration.getMedium()) {
            medium = Tools.randomCommon(0, mediumList.size(), mediumList.size());
        } else {
            medium = Tools.randomCommon(0, mediumList.size(), configuration.getMedium());
        }
        if (difficultyList.size() < configuration.getDifficulty()) {
            difficulty = Tools.randomCommon(0, difficultyList.size(), difficultyList.size());
        } else {
            difficulty = Tools.randomCommon(0, difficultyList.size(), configuration.getDifficulty());
        }
        String problemIds = "";
        for (int i = 0; i < simple.length; i++) {
            problemIds += simpleList.get(simple[i] - 1).getId() + ",";
        }
        for (int i = 0; i < medium.length; i++) {
            problemIds += (mediumList.get(medium[i] - 1).getId()) + ",";
        }
        for (int i = 0; i < difficulty.length; i++) {
            problemIds += (difficultyList.get(difficulty[i] - 1).getId()) + ",";
        }
        if (problemIds.length() > 1) {
            problemIds = problemIds.substring(0, problemIds.length() - 1);
        }
        Map<String, String> problemMap = new HashMap<>();
        String[] problemIdString = problemIds.split(",");
        for (int i = 0; i < problemIdString.length; i++) {
            problemMap.put(problemIdString[i], "");
        }
        request.getSession().removeAttribute("problemMap");
        request.getSession().removeAttribute("problems");
        request.getSession().setAttribute("problemMap", problemMap);
        request.getSession().setAttribute("problemIds", problemIds);
        return "redirect:user_mockTest.do";
    }

    @SuppressWarnings("unchecked")
    @RequestMapping("user_mockTest")
    public String mockTest(HttpServletRequest request, ModelMap modelMap) {
        String number = request.getParameter("number");
        String problemId = request.getParameter("problem_id");
        String answer = request.getParameter("answer");
        String problemIds = request.getParameter("problemIds");
        if (Tools.isEmpty(problemIds)) {
            problemIds = (String) request.getSession().getAttribute("problemIds");
        }
        String[] problemIdString = problemIds.split(",");
        List<Problem> problems = new ArrayList<>();
        for (int i = 0; i < problemIdString.length; i++) {
            Problem problem = problemService.getProblem(problemIdString[i]);
            if (problem == null) {
                continue;
            }
            problems.add(problem);
        }
        int num = 0;
        if (Tools.isNotEmpty(number)) {
            num = Integer.valueOf(number);
        }
        if (Tools.isNotEmpty(problemId)) {
            Map<String, String> problemMap = (Map<String, String>) request.getSession().getAttribute("problemMap");
            problemMap.put(problemId, answer);
            request.getSession().removeAttribute("problemMap");
            request.getSession().setAttribute("problemMap", problemMap);
        }
        if (num == problems.size()) {
            return "redirect:user_mockResult.do";
        }
        Problem problem = problems.get(num);
        request.setAttribute("number", num + 1);
        request.setAttribute("total", problems.size());
        request.setAttribute("problem", problem);
        request.setAttribute("problemIds", problemIds);
        return "user/mock_exam_test";
    }

    @SuppressWarnings("unchecked")
    @RequestMapping("user_mockResult")
    public String mockResult(HttpServletRequest request, ModelMap modelMap) {
        String problemIds = (String) request.getSession().getAttribute("problemIds");
        String[] problemIdString = problemIds.split(",");
        Map<String, String> problemMap = (Map<String, String>) request.getSession().getAttribute("problemMap");
        User user = (User) request.getSession().getAttribute("loguser");
        int count = 0;
        String error = "";
        for (int i = 0; i < problemIdString.length; i++) {
            Problem problem = problemService.getProblem(problemIdString[i]);
            if (problem == null) {
                continue;
            }
            if (problem.getAnswer().equals(problemMap.get(problem.getId()))) {
                count += 1;
            } else {
                ErrorProblem errorProblem = errorProblemService.getUserErrorProblem(user.getId(), problem.getId());
                if (errorProblem == null) {
                    errorProblem = new ErrorProblem();
                    errorProblem.setId(Tools.createID());
                    errorProblem.setUserId(user.getId());
                    errorProblem.setProblemId(problem.getId());
                    errorProblem.setDifficulty(problem.getDifficulty());
                    errorProblem.setKnowledge(problem.getKnowledge());
                    errorProblem.setQuestion(problem.getQuestion());
                    errorProblem.setAnswer(problem.getAnswer());
                    errorProblem.setCount(1);
                    errorProblem.setCreateTime(new Date());
                    errorProblemService.addErrorProblem(errorProblem);
                } else {
                    errorProblem.setUserId(user.getId());
                    errorProblem.setProblemId(problem.getId());
                    errorProblem.setDifficulty(problem.getDifficulty());
                    errorProblem.setKnowledge(problem.getKnowledge());
                    errorProblem.setQuestion(problem.getQuestion());
                    errorProblem.setAnswer(problem.getAnswer());
                    errorProblem.setCount(errorProblem.getCount() + 1);
                    errorProblem.setCreateTime(new Date());
                    errorProblemService.updateErrorProblem(errorProblem);
                }
                error = error + (i + 1) + "题，";
            }
        }
        if (error.length() > 1) {
            error = error.substring(0, error.length() - 1);
        }
        double score = 100.00D;
        if (problemIdString.length > 0) {
            score = 100 / problemIdString.length * count;
        }
        request.setAttribute("score", score);
        request.setAttribute("error", error);
        return "user/mock_exam_result";
    }

    @RequestMapping("user_errorProblem")
    public String errorProblem(HttpServletRequest request) {
        String page = request.getParameter("page");
        if (Tools.isEmpty(page)) {
            page = "1";
        }
        User user = (User) request.getSession().getAttribute("loguser");
        PageHelper.startPage(Integer.valueOf(page), 10);
        List<ErrorProblem> list = errorProblemService.getUserErrorProblem(user.getId());
        PageInfo<ErrorProblem> pageInfo = new PageInfo<ErrorProblem>(list);
        request.setAttribute("pages", pageInfo);
        return "user/error_problem";
    }

    @RequestMapping("user_problemDetails")
    public String ProblemDetails(HttpServletRequest request) {
        String problemId = request.getParameter("problem_id");
        if (Tools.isEmpty(problemId)) {
            return "redirect:user_problem.do";
        }
        Problem problem = problemService.getProblem(problemId);
        if (problem == null) {
            return "redirect:user_problem.do";
        }
        request.setAttribute("problem", problem);
        return "user/problem_details";
    }

    @RequestMapping("user_password")
    public String password(HttpServletRequest request) {
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        if (Tools.isEmpty(password)) {
            return "user/password";
        }
        if (Tools.isEmpty(newPassword)) {
            return "user/password";
        }
        User user = (User) request.getSession().getAttribute("loguser");
        user = userService.getUser(user.getId());
        if (!user.getPassword().equals(password)) {
            request.setAttribute("message", "密码修改失败，原密码输入错误");
            return "user/password";
        }
        user.setPassword(newPassword);
        if (!userService.updatePassword(user)) {
            request.setAttribute("message", "密码修改失败，请重试");
            return "user/password";
        } else {
            request.setAttribute("message", "密码修改成功，下次请用新密码登录");
            return "user/password";
        }
    }

}
