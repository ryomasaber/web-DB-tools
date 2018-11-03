<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>基本介绍</title>
    <link href="/lib/layui/css/layui.css" rel="stylesheet" />
    <link href="/lib/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/lib/winui/css/winui.css" rel="stylesheet" />
    <style>
        ol {
            padding-left: 20px;
        }

        ol > li {
            list-style-type: decimal;
            font-size: 13px;
            color: #444
        }
    </style>
</head>
<body class="winui-window-body">
<div class="winui-tab" style="height:100%">
    <div class="winui-tab-left">
        <div class="winui-scroll-y" style="height:auto;position:absolute;top:0;bottom:0;">
            <ul class="winui-tab-nav">
                <li class="winui-this"><i class="fa fa-info-circle fa-fw"></i>模板介绍</li>
                <li><i class="fa fa-clock-o fa-fw"></i>版本记录</li>
                <li><i class="fa fa-bug fa-fw"></i>已知BUG</li>
            </ul>
        </div>
    </div>
    <div class="winui-tab-right">
        <div class="winui-scroll-y">
            <div class="winui-tab-content">
                <div class="winui-tab-item layui-show">
                    <blockquote class="layui-elem-quote">
                        基于winui打造的一款Win10风格后台管理系统！
                    </blockquote>
                    <div class="layui-collapse" style="font-size:14px;">
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title">简介</h2>
                            <div class="layui-colla-content layui-show">
                                <blockquote class="layui-elem-quote">
                                    桌面图标双击打开。<br />
                                    主流Chime web工具集合。<br />
                                    开发者信息及联系方式：<br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;name: 雷飞飞 <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;email: feifei.lei@renren-inc.com <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   QQ: 463367527 <br />
                                    &nbsp;&nbsp;phone: 13627268272 <br /><br />
                                    持续优化中。<br />
                                </blockquote>
                            </div>
                        </div>
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title">兼容性</h2>
                            <div class="layui-colla-content">
                                <blockquote class="layui-elem-quote">
                                    由于WinAdmin框架并非职业前端人员打造，因此兼容性并不强！<br />
                                    目前开发调试全用的Google Chrome和火狐浏览器！请尽量使用Chrome浏览器访问！<br />
                                    此外，WinAdmin并非响应式，不支持手机，平板等。推荐台式或者笔记本！
                                </blockquote>
                            </div>
                        </div>
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title">使用说明</h2>
                            <div class="layui-colla-content">
                                <blockquote class="layui-elem-quote">
                                    1、用户可自定义菜单，可以选择iframe（当前窗口弹窗显示）或者new page(新开窗口显示)。<br />
                                    2、iframe模式先自己尝试，有些网站不支持被iframe，所以使用iframe无法打开，可选择new page方式打开。<br />
                                    3、开始菜单只支持两级。<br />
                                    4、内部系统，开发者有空才能优化。<br />
                                    5、左下角开始菜单可使用alt键快速打开。<br />
                                    6、右下角气泡点击可加管理员开发者QQ及微信。<br />
                                    7、桌面工具栏支持锁屏，锁屏解锁密码为当前登录的用户密码。<br />
                                </blockquote>
                            </div>
                        </div>
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title" style="color:#ff6a00">特别注意</h2>
                            <div class="layui-colla-content">
                                <blockquote class="layui-elem-quote">
                                    1、主题相关设置未保存到数据库，仅在当前浏览器生效，且清除览器缓存后失效！<br />
                                    2、桌面助手便签也未保存到数据库，清除浏览器缓存后失效！<br />
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <hr />
                <#--<blockquote class="layui-elem-quote">更多请看文档：<a style="color:#0094ff" href="http://www.win-ui.com/doc" target="_blank">点击前往</a></blockquote>-->
                </div>
                <div class="winui-tab-item">
                    <ul class="layui-timeline">
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2018年10月15日</h3>
                                <p>
                                    正式内部上线使用
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2018年09月30日</h3>
                                <p>
                                    测试环境内部上线使用
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <div class="layui-timeline-title">开发阶段</div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="winui-tab-item">
                    <ol>
                        <li>最大化后改变浏览器视口大小，窗口的位置会错乱</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/lib/layui/layui.js"></script>
<script type="text/javascript">
    layui.config({
        base: '/lib/winui/' //指定 winui 路径
    }).use(['winui']);

    window.onload = function () {
        winui.init();
    }
</script>
<#include "/base/tj.ftl">
</body>
</html>