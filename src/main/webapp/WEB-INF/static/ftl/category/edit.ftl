<#include "../head.ftl">
<table class="table">
    <caption>Category List</caption>
    <thead>
        <tr>
            <th>#</th>
            <th>categoryId</th>
            <th>parentCategoryId</th>
            <th>supplierId</th>
            <th>categoryName</th>
            <th>
                <span class="glyphicon glyphicon-plus" aria-hidden="true" data-toggle="modal" data-target="#addModal" v-on:click="addReset()">
                </span>
            </th>
        </tr>
    </thead>
    <tbody>
        <#list items as item>
            <tr>
                <th scope="row">#</th>
                <th>${item.categoryId!}</th>
                <th>${item.parentCategoryId!}</th>
                <th>${item.supplierId!}</th>
                <th>${item.categoryName!}</th>
                <th>
                    <div class="btn-group">
                        <button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#updateModal" v-on:click="edit(${item.categoryId})" >
                            <span class="glyphicon glyphicon-edit" aria-hidden="true">
                            </span>
                        </button>
                        <button type="button" class="btn btn-default" aria-label="Right Align" v-on:click="deleteItem(${item.categoryId})">
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
        <li v-bind:class="{ hide: page==1}">
            <a href="" aria-label="First Page">
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
            <div class="modal-body" id="item_info">
                <div class="input-group">
                    <span class="input-group-addon">  categoryId  </span>
                    <input  v-model="item.categoryId" type="text" class="form-control">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  parentCategoryId  </span>
                    <input  v-model="item.parentCategoryId" type="text" class="form-control">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  supplierId  </span>
                    <input  v-model="item.supplierId" type="text" class="form-control">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  categoryName  </span>
                    <input  v-model="item.categoryName" type="text" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    取消
                </button>
                <button type="button" class="btn btn-primary" v-on:click="update()">
                    确定修改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div> <!-- /.modal -->

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
            <div class="modal-body">
                <div class="input-group">
                    <span class="input-group-addon">  categoryId  </span>
                    <input  v-model="item.categoryId" type="text" class="form-control">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  parentCategoryId  </span>
                    <input  v-model="item.parentCategoryId" type="text" class="form-control">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  supplierId  </span>
                    <input  v-model="item.supplierId" type="text" class="form-control">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  categoryName  </span>
                    <input  v-model="item.categoryName" type="text" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary" v-on:click="add()">
                    确定修改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div> <!-- /.modal -->

<#include "../foot.ftl">

<script>
    vm = new Vue({
        el: '#app',
        data: {
            item: {},
            total:${total},
            page:${page},
            lastPage:${lastPage},
            perpage:${perpage},
        },
        methods: {
            edit: function (category_id) {
                $.ajax({
                    // 数据传送方式
                    type: 'GET',
                    contentType: "application/json; charset=utf-8",
                    url: '/category/get/?category_id='+category_id,
                    dataType: 'json',
                    async:true,
                    success: function (msg, status) {
                        console.log(typeof msg)
                        vm.item = msg;
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
                    url: '/category/update',
                    data:JSON.stringify(vm.item),
                    dataType: 'json',
                    async:true,
                    success: function (msg, status) {
                        console.log(typeof msg);
                        console.log(msg);
                        $('#updateModal').modal('hide')
                    },
                    error: function (xhr, desc, err) {
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError:" + err);
                    }
                });
            },
            deleteItem: function (category_id) {
                $.ajax({
                    type: 'GET',
                    contentType: "application/json; charset=utf-8",
                    url: '/category/del/?category_id='+category_id,
                    dataType: 'json',
                    async:true,
                    success: function (msg, status) {
                        console.log(typeof msg)
                        vm.item = msg;
                    },
                    error: function (xhr, desc, err) {
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError:" + err);
                    }
                });
            },
            addReset: function () {
                vm.item.categoryId = "";
            },
            add: function () {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '/category/add',
                    data:JSON.stringify(vm.item),
                    dataType: 'json',
                    async:true,
                    success: function (msg, status) {
                        console.log(typeof msg);
                        console.log(msg);
                        $('#addModal').modal('hide')
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



