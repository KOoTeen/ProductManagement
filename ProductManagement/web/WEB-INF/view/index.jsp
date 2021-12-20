<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Product List - Page</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h1 style="text-transform: uppercase">Product List - Page</h1>
			</div>
			<div class="panel-body">
                                <a href="view.html"><button class="btn btn-success" style="margin-bottom: 15px;">Add Product</button></a>
                                <form method="get" action="index.html" style="float: right">
                                    <input type="text" class="form-control" name="s" style="width: 200px; float: right" placeholder="Tim kiem ..."/>
                                </form>
				<table class="table table-bordered table-hovered">
					<thead>
						<tr>
							<th>STT</th>
							<th>Thumbnail</th>
							<th>Title</th>
							<th>Price</th>
							<th>Discount</th>
							<th>Updated At</th>
                                                        <th></th>
                                                        <th></th>
						</tr>
					</thead>
					<tbody>
                                            <c:forEach items="${productList}" var="item" varStatus="loop">
						<tr>
							<td>${loop.index + 1}</td>
                                                        <td>
                                                            <img src="${item.thumbnail}" width="80px">
                                                        </td>
							<td>${item.title}</td>
							<td>${item.price}</td>
							<td>${item.discount}</td>
							<td>${item.updatedAt}</td>
                                                        <td>
                                                            <a href="view.html?id=${item.id}"><button class="btn btn-warning">Edit</button></a>
                                                        </td>
                                                        <td>
                                                            <button class="btn btn-danger" onclick="deleteProduct(${item.id})">Delete</button>
                                                        </td>
						</tr>
                                            </c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
    
    <script>
        function deleteProduct(id) {
            var option = confirm('Ban co chac chan muon xoa du lieu nay khong???');
            if(!option) return;
            
            $.post('delete.html', {
                'id': id
            }, function(data) {
                location.reload();
            });
//            $.post("delete/"+id+".html", {}, function(data) {
//                location.reload()
//            })
        }
    </script>
</body>
</html>