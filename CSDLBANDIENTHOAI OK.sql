CREATE DATABASE CSDLBANDIENTHOAI
GO

USE CSDLBANDIENTHOAI
GO

--BẢNG: CƠ SỞ
CREATE TABLE Branches
(
	BranchId nvarchar(10) PRIMARY KEY,
	BranchName nvarchar(255),
	BranchAdd nvarchar(255) 
)
GO
INSERT INTO Branches(BranchId,BranchName,BranchAdd)
VALUES('CS1',N'Cơ sở 1 TP HCM', N'111 Tôn Đức Thắng, P1, Q12, TP HCM')
INSERT INTO Branches(BranchId,BranchName,BranchAdd)
VALUES('CS2',N'Cơ sở 2 Đà Nẵng', N'999 Phan Châu Trinh, Thanh Khê, Đà Nẵng')
SELECT * FROM Branches

--BẢNG: LOẠI SẢN PHẨM
CREATE TABLE Categories
(
	CategoryId INT Identity(1,1) PRIMARY KEY,
	CategoryName nvarchar(255),
	Avatar nvarchar(255)
)
GO
INSERT INTO Categories(CategoryName,Avatar)
VALUES(N'APPLE','https://static1.abc.es/media/tecnologia/2022/03/03/apple-keynote-kwfG--620x349@abc.jpg')
INSERT INTO Categories(CategoryName,Avatar)
VALUES(N'OPPO','https://tintuc.viettelstore.vn/wp-content/uploads/2021/03/dien-thoai-opp-gia-7-trieu-1.jpg')
INSERT INTO Categories(CategoryName,Avatar)
VALUES(N'SAMSUNG','https://dienthoaithongminhdn.com/wp-content/uploads/2020/04/samsung-galaxy-z-flip-1.jpg')
INSERT INTO Categories(CategoryName,Avatar)
VALUES(N'VIVO','https://cdn.nguyenkimmall.com/images/detailed/770/10050029-dien-thoai-vivo-y21-4gb-64gb-trang-1.jpg')
INSERT INTO Categories(CategoryName,Avatar)
VALUES(N'REALME','https://cdn.tgdd.vn/Products/Images/42/255513/realme-9-pro-plus-5g-blue-thumb-600x600.jpg')
INSERT INTO Categories(CategoryName,Avatar)
VALUES(N'XIAOMI','https://cdn.tgdd.vn/Products/Images/42/233241/xiaomi-mi-11-lite-4g-blue-600x600.jpg')
SELECT * FROM Categories

