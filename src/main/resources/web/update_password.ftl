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
    <link id="layuicss-layer" rel="stylesheet" href="http://www.layui.com/admin/std/dist/layuiadmin/layui/css/modules/layer/default/layer.css?v=3.1.1" media="all">
</head>






<div>
    <input id="defaultSchemaStr" type="hidden" value='${user.defaultSchema}' />
</div>

<body layadmin-themealias="default">

<div class="layui-fluid">

    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="data-form">
                <span class="topBar">Hi ${user.account}&nbsp;, 上次登录ip：${user.lastLoginIp} , 上次登录时间：${user.lastLoginTime?string("yyyy-MM-dd HH:mm:ss zzzz")} , <a href="/logout">退出</a></span>
            </div>
            <div>
                <input id="level" type="hidden" value='${user.level}' />
                <input id="onlineLevel" type="hidden" value='${user.onlineLevel}' />
            </div>
            <div class="layui-card">
                <div class="layui-card-header">设置我的资料</div>
                <div class="layui-card-body" pad15="">

                    <div class="layui-form" lay-filter="roleFilter">
                        <div class="layui-form-item">
                            <#if env == 'test'>
                                <label class="layui-form-label">我的权限</label>
                            <#else>
                                <label class="layui-form-label">预发布权限</label>
                            </#if>

                            <div class="layui-input-inline">
                                <select id="role" lay-verify="required" disabled>
                                    <option value="9" >超级管理员</option>
                                    <option value="2" >DDL更改</option>
                                    <option value="1" >DML更改</option>
                                    <option value="0" >只读</option>
                                </select>


                            </div>
                            <div class="layui-form-mid layui-word-aux">当前权限不可更改为其它权限</div>
                        </div>
                        <#if env != 'test'>
                            <div class="layui-form-item">
                                <label class="layui-form-label">线上权限</label>
                                <div class="layui-input-inline">
                                    <select id="onlineRole" lay-verify="required" disabled>
                                        <option value="9" >超级管理员</option>
                                        <option value="2" >DDL更改</option>
                                        <option value="1" >DML更改</option>
                                        <option value="0" >只读</option>
                                    </select>
                                </div>
                                <div class="layui-form-mid layui-word-aux">当前权限不可更改为其它权限</div>
                            </div>
                        </#if>

                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-inline">
                                <input type="text" id="username" readonly="" class="layui-input" value="${user.account}">
                            </div>
                            <div class="layui-form-mid layui-word-aux">不可修改。</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-inline">
                                <input type="text" id="email" lay-verify="email" autocomplete="off" class="layui-input" value="${user.email}">
                            </div>
                            <button id="modify-email" class="layui-btn layui-btn-primary">更改</button>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">原始密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="password"  autocomplete="off" placeholder="请输入原始密码" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="new_password"  autocomplete="off" placeholder="请输入新密码" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">确认密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="confirm_password"  autocomplete="off" placeholder="请确认密码" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button id="edit-password-submit" class="layui-btn" lay-submit="" lay-filter="setmyinfo">确认修改</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="text-align: left;">如您有任何问题，请发送email至：<a>feifei.lei@renren-inc.com</a>
                        或QQ：<a>463367527</a> 帮您解决问题！
                    </div>
                     <#if isInitPw == true>
                     <div class="form-group" style="font-size: 20px;color: red;text-align: center;">您的密码为初始密码，请修改后使用!</div>
                     </#if>
                     <#if user.updatePasswordinterval?exists && user.updatePasswordinterval &gt; 60>
                     <div class="form-group" style="font-size: 20px;color: red;text-align: center;">
                         您的密码已到期,请修改密码,否则无法继续使用该平台工具!
                     </div>
                     </#if>

                </div>
            </div>
        </div>
    </div>
</div>



<div hidden="true" page-id="databse-login-page"></div>
<script type="text/ecmascript" src="js/md5.js"></script>
<script type="text/javascript" src="//static.chimeroi.com/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/lib/layui/layui.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<script type="text/javascript">

    window.onload = function(){
        // var defaultSchemaStr=$("#defaultSchemaStr").val();
        // document.getElementById('defaultSchema').value= defaultSchemaStr;
        layui.use(['form'], function() {
            var form = layui.form;
            $("#role").val($("#level").val());
            $("#onlineRole").val($("#onlineLevel").val());
            form.render('select','roleFilter');
            $(".select").siblings(".layui-form-select").hide();
        });

    };

    $("#modify-email").on("click", function () {
        if(!$("#email").val()){
            layer.msg("邮箱不能为空");
            return false;
        } else if($("#email").val().indexOf('@')<0){
            layer.msg("邮箱格式不正确");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "updateEmail",
            data: {"email": $("#email").val()},
            success: function (msg) {
                if (msg.indexOf('page-id="databse-login-page"') > -1) {
                    window.location.reload();
                    return false;
                }
                if (msg.indexOf("邮箱无修改")>-1) {
                    layer.msg('邮箱无修改');
                } else {
                    layer.msg('更新成功');
                }
            },
            error: function () {
                layer.msg("server error");
            }

        })


    });


    $("#edit-password-submit").on("click", function () {
        if (!$("#password").val() || !$("#new_password").val() || !$("#confirm_password").val()) {
            layer.msg("输入框不能为空");
            return false;
        } else {
            var newPassword = $("#new_password").val();
            var confirmPassword = $("#confirm_password").val();
            if (newPassword.length < 6 || confirmPassword.length < 6 || newPassword.length > 30 || confirmPassword.length > 30) {
                layer.msg("密码长度必须大于等于6位,小于等于30");
            } else if (newPassword !== confirmPassword) {
                layer.msg("新密码和确认密码不一致！");
            } else if (newPassword == $("#password").val()) {
                layer.msg("新密码不能和原始密码相同！");
            } else if (!CheckPassWord(newPassword)) {
                layer.msg("密码必须包含字母和数字！");
            } else {
                $.ajax({
                    type: "POST",
                    url: "update_password_submit",
                    data: {
                        "password": $("#password").val(),
                        "newPassword": $("#new_password").val(),
                        "confirmPassword": $("#confirm_password").val()
                    },
                    success: function (msg) {
                        if (msg.indexOf('page-id="databse-login-page"') > -1) {
                            window.location.reload();
                            return false;
                        }
                        var result = eval('(' + msg + ')');
                        if (msg.indexOf('执行成功，影响行数：1') > -1) {
                            layer.confirm('密码修改成功！\n点击确定重新登录!', {
                                btn: ['确定'] //按钮
                            }, function () {
                                window.location.href = "logout";
                            });
                        } else {
                            layer.msg(JSON.stringify(result.data));
                        }
                    },
                    error: function () {
                        layer.msg("server error");
                    }
                })
            }
        }
        return false;
    });

    function CheckPassWord(password) {//密码必须包含数字和字母
        var reg = new RegExp(/^(?![^a-zA-Z]+$)(?!\D+$)/);
        if (reg.test(password)) {
            return true;
        } else {
            return false;
        }
    }
</script>
<#include "/base/tj.ftl">
</body>


</html>
