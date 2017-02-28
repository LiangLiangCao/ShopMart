<#assign menu="admin_list">
<#assign submenu="admin_list">
<#include "head.ftl">

<div class="blog-masthead">
    <div class="container">
        <nav class="blog-nav">
            <a class="blog-nav-item active" href="#">CMBShop</a>
            <a class="blog-nav-item" href="#">商品</a>
            <a class="blog-nav-item" href="#">用户</a>
            <a class="blog-nav-item" href="#">商家</a>
            <a class="blog-nav-item" href="/login.htm">登录</a>
        </nav>
    </div>
</div>

<div class="container">

    <div class="col-md-12">
        <div class="col-md-3">
            <img src="/static/images/iphone.webp" alt="iphone" class="img-rounded">
        </div>
        <div class="col-md-9">
            <h2>iphone 7</h2>
            <p>iPhone 7 now has the best performance and battery life ever, as well as new finishes, water resistance, and stereo speakers.
            <p><a class="btn btn-default" href="#" role="button">View details »</a></p>
        </div>
    </div>


    <div class="search-box row">
        <div class="col-md-3"></div>
        <form class="col-md-7 col-md-offset-3 form-inline">
            <input type="text" class="form-control" id="searchInput" placeholder="输入关键字">
            <span type="submit" class="btn btn-primary" id="go" onclick="jumpTo();" alt="Search">搜索</span>
        </form>
    </div>


    <div>${some}</div>

    <div class="row">
        <div class="col-md-4">
            <table class="table table-hover table-condensed" id="wordFreqRank">
                <h4 class="th-center">热词排行</h4>
                <th>排名</th>
                <th>关键词</th>
                <th>频率</th>
                <th>趋势</th>
            </table>
        </div>
        <div class="col-md-4">
            <table class="table table-hover table-condensed" id="wordUptrendRank">
                <h4 class="th-center">上升最快</h4>
                <th>排名</th>
                <th>关键词</th>
                <th>频率</th>
                <th>同比</th>
            </table>
        </div>
        <div class="col-md-4">
            <table class="table table-hover table-condensed" id="siteUpdateNumRank">
                <h4 class="th-center">最近更新网站</h4>
                <th>排名</th>
                <th>网站</th>
                <th>更新数</th>
                <th>同比</th>
            </table>
        </div>
    </div>

</div><!-- /.container -->



<#include "foot.ftl">