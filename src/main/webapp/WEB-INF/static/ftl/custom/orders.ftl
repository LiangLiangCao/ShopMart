<#assign menu="admin_list">
<#assign submenu="add_admin">
<#include "../head.ftl">
<style type="text/css">
    p.error {
        color: #DE5959;
    }

    .form-signin input[type="text"].error, .form-signin input[type="password"].error {
        border-color: #b94a48;
        color: #b94a48;
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    }

    input.error:focus {
        border-color: #953b39;
        color: #b94a48;
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
    }
</style>
<header class="panel-heading">
    订单信息
</header>
<h2 class="form-signin-heading">
    <img src="${BASE_PATH}/static/images/logo.png" style="height: 38px;"/>
</h2>
<div class="container">
    <h2 class="form-signin-heading"/>
<#list arryList as map >
    <div class="login-wrap">
        <div class="form-group">
            <label class="col-sm-2 control-label">订单编号：</label>
            <p class="col-sm-10" 　>${map.orders.ordrId!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">商品名称：</label>
            <p class="col-sm-10">${map.product.productName!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">商品价格：</label>
            <p class="col-sm-10">${map.orderitem.totalPrice!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">商品描述：</label>
            <p class="col-sm-10"">${map.product.description!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">购买时间：</label>
            <p class="col-sm-10">${(map.orders.payTime)!?string("yyyy-MM-dd HH:mm:ss")}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">购买数量：</label>
            <p class="col-sm-10">${map.orderitem.num!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">收货人姓名：</label>
            <p class="col-sm-10">${map.orders.name!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">收货人手机：</label>
            <p class="col-sm-10"">${map.orders.phone!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">收货人地址：</label>
            <p class="col-sm-10">${map.orders.address!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">送货方式：</label>
            <p class="col-sm-10">${map.orders.deliveryMethod!}</p>
        </div>
    </div>
</#list>
</div>
<#include "../foot.ftl">
<script type="text/javascript">
</script>
</body>
</html>
