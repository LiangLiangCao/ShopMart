
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


<#list latestProduct as item>

<div class="row">
    <div class="col-md-12">
        <div class="image">
            <img src="/static/images/iphone.webp" width="100px" height="100px" alt="iphone" class="img-rounded">
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
        <li>
            <a href="/page/${page-1}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>

        <li>
            <a href="/page/${page+1}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>



<#include "foot.ftl">


<script>

    vm = new Vue({
        el:"#app",
        data: {

            perpage:2,
        },
        computed:{
            PerPage: function() {
                return this.perpage? parseInt(this.perpage):10;
            }
        },
        methods: {
            refresh: function() {
                this.$refs.table.setPage(vm.page);
            },
        },
        ready: function() {
            this.$on('vue-pagination::table', function(page) {
                this.table1Page = page;
            });
        },

    })

</script>

</body>

</html>
