<#assign menu="admin_list">
<#assign submenu="add_admin">
<#include "../head.ftl">


<#--productId-->
<#--categoryId-->
<#--promotionId-->
<#--supplierId-->
<#--productName-->
<#--price-->
<#--picture-->
<#--quantity-->
<#--description-->


<div class="row">
    <div class="col-md-12">
        <div class="image">
            <img src="/static/images/iphone.webp" width="100px" height="100px" alt="iphone" class="img-rounded">
        </div>
        <div class="description">
            <h2>商品名 ${product.productName}</h2>

            <h3>价格 ${product.price}</h3>

            <h3> 促销类型 ${product.productId}</h3>
            <h3> 供应商 ID ${product.supplierId}</h3>
            <h3> 数量 ${product.quantity}</h3>
            <h3> 商品类别 ${product.categoryId}</h3>
            <p> 商品描述 ${product.description}<p>
            <a class="btn btn-default" href="#" role="button" v-on:click="add()">购买</a></p>
        </div>
    </div>
</div>




<#include "../foot.ftl">

<script>

    vm = new Vue({
        el: '#app',
        data: {
            product: ${product_var}
        },
        methods: {
            add: function () {

                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '/order/add',
                    data:JSON.stringify(vm.product),
                    dataType: 'json',
                    async:true,
                    success: function (msg, status) {
                        console.log(typeof msg);
                        console.log(msg);
                    },
                    error: function (xhr, desc, err) {
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

