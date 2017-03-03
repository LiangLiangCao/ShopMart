<#assign menu="admin_list">
<#assign submenu="add_admin">
<#include "../head.ftl">
<style type="text/css">
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
                <section class="panel">
                    <header class="panel-heading">
                        添加用户
                    </header>
                    <div class="panel-body">
                        <form id="add_admin_form" method="post" class="form-horizontal" autocomplete="off"
                              action="${BASE_PATH}/admin/manage/addNew.json">
                            <fieldset>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">用户邮箱</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="email"
                                               placeholder="用户邮箱" id="email" vaule="${email}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="password"
                                               placeholder="用户密码" id="email" vaule="${password}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">是否管理员</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="role" >
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
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->
<script type="text/javascript">
    $(function () {
        $('#add_admin_form').ajaxForm({
            dataType: 'json',
            success: function (data) {
                if (data.result) {
                    bootbox.alert("保存成功，将刷新页面", function () {
                        window.location.reload();
                    });
                } else {
                    showErrors($('#add_admin_form'), data.errors);
                }
            }
        });
    });
</script>
<#include "../foot.ftl">

</body>

</html>


