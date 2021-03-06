<#assign menu="default">

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
<div class="container">
    <h2 class="form-signin-heading">
        <img src="${BASE_PATH}/static/images/logo.png" style="height: 38px;"/>
    </h2>
    <div class="login-wrap">
        <div class="form-group">
            <label class="col-sm-2 control-label">订单编号：</label>
            <p class="col-sm-10"  style="*width: 250px;"　>${orders.ordrId!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">商品名称：</label>
            <p class="col-sm-10" style="*width: 250px;">${product.productName!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">商品价格：</label>
            <p class="col-sm-10" style="*width: 250px;">${orderitem.totalPrice!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">商品描述：</label>
            <p class="col-sm-10" style="*width: 250px;">${product.description!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">购买时间：</label>
            <p class="col-sm-10" style="*width: 250px;">${(orders.payTime)!?string("yyyy-MM-dd HH:mm:ss")}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">购买数量：</label>
            <p class="col-sm-10" style="*width: 250px;">${orderitem.num!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">收货人姓名：</label>
            <p class="col-sm-10" style="*width: 250px;">${orders.name!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">收货人手机：</label>
            <p class="col-sm-10" style="*width: 250px;">${orders.phone!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">收货人地址：</label>
            <p class="col-sm-10" style="*width: 250px;">${orders.address!}</p>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">送货方式：</label>
            <p class="col-sm-10" style="*width: 250px;">${orders.deliveryMethod!}</p>
        </div>
    </div>
</div>
<#include "../foot.ftl">
<script type="text/javascript">
</script>
</body>
</html>
