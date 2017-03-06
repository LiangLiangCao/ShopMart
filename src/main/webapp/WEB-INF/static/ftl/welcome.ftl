
<#include "head.ftl">

<nav class="blog-nav">
    <#list catogeries as cat>
        <a class="blog-nav-item" href="/?catId=${cat.categoryId}">${cat.categoryName}</a>
    </#list>
</nav>


<#list items as item>

<div class="row">
    <div class="col-md-12">
        <div class="image">
            <img src="${BASE_PATH}/static/images/iphone.webp" width="100px" height="100px" alt="iphone" class="img-rounded">
        </div>
        <div class="description">
            <h2>${item.productName}</h2>
            <p>${item.description}<p>
            <a class="btn btn-sm btn-primary" href="/product/${item.productId}" role="button">查看详情</a></p>
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
