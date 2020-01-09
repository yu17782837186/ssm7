package com.ning.servlet;

import com.ning.pojo.Address;
import com.ning.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/es")
public class ElServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求编码格式
        request.setCharacterEncoding("utf-8");
        //设置响应编码格式
        response.setContentType("text/html;charset=utf-8");
        //获取请求信息
        String uname = request.getParameter("uname");
        String pwd = request.getParameter("pwd");
        //处理请求信息
        System.out.println(uname+":"+pwd);
        //响应处理结果
        //使用request作用域进行数据流转
        //普通字符串
        request.setAttribute("str","今天的天气真好，适合学习");
        //对象类型
        User user = new User(1,"小红","游泳",new Address("陕西","西安","紫阳"));
        request.setAttribute("user",user);
        //集合类型
        //list集合 存储普通字符串
        List<String> list = new ArrayList<>();
        list.add("小明");
        list.add("小红");
        list.add("小亮");
        request.setAttribute("list",list);
        //存储对象
        User user1 = new User(2,"小小","打篮球",new Address("四川","重庆","绵阳"));
        List<User> list1 = new ArrayList<>();
        list1.add(user1);
        request.setAttribute("list1",list1);
        //map集合 //存储普通字符串
        Map<String,String> map = new HashMap<>();
        map.put("a","北京");
        map.put("b","上海");
        map.put("c","西安");
        request.setAttribute("map",map);
        //存储对象
        Map<String,User> map1 = new HashMap<>();
        map1.put("d",new User(3,"faker","lol",new Address("韩","首尔","666")));
        request.setAttribute("map1",map1);
        //空值判断
        request.setAttribute("s","");
        request.setAttribute("s2",new User());
        request.setAttribute("s3",new ArrayList<>());
        request.setAttribute("s4",new HashMap<>());
        //请求转发
        request.getRequestDispatcher("/el.jsp").forward(request,response);
        return;
    }
}
