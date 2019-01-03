<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="margin-left: 205px;">Information Detail</legend>
</fieldset>

<#if code==0>
    <div class="layui-form-item">
        <div class="layui-col-xs6">
            ${msg!''}
        </div>
    </div>
<#else>
<div class="layui-tab" lay-filter="lead-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">去重汇总统计</li>
        <li>按月统计</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">

                <table class="layui-table" lay-even="" lay-skin="row">
                    <colgroup>
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>agent name</th>
                        <th>teamId</th>
                        <th>gf domain</th>
                        <th>total full lead</th>
                        <th>total partial lead</th>
                        <th>unique total full lead</th>
                        <th>unique total partial lead</th>
                    </tr>
                    </thead>
                    <tbody>

            <#list totalList as lead>
            <tr>
                <td>${lead.name!''}</td>
                <td>${lead.uid!''}</td>
                <td>${lead.domain!''}</td>
                <td>${lead.fullLeadCount}</td>
                <td>${lead.partialLeadCount}</td>
                <td>${lead.uniqueFullLeadCount}</td>
                <td>${lead.uniquePartialLeadCount}</td>
            </tr>
            </#list>
                    </tbody>
                </table>

        </div>
        <div class="layui-tab-item">

                <table class="layui-table" lay-even="" lay-skin="row">
                    <colgroup>
                        <col width="20%">
                        <col width="15%">
                        <col width="20%">
                        <col width="15%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>agent name</th>
                        <th>teamId</th>
                        <th>gf domain</th>
                        <th>month</th>
                        <th>full lead count</th>
                        <th>partial lead count</th>
                    </tr>
                    </thead>
                    <tbody>

            <#list list as lead>
            <tr>
                <td>${lead.name!''}</td>
                <td>${lead.uid!''}</td>
                <td>${lead.domain!''}</td>
                <td>${lead.date!''}</td>
                <td>${lead.fullLeadCount}</td>
                <td>${lead.partialLeadCount}</td>
            </tr>
            </#list>
                    </tbody>
                </table>
        </div>
    </div>
</div>

</#if>