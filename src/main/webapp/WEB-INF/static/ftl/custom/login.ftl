
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
<body class="login-body">
<div class="container">
        <#if redirect??>
        <form class="form-signin" id="adminForm"
              action="${BASE_PATH}/custom/login?redirect=${redirect!}" autocomplete="off"
              method="post">
        <#else>
        <form class="form-signin" id="adminForm"
              action="${BASE_PATH}/custom/login" autocomplete="off"
              method="post">
        </#if>
        <h2 class="form-signin-heading">
            <img src="${BASE_PATH}/static/images/logo.png"
                 style="height: 38px;"/>
        </h2>
        <div class="login-wrap">
            <div class="form-group">
                <label for="exampleInputEmail1">用户名</label>
                <input type="text" name="name" class="form-control" placeholder="用户名" value="" style="*width: 250px;"
                       autofocus>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">密码</label>
                <input type="password" name="password" class="form-control" placeholder="密码" value=""
                       style="*width: 250px;">
            </div>

            <div class="clearfix"></div>

            <button class="btn btn-lg btn-login btn-block" type="submit">登录</button>
        </div>
    </form>
</div>
</body>
</html>