--BẢNG: SẢN PHẨM
CREATE TABLE Products
(
	ProductId int  Identity(1,1) PRIMARY KEY,
	ProductName nvarchar(255),
	CategoryId int,
	Price float,
	Avatar nvarchar(255),
	Description ntext,
	InStocks int,
	BranchId nvarchar(10),
	CONSTRAINT PRODUCTS_BranchId FOREIGN KEY(BranchId)
    REFERENCES Branches(BranchId),
	CONSTRAINT PRODUCTS_CategoryId FOREIGN KEY(CategoryId)
    REFERENCES Categories(CategoryId)
)
GO
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'iPhone 13 Pro 128GB',1, 30990000, 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/19/637859775179431329_iPhone%2013%20pro%20(4).jpg',N'Tận hưởng tốc độ khó tin trên chiếc smartphone nhanh nhất thế giới, iPhone 13 Pro với màn hình ProMotion 120Hz đột phá, bộ vi xử lý A15 Bionic cho hiệu năng không đối thủ, thời lượng pin vượt trội và bộ 3 camera được nâng cấp đáng kể, xứng đáng là chiếc điện thoại đầu bảng trên thị trường.',20, N'CS1')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'iPhone 13 128GB',1, 24990000, 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/30/637842470238437307_iphone-13-pink.jpg',N'iPhone 13 sở hữu hệ thống camera kép xuất sắc nhất từ trước đến nay, bộ vi xử lý Apple A15 nhanh nhất thế giới smartphone cùng thời lượng pin cực khủng, sẵn sàng đồng hành cùng bạn suốt cả ngày.',20, N'CS2')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'iPhone 13 mini 128GB',1, 21990000, 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/30/637842470238124787_iphone-13-blue.jpg',N'iPhone 13 mini là chiếc điện thoại dành cho những ai yêu thích sự nhỏ gọn. Với một kiểu dáng dễ thương, nằm gọn trong bàn tay hay túi quần của bạn, iPhone 13 mini còn gây bất ngờ hơn nữa với sức mạnh đáng kinh ngạc, màn hình OLED siêu nét và camera nhiếp ảnh chuyên nghiệp.',20, N'CS2')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'iPhone 12 64GB',1, 19990000, 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2020/11/27/637420740222987925_iphone-12-12-mini-4.jpg',N'iPhone 12 ra mắt với vai trò mở ra một kỷ nguyên hoàn toàn mới. Tốc độ mạng 5G siêu tốc, bộ vi xử lý A14 Bionic nhanh nhất thế giới smartphone, màn hình OLED tràn cạnh tuyệt đẹp và camera siêu chụp đêm, tất cả đều có mặt trên iPhone 12.',20, N'CS1')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'OPPO Reno7 5G',2, 12990000, 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/24/637837098887152708_Reno%207%205G-28.jpg',N'Khám phá thế hệ chụp chân dung mới nhất, OPPO Reno7 5G sẵn sàng cho tấm ảnh và thước phim chân dung nghệ thuật, chất lượng cao. Sức mạnh của Dimensity 900 5G, kết nối 5G và sạc 66W, điện thoại còn mở ra kỷ nguyên tốc độ, sử dụng bền lâu theo thời gian.',20, N'CS1')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'OPPO Find X3 Pro 5G',2, 26990000, 'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/oppo-find-x3-pro-12.jpg',N'Sẵn sàng cùng bạn hướng tới tương lai với OPPO Find X3 Pro 5G, chiếc điện thoại sở hữu camera màu sắc trung thực, màn hình 120Hz siêu mượt, 1 tỷ màu sống động và hiệu năng đột phá với sức mạnh của con chip Qualcomm Snapdragon 888 hỗ trợ 5G.',20, N'CS2')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Samsung Galaxy S22 Plus 5G 128GB',3, 25990000, 'https://fptshop.com.vn/Uploads/images/2015/thiet-ke-Samsung-Galaxy-S22-Plus(1).jpg',N'Tận hưởng những công nghệ hàng đầu nhà Samsung, Galaxy S22 Plus 5G sẽ cho bạn trải nghiệm đỉnh cao từ thiết kế thời thượng, hiệu năng mạnh mẽ Snapdragon 8 Gen 1 và hệ thống camera đêm chuyên nghiệp nhất từ trước đến nay.',20, N'CS2')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Samsung Galaxy S22 5G 128GB',3, 21990000, 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/7/637822443653689053_DSC08208.jpg',N'Samsung Galaxy S22 5G là bước nhảy vọt trong công nghệ video trên thế hệ di động. Đồng thời, điện thoại cũng mở ra loạt cải tiến đột phá hàng đầu hiện nay từ màn hình vát phẳng “nịnh” mắt đến bộ xử lý 4nm tiên tiến đầu tiên trên thế hệ smartphone Samsung.',20, N'CS1')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Samsung Galaxy Z Flip3 5G 128GB',3, 24990000, 'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/Samsung-Galaxy-Z-Flip-3-5g-3.jpg', N'Một biểu tượng thời trang, một kiệt tác của thế giới công nghệ mà ai cũng phải kinh ngạc khi nhìn thấy Samsung Galaxy Z Flip3 5G và cách mà bạn sử dụng siêu phẩm smartphone này, nơi công nghệ điện thoại màn hình gập đã mang đến những điều không tưởng.',20, N'CS1')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Samsung Galaxy Z Flip',3, 19990000, 'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-z-flip-1.jpg', N'Một chiếc điện thoại vừa nhỏ gọn đáng kinh ngạc, lại vừa mang đến trải nghiệm mãn nhãn trên màn hình lớn chuẩn điện ảnh 6,7 inch, những điều tưởng như nằm ngoài giới hạn đã thực sự xuất hiện trên Samsung Galaxy Z Flip với thiết kế gập độc đáo và sáng tạo chưa từng thấy.',20, N'CS2')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Samsung Galaxy Note 20 Ultra',3, 20990000, 'https://images.fpt.shop/unsafe/fit-in/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note20-ultra-2.jpg', N'Chiếc Galaxy Note màn hình lớn nhất, bút S Pen thông minh nhất và những tính năng mạnh mẽ nhất đã xuất hiện. Samsung Galaxy Note 20 Ultra sẽ định nghĩa lại smartphone, thay đổi những trải nghiệm của bạn theo cách thú vị hơn bao giờ hết.',20, N'CS2')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Xiaomi 12 Pro',6, 27990000, 'https://fptshop.com.vn/Uploads/images/2015/xiaomi-12-pro-1(1).png', N'Với việc liên tục phát triển và cải tiến những công nghệ vượt bậc, Xiaomi đã đem đến một Xiaomi 12 Pro hoàn hảo, sẵn sàng làm chủ mọi cuộc chơi của bạn. Với bộ ba camera 50MP, màn hình 2K+, sạc nhanh 120W và bộ xử lý hàng đầu, điện thoại sẽ là lựa chọn hàng đầu cho năm 2022.',20, N'CS1')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Xiaomi 12',6, 19990000, 'https://fptshop.com.vn/Uploads/images/2015/xiaomi-12(1).jpg', N'Với Xiaomi 12 trong tay, bạn sẽ dễ dàng làm chủ mọi cuộc vui của riêng mình. Dù là chụp ảnh, chơi game hay đắm chìm trong những bộ phim, điện thoại sẽ luôn cho bạn những trải nghiệm hàng đầu. Chiếc flagship này sẽ là một trong những lựa chọn cực hot dành cho bạn ngay hôm nay.',20, N'CS1')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Xiaomi 11T Pro 5G',6, 14990000, 'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/xiaomi-11t-pro-1.jpg', N'Xiaomi 11T Pro là chiếc điện thoại cao cấp có mức giá tốt nhất hiện nay. Bạn sẽ nhận được camera chuyên nghiệp 108MP, sạc siêu nhanh 120W, màn hình AMOLED 120Hz mượt mà hỗ trợ Dolby Vision và bộ vi xử lý đầu bảng Snapdragon 888, một loạt những tính năng đỉnh cao sẽ mang tới trải nghiệm thú vị hơn bao giờ hết.',20, N'CS2')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Vivo V23 5G',4, 12990000, 'https://fptshop.com.vn/Uploads/images/2015/vivo-v23-5g-6.png', N'vivo V23 5G được giới thiệu là sản phẩm tiên phong trên thị trường về việc trang bị cụm camera selfie kép 50MP ấn tượng. Không những vậy, chiếc điện thoại này được hoàn thiện cả về thiết kế, hiệu năng và camera, hướng đến những trải nghiệm tốt nhất cho người dùng.',20, N'CS2')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Realme 8 Pro',5, 8690000, 'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2021/4/20/637545116971545639_FRT07689.jpg', N'Realme 8 Pro với camera độ phân giải lên tới 108MP, mang đến cho bạn những hình ảnh và thước phim chân thực nhất. Bên cạnh đó cấu hình ấn tượng nhờ bộ vi xử lý Snapdragon 720G sẽ tạo nên dấu ấn sức mạnh đỉnh cao trong một thiết kế mỏng nhẹ.',20, N'CS1')
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Realme 9 Pro 5G',5, 7990000, 'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/Realme-9-Pro.jpg', N'Tận hưởng hiệu năng mạnh cùng màn hình siêu mượt 120Hz, kết nối 5G và sạc nhanh 33W, Realme 9 Pro là người bạn đồng hành lý tưởng cho cuộc sống năng động. Không chỉ vậy, hệ thống camera 64MP và thiết kế mới còn giúp bạn bắt trọn mọi xu hướng trong năm 2022 này.',20, N'CS2')
SELECT * FROM Products

