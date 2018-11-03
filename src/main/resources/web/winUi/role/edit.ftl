<style>
    dl.menulist dd {
        margin-left: 26px;
    }

    dl.menulist dd,
    dl.menulist dt {
        height: 30px;
        line-height: 30px;
    }

        dl.menulist dd .layui-form-checkbox,
        dl.menulist dt .layui-form-checkbox {
            margin-right: 8px;
        }

    dl.menulist .functions {
        margin-left: 200px;
        float: right;
    }

        dl.menulist .functions > span {
            padding: 0 5px;
        }

    dl.menulist .layui-form-checkbox[lay-skin="primary"] {
        margin-top: 2px;
    }
</style>
<div style="width:860px;margin:0 auto;padding-top:20px;">
    <form class="layui-form layui-form-pane" action="">
        <input type="hidden" name="id" value="${userRole.id!''}" />
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-block">
                <input type="text" name="roleName" win-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input" value="${userRole.roleName!''}" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色描述</label>
            <div class="layui-input-block">
                <input type="text" name="description" win-verify="required" placeholder="请输入角色描述" autocomplete="off" class="layui-input" value="${userRole.description!''}" />
            </div>
        </div>
        <div class="layui-form-item">
            <input id="hidMenus" type="hidden" name="menus" value="" />
            <input id="hidFuctions" type="hidden" name="functions" value="" />
            <hr class="layui-bg-blue">
            <dl class="menulist layui-form">
                <#list sysMenus as panretMenu>
                    <dt>
                        <input type="checkbox" class="cbxmenu" value="${panretMenu.id}" lay-skin="primary" lay-filter="cbxmenu" <#if panretMenu.roleSelect == true>checked</#if> />${panretMenu.name}
                    </span>
                    </dt>
                    <#if panretMenu.childs?exists && panretMenu.childs?size &gt; 0 >
                        <#list panretMenu.childs as childMenu>
                            <dd>
                                <input type="checkbox" class="cbxmenu" value="${childMenu.id}" lay-skin="primary" lay-filter="cbxmenu" <#if childMenu.roleSelect == true>checked</#if> />${childMenu.name}
                            </dd>
                        </#list>
                    </#if>
                </#list>
            </dl>
            <hr class="layui-bg-blue">
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block txtcenter" style="margin-left:0;">
                <button class="winui-btn" lay-submit lay-filter="formEditRole" onclick="getMenuAndFunction()">确定</button>
                <button class="winui-btn" onclick="winui.window.close('editRole'); return false;">取消</button>
            </div>
        </div>
    </form>
</div>
<script>
    var getMenuAndFunction;
    layui.use(['form'], function (form) {
        form.render();
        form.on('submit(formEditRole)', function (data) {
            //表单验证
            try {
                if (winui.verifyForm(data.elem)) {
                    layui.$.ajax({
                        type: 'POST',
                        url: '/role/update',
                        async: false,
                        data: data.field,
                        dataType: 'json',
                        success: function (json) {
                            winui.window.msg('修改成功');
                            winui.window.close('editRole');
                        },
                        error: function (xml) {
                            winui.window.msg('修改失败');
                            console.log(xml.responseText);
                        }
                    });
                }
            } catch (e) {
                console.log(e);
                return false;
            }
            return false;
        });
        getMenuAndFunction = function () {
            var $menu = layui.$('.cbxmenu:checked');
            var $function = layui.$('.cbxfunction:checked');
            var menus = '';
            var functions = '';
            layui.each($menu, function () {
                menus += layui.$(this).val() + ',';
            });
            layui.each($function, function () {
                functions += layui.$(this).val() + ',';
            });
            layui.$('#hidMenus').val(menus);
            layui.$('#hidFuctions').val(functions);
        }
        layui.$(function () {
            form.on('checkbox(cbxmenu)', function (data) {
                layui.$(data.elem).parent('dt').nextUntil('dt').find('input[type=checkbox]').prop('checked', data.elem.checked);
                if (data.elem.checked)
                    layui.$(data.elem).parent('dd').prevAll('dt').first().children('input[type=checkbox]').prop('checked', data.elem.checked);
                layui.$(data.elem).siblings('.functions').find('input[type=checkbox]').prop('checked', data.elem.checked);
                form.render('checkbox');
            });
            form.on('checkbox(cbxfunction)', function (data) {
                if (data.elem.checked) {
                    layui.$(data.elem).parents('.functions').prevAll('input[type=checkbox]').prop('checked', data.elem.checked);
                    layui.$(data.elem).parents('.functions').prevAll('input[type=checkbox]').parent('dd').prevAll('dt').first().children('input[type=checkbox]').prop('checked', data.elem.checked);
                }
                form.render('checkbox');
            });
        });
    });
</script>