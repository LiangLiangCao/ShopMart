<#assign menu="admin_list">
<#assign submenu="add_admin">
<#include "../head.ftl">


<div class="row">
    <div class="col-md-12">
        <div class="image">
            <img src="/static/images/iphone.webp" width="100px" height="100px" alt="iphone" class="img-rounded">
        </div>
        <div class="description">
            <h2>${product.productName}</h2>
            <p>${product.description}<p>
            <a class="btn btn-default" href="/product/" role="button">View details »</a></p>
        </div>
    </div>
</div>

<#include "../foot.ftl">



</body>

</html>

