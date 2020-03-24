package com.writer1.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.writer1.entity.User;
import com.writer1.service.impl.UserServiceImpl;
import org.apache.http.HttpRequest;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * @author lerry
 * @style RESTful
 * */

@Controller
public class UserController {
    @Autowired
    private UserServiceImpl userServiceImpl;
    //使用指定的类UserController初始化日志对象，方便在日志输出的时候，可以打印出日志信息所属的类。
    final static Logger logger = LoggerFactory.getLogger(UserController.class);

    /*
     * 检查用户名是否已存在
     * @method GET
     * @param username
     * @return int
     * */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public @ResponseBody
    int checkUsername(@RequestParam("username") String username) {
        return userServiceImpl.queryByUsername(username);
    }

    /*
     * 注册请求
     * @method PUT
     * @param User
     * @return int
     * */
    @RequestMapping(value = "/register", method = RequestMethod.PUT)
    public @ResponseBody
    int register(@RequestBody User u) {
        String username = u.getUsername();
        String password = u.getPassword();
        return userServiceImpl.addUser(username, password);
    }

    /*
     * 获得登录状态
     * @method GET
     * @return String
     * */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public @ResponseBody
    String getUsername() {
        //如果正常登陆（执行subject.login(token)成功）
        // 就能在全局通过SecurityUtils.getSubject().getPrincipal()获取用户信息
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        logger.info("当前用户为{}", username);
        return username;
    }

    /*
     * 登陆请求,跳转不同页面
     * @method POST
     * @param User
     * @return int
     * */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public @ResponseBody
    String login(@RequestBody User u) {
        String username = u.getUsername(),
                password = u.getPassword();
        String role_permissions=userServiceImpl.queryRole_permissions(username);
        if("admin".equals(role_permissions)){
            return "admin";
        }else if ("teacher".equals(role_permissions)){
            return "teacher";
        }else {
            return "student";
        }

    }

    //校验用户是否存活
    @RequestMapping(value = "/login1", method = RequestMethod.POST)
    public @ResponseBody
    int login1(@RequestBody User u,HttpServletRequest request) {
        String username = u.getUsername(),
                password = u.getPassword();
        String is_valid=userServiceImpl.queryIs_valid(username);
        if("0".equals(is_valid)){
            return 10;
        }
        String role=userServiceImpl.queryRole_permissions(username);
        //SecurityUtils.getSubject()是每个请求创建一个Subject,
        // 并保存到ThreadContext的resources（ThreadLocal<Map<Object, Object>>）变量中，
        // 也就是一个http请求一个subject,并绑定到当前线程。
        Subject subject = SecurityUtils.getSubject();
        // // 把用户信息封装为 UsernamePasswordToken 对象
        UsernamePasswordToken token = new UsernamePasswordToken(username, password,role);
        try {
            //登录
            subject.login(token);
            logger.info(username + "已登录 ");
            Session session = subject.getSession();
            session.setAttribute("subject", subject);
            request.getSession().setAttribute("role",userServiceImpl.queryRole_permissions(username));
            return 1;
        } catch (AuthenticationException e) {
            return 0;
        }
    }
    /*
     * 退出登录
     * @method GET
     * */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public @ResponseBody
    void logout() {
        SecurityUtils.getSubject().logout();

    }
    /*
    用户管理
     */
    @RequestMapping(value = "/query",method = RequestMethod.GET)
    public @ResponseBody
    String query(@RequestParam("page") String page_, @RequestParam("limit") String limit) throws JsonProcessingException {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        int page = Integer.parseInt(page_);
        int rows = Integer.parseInt(limit);
        int offset = (page - 1) * rows;
        return userServiceImpl.queryTitle(offset, rows);
    }

}
