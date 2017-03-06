<#assign menu="default">
<#include "head.ftl">


<ul class="nav nav-tabs" id="myTabs" role="tablist">

    <li role="presentation"  v-bind:class="{ active: catId==0 }">
        <a href="${BASE_PATH}/" > 所有 </a>
    </li>

    <#list catogeries as cat>
        <li role="presentation" v-bind:class="{ active: catId==${cat.categoryId}}">
            <a href="${BASE_PATH}/?catId=${cat.categoryId}">${cat.categoryName}</a>
        </li>
    </#list>

</ul>

<#list items as item>


<div class="container">
    <div class="row">

        <div class="col-md-12 item_box">
            <div class="item_image">
                <img src="${BASE_PATH}/static/images/logo.png" width="100px" height="100px" alt="iphone" class="img-rounded">
            </div>
            <div class="item_detail">
                <div class="item_title">${item.productName}</div>
                <p class="item_description">${item.description}</p>
                <a class="item_btn btn btn-xs btn-info" href="/product/${item.productId}" role="button">查看</a>
            </div>
        </div>

    </div>
</div>


</#list>


<nav aria-label="Page navigation">
    <ul class="pagination">

        <li v-bind:class="{ hide: page==1}">
            <a href="/" aria-label="First Page">
                <span aria-hidden="true">&laquo;&laquo;</span>
            </a>
        </li>
        <li v-bind:class="{ hide: page==1}">
            <a href="?page=${page-1}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>

        <li v-bind:class="{ hide: page==lastPage}">
            <a href="?page=${page+1}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>

        <li v-bind:class="{ hide: page==lastPage}">
            <a href="?page=${lastPage}" aria-label="Last Page">
                <span aria-hidden="true">&raquo;&raquo;</span>
            </a>
        </li>
    </ul>
</nav>



<#include "foot.ftl">


<script>

    vm = new Vue({
        el:"#app",
        data: {
            total:${total},
            page:${page},
            lastPage:${lastPage},
            perpage:${perpage},
            catId:${catId?default(0)},
        },
        computed:{
            PerPage: function() {

            }
        },
        methods: {
            refresh: function() {

            },
        },
        ready: function() {

        },

    })

</script>

</body>

</html>
