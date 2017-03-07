<#assign menu="default">

<#include "../head.ftl">
<style type="text/css">
    .container-1 {
         padding-right: 0px;
        padding-left: 0px;m
         margin-right: auto;
         margin-left: auto;
    }
</style>
<h1 class="panel-heading" style="font-weight: 400;font-size:20px">
    所有订单信息
</h1>

<div class="container-1">
    <div class="login-wrap">
    <#list arryList as map >
        <#assign  x=map_index/>
        <#if x%1==0>
            <h4 class="form-signin-heading">
                <img src="${BASE_PATH}/static/images/logo.png" style="height: 38px;"/>
                订单信息
            </h4>
        </#if>
        <#list map?keys as key >
            <#if key=="orders">
                <div class="form-group">
                    <label class="col-xs-4 control-label">订单编号：</label>
                    <p class="col-xs-8">${(map[key].ordrId)!}</p>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label">购买时间：</label>
                    <p class="col-xs-8">${(map[key].payTime)!?string("yyyy-MM-dd HH:mm:ss")}</p>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">收货人姓名：</label>
                    <p class="col-xs-8">${(map[key].name)!}</p>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label">手机：</label>
                    <p class="col-xs-8"">${(map[key].phone)!}</p>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label">地址：</label>
                    <p class="col-xs-8">${(map[key].address)!}</p>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label">送货方式：</label>
                    <p class="col-xs-8">${(map[key].deliveryMethod)!}</p>
                </div>
            </#if>
            <#if key=="product">
                <div class="form-group">
                    <label class="col-xs-4 control-label">商品名称：</label>
                    <p class="col-xs-8">${(map[key].productName)!}</p>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label">商品描述：</label>
                    <p class="col-xs-8"">${(map[key].description)!}</p>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label">商品价格：</label>
                    <p class="col-xs-8"">${(map[key].price)!?string("#.##")}</p>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label">购买数量：</label>
                    <p class="col-xs-8">1</p>
                </div>
            </#if>

        </#list>
    </#list>
    </div>

</div>
<#include "../foot.ftl">
<script type="text/javascript">
</script>
</body>
</html>
