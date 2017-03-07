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
    订单支付
</header>
<div class="container">
    <h2 class="form-signin-heading">
        <img src="${BASE_PATH}/static/images/logo.png" style="height: 38px;"/>
    </h2>
    <div class="login-wrap">
        <div class="form-group">
            <label for="exampleInputEmail1">用户名</label>
            <input type="text" v-model="user.userId" class="form-control" placeholder="用户名" value="${username}"
                   style="*width: 250px;"
                   autofocus>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">密码</label>
            <input type="password" v-model="user.password" class="form-control" placeholder="密码" value=""
                   style="*width: 250px;">
        </div>
        <button class="btn btn-lg btn-login btn-block" v-on:click="pay()">支付</button>
    </div>
</div>
<#include "../foot.ftl">
<script type="text/javascript">
    vm = new Vue({
        el: '#app',
        data: {
            user: {}
        },
        methods: {
            pay: function () {
                console.log("hi,cbb");
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '/custom/pay',
                    data: JSON.stringify(vm.user),
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
