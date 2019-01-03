<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
    <meta charset="utf-8">
    <title>忘记密码 - layuiAdmin</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="http://www.layui.com/admin/std/dist/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="http://www.layui.com/admin/std/dist/layuiadmin/style/login.css" media="all">
    <link id="layuicss-layer" rel="stylesheet" href="http://www.layui.com/admin/std/dist/layuiadmin/layui/css/modules/layer/default/layer.css?v=3.1.1" media="all"></head>

<body layadmin-themealias="default"><div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>找回密码</h2>
            <p>Chimeinc DB</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">

            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone" for="user-name"></label>
                <input type="text"  id="user-name"  placeholder="请输入用户名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone" for="user-name"></label>
                <input type="text"  id="user-email"  placeholder="请输入注册时的邮箱" class="layui-input">
            </div>
        <#--<div class="layui-form-item">-->
        <#--<div class="layui-row">-->
        <#--<div class="layui-col-xs7">-->
        <#--<label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>-->
        <#--<input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">-->
        <#--</div>-->
        <#--<div class="layui-col-xs5">-->
        <#--<div style="margin-left: 10px;">-->
        <#--<img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">-->
        <#--</div>-->
        <#--</div>-->
        <#--</div>-->
        <#--</div>-->
        <#--<div class="layui-form-item">-->
        <#--<div class="layui-row">-->
        <#--<div class="layui-col-xs7">-->
        <#--<label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-smscode"></label>-->
        <#--</div>-->
        <#--</div>-->
        <#--</div>-->
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" id="forget-submit">找回密码</button>
            </div>

        </div>
    </div>

</div>


<script type="text/javascript" src="/lib/layui/layui.js"></script>
<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/js/layer.js"></script>
<script type="text/javascript">

    function countDown(second) {
        // 如果秒数还是大于0，则表示倒计时还没结束
        if (second >= 0) {
            // 获取默认按钮上的文字
            if (typeof buttonDefaultValue === 'undefined') {
                buttonDefaultValue = "重新发送";
            }
            // 按钮置为不可点击状态
            $("#forget-submit").addClass("layui-btn-disabled");
            // 按钮里的内容呈现倒计时状态
            $("#forget-submit").html(buttonDefaultValue + '(' + second + ')');
            // 时间减一
            second--;
            // 一秒后重复执行
            setTimeout(function () {
                countDown(second);
            }, 1000);
            // 否则，按钮重置为初始状态
        } else {
            // 按钮置未可点击状态
            $("#forget-submit").removeClass("layui-btn-disabled");
            // 按钮里的内容恢复初始状态
            $("#forget-submit").html(buttonDefaultValue);
        }
    }
    $("#forget-submit").on("click", function () {
        if (!$("#user-name").val() || !$("#user-email").val()) {
            layer.msg("必填项不能为空");
            return false;
        }
        $("#forget-submit").addClass("layui-btn-disabled");
        $.ajax({
            type: "GET",
            url: "/forgetPassword",
            data: {
                "userName": $("#user-name").val(),
                "email": $("#user-email").val()
            },
            success: function (msg) {
                var result = eval('(' + msg + ')');
                if (msg.indexOf('执行成功') > -1) {
                    layer.msg("重置密码链接已发送至您的邮箱");
                } else {
                    layer.msg(result.data[0].error);
                }

            },
            error: function () {
                layer.msg("server error");
            }

        })
        countDown(60);
    })
</script>

<style id="LAY_layadmin_theme">.layui-side-menu,.layadmin-pagetabs .layui-tab-title li:after,.layadmin-pagetabs .layui-tab-title li.layui-this:after,.layui-layer-admin .layui-layer-title,.layadmin-side-shrink .layui-side-menu .layui-nav>.layui-nav-item>.layui-nav-child{background-color:#20222A !important;}.layui-nav-tree .layui-this,.layui-nav-tree .layui-this>a,.layui-nav-tree .layui-nav-child dd.layui-this,.layui-nav-tree .layui-nav-child dd.layui-this a{background-color:#009688 !important;}.layui-layout-admin .layui-logo{background-color:#20222A !important;}</style></body></html>