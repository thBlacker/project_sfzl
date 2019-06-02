<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>争鸣书法网</title>
   <%-- <script type="text/javascript" src="/WEB-INF/pages/sfzl/sfzls.js?v=1.0" ></script>
    <script type="text/javascript" src="/WEB-INF/pages/public/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/WEB-INF/pages/public/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/WEB-INF/pages/public/js/easyui-lang-zh_CN.js"></script>--%>
</head>
<%
    String returnCode = request.getAttribute("returnCode").toString();
    ArrayList<Map> hotList = null;
    if ("00".equals(returnCode)) {//查询成功
        hotList = (ArrayList<Map>) request.getAttribute("hotList");
    }
    ArrayList<Map> newList = null;
    if ("00".equals(returnCode)) {//查询成功
        newList = (ArrayList<Map>) request.getAttribute("newList");
    }
    if(hotList != null && hotList.size()>0 && newList != null && newList.size()>0 ){
%>
<style>
    body{
        background-color: lightgoldenrodyellow;
        width:100%;
        background-size:100% 100%;
    }
    .all{
        margin-left: 40px;
    }
    .all .self{
        text-align: center;
    }
    .self{
        height: 250px;
        width: 335px;
        margin-top: 10px;
        margin-left: 30px;
        float: left;
        box-shadow: darkgrey 10px 10px 30px 5px ;//边框阴影
    }
    .ms{
        /*不换行 超出部分使用 ... 代替 */
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 330px;/*设置的长度*/
        height: 30px;

        font-family: 隶书;
        font-size: 15px;
        margin-top: 10px;
    }
    .head{
        /*background-image: ;*/
        margin-top: 30px;
        font-family: 华文行楷;
        font-size: 50px;
    }
    .bottom{
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 460px;

        font-family: 华文行楷;
        font-size: 20px;
        position: absolute;
        right: -140px;
        top: 10px;
    }
    .img{
        height:200px;
        width:315px;
        padding-top: 10px;
        overflow:hidden;
        background-color: antiquewhite;
        margin-left: 10px;
    }
    .img img{
        width:auto;
        height:auto;
        max-width:100%;
        max-height:100%;
    }
    .t1{
        height: 21px;
        font-family: 隶书;
        font-size: 20px;
    }
    .hot,.new{
        margin-top: 30px;
        height: 600px;
    }
</style>
<body>
    <div class="head">百家争鸣之书法</div>

    <div class="all">

        <div class="hot">
            <div class="t1">人气榜</div>
            <%
                for(int i = 0; i< hotList.size(); i++){
            %>
                <div  class="self">
                    <div class="img">
                        <img src="<%=request.getContextPath()%>/resource/<%=hotList.get(i).get("url")%>/<%=hotList.get(i).get("type")%>.jpg" >
                    </div>
                    <div class="ms">
                            <%--作者：<%=sfList.get(i).get("auther")%> |--%>
                            作品名：<%=hotList.get(i).get("name")%> |
                            访问量：<%=hotList.get(i).get("fwl")%>
                            <%--上传者：<%=sfList.get(i).get("userid")%>--%><%--上传者：<%=sfList.get(i).get("userid")%>--%>

                    </div>
                    <input class="userid" type="hidden" value="<%=hotList.get(i).get("type")%>">
                    <input class="userid" type="hidden" value="<%=hotList.get(i).get("url")%>">
                    <input class="userid" type="hidden" value="<%=hotList.get(i).get("id")%>">
                </div>
            <%
                }
            %>
        </div>


        <div class="new">
            <div class="t1">鲜货榜</div>
            <%
                for(int i = 0; i< newList.size(); i++){
            %>
            <div  class="self">
                <div class="img">
                    <img src="<%=request.getContextPath()%>/resource/<%=newList.get(i).get("url")%>/<%=newList.get(i).get("type")%>.jpg" >
                </div>
                <div class="ms">
                    <%--作者：<%=sfList.get(i).get("auther")%> |--%>
                    作品名：<%=newList.get(i).get("name")%> |
                    上传时间：<%=newList.get(i).get("lrrq")%>
                    <%--上传者：<%=sfList.get(i).get("userid")%>--%><%--上传者：<%=sfList.get(i).get("userid")%>--%>

                </div>
                <input class="userid" type="hidden" value="<%=newList.get(i).get("type")%>">
                <input class="userid" type="hidden" value="<%=newList.get(i).get("url")%>">
                <input class="userid" type="hidden" value="<%=newList.get(i).get("id")%>">
            </div>

            <%
                }
            %>
        </div>
    </div>
</body>
        <div class="bottom">
            <a onclick="toLogin()">登录上传书法作品，让更多的人看见！</a>
        </div>
<%
    }
%>

<script type="text/javascript">
    function toLogin() {
        window.location.href="/pages/dl/login.jsp";
    }
</script>
</html>
