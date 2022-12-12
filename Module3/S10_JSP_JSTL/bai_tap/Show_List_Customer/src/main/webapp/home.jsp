<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/12/2022
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<table class="table table-striped">
    <tr>
        <td>STT</td>
        <td>Tên</td>
        <td>Ngày Sinh</td>
        <td>Địa Chỉ</td>
        <td>Ảnh</td>
    </tr>

    <c:forEach var="customer1" items="${customerList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${customer1.name}</td>
            <td>${customer1.date}</td>
            <td>${customer1.diaChi}</td>
            <td><img src="${customer1.anh}" width="50px" height="50px"></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>