--BẢNG: YÊU THÍCH
CREATE TABLE Favorites
(
	Id int Identity(1,1) PRIMARY KEY,
	ProductId int,
	ProductName nvarchar(255),
	Price float,
	Avatar nvarchar(255),
	CONSTRAINT FAVORITE_ProductId FOREIGN KEY(ProductId)
    REFERENCES Products(ProductId)
)
GO
INSERT INTO Favorites(ProductId,ProductName,Price,Avatar)
VALUES(3,N'Samsung Galaxy S22 Ultra 5G 128GB',30990000,'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/11/thiet-ke-Samsung-Galaxy-S22-Ultra-2.jpg')
INSERT INTO Favorites(ProductId,ProductName,Price,Avatar)
VALUES(5,N'Samsung Galaxy Z Fold3 5G 256GB',35990000,'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-z-fold3-5g-1.jpg')
SELECT * FROM Favorites

--BẢNG: ĐẶT HÀNG
CREATE TABLE Orders
(
	Id int Identity(1,1) PRIMARY KEY,
	ProductId int,
	ProductName nvarchar(255),
	Quantity int,
	CONSTRAINT ORDERS_ProductId FOREIGN KEY(ProductId)
    REFERENCES Products(ProductId)
)
GO
INSERT INTO Orders(ProductId,ProductName,Quantity)
VALUES(1,N'iPhone 13 Pro Max 128GB',2)
INSERT INTO Orders(ProductId,ProductName,Quantity)
VALUES(3,N'Samsung Galaxy S22 Ultra 5G 128GB',4)
INSERT INTO Orders(ProductId,ProductName,Quantity)
VALUES(2,N'Reno7 Z 5G',5)
INSERT INTO Orders(ProductId,ProductName,Quantity)
VALUES(5,N'Samsung Galaxy Z Fold3 5G 256GB',8)
INSERT INTO Orders(ProductId,ProductName,Quantity)
VALUES(4,N'iPhone 11 64GB',10)
SELECT * FROM Orders

