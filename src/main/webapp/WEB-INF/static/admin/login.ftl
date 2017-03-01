<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Liang">
    <meta name="keyword"
          content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>ShopMart登录页面</title>

    <!-- Bootstrap core CSS -->
    <link href="${BASE_PATH}/static/manage/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="${BASE_PATH}/static/manage/css/bootstrap-reset.css"
          rel="stylesheet">
    <!--external css-->
    <link href="${BASE_PATH}/static/manage/assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="${BASE_PATH}/static/manage/css/style.css" rel="stylesheet">
    <link href="${BASE_PATH}/static/manage/css/style-responsive.css"
          rel="stylesheet"/>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="${BASE_PATH}/static/manage/js/html5shiv.js"></script>
    <script src="${BASE_PATH}/static/manage/js/respond.min.js"></script>
    <![endif]-->
    <script src="${BASE_PATH}/static/manage/js/jquery.js"></script>
    <script src="${BASE_PATH}/static/manage/js/jquery.form.min.js"></script>

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
</head>

<body class="login-body">

<div class="container">

    <form class="form-signin" id="adminForm"
          action="${BASE_PATH}/admin/login.json" autocomplete="off"
          method="post">
        <h2 class="form-signin-heading">
            <img src="${BASE_PATH}/static/manage/img/logo.png"
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