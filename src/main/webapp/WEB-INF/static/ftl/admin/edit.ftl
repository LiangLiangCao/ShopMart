<#assign menu="admin">

<#include "../head.ftl">
<!-- page start-->

<section class="panel">
    <header class="panel-heading"> 所有用户列表</header>
    <div class="panel-body">
        <div class="adv-table">
            <div role="grid" class="dataTables_wrapper"
                 id="hidden-table-info_wrapper">
                <table class="table table-striped table-advance table-hover">
                    <thead>
                    <tr>
                        <th>用户id</th>
                        <th>email</th>
                        <th>gender</th>
                        <th>phone</th>
                        <th>role</th>
                        <th>score</th>
                        <th>
                            <span class="glyphicon glyphicon-plus" aria-hidden="true" data-toggle="modal"
                                  data-target="#addModal"
                                  v-on:click="addReset()">
                            </span>
                        </th>
                    </tr>


                    </thead>
                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                    <#list users as e>
                    <tr class="gradeA odd">
                        <td>${e.userId!}</td>
                        <td> ${e.email!}</td>
                        <td>${e.gender!}</td>
                        <td> ${e.phone!}</td>
                        <td>${e.role!}</td>
                        <td> ${e.score!}</td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" aria-label="Left Align"
                                        data-toggle="modal"
                                        data-target="#updateModal" v-on:click="edit(${e.userId})">
                        <span class="glyphicon glyphicon-edit" aria-hidden="true">
                        </span>
                                </button>
                                <button type="button" class="btn btn-default" aria-label="Center Align"
                                        v-on:click="deleteIt(${e.userId})">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true">
                        </span>
                                </button>
                            </div>
                        </td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</section>

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
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑条目</h4>
            </div>
            <div class="modal-body" id="product_info">
                <div class="input-group">
                    <span class="input-group-addon">  userId  </span>
                    <input v-model="user.userId" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1" disabled>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  password  </span>
                    <input v-model="user.password" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  gender  </span>
                    <input v-model="user.gender" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  email  </span>
                    <input v-model="user.email" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"> phone </span>
                    <input v-model="user.phone" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"> 角色</span>
                    <select class="form-control" v-model="user.role" name="role" placeholder="1"
                            aria-describedby="basic-addon1">
                        <option value="1">管理员</option>
                        <option value="2">普通用户</option>
                    </select>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  score  </span>
                    <input v-model="user.score" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <hr>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary" v-on:click="update()">
                    修改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div> <!-- /.modal -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body" id="product_info">
                <div class="input-group">
                    <span class="input-group-addon">  email  </span>
                    <input v-model="user.email" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  password  </span>
                    <input v-model="user.password" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"> 角色</span>
                    <select class="form-control" v-model="user.role" name="role" placeholder="1"
                            aria-describedby="basic-addon1">
                        <option value="1">管理员</option>
                        <option value="2">普通用户</option>
                    </select>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  gender  </span>
                    <input v-model="user.gender" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>

                <div class="input-group">
                    <span class="input-group-addon"> phone </span>
                    <input v-model="user.phone" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  role  </span>
                    <input v-model="user.role" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">  score  </span>
                    <input v-model="user.score" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>
                <hr>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary" v-on:click="add()">
                    添加
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
            user: {},
            total:${total},
            page:${page},
            lastPage:${lastPage},
            perpage:${perpage},
        },
        methods: {
            deleteIt: function (user_id) {
                $.ajax({
                    type: 'GET',
                    contentType: "application/json; charset=utf-8",
                    url: '/admin/user/delete',
                    dataType: 'json',
                    data: {"user_id": user_id},
                    async: true,
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
            edit: function (user_id) {
                $.ajax({
                    type: 'GET',
                    contentType: "application/json; charset=utf-8",
                    url: '/admin/user/get/?user_id=' + user_id,
                    dataType: 'json',
                    async: true,
                    success: function (msg, status) {
                        vm.user = msg;
                    },
                    error: function (xhr, desc, err) {
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError:" + err);
                    }
                });
            },

            addReset: function () {
                vm.user.userId = ""
            },

            update: function () {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '${BASE_PATH}/admin/user/update',
                    data: JSON.stringify(vm.user),
                    dataType: 'json',
                    async: true,
                    success: function (msg, status) {
                        console.log(typeof msg);
                        console.log(msg);
                        console.log("修改数据啦");
                        $('#updateModal').modal('hide');
//                        window.location.href = msg.msg;
                        window.location.reload();
                    },
                    error: function (xhr, desc, err) {
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError:" + err);
                    }
                });
            },
            add: function () {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '${BASE_PATH}/admin/user/addNew',
                    data: JSON.stringify(vm.user),
                    dataType: 'json',
                    async: true,
                    success: function (msg, status) {
                        console.log(typeof msg);
                        console.log(msg);
                        console.log("修改数据啦");
                        $('#addModal').modal('hide');

                        window.location.reload();
                    },
                    error: function (xhr, desc, err) {
                        console.log(xhr);
                        console.log("Details: " + desc + "\nError:" + err);
                    }
                });
            }
        }

    });

</script>
</body>
</html>



