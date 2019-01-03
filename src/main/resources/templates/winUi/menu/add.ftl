<div style="width:600px;margin:0 auto;padding-top:20px;">
    <form class="layui-form" action="">
        <blockquote class="layui-elem-quote layui-text">
            Tips：使用fa-加图标名，如google图标使用fa-google  <a href="http://fontawesome.dashgame.com/" target="_blank">图标库请点击</a>
        </blockquote>
        <div class="layui-form-item">
            <label class="layui-form-label">上级菜单</label>
            <div class="layui-input-block">
                <select name="parentId">
                    <option value="0">请选择上级菜单</option>
                    <#list menuList as addMenuChild>
                        <option value="${addMenuChild.id}">${addMenuChild.name}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜单图标</label>
            <div class="layui-input-block">
                <input type="text" name="icon" win-verify="required" placeholder="请输入图标src或者class" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜单名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" win-verify="required" placeholder="请输入菜单名称" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">窗口标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" placeholder="请输入菜单名称" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜单地址</label>
            <div class="layui-input-block">
                <input type="text" name="pageUrl" placeholder="请输入菜单地址" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜单类型</label>
            <div class="layui-input-block winui-radio">
                <#if userInfo.level == 9>
                    <input type="radio" name="openType" value="1" title="HTML" />
                </#if>
                <input type="radio" name="openType" value="2" title="Iframe" checked />
                <input type="radio" name="openType" value="3" title="New Page" />
            </div>
        </div>
        <#if userInfo.level == 9>
        <div class="layui-form-item">
            <label class="layui-form-label">系统菜单</label>
            <div class="layui-input-block winui-switch">
                <input name="necessary" type="checkbox" lay-filter="isNecessary" lay-skin="switch" lay-text="是|否" value="true">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">public菜单</label>
            <div class="layui-input-block winui-switch">
                <input name="public" type="checkbox" lay-filter="isPublic" lay-skin="switch" lay-text="是|否" value="true">
            </div>
        </div>
        <#else >
            <input name="necessary" type="hidden" lay-filter="isNecessary" lay-skin="switch" lay-text="是|否" value="false">
            <input name="public" type="hidden" lay-filter="isPublic" lay-skin="switch" lay-text="是|否" value="false" >
        </#if>

        <div class="layui-form-item">
            <label class="layui-form-label">放置桌面</label>
            <div class="layui-input-block winui-switch">
                <input name="desk" type="checkbox" lay-filter="isDesk" lay-skin="switch" lay-text="是|否" value="true">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="winui-btn" lay-submit lay-filter="formAddMenu">确定</button>
                <button class="winui-btn" onclick="winui.window.close('addMenu'); return false;">取消</button>
            </div>
        </div>
    </form>
    <input type="hidden" id = "parentTableId" value="${parentTableId}">
    <div class="tips">
        Tips：</br>
        1.系统菜单不可以删除 </br>
        2.窗口标题若不填则默认和菜单名称相同 </br>
        3.地址为空的菜单才可以被选为父级菜单
    </div>
</div>
<script>
    layui.use(['form','layer'], function (form) {
        var $ = layui.$
                , msg = winui.window.msg;

        form.render();
        form.on('switch(isNecessary)', function (data) {
            $(data.elem).val(data.elem.checked);
        });
        form.on('submit(formAddMenu)', function (data) {
            //表单验证
            if (winui.verifyForm(data.elem)) {
                layui.$.ajax({
                    type: 'get',
                    url: '/menu/save',
                    async: false,
                    data: data.field,
                    success: function (json) {
                        if (json == "success") {
                            msg('添加成功');
                            winui.init();
                        } else {
                            msg(json.message)
                        }

                        winui.window.close('addMenu');
                    },
                    error: function (xml) {
                        msg('添加失败');
                        console.log(xml.responseText);
                    }
                });
            }
            return false;
        });
    });
</script>