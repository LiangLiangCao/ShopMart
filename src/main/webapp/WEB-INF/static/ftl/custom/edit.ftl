<#assign menu="default">

<#include "../head.ftl">
<!-- page start-->

<section class="panel">
    <header class="panel-heading"> 用户个人信息</header>
    <div class="panel-body">

        <dl class="dl-horizontal">
            <p>用户id:  ${user.userId!}</p>

            <p>email:  ${user.email!}</p>

            <P>gender: ${user.gender!}${user.gender!}</P>

            <p>phone:  ${user.phone!}</p>

            <p>score:  ${user.score!}</p>

        </dl>
        <button type="button" class="btn btn-default"
                data-toggle="modal" style="width:90%;margin:0 auto"
                data-target="#updateModal" v-on:click="edit(${user.userId})">
            修改
        </button>
</section>

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

<#include "../foot.ftl">
<script>
    vm = new Vue({
        el: '#app',
        data: {
            user: {},

        },
        methods: {
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
        }

    });

</script>
</body>
</html>



