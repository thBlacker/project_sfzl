<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>星空登录</title>
    <style>
        *{margin: 0;padding: 0;}
        html,body{height: 100%;}
        body{background: linear-gradient(to bottom, #131313 0%,#02101c 100%);}
        .canvas-box{position: fixed;left: 0;top: 0;z-index: -1;}
        .box{position: absolute;z-index: 10;color:#fff;font-family: Arial;left: 50%;top:50%;transform: translate(-50%,-50%);text-align: center;}
        a:link,a:hover,a:visited,a:active{text-decoration: none;color: inherit;display: block;}
        a{margin: 30px 0;font-size: 20px;}

        .outer{
            width: 350px;
            height: 400px;
            /*border: solid 1px  red;*/
            margin-left: 40%;
            margin-top: 15%;
        }
        .title{
            text-align: center;
            font-family: 华文行楷;
            font-size: 45px;
            color: cyan;
        }
        .mid{
            width: 320px;
            height: 280px;
            border: solid 1px yellow;
            margin-left: 10px;
            margin-top: 20px;
        }
        .but{
            width: 320px;
            height: 25px;
            margin-left: 10px;
            margin-top: 10px;
            /*border: solid 1px white;*/
        }
        .f_pw{
            float: left;
            font-family: 华文行楷;
            font-size: 20px;
            color: white;
        }
        .t_zc{
            float: right;
            font-family: 华文行楷;
            font-size: 20px;
            color: white;
        }
        .in_name,.in_pard{
            width: 300px;
            height: 40px;
            margin-top: 20px;
            margin-left: 5px;
        }
        .in_yzm{
            margin-top: 20px;
            margin-left: 5px;
            width: 200px;
            height: 40px;
        }
        .dl{
            height: 30px;
            width: 200px;
            font-family: 华文行楷;
            color: white;
            font-size: 25px;
        }
    </style>
</head>
<body>
<div class="canvas-box">
    <canvas id="canvas">你的浏览器不支持canvas</canvas>
</div>

    <div class="outer">
        <div class="title">
            让世界看到你~
        </div>
        <div class="mid"><%--登录需要的数据--%>
            <input name="name" class="in_name"/>
            <input name="password" class="in_pard"/>
            <input name="yzm" class="in_yzm"/><img class="yzm" src="">
            <button class="b_dl"><span class="dl">登录</span></button>
        </div>
        <div class="but">
            <p class="f_pw">忘记密码？</p>
            <p class="t_zc">我要注册</p>
        </div>
    </div>

<script>
    var WINDOW_WIDTH = document.body.offsetWidth;
    var WINDOW_HEIGHT = document.body.offsetHeight;
    var canvas,context;
    var num = 500;
    var stars = [];
    var mouseX = WINDOW_WIDTH/2;
    var mouseY = WINDOW_HEIGHT/2;
    var rnd;

    window.onload = function(){
        canvas = document.getElementById('canvas');
        canvas.width = WINDOW_WIDTH;
        canvas.height = WINDOW_HEIGHT;

        context = canvas.getContext('2d');

        addStar();
        setInterval(render,33);
        liuxing();

        // render();
        document.body.addEventListener('mousemove',mouseMove);
    }

    function liuxing(){
        var time = Math.round(Math.random()*3000+33);
        setTimeout(function(){
            rnd = Math.ceil(Math.random()*stars.length)
            liuxing();
        },time)
    }

    function mouseMove(e){
        //因为是整屏背景，这里不做坐标转换
        mouseX = e.clientX;
        mouseY = e.clientY;
    }

    function render(){
        context.fillStyle = 'rgba(0,0,0,0.1)';
        context.fillRect(0,0,WINDOW_WIDTH,WINDOW_HEIGHT);
        // context.clearRect(0,0,WINDOW_WIDTH,WINDOW_HEIGHT)
        for(var i =0; i<num ; i++){
            var star = stars[i];
            if(i == rnd){
                star.vx = -5;
                star.vy = 20;
                context.beginPath();
                context.strokeStyle = 'rgba(255,255,255,'+star.alpha+')';
                context.lineWidth = star.r;
                context.moveTo(star.x,star.y);
                context.lineTo(star.x+star.vx,star.y+star.vy);
                context.stroke();
                context.closePath();
            }
            star.alpha += star.ra;
            if(star.alpha<=0){
                star.alpha = 0;
                star.ra = -star.ra;
                star.vx = Math.random()*0.2-0.1;
                star.vy = Math.random()*0.2-0.1;
            }else if(star.alpha>1){
                star.alpha = 1;
                star.ra = -star.ra
            }
            star.x += star.vx;
            if(star.x>=WINDOW_WIDTH){
                star.x = 0;
            }else if(star.x<0){
                star.x = WINDOW_WIDTH;
                star.vx = Math.random()*0.2-0.1;
                star.vy = Math.random()*0.2-0.1;
            }
            star.y += star.vy;
            if(star.y>=WINDOW_HEIGHT){
                star.y = 0;
                star.vy = Math.random()*0.2-0.1;
                star.vx = Math.random()*0.2-0.1;
            }else if(star.y<0){
                star.y = WINDOW_HEIGHT;
            }
            context.beginPath();
            var bg = context.createRadialGradient(star.x, star.y, 0, star.x, star.y, star.r);
            bg.addColorStop(0,'rgba(255,255,255,'+star.alpha+')')
            bg.addColorStop(1,'rgba(255,255,255,0)')
            context.fillStyle  = bg;
            context.arc(star.x,star.y, star.r, 0, Math.PI*2, true);
            context.fill();
            context.closePath();
        }
    }

    function addStar(){
        for(var i = 0; i<num ; i++){
            var aStar = {
                x:Math.round(Math.random()*WINDOW_WIDTH),
                y:Math.round(Math.random()*WINDOW_HEIGHT),
                r:Math.random()*3,
                ra:Math.random()*0.05,
                alpha:Math.random(),
                vx:Math.random()*0.2-0.1,
                vy:Math.random()*0.2-0.1
            }
            stars.push(aStar);
        }
    }
</script>
</body>
</html>