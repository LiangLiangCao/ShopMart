<#assign menu="admin_list">
<#assign submenu="add_admin">
<#include "../head.ftl">

<!--main content start-->
<div class="blog-masthead">
    <div class="container">
        <nav class="blog-nav">
            <a class="blog-nav-item active" href="#">CMBShop</a>
            <a class="blog-nav-item" href="#">编辑</a>
            <a class="blog-nav-item" href="#">删除</a>
        </nav>
    </div>
</div>


<#--proId-->
<#--categoryId-->
<#--promoId-->
<#--suplrId-->
<#--productName-->
<#--price-->
<#--picture-->
<#--quantity-->
<#--description-->


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

            <th><span class=" glyphicon glyphicon-plus" aria-hidden="true"></span>

            </th>

        </tr>
    </thead>
    <tbody>

        <#list latestProduct as item>

            <tr>
                <th scope="row">1</th>
                <th>${item.proId}</th>
                <#--<th>${item.categoryId}</th>-->
                <#--<th>${item.promoId}</th>-->
                <#--<th>${item.suplrId}</th>-->
                <th>${item.productName}</th>
                <th>${item.price}</th>
                <th>${item.picture}</th>
                <th>${item.quantity}</th>
                <th>${item.description}</th>
                <th>
                    <#--<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>-->

                    <#--<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>-->


                    <div class="btn-group">
                        <button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#myModal" v-on:click="get_email_content()" >

                            <span class="glyphicon glyphicon-edit" aria-hidden="true">

                            </span>
                        </button>


                        <button type="button" class="btn btn-default" aria-label="Center Align">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true">

                            </span>
                        </button>

                    </div>

                </th>
            </tr>

        </#list>

    </tbody>
</table>




<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    编辑条目
                </h4>
            </div>
            <div class="modal-body" id="mail_info">

                <div class="input-group">
                    <span class="input-group-addon">  receivers  </span>
                    <input  v-model="receivers" type="text" class="form-control" placeholder="jaitch@163.com"
                            aria-describedby="basic-addon1">
                </div>

                <div class="input-group">
                    <span class="input-group-addon"> cc_receivers </span>
                    <input v-model="cc_receivers" type="text" class="form-control" placeholder="1129966399@qq.com"
                           aria-describedby="basic-addon1">
                </div>

                <div class="input-group">
                    <span class="input-group-addon"> bcc_receivers </span>
                    <input v-model="bcc_receivers" type="text" class="form-control" placeholder=""
                           aria-describedby="basic-addon1">
                </div>

                <div class="input-group">
                    <span class="input-group-addon"> 邮件标题 </span>
                    <input v-model="subject" type="text" class="form-control" placeholder="朱雀项目问题"
                           aria-describedby="basic-addon1">
                </div>
                <hr>

                <div id="mail_content" style="min-height: 50px"></div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary" v-on:click="send_mail()">
                    确定发送
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
            active:0,
            message: 'Hello Vue.js!',
            isDebug: false,

            receivers: 'jianghan.jh@alibaba-inc.com',
            cc_receivers: 'hanjiang.it@qq.com',
            bcc_receivers: '',
            subject: "朱雀项目bug周报--Send From AliAVMS",
            content: "",

            project_id:'2334',
            status_list:'Open,New',
            module_id_list:'7541',

            maxToasts: 6,
            position: 'bottom right',
            theme: 'error',
            timeLife: 3000,
            closeBtn: true,

            spinner: new Spinner(opts)
        },
        methods: {
            get_email_content: function () {


            },
        }
    })

</script>


</body>

</html>



