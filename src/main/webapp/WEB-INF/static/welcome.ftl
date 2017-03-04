<#assign menu="admin_list">
<#assign submenu="admin_list">
<#include "head.ftl">


<style>

.image{

    float:left;
    width: 100px;
    height: 100px;
}


.description{
    float:left;
}
</style>


<div class="container">

<#list latestProduct as item>


<div class="row">
    <div class="col-md-12">
        <div class="image">
            <img src="/static/images/iphone.webp" width="100px" height="100px" alt="iphone" class="img-rounded">
        </div>
        <div class="description">
            <h2>${item.productName}</h2>
            <p>${item.description}<p>
            <a class="btn btn-default" href="/product/${item.proId}" role="button">View details »</a></p>
        </div>
    </div>
</div>


</#list>




    <div class="search-box row">
        <div class="col-md-3"></div>
        <form class="col-md-7 col-md-offset-3 form-inline">
            <input type="text" class="form-control" id="searchInput" placeholder="输入关键字">
            <span type="submit" class="btn btn-primary" id="go" onclick="jumpTo();" alt="Search">搜索</span>
        </form>
    </div>



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

</body>

</html>
