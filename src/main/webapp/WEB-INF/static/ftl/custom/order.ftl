<#assign menu="default">
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
<div class="container">
    <h2 class="form-signin-heading">
        <img src="${BASE_PATH}/static/images/logo.png" style="height: 38px;"/>
    </h2>
    <div class="login-wrap">
        <div class="form-group">
            <label for="exampleInputEmail1">收货人姓名</label>
            <input type="text" v-model="orders.name" class="form-control" placeholder="张三" value="bill"
                   style="*width: 250px;">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">收货人地址</label>
            <input type="text" v-model="orders.address" class="form-control" placeholder="收货人地址" value="上海市浦东区翔融苑"
                   style="*width: 250px;">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">收货人手机</label>
            <input type="text" v-model="orders.phone" class="form-control" placeholder="18312000000" value="18312976875"
                   style="*width: 250px;">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">送货方式</label>
            <input type="text" v-model="orders.deliveryMethod" class="form-control" placeholder="快递" value="快递"
                   style="*width: 250px;">
        </div>
        <button class="btn btn-lg btn-login btn-block" v-on:click="add()">确定</button>
    </div>
</div>

<#include "../foot.ftl">

<script type="text/javascript">
    vm = new Vue({
        el: '#app',
        data: {
            orders:{}
        },
        methods: {
            add: function () {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '/custom/receive',
                    data: JSON.stringify(vm.orders),
                    dataType: 'json',
                    async: true,
                    success: function (msg, status) {
                        console.log(typeof msg);
                        console.log(msg);
                        window.location.href=msg.msg;
                    },
                    error: function (xhr, desc, err) {

                        console.log("hi,cbb");
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError:" + err);
                    }
                });
            },

        }

    });
</script>


</body>

</html>
