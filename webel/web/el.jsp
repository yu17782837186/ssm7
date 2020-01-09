<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/11/17
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
<h3>el表达式的认识，使用传统方式来获取数据</h3>
<b><%=request.getParameter("uname")%></b><br />
<b><%=request.getAttribute("str")%></b><br />
<b><%=((User)request.getAttribute("user")).getAddr().getTown()%></b><br />
<b><%=((ArrayList)request.getAttribute("list")).get(2)%></b><br />
<b><%=((User)((ArrayList)request.getAttribute("list1")).get(0)).getAddr().getTown()%></b><br />
<b><%=((HashMap)request.getAttribute("map")).get("b")%></b><br />
<b><%=((User)(((HashMap)request.getAttribute("map1")).get("d"))).getAddr().getPre()%></b>
--%>
<%--
    传统方式获取作用域数据：
    缺点一：导入包
    缺点二：需要强转
    缺点三：获取数据的代码过于麻烦
    使用el表达式获取作用域数据：
    ${表达式}

--%>
<%--
    使用el表达式获取作用域数据
    作用：获取作用域对象中的数据 获取的是pageContext,request,session,application四个对象中的数据 找到了返回
            找不到不会报错
    语法：
        ${表达式}
        表达式：
            获取请求数据：
            request对象存储了请求数据-->param.键名 直接返回值
            request对象存储了请求数据-->paramValues.键名 返回的是数组
            自定义数据：通过setAttribute方法存储到作用域中的数据
            ${键名} 返回键名所对应的值
            注意如果存储的是普通字符串 直接返回 如果存储的是对象 则返回的是对象
            获取对象中的数据 普通对象 ${键名.属性名...} 集合对象 list集合${键名[角标]...} map集合${键名...}

        作用域查找顺序：
        默认查找顺序
        pageContext-->request-->session-->application
        每次都是从小到大查找 找到了则获取，不再继续找了
        指定查找：
        ${pageScope.hello}--${requestScope.hello}--${sessionScope.hello}--${applicationScope.hello}

        el表达式的逻辑运算
        ${逻辑表达式}：&& || ！
        ${算数表达式}：+，-，*，/,%
        ${关系表达式}：>,<,=,==,!=,
        注意：
        +表示加法运算，不表示字符连接，使用el表达式进行字符连会报错

        el的空值判断：
        ${empty 键名}
        作用：
            判断键名对象的值是否存有数据

        el获取请求头数据和cookie数据：
        请求头数据：
            ${header}-->返回所有的请求头数据
            ${header["键名"]}-->返回指定的键名的请求头数据
            ${headerValues["键名"]}-->返回指定的键名(同键不同值)的数组
        获取cookie数据;
        ${cookie}--->返回了存储所有cookie对象的map集合
        ${cookie.键名}-->返回指定的cookie对象
        ${cookie.键名.name}-->返回指定的cookie对象存储的数据的键名
        ${ckkie.键名.value}-->返回指定的cookie对象存储的数据的值
--%>
<h3>el表达式认识，使用el表达式获取作用域对象的数据</h3>
<b>${param.uname}</b><br />
<b>${paramValues.fav[1]}</b><br />
<b>${str}</b><br />
<b>${user}</b><br />
<b>${user.addr.town}</b><br />
<b>${list[2]}</b><br />
<b>${list1[0].addr.town}</b><br />
<b>${map.b}</b><br />
<b>${map1.d.addr.pre}</b><br />
<hr>
<h3> el的作用域查找顺序</h3>
<%
    pageContext.setAttribute("hello","hello PageContext");
    request.setAttribute("hello","hello Request");
    session.setAttribute("hello","hello session");
    application.setAttribute("hello","hello application");
%>
${pageScope.hello}--${requestScope.hello}--${sessionScope.hello}--${applicationScope.hello}
<h3>el表达式的逻辑运算</h3>
${1+2}--${1*2}--${1/2}--${1-2}--${1%2}--${1==1}--${1>2}--${1==1?"男":"女"}--${1+'2'}--${1+"3"}
<h3>el表达式的空值判断</h3>
${empty s}---${empty s1}---${empty s2}---${empty s3}---${empty s4}
<h3>el获取请求头数据和cookie数据</h3>
${header}--${header["user-agent"]}--${headerValues["accept-language"][0]} <br /> <br /> <br />
${cookie}--${cookie.JSESSIONID}--${cookie.JSESSIONID.name}--${cookie.JSESSIONID.value}