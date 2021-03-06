<#assign menu="admin">
<#include "../head.ftl">
<style type="text/css">
    .pagination {
        border-radius: 4px;
        display: inline-block;
        margin: 0;
        padding-left: 0;
    }

    .m-bot15 {
        margin-bottom: 5px;
    }

    .form-control {
        border: 1px solid #E2E2E4;
        box-shadow: none;
        color: #C2C2C2;
    }

    .input-lg {
        border-radius: 6px;
        font-size: 15px;
        height: 40px;
        line-height: 1.33;
        padding: 9px 15 px；
    }
</style>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <!--breadcrumbs start -->
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home">用户管理</i>
                    </li>
                </ul>
                <!--breadcrumbs end -->
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <section class="panel">
                    <header class="panel-heading">
                        添加用户
                    </header>
                    <div class="panel-body">
                        <form id="add_admin_form" method="post" class="form-horizontal" autocomplete="off"
                              action="${BASE_PATH}/admin/user/addNew">
                            <fieldset>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="email"
                                               placeholder="用户邮箱" id="email" vaule="${email!}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="password"
                                               placeholder="用户密码" id="email" vaule="${password!}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">角色</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="role">
                                            <option value="1">管理员</option>
                                            <option value="2">普通用户</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label"></label>
                                    <button class="btn btn-danger btn-lg btn-block" style="width:90%;margin:0 auto"
                                            type="submit">增加
                                    </button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </section>
            </div>
            <div class="col-lg-9">
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
                                        <th><span class=" glyphicon glyphicon-plus" aria-hidden="true"></span></th>
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
                                                        data-toggle="modal" data-target="#myModal"
                                                        v-on:click="edit(${e.userId!})">
                                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"/>
                                                </button>
                                                <button type="button" class="btn btn-default" aria-label="Center Align"
                                                        v-on:click="deleteIt(${e.userId!})">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"/>
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
                </section>


            </div>
            <!-- page end-->
        </div>
    </section>
</section>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <button type="button" class="btn btn-primary" v-on:click="update()">
                    确定修改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div> <!-- /.modal -->
<#include "../foot.ftl">
<script type="text/javascript">
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

            update: function () {
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: '/admin/user/update',
                    data: JSON.stringify(vm.user),
                    dataType: 'json',
                    async: true,
                    success: function (msg, status) {
                        console.log(typeof msg);
                        console.log(msg);
                        console.log("修改数据啦");
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
</body >

</html>
