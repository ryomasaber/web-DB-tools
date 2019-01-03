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
            <h2>重置密码</h2>
            <p>Chimeinc DB</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">

            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="user-name"></label>
                <input type="password"  id="new-password"  placeholder="请输入新密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="user-name"></label>
                <input type="password"  id="confirm-password"  placeholder="请确认密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit="" id="reset-submit">重置密码</button>
            </div>

        </div>
    </div>

</div>


<script src="/lib/layui/layui.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<script type="text/javascript">

    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    function CheckPassWord(password) {//密码必须包含数字和字母
        var reg = new RegExp(/^(?![^a-zA-Z]+$)(?!\D+$)/);
        if (reg.test(password)) {
            return true;
        } else {
            return false;
        }
    }

    $("#reset-submit").on("click",function () {
        if(!$("#new-password").val() || !$("#confirm-password").val()){
            layer.msg("必填项不能为空");
            return false;
        }
        if($("#new-password").val() != $("#confirm-password").val()){
            layer.msg("两次密码输入不一致");
            return false;
        }

        if ($("#new-password").val().length < 6  || $("#new-password").val().length > 30 ) {
            layer.msg("密码长度必须大于等于6位,小于等于30");
            return false;
        }

        if (!CheckPassWord($("#new-password").val())) {
            layer.msg("密码必须包含字母和数字！");
            return false;
        }

        $.ajax({
            type: "GET",
            url: "/resetPassword",
            data: {
                "password": $("#new-password").val(),
                "id": GetQueryString("id")
            },
            success: function (msg) {
                var result = eval('(' + msg + ')');
                if (msg.indexOf('执行成功')>-1) {
                    layer.open({
                        type: 1
                        ,offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                        ,id: 'layerDemo'+ 'auto' //防止重复弹出
                        ,content: '<div style="padding: 20px 100px;">'+ '密码重置成功' +'</div>'
                        ,btn: '跳转登录'
                        ,btnAlign: 'c' //按钮居中
                        ,shade: 0 //不显示遮罩
                        ,yes: function(){
                            layer.closeAll();
                            window.location.href = "login";
                        }
                    });
                } else {
                    layer.msg(result.data[0].error);
                }

            },
            error: function () {
                layer.msg("server error");
            }

        })
    })
</script>

<style id="LAY_layadmin_theme">.layui-side-menu,.layadmin-pagetabs .layui-tab-title li:after,.layadmin-pagetabs .layui-tab-title li.layui-this:after,.layui-layer-admin .layui-layer-title,.layadmin-side-shrink .layui-side-menu .layui-nav>.layui-nav-item>.layui-nav-child{background-color:#20222A !important;}.layui-nav-tree .layui-this,.layui-nav-tree .layui-this>a,.layui-nav-tree .layui-nav-child dd.layui-this,.layui-nav-tree .layui-nav-child dd.layui-this a{background-color:#009688 !important;}.layui-layout-admin .layui-logo{background-color:#20222A !important;}</style></body></html>