--BẢNG: KHÁCH HÀNG
CREATE TABLE Customers
(
	CustomerId int Identity(1,1) PRIMARY KEY,
	CustomerName nvarchar(255),
	CustomerSex nvarchar(255),
	Age int,
	Avatar nvarchar(255),
	Id int,
	CONSTRAINT CUSTOMERS_Id FOREIGN KEY(Id)
    REFERENCES Orders(Id)
)
GO
INSERT INTO Customers(CustomerName,CustomerSex,Age,Avatar,Id)
VALUES(N'Phan Van Hung', N'Hue', 21,'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg',1)
INSERT INTO Customers(CustomerName,CustomerSex,Age,Avatar,Id)
VALUES(N'Tran Trong Tuyen', N'Quang Ngai', 24,'https://play-lh.googleusercontent.com/6f6MrwfRIEnR-OIKIt_O3VdplItbaMqtqgCNSOxcfVMCKGKsOdBK5XcI6HZpjssnB2Y',5)
INSERT INTO Customers(CustomerName,CustomerSex,Age,Avatar,Id)
VALUES(N'Tran Nhat Khanh Lan', N'Da Nang', 23,'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',4)
INSERT INTO Customers(CustomerName,CustomerSex,Age,Avatar,Id)
VALUES(N'Nguyen Duy Thang', N'Da Nang', 25,'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/golden-retriever-royalty-free-image-506756303-1560962726.jpg?crop=0.672xw:1.00xh;0.166xw,0&resize=640:*',3)
INSERT INTO Customers(CustomerName,CustomerSex,Age,Avatar,Id)
VALUES(N'Pham Thi Nhu Thuy', N'Quang Nam', 27,'https://www.princeton.edu/sites/default/files/styles/half_2x/public/images/2022/02/KOA_Nassau_2697x1517.jpg?itok=iQEwihUn',2)
INSERT INTO Customers(CustomerName,CustomerSex,Age,Avatar,Id)
VALUES(N'Tran Thi Thao Nguyen', N'Quang Nam', 26,'https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg',4)
SELECT * FROM Customers

