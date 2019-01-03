<form id="operateDescription" class="form-horizontal" role="form" style="" xmlns="http://www.w3.org/1999/html">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">说明</label>
        <div class="col-sm-8">
            <p>意见或建议发送邮件至：feifei.lei@renren-inc.com</p>
            <p>导入文件请选择txt文件或sql文件</p>
            <p>单条SQL执行table形式返回，多条SQL依然已JSON形式返回展示</p>
            <p>默认查询未加limit最大查询<span class="color_red text-thickening">500</span>条,加limit查询最大支持查询<span class="color_red text-thickening">10W</span>条,<span class="color_red text-thickening">limit数量大请指定查询字段，不要写select *</span></p>
            <p>支持多数据不同表关联查询，表名前加上数据库名schema</p>
            <p>支持多条sql执行，使用<sspan class="color_red">英文;接回车</sspan>分隔</p>
            <p>单个条件结果请写在一行内，以下<span class="color_red">标红</span>为<span class="color_red">错误</span>写法，如:</p>
            <p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;select * from table_name where</span></p>
            <p><span class="color_red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;account='fei</span></p>
            <p><span class="color_red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fei'</span></p>
            <p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;and id=1</span></p>
            <p><span class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;and json_1='{</span></p>
            <p><span class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"data":[</span></p>
            <p><span class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],</span></p>
            <p><span class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"status":{</span></p>
            <p><span class="color_red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"msg":"suc</span></p>
            <p><span class="color_red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cess",</span></p>
            <p><span class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"code":0</span></p>
            <p><span class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span></p>
            <p><span class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}'</span></p>
            <p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;and email=</span></p>
            <p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'feifei@qq.com'</span></p>
        </div>
    </div>

</form>