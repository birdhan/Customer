<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>

<script type="text/javascript">
function yuyue(id,name,price,pic){
	/* var mytan=window.open("${pageContext.request.contextPath}/tan.html","han","width=300,height=200,top=200,left=500,location=0");
	mytan.document.write("") */
	var nu=$("#number002").val();
	var sta="unpaid";
if(confirm("您确定要将"+nu+"个"+name+"加入购物车吗？")){
	
	
	var user = {
			sid:id,
            sname:name,
            spic:price,
            owd:pic,
            number:nu,
            ostatus:sta	
            
        };
	//ajax
	$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/Linsnacks/yuyue" ,//url
                data: user,
                success: function (success) {
                   alert("添加成功");
                },
                error : function() {
                    alert("添加失败");
                }
            });
	
	
	
} 
}

function goumai(id,name,price,pic){
	/* var mytan=window.open("${pageContext.request.contextPath}/tan.html","han","width=300,height=200,top=200,left=500,location=0");
	mytan.document.write("") */
	var nu=$("#number002").val();
	var sta="noship";
if(confirm("您确定要购买"+nu+"个"+name+"吗？默认货到付款。")){
	
	
	var user = {
			sid:id,
            sname:name,
            spic:price,
            owd:pic,
            number:nu,
            ostatus:sta	
            
        };
	//ajax
	$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/Linsnacks/yuyue" ,//url
                data: user,
                success: function (success) {
                   alert("下单成功在我的仓库中查看");
                },
                error : function() {
                    alert("添加失败");
                }
            });
	
	
	
} 
}
</script>
<main class="ps-main">
  <div class="test">
	<div class="container">
	  <div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
			</div>
	  </div>
	</div>
  </div>
  <div class="ps-product--detail pt-60">
	<div class="ps-container">
	  <div class="row">
		<div class="col-lg-10 col-md-12 col-lg-offset-1">
		  <div class="ps-product__thumbnail">
			<!-- 图片位置两个 -->
			<div class="ps-product__image">
			  <div class="item"><img class="zoom" src="http://localhost:80/pic/${snack.picture}" alt="" data-zoom-image="http://localhost:80/pic/${snack.picture}"></div>
			 <!--  <div class="item"><img class="zoom" src="images/shoe-detail/2.jpg" alt="" data-zoom-image="images/shoe-detail/2.jpg"></div>
			  <div class="item"><img class="zoom" src="images/shoe-detail/3.jpg" alt="" data-zoom-image="images/shoe-detail/3.jpg"></div> -->
			</div>
		  </div>
		<!--  右侧横线 -->
		  <div class="ps-product__info">
			<div class="ps-product__rating" style="border-bottom: 2px solid #00afc7;height: 5px;">
			  
			</div>
			<h1>${snack.name}</h1>
			
			<h3 class="ps-product__price">RMB ${snack.price}</h3>
			<div class="ps-product__block ps-product__quickview">
			  <h4>特点</h4>
			  <p style="border-bottom: 1px solid #e5e5e5;">${snack.special}</p>
			</div>
			<div class="ps-product__block ps-product__style">
			  <h5>设计师</h5>
			  <h4>${snack.designer}</h4>
			</div>
			<div class="ps-product__block ps-product__style">
			  <h5>热度</h5>
			  <h4>${snack.chickrate}</h4>
			</div>
			<div class="ps-product__block ps-product__size">
			  <h4>更新时间<a href="#">${snack.uptime}</a></h4>
			  <h4>购买数量</h4>
			  <!-- <div class="form-group">
				<input class="form-control" type="number" value="1">
			  </div> -->
			</div>
			<div class="form-group">
				<input class="form-control" type="number" value="1" id="number002">
			  </div>
			<div class="ps-product__shopping"><a class="ps-btn mb-10" onclick="goumai('${snack.id}','${snack.name}','${snack.price}','${snack.picture}')">	直接购买<i class="ps-icon-next"></i></a>
			   <a style="cursor: pointer;" onclick="yuyue('${snack.id}','${snack.name}','${snack.price}','${snack.picture}')">&nbsp;&nbsp;加入购物车</a> 
			</div>
			
		  </div>
		  <div class="clearfix"></div>
		  <div class="ps-product__content mt-50">
			<ul class="tab-list" role="tablist">
			  <li class="active"><a href="#tab_01" aria-controls="tab_01" role="tab" data-toggle="tab">详情</a></li>
			  <li><a href="#tab_02" aria-controls="tab_02" role="tab" data-toggle="tab">评论</a></li>
			</ul>
		  </div>
		  <div class="tab-content mb-60">
			<div class="tab-pane active" role="tabpanel" id="tab_01">
			  <p>${snack.describese}</p>
			</div>
				<div class="tab-pane" role="tabpanel" id="tab_02">
							<p class="mb-20">
								 <strong>来自已购买用户的评论</strong>
							</p>
							
							<!-- 留言信息列表循环 -->
							<c:forEach items="${ findByidstatus}" var="findByidstatus">
							<div class="ps-review">
								<div class="ps-review__thumbnail">
									<img src="images/user/1.jpg" alt="找不到">
								</div>
								<div class="ps-review__content">
									<header> <select class="ps-rating">
										<option value="1">1</option>
										<option value="1">2</option>
										<option value="1">3</option>
										<option value="1">4</option>
										<option value="5">5</option>
									</select>
									<p>
										用户<a href=""> ${findByidstatus.uname }</a>&nbsp;下单时间 - ${findByidstatus.ltime }
									</p>
									</header>
									<p>${findByidstatus.message } </p>
								</div>
							</div>
							</c:forEach>
							
							
							
							
							
							
							<!-- <form class="ps-product__review" action="_action" method="post">
								
								<div class="row">
									
									<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 ">
										<div class="form-group">
											<label>By:<a href=""> 韩春阳</a></label>
											<textarea class="form-control" rows="6" name=""></textarea>
										</div>
										<div class="form-group">
											<button class="ps-btn ps-btn--sm">
												Submit<i class="ps-icon-next"></i>
											</button>
										</div>
									</div>
								</div>
							</form> -->
							
							
						</div>
		
		  </div>
		</div>
	  </div>
	</div>
  </div>
  
  
 
</main>




<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>