--BẢNG: TÀI KHOẢN
CREATE TABLE Accounts
(
	AccountId int Identity(1,1) PRIMARY KEY,
	AccountName nvarchar(255),
	AccountEmail nvarchar(255), 
	AccountPassword nvarchar(255),
	CustomerId int,
	CONSTRAINT ACCOUNTS_CustomerId FOREIGN KEY(CustomerId)
    REFERENCES Customers(CustomerId)
)
GO
Insert into Accounts(AccountName,AccountEmail,AccountPassword,CustomerId)
Values
(N'saler',N'saler@gmail.com','saler',2),
(N'admin',N'admin@gmail.com','admin',5),
(N'Trần Trọng Tuyển',N'trongtuyenlekhiet@gmail.com','12345678',1),
(N'Trần Trọng Sinh',N'sinh@gmail.com','123456',3),
(N'becute',N'becutehihi@gmail.com','12345678',4),
(N'Nguyễn admin',N'admin','12345678',6)
SELECT * FROM Accounts


-- ***** ĐỒNG BỘ, CÁC THAO TÁC:
-- ***** INSERT DỮ LIỆU:
-- ***** CODE NÂNG CAO: 
--Sao kê tất cả các đơn hàng do khách hàng có CustomerSex = ‘Quang Nam’ mua, sắp xếp kết quả tăng dần theo số lượng */
SELECT Id,ProductId,ProductName,Quantity
FROM Orders
WHERE Id IN (SELECT Id FROM Customers WHERE CustomerSex = 'Quang Nam')
ORDER BY Quantity
--chạy
SELECT * FROM Orders
SELECT * FROM Customers

-- ***** TRIGGER:
--Thêm mới nhiều bản ghi trên bảng PRODUCTS, InStocks và Price phải lớn hơn 0, CategoryId phải có trong bảng CATEGORIES.
CREATE TRIGGER TRIGGER_N 
ON Products
FOR INSERT
AS
BEGIN
  IF EXISTS (SELECT CategoryId,Price,InStocks FROM inserted 
  WHERE CategoryId NOT IN (SELECT CategoryId  FROM Categories) OR InStocks <= 0 OR Price <= 0)
     BEGIN
        ROLLBACK TRANSACTION
	    PRINT N'THẤT BẠI'
	 END
   ELSE PRINT N'THÀNH CÔNG'
END
-- chạy 
SELECT * FROM Products
SELECT * FROM Categories

--TH: thành công
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Điện thoại Samsung Galaxy Z Fold3 5G 512GB',3, 44990000, 'https://cdn.tgdd.vn/Products/Images/42/248284/samsung-galaxy-z-fold-3-green-1-600x600.jpg', N'Galaxy Z Fold3 5G đánh dấu bước tiến mới của Samsung trong phân khúc điện thoại gập cao cấp khi được cải tiến về độ bền cùng những nâng cấp đáng giá về cấu hình hiệu năng, hứa hẹn sẽ mang đến trải nghiệm sử dụng đột phá cho người dùng.',30, N'CS2')
--TH: ko thành công
INSERT INTO Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,BranchId) 
VALUES(N'Điện thoại Samsung Galaxy 7',3, 0, 'https://cdn.tgdd.vn/Products/Images/42/248284/samsung-galaxy-z-fold-3-green-1-600x600.jpg', N'Galaxy Z Fold3 5G đánh dấu bước tiến mới của Samsung trong phân khúc điện thoại gập cao cấp khi được cải tiến về độ bền cùng những nâng cấp đáng giá về cấu hình hiệu năng, hứa hẹn sẽ mang đến trải nghiệm sử dụng đột phá cho người dùng.',0, N'CS1')
--
DROP TRIGGER TRIGGER_N
-- ***** FUNCTION:
--Liệt kê thông tin CATEGORIES và PRODUCTS có các sản phẩm có số lượng còn trong khoảng tối-thiểu và tối-đa 
--là hai giá trị được nhập theo tham số của hàm.
CREATE FUNCTION FUNC_N(
         @TOITHIEU INT, 
		 @TOIDA INT)
