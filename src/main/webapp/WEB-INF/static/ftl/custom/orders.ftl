<#assign menu="default">

<#include "../head.ftl">

<div v-bind:class="{ hide: isSearch}">
    <div class="form-inline">
        <div class="form-group">
            <select class="form-control" v-model="selected" >
                <option value="1">订单号</option>
                <option value="2">订单时间</option>
                <option value="3">订单状态</option>
            </select>
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="keyword" v-model="keyword"  placeholder="">
        </div>
        <button type="submit" class="btn btn-info" v-on:click="searchIt()">搜索</button>
    </div>
</div>

<h1 class="panel-heading" style="font-weight: 400;font-size:20px">
    所有订单信息
</h1>

<div id="container" class="container">
    <#list arryList as map >

    <div id="item_row" class="col-md-12" style="padding-left: 0px;padding-bottom: 20px">
        <#assign  x=map_index/>
        <#if x%1==0>
            <p>
                <img src="${BASE_PATH}/static/images/logo.png" style="width:40px;height:40px; "/>
                <span>订单信息</span>
            </p>
        </#if>
        <#list map?keys as key >
            <#if key=="orders">
                <p> 订单编号： ${(map[key].ordrId)!}</p>
                <p> 购买时间： ${(map[key].payTime)!?string("yyyy-MM-dd HH:mm:ss")}</p>
                <p> 收货人姓名： ${(map[key].name)!}</p>
                <p> 手机： ${(map[key].phone)!}</p>
                <p> 地址： ${(map[key].address)!}</p>
                <p> 送货方式： ${(map[key].deliveryMethod)!}</p>
            </#if>
            <#if key=="product">
                <p> 商品名称： ${(map[key].productName)!}</p>
                <p> 商品描述： ${(map[key].description)!}</p>
                <p> 商品价格： ${(map[key].price)!?string("#.##")}</p>
                <p> 购买数量： 1</p>
            </#if>
        </#list>

    </div>
    </#list>


</div>

<#include "../foot.ftl">

<script type="text/javascript">

    vm = new Vue({
        el: '#app',
        data: {
            product: {},
            isSearch:true,
            keyword:"",
            selected:"1",
            myurl:"",
        },
        methods: {
            search:function () {
                vm.isSearch = !vm.isSearch;
                console.log(vm.isSearch);
            },
            searchIt:function () {
                console.log(vm.keyword);
                if(vm.keyword != ""){

                    console.log("${BASE_PATH}/custom/orderAll/?type="+vm.selected+"&keyword="+vm.keyword);
                    vm.myurl = "${BASE_PATH}/custom/orderAll/?type="+vm.selected+"&keyword="+vm.keyword;
                    window.location.href = vm.myurl;
                }
            },
        }
    });

</script>

</body>
</html>
