USE quanlybanhang;

INSERT INTO Customer
VALUES (1, 'Minh Quan', 10),
       (2, 'Ngoc Oanh', 20),
	   (3, 'Hong Ha', 50);
       
INSERT INTO `Order`
VALUES (1,1,'2006-03-21',null),
       (2,2,'2006-03-23',null),
	   (3,1,'2006-03-16',null);

INSERT INTO Product
VALUES (1,'May Giat',3),
       (2,'Tu Lanh',5),
	   (3,'Dieu Hoa',7),
	   (4,'Quat',1),
	   (5,'Bep Dien',2);
       
INSERT INTO OrderDetail
VALUES (1, 1, 3),
       (1, 3, 7),
	   (1, 4, 2),
	   (2, 1, 1),
	   (3, 1, 8),
	   (2, 5, 4),
	   (2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT oID, oDate, oTotalPrice
FROM `ORDER`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT *
FROM Customer
WHERE CT.cID NOT IN 
(
SELECT CT.cID
FROM Customer CT join Order OD on CT.cID = OD.cID
);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT *
FROM (
SELECT *
FROM Customer 
join Order on Customer.cID= Order.cID
) AS Customers join (
SELECT SUM(Product.pPrice* OrderDetail.odQTY), OrderDetail.oID
FROM Product 
join OrderDetail on Product.pID= OrderDetail.pID group by
) AS Price on Customers.oID = Price.oID 
