<#assign config_v="20140830004">
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
    <div id="apphead" class="blog-masthead">
        <div class="container">
        <#if menu == "default">
            <nav class="blog-nav">
                <a class="blog-nav-item active" href="/">CMBShop</a>
                <a class="blog-nav-item" href="${BASE_PATH}/custom/orderAll/">订单管理</a>
                <a class="blog-nav-item" href="${BASE_PATH}/custom/private/">个人信息</a>

                <a class="blog-nav-item" href="#">
                    <span class="glyphicon glyphicon-search" aria-hidden="true" v-on:click="search()" >
                    </span>
                </a>

                <li class="blog-nav-item dropdown ">
                    <div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    </div>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="blog-nav-item" href="${BASE_PATH}/custom/login">登录</a>
                        </li>
                        <li>
                            <a class="blog-nav-item" href="${BASE_PATH}/custom/logout">登出</a>
                        </li>
                    </ul>
                </li>
            </nav>
        </#if>
        <#if menu == "admin">
            <nav class="blog-nav">
                <a class="blog-nav-item active" disabled>Admin管理后台</a>
                <li class="blog-nav-item dropdown ">
                    <div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    </div>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="blog-nav-item" href="${BASE_PATH}/admin/login/">登录</a>
                        </li>
                        <li>
                            <a class="blog-nav-item" href="${BASE_PATH}/admin/logout">登出</a>
                        </li>
                    </ul>
                </li>
            </nav>
        </#if>
        <#if menu == "supply">
            <nav class="blog-nav">
                <a class="blog-nav-item active" disabled>Supplier管理后台</a>
                <a class="blog-nav-item" href="${BASE_PATH}/supply/product/">商品</a>
                <a class="blog-nav-item" href="${BASE_PATH}/order/"> 订单</a>
                <a class="blog-nav-item" href="${BASE_PATH}/supply/category/"> 目录</a>
                <li class="blog-nav-item dropdown ">
                    <div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    </div>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="blog-nav-item" href="${BASE_PATH}/supply/login/">登录</a>
                        </li>
                        <li>
                            <a class="blog-nav-item" href="${BASE_PATH}/supply/logout">登出</a>
                        </li>
                    </ul>
                </li>
            </nav>
        </#if>
        </div>
    </div>