RETURNS TABLE
AS
  RETURN   
  SELECT c.CategoryId,CategoryName,c.Avatar,ProductId,ProductName,Price,Description,InStocks,BranchId
  FROM CATEGORIES c INNER JOIN PRODUCTS p ON c.CategoryId = p.CategoryId
  WHERE InStocks >= @TOITHIEU and InStocks <= @TOIDA  
--chạy 
SELECT * FROM FUNC_N(2,30) 
SELECT * FROM FUNC_N(2,19) 

SELECT * FROM Categories
SELECT * FROM Products
--
drop function FUNC_N
-- ***** PROCEDURE:
--Xóa thông tin của những PRODUCTS có ProductId được truyền vào như một tham số của thủ tục. 
CREATE PROC PRO_N(
	@ProductId INT)
AS
BEGIN
	DELETE FROM Products WHERE ProductId = @ProductId
END
--chạy
SELECT * FROM Products
EXEC PRO_N 17
--
DROP PROC PRO_N


















-----LỖI
--Thêm tài khoản, nếu trùng tài khoản thì báo lỗi
CREATE TRIGGER TRIGGER_N
ON Accounts
FOR INSERT
AS
BEGIN
	DECLARE @AccountEmail NVARCHAR(255)
	DECLARE @AccountId INT
	SELECT @AccountEmail = AccountEmail FROM inserted
	SELECT @AccountId = AccountId FROM inserted
  IF EXISTS (SELECT AccountEmail,AccountId FROM inserted WHERE AccountEmail IN (SELECT AccountEmail FROM Accounts where AccountId != AccountId  ) )
     BEGIN
        ROLLBACK TRANSACTION
	    PRINT N'THẤT BẠI'
	 END
   ELSE PRINT N'THÀNH CÔNG'
END
drop trigger TRIGGER_N

--chạy
SELECT * FROM Accounts
insert into Accounts(AccountName,AccountEmail,AccountPassword,CustomerId)
values(N'Thảo Nguyên','thaonguyen@gmail.com','123456',3)

--Viết trigger cho bảng CHITIETDONHANG: Khi thực hiện đăng ký mới một đơn đặt hàng cho 
--khách hàng thì cập nhật lại số lượng sản phẩm trong bảng sản phẩm (tức là số lượng 
--sản phẩm còn lại sau khi đã bán)

CREATE TRIGGER TRG_N
ON CHITIETDONHANG
FOR INSERT
AS
BEGIN
	DECLARE @SoLuong INT
	DECLARE @MaSP NVARCHAR(10)
	SELECT @SoLuong = inserted.SoLuong FROM inserted
	SELECT @MaSP = inserted.MaSP FROM inserted
	UPDATE SANPHAM SET SoLuong = SoLuong - @SoLuong WHERE MaSP = @MaSP
	
END

CREATE TRIGGER TRIGGER_N
ON CHITIETDONHANG
AFTER INSERT
AS
BEGIN
	DECLARE @SoLuong INT
	DECLARE @MaSP NVARCHAR(10)
	SELECT @SoLuong = SoLuong FROM inserted
	SELECT @MaSP = MaSP FROM inserted
	UPDATE SANPHAM SET SoLuong = (SoLuong - @SoLuong) WHERE MaSP = @MaSP
END
