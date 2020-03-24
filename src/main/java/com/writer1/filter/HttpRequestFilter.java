package com.writer1.filter;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;

//@WebFilter("/*")
public class HttpRequestFilter implements Filter {
    final String CHARACTER_ENCODING = "utf-8";

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        request.setCharacterEncoding(CHARACTER_ENCODING);
        httpServletResponse.setCharacterEncoding(CHARACTER_ENCODING);
        String spath = httpServletRequest.getServletPath();
        String role= (String) httpServletRequest.getSession().getAttribute("role");
        //过滤掉静态资源请求
        String[] urls = {"/pages/", "/css/", "/plugins/","favicon"};
        boolean flag = true;
        for (String str : urls) {
            if (spath.indexOf(str) != -1) {
                flag = false;
                break;
            }
        }
        if (flag) {
            if(spath.indexOf("login")!=-1){

            }
           if(spath.indexOf("admin")!=-1){
                if(role!="admin"){
                    return;
                }
                filterChain.doFilter(request, response);
            }else if(spath.indexOf("teacher")!=-1){
                if(role!="teacher"){
                    return;
                }
                filterChain.doFilter(request, response);
            }else if(spath.indexOf("student")!=-1){
                if(role!="student"){
                    return;
                }
                filterChain.doFilter(request, response);
            }
            System.out.println("请求 "+spath);
            //计算url请求响应时间
            long t1 = System.currentTimeMillis();
            filterChain.doFilter(request, response);//拦截request获取请求信息后放行
            long t2 = System.currentTimeMillis();
        } else {
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
