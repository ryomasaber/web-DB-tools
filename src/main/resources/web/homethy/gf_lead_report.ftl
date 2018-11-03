<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/html">
<head>
    <link rel="stylesheet" href="/css/style.css" media="all" />
    <link rel="stylesheet" href="/lib/layui/css/layui.css" media="all" />
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/layer.js"></script>
    <title>lead rsync from gf</title>
    <style type="text/css">
        .text-label{
            text-align: right;
            padding: 9px 15px;
            font-weight: 400;
            line-height: 20px;
        }
    </style>
</head>

<body >
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<div class="layui-container">


    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend style="margin-left: 205px;">GF Lead Report</legend>
    </fieldset>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-col-xs3 text-label">GF Domain</label>
            <div class="layui-input-inline" style="width: 25%;">
                <input type="text" name="gfdomain" lay-verify="pass" autocomplete="off" class="layui-input" id="gfdomain">
            </div>
            <div class="layui-form-mid layui-word-aux">请填写gf站的域名，不包含http前缀以及uri、/等,直接查询默认查询同步过lead的gf站列表</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 25%;"></label>
            <button class="layui-btn layui-btn-normal" id="query-agent">查询</button>
        </div>
        <div id="loading" class="form-horizontal" role="form" style="display:none">
            <div class="form-group">
                <div class="loading">玩儿命加载中...</div>
            </div>

        </div>

        <div class="layui-form-item" id="detail-result">

        </div>
    </form>
</div>
<script type="text/javascript" src="/lib/layui/layui.js"></script>
<script type="text/javascript">
    $("#query-agent").on("click", function () {

        $("#query-agent").addClass("layui-btn-disabled");
        $("#query-agent").removeClass("layui-btn-normal");

        var reg = /\s+/g;
        var s = $("#gfdomain").val().replace(reg, "");
        $('#loading').show();
        $('#detail-result').hide();
        try {
            $.ajax({
                type: "POST",
                url: "getGfLeadReportDetail",
                data: {
                    "domain": s
                },
                success: function (msg) {
                    document.getElementById('detail-result').innerHTML=msg;
                    $('#loading').hide();
                    $('#detail-result').fadeIn();
                    $("#query-agent").removeClass("layui-btn-disabled");
                    $("#query-agent").addClass("layui-btn-normal");
                    layui.use('element', function () {
                        var element = layui.element;
                        element.on('tab(lead-tab)', function (elem) {
                        });

                    });
                },
                error: function () {
                    layer.msg("server error");
                    $("#query-agent").removeClass("layui-btn-disabled");
                    $("#query-agent").addClass("layui-btn-normal");
                }
            })
        } catch (e) {
            console.log(JSON.stringify(e));
            $("#query-agent").removeClass("layui-btn-disabled");
            $("#query-agent").addClass("layui-btn-normal");
        }
        return false;
    });
</script>

<#include "/base/tj.ftl">
</body>


</html>
