<#include "../head.ftl">

<table class="table">
    <caption>Order List</caption>
    <thead>
        <tr>
            <th>#</th>
            <th>ordrId</th>
            <th>userId</th>
            <th>name</th>
            <th>address</th>
            <th>phone</th>
            <th>postage</th>
            <#--<th>total</th>-->
            <#--<th>deliveryDate</th>-->
            <#--<th>deliveryMethod</th>-->
            <#--<th>orderToatl</th>-->
            <#--<th>createTime</th>-->
            <#--<th>payTime</th>-->
            <#--<th>closeTime</th>-->
            <#--<th>state</th>-->
            <#---->
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
                
                <th>${item.ordrId!}</th>
                <th>${item.userId!}</th>
                <th>${item.name!}</th>
                <th>${item.address!}</th>
                <th>${item.phone!}</th>
                <th>${item.postage!}</th>
                <#--<th>${item.total!}</th>-->
                <#--<th>${item.deliveryDate!}</th>-->
                <#--<th>${item.deliveryMethod!}</th>-->
                <#--<th>${item.orderToatl!}</th>-->
                <#--<th>${item.createTime!}</th>-->
                <#--<th>${item.payTime!}</th>-->
                <#--<th>${item.closeTime!}</th>-->
                <#--<th>${item.state!}</th>-->

                <th>
                    <div class="btn-group">
                        <button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#updateModal" v-on:click="edit(${item.ordrId})" >

                            <span class="glyphicon glyphicon-edit" aria-hidden="true">

                            </span>
                        </button>


                        <button type="button" class="btn btn-default" aria-label="Right Align" v-on:click="deleteItem(${item.ordrId})">
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
            <a href="./" aria-label="First Page">
                <span aria-hidden="true">&laquo;&laquo;</span>
            </a>
        </li>
        <li v-bind:class="{ hide: page==1}">
            <a href="./?page=${page-1}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>

        <li v-bind:class="{ hide: page==lastPage}">
            <a href="./?page=${page+1}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>

        <li v-bind:class="{ hide: page==lastPage}">
            <a href="./?page=${lastPage}" aria-label="Last Page">
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
                    <span class="input-group-addon">  ordrId  </span>
                    <input  v-model="item.ordrId" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  userId  </span>
                    <input  v-model="item.userId" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  name  </span>
                    <input  v-model="item.name" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  address  </span>
                    <input  v-model="item.address" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  phone  </span>
                    <input  v-model="item.phone" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  postage  </span>
                    <input  v-model="item.postage" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  total  </span>
                    <input  v-model="item.total" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  deliveryDate  </span>
                    <input  v-model="item.deliveryDate" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  deliveryMethod  </span>
                    <input  v-model="item.deliveryMethod" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  productToatl  </span>
                    <input  v-model="item.productToatl" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  createTime  </span>
                    <input  v-model="item.createTime" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  payTime  </span>
                    <input  v-model="item.payTime" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  closeTime  </span>
                    <input  v-model="item.closeTime" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  state  </span>
                    <input  v-model="item.state" type="text" class="form-control" placeholder=""
                            >
                </div>


                <hr>

                <div id="mail_content" style="min-height: 50px"></div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
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
                    <span class="input-group-addon">  ordrId  </span>
                    <input  v-model="item.ordrId" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  userId  </span>
                    <input  v-model="item.userId" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  name  </span>
                    <input  v-model="item.name" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  address  </span>
                    <input  v-model="item.address" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  phone  </span>
                    <input  v-model="item.phone" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  postage  </span>
                    <input  v-model="item.postage" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  total  </span>
                    <input  v-model="item.total" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  deliveryDate  </span>
                    <input  v-model="item.deliveryDate" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  deliveryMethod  </span>
                    <input  v-model="item.deliveryMethod" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  productToatl  </span>
                    <input  v-model="item.productToatl" type="text" class="form-control" placeholder=""
                            >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  createTime  </span>
                    <input  v-model="item.createTime" type="text" class="form-control">
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  payTime  </span>
                    <input  v-model="item.payTime" type="text" class="form-control">
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  closeTime  </span>
                    <input  v-model="item.closeTime" type="text" class="form-control">
                </div>

                <div class="input-group">
                    <span class="input-group-addon">  state  </span>
                    <input v-model="item.state" type="text" class="form-control" >
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
            edit: function (order_id) {

                $.ajax({
                    // 数据传送方式
                    type: 'GET',
                    contentType: "application/json; charset=utf-8",
                    url: '/order/get/?order_id='+order_id,
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
                    url: '/order/update',
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

            deleteItem: function (order_id) {
                $.ajax({
                    type: 'GET',
                    contentType: "application/json; charset=utf-8",
                    url: '/order/del/?order_id='+order_id,
                    dataType: 'json',
                    async:true,
                    success: function (msg, status) {
                        console.log(typeof msg)
                        vm.order = msg;
                    },
                    error: function (xhr, desc, err) {
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError:" + err);
                    }
                });
            },

            addReset: function () {
                vm.item.ordrId = "";
            },

            add: function () {

                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '/order/add',
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



