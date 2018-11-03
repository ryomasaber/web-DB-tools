$(document).ready(function () {
    var trigger = $('.hamburger'),
        overlay = $('.overlay'),
        isClosed = false;

    trigger.click(function () {
        hamburger_cross();
    });

    function hamburger_cross() {

        if (isClosed == true) {
            overlay.hide();
            trigger.removeClass('is-open');
            trigger.addClass('is-closed');
            isClosed = false;
        } else {
            overlay.show();
            trigger.removeClass('is-closed');
            trigger.addClass('is-open');
            isClosed = true;
        }
    }

    $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
    });
});

window.onload = function(){
    $("input[name='env']").eq(0).attr("checked","checked");
    var defaultSchemaStr=$("#defaultSchema").val();
    document.getElementById('dataSchema').value= defaultSchemaStr;

    document.getElementById('upload').onchange = function () {
        getFileContent(this, function (str) {
            editor1.setValue(str);
        });
    };
};

$(".close").click(function(){
    $(".alert").fadeOut();
});

$(".prdoduction_close").click(function(){
    $(".prdoduction_alert").fadeOut();
});
//格式化代码函数,已经用原生方式写好了不需要改动,直接引用就好
var formatJson = function (json, options) {
    var reg = null,
        formatted = '',
        pad = 0,
        PADDING = '    ';
    options = options || {};
    options.newlineAfterColonIfBeforeBraceOrBracket = (options.newlineAfterColonIfBeforeBraceOrBracket === true) ? true : false;
    options.spaceAfterColon = (options.spaceAfterColon === false) ? false : true;
    if (typeof json !== 'string') {
        json = JSON.stringify(json);
    } else {
        json = JSON.parse(json);
        json = JSON.stringify(json);
    }
    reg = /([\{\}])/g;
    json = json.replace(reg, '\r\n$1\r\n');
    reg = /([\[\]])/g;
    json = json.replace(reg, '\r\n$1\r\n');
    reg = /(\,)/g;
    json = json.replace(reg, '$1\r\n');
    reg = /(\r\n\r\n)/g;
    json = json.replace(reg, '\r\n');
    reg = /\r\n\,/g;
    json = json.replace(reg, ',');
    if (!options.newlineAfterColonIfBeforeBraceOrBracket) {
        reg = /\:\r\n\{/g;
        json = json.replace(reg, ':{');
        reg = /\:\r\n\[/g;
        json = json.replace(reg, ':[');
    }
    if (options.spaceAfterColon) {
        reg = /\:/g;
        json = json.replace(reg, ':');
    }
    (json.split('\r\n')).forEach(function (node, index) {
            var i = 0,
                indent = 0,
                padding = '';

            if (node.match(/\{$/) || node.match(/\[$/)) {
                indent = 1;
            } else if (node.match(/\}/) || node.match(/\]/)) {
                if (pad !== 0) {
                    pad -= 1;
                }
            } else {
                indent = 0;
            }

            for (i = 0; i < pad; i++) {
                padding += PADDING;
            }
            formatted += padding + node + '\r\n';
            pad += indent;
        }
    );
    return formatted;
};

function displayJsonResult(){
    $("#operateDescription").hide();
    $("#sqlExcResultJson").show();
    $("#table-result-div").hide();
}
function displayTextResult(){
    $("#operateDescription").hide();
    $("#sqlExcResultText").show();
    $("#table-result-div").hide();
}

function displayTable(){
    $("#operateDescription").hide();
    $("#sqlExcResultJson").hide();
    $("#sqlExcResultText").hide();
    $("#table-result-div").show();
}

function changeEnvDatabase() {
    var obj = document.getElementById("tab-style");
    if($("input[name='env']:checked").val() == "prd"){
        $("#prdoduction_database").show();
        editor1.setOption("theme","3024-day");
        obj.style.cssText = "width:90%;margin-top: 130px;margin-left: 90px;";
    }else{
        $("#prdoduction_database").hide();
        editor1.setOption("theme","default");
        obj.style.cssText = "width:90%;margin-top: 50px;margin-left: 90px;";
    }
    changeSchema();
}

function hideResultAndDescription(){
    $("#operateDescription").hide();
    $("#sqlExcResultJson").hide();
    $("#sqlExcResultText").hide();
    $("#table-result-div").hide();
}
function setEditNull() {
    $("#editSql").val("");
    $("#editSqlName").val("");
    $("#editSqlId").val("");
    $(".dataExcSqlDiv").show();
    $(".editSqlDetail").hide();
    $(".alert").fadeOut();
}

function queryParams(params) {
    var temp = {
        env : $("input[name='env']:checked").val(),
        schema: $("#dataSchema").val(),
        statement: $("#dataExcSql").text(editor1.getValue())
    };
    return temp;
}

function getColumns(data){
    var cloumnsStr =[];
    console.log(data.length);
    if(data.length == 0){
        cloumnsStr.push({field:"null_result",title:"执行成功，0跳记录！"})
    }else{
        for(var item in data[0]){
            cloumnsStr.push({field:item,title:item})
        }
    }
    console.log(cloumnsStr);
    return cloumnsStr;
}

function formartTable(mdata){
    document.getElementById('result-table').innerHTML='<table id="tb_departments"></table>'
    $('#tb_departments').bootstrapTable({
        toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        method: 'POST',
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: false,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
//                                     queryParams:queryParams,//传递参数（*）
        contentType : "application/x-www-form-urlencoded",
        escape : true,
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        showExport: true,                     //是否显示导出
        exportDataType: "all",              //basic', 'all', 'selected'.
        exportTypes: [ 'csv', 'txt', 'sql', 'doc', 'excel', 'xlsx'],
        pageNumber:1,                       //初始化加载第一页，默认第一页
        pageSize: 15,                       //每页的记录行数（*）
        pageList: [10, 50, 200,500],        //可供选择的每页的行数（*）
        search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        // searchOnEnterKey: true,
        //          strictSearch: true,
        showColumns: true,                  //是否显示所有的列
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        //height: 1000,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                   //是否显示父子表
        columns: getColumns(mdata),
        data: mdata


    });
}




function appearTimes(inputStr, indexOfStr){
    //参数合法性判断
    var result = inputStr.match(new RegExp(indexOfStr, "g"));//indexOfStr需要转义
    return result ? result.length : 0;
}
$("#excExplainSubmit").on("click", function () {
    if (!editor1.getValue() || !$("#dataSchema").val()) {
        $("#myAlert").fadeIn();
        return false;
    } else {
        $("#excExplainSubmit").attr("disabled",true);
        $('#loading').show();
        hideResultAndDescription();
        $.ajax({
            type: "POST",
            url: "executeSql",
            data: {
                "env" : $("input[name='env']:checked").val(),
                "schema": $("#dataSchema").val(),
                "statement": "explain " + editor1.getValue()
            },
            success: function (msg) {
                if(msg.indexOf('page-id="databse-login-page"')>-1){
                    window.location.reload();
                    return false;
                }
                $("#excExplainSubmit").attr("disabled",false);
                $('#loading').hide();
                // var result = eval('(' + msg + ')');
                var reg=/\\/g;
                msg=msg.replace(reg," ");
                reg=/\"\{/g;
                msg=msg.replace(reg,'{');
                reg=/\}\"/g;
                msg=msg.replace(reg,'}');
                try{
                    //   $("#dataExcResult").val(formatResult);
                    $("#json-collapsed").JSONView(msg, { nl2br: true, recursive_collapser: true });
                    displayJsonResult();
                    $('.level1 .array').prev().prev().click();
                }
                catch(e){
                    editor3.setValue(formatResult);
                    displayTextResult();
                }

            },
            error: function (error) {
                $("#excExplainSubmit").attr("disabled",false);
                $('#loading').hide();
                if(isOutOfNet(error)){
                    $('#myModal').modal('show');
                    return false;
                }
                layer.msg("server error");
            }
        })
    }
    return false;
});

$("#favoriteSubmit").on("click", function () {
    // var today = new Date();
    // var date;
    // date =(today.getYear()-100)+"-" + (today.getMonth() + 1 ) + "-"+today.getDate() + "-" +$
    //     ("#dataSchema").val();
    // document.getElementById("favoriteSqlName").value=date;
    $("#addSqlName").val("");
    if (!editor1.getValue()) {
        $("#myAlert").fadeIn();
        return false;
    }
    if (editor1.getValue().length > 5000) {
        layer.msg("超过最长字符限制");
        return false;
    }
    $('#myModalName').modal('show');
});

$("#submitFavoriteSql").on("click", function () {
    var sqlName=$("#addSqlName").val();
    if (!sqlName) {
        layer.msg("请输入SQL名！");
        return false;
    }
    submitFavoriteSql(sqlName);
});


function submitFavoriteSql(sqlName) {
    $("#excSaveSubmit").attr("disabled",true);
    $.ajax({
        type: "POST",
        url: "saveUserFavoriteSql",
        data: {
            "name": sqlName,
            "statement": editor1.getValue().replace(/\n|\r\n/g,"<br>")
        },
        success: function (msg) {
            if(msg.indexOf('page-id="databse-login-page"')>-1){
                window.location.reload();
                return false;
            }
            $("#excSaveSubmit").attr("disabled",false);
            var result = eval('(' + msg + ')');
            $("#editSqlName").val("");
            //   $("#favoriteSqlName").val("favorite sql");
            layer.msg("收藏成功\n");
            $('#myModalName').modal('hide');
            reloadFavoriteList(msg);
        },
        error: function (error) {
            $("#excSaveSubmit").attr("disabled",false);
            if(isOutOfNet(error)){
                $('#myModal').modal('show');
                return false;
            }
            layer.msg("server error");
        }
    });
    return false;
}



$(".sidebar-nav").on("click", ".favoriteSql", function () {
    setEditNull();
    var id = $(this).attr("data-id");
    reg = /\%\+/g;
    var sqlDetail = $(this).attr("data-sql").replace(reg,"'");
    reg=new RegExp("<br>","g");
    sqlDetail=sqlDetail.replace(reg,"\n");
    console.log(sqlDetail);
    editor1.setValue(sqlDetail);
    $('.hamburger').click();
    return false;
});

$(".sidebar-nav").on("click", ".editFavoriteSql", function () {
    setEditNull();
    $(".editSqlDetail").show();
    $(".dataExcSqlDiv").hide();
    if($("input[name='env']:checked").val() == "prd"){
        $("#prdoduction_database").show();
    }else{
        $("#prdoduction_database").hide();
    }
    var id = $(this).attr("data-id");
    reg = /\%\+/g;
    var sqlDetail = $(this).attr("data-sql").replace(reg,"'");
    reg=new RegExp("<br>","g");
    sqlDetail=sqlDetail.replace(reg,"\n");
    var sqlname = $(this).attr("data-name");
    editor2.setValue(sqlDetail);
    $("#editSqlName").val(sqlname);
    $("#editSqlId").val(id);

    $(".alert").fadeOut();
    $('.hamburger').click();

    return false;
});


$("#excEditCancel").on("click", function () {
    setEditNull();
    return false;
});

$(".editSqlDetail").on("click", "#excEditSubmit", function () {
    if (!editor2.getValue() || !$("#editSqlName").val()) {
        $("#myAlert").fadeIn();
        return false;
    } else {
        $("#excEditSubmit").attr("disabled",true);
        $.ajax({
            type: "POST",
            url: "saveUserFavoriteSql",
            data: {
                "id"  : $("#editSqlId").val(),
                "name": $("#editSqlName").val(),
                "statement": editor2.getValue().replace(/\n|\r\n/g,"<br>")
            },
            success: function (msg) {
                if(msg.indexOf('page-id="databse-login-page"')>-1){
                    window.location.reload();
                    return false;
                }
                $("#excEditSubmit").attr("disabled",false);
                var statement = editor2.getValue().replace(/\n|\r\n/g,"<br>").replace(/\'/g,"%+");
                var id = $("#editSqlId").val();
                var name = $("#editSqlName").val();
                var domSelector = '#favorite_sql_ul [data-id="'+id+'"]';
                console.log($(domSelector))
                $(domSelector).eq(0).attr('title',name);
                $(domSelector).eq(0).html(name);
                $(domSelector).eq(0).attr('data-sql',statement);
                $(domSelector).eq(0).attr('data-content',name);
                $(domSelector).eq(1).attr('data-sql',statement);
                $(domSelector).eq(1).attr('data-name',name);
                // reloadFavoriteList(msg);
                layer.msg("保存成功\n");
                setEditNull();
            },
            error: function (error) {
                $("#excEditSubmit").attr("disabled",false);
                if(isOutOfNet(error)){
                    $('#myModal').modal('show');
                    return false;
                }
                layer.msg("server error");
            }
        })
    }
    return false;
});

$(".sidebar-nav").on("click", ".deleteFavoriteSql", function () {
    var id=$(this).attr("data-id");
    if(confirm("确认删除？")){
        $.ajax({
            type: "POST",
            url: "deleteUserFavoriteSql",
            data: {
                "id":id
            },
            success: function (msg) {
                if(msg.indexOf('page-id="databse-login-page"')>-1){
                    window.location.reload();
                    return false;
                }
                var domSelector = '#favorite_sql_ul [data-id="'+id+'"]';
                $(domSelector).parent("li").remove();
                // reloadFavoriteList(msg)
                layer.msg("删除成功\n");
            },
            error: function (error) {
                layer.msg("server error");
            }
        })
    }
    return false;
});

function isOutOfNet(msg) {
    var isForbidden = false;
    try{
        isForbidden = msg.responseText.indexOf('<title>403 Forbidden</title>')>-1;
    }catch (e){
        console.log(e);
    }
    return isForbidden;
}

function reloadFavoriteList(msg) {
    var result = JSON.parse(msg);
    msg = result.data;
    var html = "";
    for(var i = 0; i < msg.length; i++){
        let favoriteSql = msg[i];
        html += `<li class="favoriteSqlli fa fa-fw fa-home">
                        <a title="${favoriteSql.name}"
                           data-container="body" data-toggle="popover" data-placement="top"
                           data-content="${favoriteSql.name}" class="favoriteSql" data-sql='${favoriteSql.favoriteSqlDetail}' 
                           data-id="${favoriteSql.id}">${favoriteSql.name}</a>
                        <a class="editFavoriteSql" data-sql='${favoriteSql.favoriteSqlDetail}' data-id="${favoriteSql.id}" data-name="${favoriteSql.name}"><i class="glyphicon glyphicon-edit"></i></a>
                        <a class="deleteFavoriteSql"  data-id="${favoriteSql.id}"><i class="glyphicon glyphicon-trash"></i></a>
                        <a class="shareFavoriteSql"  data-id="${favoriteSql.id}"><i class="glyphicon glyphicon-share"></i></a>
                    </li>`;
    }
    $(".favoriteSqlli").remove();
    $(html).insertAfter($(".sidebar-brand"));
}

function changeSchema() {

    $.ajax({
        type: "GET",
        url: "getTables",
        data: {
            "env": $("input[name='env']:checked").val(),
            "schema": $("#dataSchema").val()
        },
        success: function (msg) {
            var result = JSON.parse(msg);
            editor1.options.hintOptions.tables=result.data;
        },
        error: function (error) {
            layer.msg("server error");
        }
    });
}

var sqlId;
$(".sidebar-nav").on("click", ".shareFavoriteSql", function () {
    sqlId = $(this).attr("data-id");
    console.log(sqlId);
    $("#ShareUserName").val("");
    $('#myModalUserName').modal('show');
});


$('#ShareUserName').bind('input propertychange', function() {
    $.ajax(
        {
            type: "GET",
            url: "getUserNames",
            data: {
                key: $("#ShareUserName").val()
            },
            success: function (data) {
                var result = JSON.parse(data);
                result = result.data;
                var str = '';
                for (var i = 0, len = result.length; i<len; i++) {
                    str += '<li data-id="'+result[i].id + '">'+ result[i].account + '</li>';
                }
                $('.list-box').html(str).show();

            },
            error: function (error) {
                layer.msg("server error");
            }
        });
});


$('body').on('click',function () {
    var target = $(this).closest('.modal-body');
    if(target.length) {
        return;
    } else {
        $('.list-box').hide();
    }
});

var userId;
$('.list-box').on('click', 'li', function () {
    userId = $(this).attr('data-id');
    $("#ShareUserName").val($(this).html());
    console.log(userId);
    $('.list-box').hide();
});


$("#shareUserFavoriteSql").on("click", function () {
    var userName=$("#ShareUserName").val();
    if (!userName) {
        layer.msg("请输入用户名！");
        return false;
    }
    shareFavoriteSql();
});


function shareFavoriteSql() {
    $.ajax({
        type: "POST",
        url: "shareUserFavoriteSql",
        data: {
            "userId": userId,
            "sqlId": sqlId
        },
        success: function (msg) {
            if(msg.indexOf('page-id="databse-login-page"')>-1){
                window.location.reload();
                return false;
            }
            layer.msg("分享成功\n");
            $('#myModalUserName').modal('hide');
        },
        error: function (error) {
            if(isOutOfNet(error)){
                $('#myModal').modal('show');
                return false;
            }
            layer.msg("server error");
        }
    });
    return false;
}


/**
 * 上传函数
 * @param fileInput DOM对象
 * @param callback 回调函数
 */
var getFileContent = function (fileInput, callback) {
    if (fileInput.files && fileInput.files.length > 0 && fileInput.files[0].size > 0) {
        //下面这一句相当于JQuery的：var file =$("#upload").prop('files')[0];
        var file = fileInput.files[0];
        if (window.FileReader) {
            var reader = new FileReader();
            reader.onloadend = function (evt) {
                if (evt.target.readyState == FileReader.DONE) {
                    callback(evt.target.result);
                }
            };
            reader.readAsText(file);
        }
    }
};

var result_data = {};
layui.use('element', function() {
    var $ = layui.jquery;
    var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

    //触发事件
    var active = {
        //在这里给active绑定几项事件，后面可通过active调用这些事件
        tabAdd: function(content,id,name) {
            //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
            //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
            element.tabAdd('table-tab-result', {
                title: name,
                content: content,
                id: id //规定好的id
            })
            FrameWH();  //计算ifram层的大小
        },
        tabChange: function(id) {
            //切换到指定Tab项
            formartTable(result_data[id]);
            displayTable();
            element.tabChange('table-tab-result', id); //根据传入的id传入到指定的tab项

        },
        tabDelete: function (id) {
            layer.msg("delete");
            element.tabDelete('table-tab-result', id);//删除
        }
        , tabDeleteAll: function (ids) {//删除所有
            $.each(ids, function (i,item) {
                element.tabDelete("table-tab-result", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
            })
        }
    };

    function FrameWH() {
        var h = $(window).height() -41- 10 - 60 -10-44 -10;
        $("iframe").css("height",h+"px");
    }

    $(window).resize(function () {
        FrameWH();
    })

    function closeAllTabs(){
        var tabtitle = $(".layui-tab-title li");
        var ids = new Array();
        $.each(tabtitle, function (i) {
            ids[i] = $(this).attr("lay-id");
        })
        //如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
        active.tabDeleteAll(ids);
    }

    $("#excSubmit").on("click", function () {
        console.log(editor1.getValue())
        if (!editor1.getValue() || !$("#dataSchema").val()) {
            layer.msg("sql不能为空");
            return false;
        } else {
            $("#excSubmit").attr("disabled",true);
            $('#loading').show();
            hideResultAndDescription();
            var reg = /\ +/g;
            var a=editor1.getValue().replace(reg," ");
            var regsn = /\ [\r\n]/g;
            var b=a.replace(regsn,"\r\n");
            var regn = /[\r\n]+/g;
            var c=a.replace(regn,"\r\n");
            var s = c.split(";\r\n");
            var isSingle = true;
            if(s.length>1 && s[1]!=''){
                isSingle=false;
            }
            $.ajax({
                type: "POST",
                url: "executeSql",
                data: {
                    "env" : $("input[name='env']:checked").val(),
                    "schema": $("#dataSchema").val(),
                    "statement": editor1.getValue()
                },
                success: function (msg) {
                    if(msg.indexOf('page-id="databse-login-page"')>-1){
                        window.location.reload();
                        return false;
                    }
                    $("#table-tab-result").removeClass("layui-hide");
                    $("#table-tab-result").addClass("layui-show");
                    closeAllTabs();
                    $("#excSubmit").attr("disabled",false);
                    $('#loading').hide();
                    var result = JSON.parse(msg);
                    var formatResult=formatJson(msg);
                    var tableHtml = '<form id="table-result-div" role="form" onsubmit="return false;">\n' +
                        '                        <div class="form-group operate-result-data" id="result-table" >\n' +
                        '                            <table id="tb_departments" ></table>\n' +
                        '                        </div>\n' +
                        '                    </form>';
                    if(isSingle){
                        var mdata;
                        if(typeof result.data !== "undefined") {
                            mdata=eval(result.data);
                        } else {
                            try {
                                mdata = eval(result);
                            } catch (e) {
                                mdata = eval('[{ "success":' + '"' + result + '"'+ '}]');
                            }
                        }
                        formartTable(mdata);
                        displayTable();
                        $("#excCountJson").hide();
                    }else{
                        result_data = {};
                        var resultData = '{ "data":{'
                        var successCount = 0;
                        var errorCount = 0;
                        var count = 1;
                        for(var item in result.data){
                            var formatData;
                            var itemResult=JSON.parse(result.data[item]);
                            if(typeof itemResult.status !== "undefined" && itemResult.status.code != 0){
                                errorCount++;
                                formatData = eval(itemResult.data);
                            } else{
                                successCount++;
                                if(Array.isArray(itemResult)){
                                    formatData = eval(result.data[item]);
                                } else {
                                    formatData = eval('[{ "success":' +  result.data[item] +  '}]');
                                }
                            }
                            result_data[count] = formatData;
                            active.tabAdd(tableHtml,count,item);
                            formartTable(eval(formatData));
                            displayTable();
                            count++;
                        }
                        active.tabChange(1);
                        var totalCount=successCount+errorCount;
                        if(errorCount>0){
                            var errorCountMsg = '，执行失败：<pan class="color_red">'+errorCount+'</pan>'
                        }else{
                            var errorCountMsg = '，执行失败：0'
                        }
                        var countMsg = '<strong>执行成功：'+ successCount +errorCountMsg+'，总数：'+totalCount+'</strong>'
                        document.getElementById('excCountJson').innerHTML=countMsg;
                        $("#excCountJson").show();
                    }
                },
                error: function (error) {
                    $('#loading').hide();
                    $("#excSubmit").attr("disabled",false);
                    if(isOutOfNet(error)){
                        $('#myModal').modal('show');
                        return false;
                    }
                    layer.msg("server error");
                }
            })

        }
        return false;
    });

    element.on('tab(table-tab-result)', function(data){
        formartTable(result_data[data.index + 1]);
        displayTable();
    });
});

