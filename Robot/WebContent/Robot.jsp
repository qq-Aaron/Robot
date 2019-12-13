<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>智能客服机器人开发</title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<style type="text/css">
	/*手动设置滚动条样式*/
    .c_center::-webkit-scrollbar{width:4px;}
    .c_center::-moz-scrollbar{width:4px;}
    .c_center::-webkit-scrollbar-track{background:#808080;border-radius:2em;}
    .c_center::-webkit-scrollbar-thumb{background-color:#03a9f4;border-radius:2em;}
    .c_center::-moz-scroll-track{background:#808080;border-radius:2em;}
    .c_center::-moz-scroll-thumb{background-color:#03a9f4;border-radius:2em;}
   /*自定义滚动条的样式*/
	*{
		margin: 0px;
	}
	body{
		width:100%;
		height:100vh;
		overflow:hidden;
		background: url("images/bg.jpg")no-repeat;
		background-size:cover;
		font-family: "楷体";
	}
	#head{
		width: 100%;
		height: 60px;
		background: rgba(0,0,0,0.2);
		text-align: center;
		line-height: 60px;
		font-size: 24px;
		color: #fff;
	}
	#content{
		width: 800px;
		height: 530px;
		background:rgba(255,2555,2555,.5);
		margin: 25px auto 0;
	}
	#content .c_head{
		width: 100%;
		height: 60px;
		background: #4caf50;
	}
	#content .c_head .h_img{
		margin:0 20px;
		border-radius:48%;
		float: left;
	}
	#content .c_head .h_span{
		float: left;
		line-height: 60px;
		color: #fff;
		font-size: 20px;
	}
	#content .c_center{
		width: 100%;
		height: 400px;
		overflow: scroll;
		overflow-x:hidden;
	}
	#content .c_center .rotWord{
		width: 100%;
		margin-top: 10px;
		overflow: hidden;
	}
	#content .c_center .rotWord span{
		background: url("images/wo.jpg");
		width: 40px;
		height: 40px;
		float: left;
		margin-left: 20px;
		border-radius:50%;
	}
	#content .c_center .rotWord p{
		max-width: 220px;
		background: rgba(0,0,255,.5);
		float: left;
		padding: 10px;
		border-radius:10px;
		margin-left: 10px;
	}
	#content .c_center .mWord{
		width: 100%;
		margin-top: 10px;
		overflow: hidden;
	}
	#content .c_center .mWord span{
		background: url("images/wo.jpg");
		width: 40px;
		height: 40px;
		float: right;
		margin-right: 20px;
		border-radius:50%;
	}
	#content .c_center .mWord p{
		max-width: 220px;
		background: rgba(0,0,255,.5);
		float: right;
		padding: 10px;
		border-radius:10px;
		margin-right: 10px;
	}
	#content .c_footer{
		width: 760px;
		height: 50px;
		margin: 0 20px;
	}
	#f_left{
		float: left;
		width: 620px;
		height: 50px;
		outline: none;
		background: rgba(0,0,0,.1);
		font-size: 18px;
		border: none;
		border-radius:5px;
		overflow: hidden;
		text-indent: 10px;
	} 
	#btn{
		width: 80px;
		height: 50px;
		background: #666;
		float: right;
		cursor: pointer;
		text-align: center;
		line-height: 50px;
		font-size: 18px;
		user-select:none;
		border-radius:10px;
	}
</style>
<script type="text/javascript">
		$(function(){
			$("#btn").click(function(){
				action();
			});
		});
        
        function action(){
        	var text=$("#f_left");
             //判断输入文本框是否有值
            if(text.val()==""||text.val==""){
               //智能优化 
                text.focus();
                return false;
            } 
            $(".c_center").append("<div class='mWord'><span></span><p>"+text.val()+"</p></div>");
            $(".c_center").scrollTop(1000000000000);
            $.ajax({
                type:"post",
                url:"robot",
                data:{"text":text.val()},
                success:function(data){
                    var result = $.parseJSON(data).text;
                    $(".c_center").append("<div class='rotWord'><span></span><p>"+result+"</p></div>");
                    $(".c_center").scrollTop(1000000000000);
                      //语言标签 autoplay自动播放
                    var obj = $('<audio src="http://fanyi.baidu.com/gettts?lan=zh&amp;text='+result+'&amp;spd=5&amp;sorce=web" autoplay></audio>');
                    $(".c_center").append(obj);
                }
            });  
            text.focus();
            
        }
         //键盘回车事件
        $(document).keydown(function(event){
            if(event.keyCode==13){
                action();
                $("#f_left").val("");
            }
        });
       
    </script>
<!-- <script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			fun();
		});
	});
	function fun(){
	     getEle('show').innerHTML =getEle('f_left').value;
	}
	function getEle(id){
	    return document.getElementById(id);
	}
</script> -->
</head>
<body>
	<div id="head">人工智能客服系统开发</div>
	<div id="content">
		<div class="c_head">
			<img alt="" src="images/mini.png" width="80px" height="60px" class="h_img">
			<span class="h_span">智能客服系统</span>
		</div>
		<div class="c_center">
			<div class="rotWord">
				<span></span>
				<p>嗨,最近想我没?</p>
			</div>
			
			<!-- <div id="mWord" class="mWord">
				<span></span>
				<p id="show">你好!</p>
			</div> --> 
		</div>
		<div class="c_footer">
			<input type="text" name="text"  id="f_left" autocomplete="off" />
			<div id="btn" >发送</div>
		</div>
	</div>
</body>
</html>