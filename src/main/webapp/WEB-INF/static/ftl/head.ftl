<#assign config_v="20140830004">
<#--<#assign BASE_PATH="http://localhost:8080/">-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="CMS Shopmall">
    <meta name="author" content="Caoliang">
    <meta name="keyword"
          content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="${BASE_PATH}/static/images/logo.png">
    <title>后台</title>
    <!-- Bootstrap core CSS -->
    <link href="${BASE_PATH}/static/css/bootstrap.min.css?v=${config_v}" rel="stylesheet">
    <link href="${BASE_PATH}/static/css/bootstrap-reset.css?v=${config_v}"
          rel="stylesheet">
    <link href="${BASE_PATH}/static/css/style.css?v=${config_v}" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="${BASE_PATH}/static/js/html5shiv.js"></script>
    <script src="${BASE_PATH}/static/js/respond.min.js"></script>
    <script src="${BASE_PATH}/static/js/vue.min.js"></script>
    <![endif]-->
    <script src="${BASE_PATH}/static/js/jquery.js?v=${config_v}"></script>
</head>

<div id="app" class="container">
    <div class="blog-masthead">
        <div class="container">
            <nav class="blog-nav">
                <a class="blog-nav-item active" href="/">CMBShop</a>
                <a class="blog-nav-item" href="#">商品</a>
                <a class="blog-nav-item" href="#">用户</a>
                <a class="blog-nav-item" href="${BASE_PATH}/custom/login">用户登录</a>
                <a class="blog-nav-item" href="">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                </a>
            </nav>
        </div>
    </div>
</div>
