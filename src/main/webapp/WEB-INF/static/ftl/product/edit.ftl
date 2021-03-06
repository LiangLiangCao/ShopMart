<#assign menu="supply">

<#include "../head.ftl">
<table class="table">
    <caption>Product List</caption>
    <thead>
        <tr>
            <th>#</th>
            <th>product_id</th>
            <#--<th>category_id</th>-->
            <#--<th>promotion_id</th>-->
            <#--<th>supplier_id</th>-->
            <th>product_name</th>
            <th>price</th>
            <th>picture_url</th>
            <th>quantity</th>
            <th>description</th>
            <th>
                <span class="glyphicon glyphicon-plus" aria-hidden="true" data-toggle="modal" data-target="#addModal" v-on:click="addReset()">
                </span>
            </th>

        </tr>
    </thead>
    <tbody>
        <#list items as item>
            <tr>
                <th scope="row">1</th>
                <th>${item.productId!}</th>
                <#--<th>${item.categoryId}</th>-->
                <#--<th>${item.promotionId}</th>-->
                <#--<th>${item.supplier_id}</th>-->
                <th>${item.productName!}</th>
                <th>${item.price!}</th>
                <th>${item.picture!}</th>
                <th>${item.quantity!}</th>
                <th>${item.description!}</th>
                <th>
                <div class="btn-group">
                    <button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#updateModal" v-on:click="edit(${item.productId})" >
                        <span class="glyphicon glyphicon-edit" aria-hidden="true">
                        </span>
                    </button>
                    <button type="button" class="btn btn-default" aria-label="Center Align"  v-on:click="delete(${item.productId})">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true">
                        </span>
                    </button>
                </div>
                </th>
            </tr>
        </#list>
    </tbody>
</table>


<nav aria-label="Page navigation">
    <ul class="pagination">
        <li v-bind:class="{ disabled: page==1}">
            <a href="" aria-label="First Page">
                <span aria-hidden="true">&laquo;&laquo;</span>
            </a>
        </li>
        <li v-bind:class="{ disabled: page==1}">
            <a href="?page=${page-1}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li v-bind:class="{ disabled: page==lastPage}">
            <a href="?page=${page+1}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
        <li v-bind:class="{ disabled: page==lastPage}">
            <a href="?page=${lastPage}" aria-label="Last Page">
                <span aria-hidden="true">&raquo;&raquo;</span>
            </a>
        </li>
    </ul>
</nav>

<!-- 模态框（Modal） -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" >
                    编辑条目
                </h4>
            </div>
            <div class="modal-body" id="product_info">
                <div class="input-group">
                    <span class="input-group-addon">  product_id  </span>
                    <input  v-model="product.productId" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1" disabled>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  categoryId  </span>
                    <input  v-model="product.categoryId" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  promotionId  </span>
                    <input  v-model="product.promotionId" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  supplier  </span>
                    <input  v-model="product.supplier" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"> product_name </span>
                    <input v-model="product.productName" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  price  </span>
                    <input  v-model="product.price" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  picture  </span>
                    <input  v-model="product.picture" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"> quantity </span>
                    <input v-model="product.quantity" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"> description </span>
                    <input v-model="product.description" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary" v-on:click="update()">
                    确定修改
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="addModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    添加商品
                </h4>
            </div>
            <div class="modal-body" id="product_info">
                <div class="input-group">
                    <span class="input-group-addon">  product_id  </span>
                    <input  v-model="product.productId" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  categoryId  </span>
                    <input  v-model="product.categoryId" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  promotionId  </span>
                    <input  v-model="product.promotionId" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  supplier  </span>
                    <input  v-model="product.supplier" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"> product_name </span>
                    <input v-model="product.productName" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  price  </span>
                    <input  v-model="product.price" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  picture  </span>
                    <input  v-model="product.picture" type="text" class="form-control" placeholder=""
                            aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"> quantity </span>
                    <input v-model="product.quantity" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"> description </span>
                    <input v-model="product.description" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <hr>
                <div id="mail_content" style="min-height: 50px"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary" v-on:click="add()">
                    确定修改
                </button>
            </div>
        </div>
    </div>
</div>
<#include "../foot.ftl">
<script>
    vm = new Vue({
        el: '#app',
        data: {
            product: {},
            total:${total},
            page:${page},
            lastPage:${lastPage},
            perpage:${perpage},
        },
        methods: {
            edit: function (product_id) {

                $.ajax({
                    type: 'GET',
                    contentType: "application/json; charset=utf-8",
                    url: '/product/get/?product_id='+product_id,
                    dataType: 'json',
                    async:true,
                    success: function (msg, status) {
                        console.log(typeof msg)
                        vm.product = msg;
                    },
                    error: function (xhr, desc, err) {
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError:" + err);
                    }
                });
            },
            update: function () {

                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '/product/update',
                    data:JSON.stringify(vm.product),
                    dataType: 'json',
                    async:true,
                    success: function (msg, status) {
                        console.log(typeof msg);
                        console.log(msg);
                        console.log("修改数据啦");
                        $('#updateModal').modal('hide');
                        window.location.reload();
                    },
                    error: function (xhr, desc, err) {
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError:" + err);
                    }
                });
            },
            delete: function (product_id) {
                $.ajax({
                    type: 'GET',
                    contentType: "application/json; charset=utf-8",
                    url: '/product/del/?product_id='+product_id,
                    dataType: 'json',
                    async:true,
                    success: function (msg, status) {
                        console.log(typeof msg)
                        vm.product = msg;
                        window.location.reload();
                    },
                    error: function (xhr, desc, err) {
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError:" + err);
                    }
                });
            },
            addReset: function () {

                vm.product.productId = ""

            },
            add: function () {

                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '/product/add',
                    data:JSON.stringify(vm.product),
                    dataType: 'json',
                    async:true,
                    success: function (msg, status) {
                        console.log(typeof msg);
                        console.log(msg);
                        $('#addModal').modal('hide');
                        window.location.reload();
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



