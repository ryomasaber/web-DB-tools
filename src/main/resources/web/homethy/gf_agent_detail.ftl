<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="margin-left: 205px;">Information Detail</legend>
</fieldset>

<form class="layui-form" action="">
<#if code==0>
    <div class="layui-form-item">
        <div class="layui-col-xs6">
        ${msg!''}
        </div>
    </div>
<#else>
    <div class="layui-form-item">
        <label class="layui-col-xs3 text-label">Name</label>
        <div class="layui-col-xs6">
            <input type="text" class="layui-input" value="${profile.displayName!''}" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-col-xs3 text-label ">Picture</label>
        <div class="layui-col-xs6">
            <img class="layui-upload-img" style="max-width: 200px;border: 1px solid #000" src="${pictureUrl!''}">
            <p id="demoText"></p>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-col-xs3 text-label ">Email</label>
        <div class="layui-col-xs6">
            <input type="text" class="layui-input" value="${profile.email!''}" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-col-xs3 text-label ">Phone</label>
        <div class="layui-col-xs6">
            <input type="text" class="layui-input" value="${profile.phone!''}" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-col-xs3 text-label ">Title</label>
        <div class="layui-col-xs6">
            <input type="text" class="layui-input" value="${profile.title!''}" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-col-xs3 text-label ">AltEmail1</label>
        <div class="layui-col-xs6">
            <input type="text" class="layui-input" value="${altEmail1!''}" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-col-xs3 text-label ">AltEmail2</label>
        <div class="layui-col-xs6">
            <input type="text" class="layui-input" value="${altEmail2!''}" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-col-xs3 text-label ">AltEmail3</label>
        <div class="layui-col-xs6">
            <input type="text" class="layui-input" value="${altEmail3!''}" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-col-xs3 text-label ">AltEmail4</label>
        <div class="layui-col-xs6">
            <input type="text" class="layui-input" value="${altEmail4!''}" readonly>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-col-xs3 text-label ">Automated Valuation Message</label>
        <div class="layui-col-md6" style="border-width: 1px;border-style: solid;border-color: #e2e2e2;">
            <div class="layui-card">
                <div class="layui-card-body">
                ${automatedMessageValuations!''}
                </div>
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-col-xs3 text-label ">Auto Reply Message Leads</label>
        <div class="layui-col-md6" style="border-width: 1px;border-style: solid;border-color: #e2e2e2;">
            <div class="layui-card">
                <div class="layui-card-body">
                ${autoReplyMessageLeads!''}
                </div>
            </div>
        </div>
    </div>
</#if>
</form>