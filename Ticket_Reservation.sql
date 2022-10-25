use Ticket_Reservation
------T?o B?ng---------
create table Movie
(
   MovieID  int not null,
   MovieName nvarchar2(40),
   Category nvarchar2(40),
   SubTitle  nvarchar2(40)
);
Create table Theater
(
   TheaterID int not null,
   MaxOfSeat  int
);
Create table Seat
(
   SeatID int not null,
   TheaterID int not null
);
create table ShowTime
(
  ShowTimeID int not null,
  MovieID int not null,
  TheaterID int not null,
  ShowTime Date
);
Create table Ticket
(
   TicketID int not null,
   ShowTimeID int not null,
   Price float
);
create table Reservation
(
   ReserveID int,
   TicketID int not null,
   CustomerID int not null,
   EmployeeID int not null
);
create table Customer
(
   CustomerID int not null,
   Name nvarchar2(40),
   TelephoneCustomer varchar(40),
   Address nvarchar2(40),
   Email varchar(40),
   BirthDate date,
   CardID int,
   UserName varchar(30),
   Password varchar(30)
);
Create table Employee
(
   EmployeeID int not null,
   Name nvarchar2(30),
   BirthDate date,
   Address nvarchar2(40),
   Email varchar(40),
   TelephoneEmplayee varchar(40)
);
create table Member
(
   MemberID int not null,
   CustomerID  int not null,
   Cash     float,
   Point  int
);
create table Payment
(
    PaymentID int not null,
    MemberID int not null,
    Cash     float,
    Point  int
);
------------T?o khoá chính khoá ph?------------------
---T?o khoá chính
alter table Movie add constraint PK_MovieID primary key( MovieID )
alter table Theater add constraint PK_TheaterID primary key( TheaterID )
alter table Seat add constraint PK_SeatID primary key(  SeatID )
alter table ShowTime add constraint PK_ShowTimeID primary key( ShowTimeID )
alter table Ticket add constraint PK_TicketID primary key( TicketID )
alter table Customer add constraint PK_CustomerID primary key(CustomerID )
alter table Employee add constraint PK_EmployeeID primary key( EmployeeID )
alter table Member add constraint PK_MemberID primary key(  MemberID )
alter table Payment add constraint PK_PaymentID primary key( PaymentID )
---T?o khoá ph?
alter table Seat add constraint FK_TheaterID foreign key(TheaterID) references Theater(TheaterID)
alter table ShowTime add constraint FK_MovieID foreign key(MovieID) references Movie(MovieID)
alter table ShowTime add constraint FK_Theater1ID foreign key(TheaterID) references Theater(TheaterID)
alter table Ticket add constraint FK_ShowTimeID foreign key(ShowTimeID) references ShowTime(ShowTimeID)
alter table Reservation add constraint FK_TicketID foreign key(TicketID) references Ticket(TicketID)
alter table Reservation add	constraint FK_CustomerID foreign key(CustomerID) references Customer(CustomerID)
alter table Reservation	add constraint FK_EmployeeID foreign key(EmployeeID) references Employee(EmployeeID)
alter table Member add constraint FK_Customer1ID foreign key(CustomerID) references Customer(CustomerID)
alter table Payment add constraint FK_MemberID foreign key(MemberID) references Member(MemberID)
-------insert d? li?u-----------
insert all
  into Customer (CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password) values
(01,N'Hoà Bình','0913567222',N'Hà n?i','hb@fbt.vn',TO_DATE('11-25-1980','MM/DD/YYYY'),13212,'HoaBinh','Hoabinh123')
  into Customer (CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password) values
(02,N'Quang Long','048123445',N'H?i Phòng','qlong@yahoo.com',TO_DATE('12-11-1989','MM/DD/YYYY'),14352,'QuangLong','QuangLong123')
  into Customer (CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password) values
(03,N'Nguy?n Tu?n','098467231',N'Tuyên Quang','Tuan@yahoo.com',TO_DATE('11-02-1890','MM/DD/YYYY'),13432,'NguyenTuan','NguyenTuan123')
  into Customer (CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password) values
(04,N'Công Ph??ng','097838343',N'Gia Lai','phuong@hagl.vn',TO_DATE('08-13-1979','MM/DD/YYYY'),12422,'CongPhuong','CongPhuong123')
  into Customer (CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password) values
(05,N'Tu?n Anh','0898935333',N'Thanh Hoá','Anh@hagl.vn',TO_DATE('04-22-2001','MM/DD/YYYY'),16333,'TuanAnh','TuanAnh123')
  into Customer (CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password) values
(06,N'Kim Lan','0543578588',N'??c L?c','Lan@dlc.vn',TO_DATE('05-11-2002','MM/DD/YYYY'),16342,'KimLan','KimLan132')
  into Customer (CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password) values
(07,N'Lan Hoa','0818436763',N'Khánh Hoà','Hoa@gmail.com',TO_DATE('10-01-2003','MM/DD/YYYY'),15343,'LanHoa','LanHoa432')
  into Customer (CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password) values
(08,N'Bình Minh','0998935233',N'Ninh Bình','Minh@eaut.vn',TO_DATE('11-22-1989','MM/DD/YYYY'),12892,'BinhMinh','BinhMinh3232')
  into Customer (CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password) values
(09,N'Bùi Ph??c','0598935367',N'Hu?','Phuoc@tmu.vn',TO_DATE('05-09-1999','MM/DD/YYYY'),14356,'BuiPhuoc','BuiPhuoc423')
  into Customer (CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password) values
(10,N'Kim Nhung','0798935633',N'Hà Nam','Nhung@html.vn',TO_DATE('04-20-2002','MM/DD/YYYY'),12353,'KimNhung','KimNhung323')
select * from dual;
select * from Customer

insert all
  into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(01,N'Lan H??ng',TO_DATE('11-23-1980','MM/DD/YYYY'),N'Hoà Bình','LHuong@eaut.vn','0912349865')
 into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(02,N'Kim Hoa',TO_DATE('12-31-1979','MM/DD/YYYY'),N'Qu?ng Bình','KimHoa@tmu.vn','098768324')
 into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(03,N'Tùng C?m',TO_DATE('8-9-1986','MM/DD/YYYY'),N'Nam ??nh','TCom@UAF.vn','098568253')
 into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(04,N'Kiên C??ng',TO_DATE('9-19-1980','MM/DD/YYYY'),N'Khánh Hoà','KCuong@hhm.vn','0912367299')
 into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(05,N'Tài Loi',TO_DATE('11-26-1980','MM/DD/YYYY'),N'Hoà Bình','TaiLoi@akm.vn','0912349890')
 into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(06,N'Bích Hu?',TO_DATE('12-30-1979','MM/DD/YYYY'),N'Qu?ng Bình','BHue@tmu.vn','098768324')
 into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(07,N'Tùng Chi',TO_DATE('8-9-1986','MM/DD/YYYY'),N'Nam ??nh','TChi@UAF.vn','098568203')
 into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(08,N'Kiên ??nh',TO_DATE('9-14-1980','MM/DD/YYYY'),N'Khánh Hoà','KDinh@hhmt.vn','0912367359')
 into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(09,N'Hoàng H?u',TO_DATE('11-23-1980','MM/DD/YYYY'),N'Hoà Bình','hHau@eaum.vn','0912349865')
 into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(10,N'Bích Trà',TO_DATE('12-11-1979','MM/DD/YYYY'),N'Qu?ng Bình','BTra@tmut.vn','098768904')
 into Employee(EmployeeID,Name,BirthDate,Address,Email,TelephoneEmplayee) values
(11,N'V?n Minh',TO_DATE('8-4-1986','MM/DD/YYYY'),N'Nam ??nh','vMinh@gette.vn','0985682535')
select * from dual;
select * from Employee

insert all
  into Movie(MovieID,MovieName,Category,SubTitle) values
(01,N'Ng??i Phán X?',N'Hành ??ng',N'Ti?ng Vi?t')
  into Movie(MovieID,MovieName,Category,SubTitle) values
(02,N'Joker-K? Ác Nhân',N'T?i Ph?m',N'Ti?ng Anh')
  into Movie(MovieID,MovieName,Category,SubTitle) values
(03,N'Ng??i Tuy?t Bé Nh?',N'Ho?t Hình',N'Ti?ng Pháp')
  into Movie(MovieID,MovieName,Category,SubTitle) values
(04,N'?àn Ông Song T?',N'Khoa H?c Vi?n T??ng',N'Ti?ng Anh')
  into Movie(MovieID,MovieName,Category,SubTitle) values
(05,N'Tiên H?c Ám',N'Hành ??ng',N'Ti?ng Anh')
  into Movie(MovieID,MovieName,Category,SubTitle) values
(06,N'Gia ?ình Addams',N'Hài K?ch',N'Ti?ng Anh')
  into Movie(MovieID,MovieName,Category,SubTitle) values
(07,N'B?c Kim Thang',N'Kinh D?',N'Ti?ng Vi?t')
  into Movie(MovieID,MovieName,Category,SubTitle) values
(08,N'Thiên ???ng H?c Ám',N'Kinh D?',N'Ti?ng Anh')
  into Movie(MovieID,MovieName,Category,SubTitle) values
(09,N'??a con c?a th?i ti?t',N'Ho?t Hình',N'Ti?ng Nh?t')
  into Movie(MovieID,MovieName,Category,SubTitle) values
(10,N'Your Name',N'Ho?t Hình',N'Ti?ng Nh?t')
select * from dual;
select * from Movie

insert all
into Theater(TheaterID,MaxOfSeat) values
(01,60)
into Theater(TheaterID,MaxOfSeat) values
(02,70)
into Theater(TheaterID,MaxOfSeat) values
(03,75)
into Theater(TheaterID,MaxOfSeat) values
(04,50)
into Theater(TheaterID,MaxOfSeat) values
(05,55)
into Theater(TheaterID,MaxOfSeat) values
(06,80)
into Theater(TheaterID,MaxOfSeat) values
(07,60)
into Theater(TheaterID,MaxOfSeat) values
(08,90)
into Theater(TheaterID,MaxOfSeat) values
(09,88)
into Theater(TheaterID,MaxOfSeat) values
(10,95)
select * from dual;
select * from Theater

insert all
 into Seat(SeatID,TheaterID) values    
(59,01)
 into Seat(SeatID,TheaterID) values 
(68,02)
 into Seat(SeatID,TheaterID) values 
(38,04)
 into Seat(SeatID,TheaterID) values 
(23,05)
 into Seat(SeatID,TheaterID) values 
(31,01)
 into Seat(SeatID,TheaterID) values 
(53,05)
 into Seat(SeatID,TheaterID) values 
(71,03)
 into Seat(SeatID,TheaterID) values 
(70,07)
 into Seat(SeatID,TheaterID) values 
(88,08)
 into Seat(SeatID,TheaterID) values 
(89,09)
 into Seat(SeatID,TheaterID) values 
(78,10)
select * from dual;
select * from Seat

insert all
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values                       
(01,07,05,TO_DATE('11-25-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values   
(02,03,01,TO_DATE('04-10-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values   
(03,02,02,TO_DATE('04-10-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values   
(04,05,04,TO_DATE('10-18-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values   
(05,06,03,TO_DATE('11-10-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values   
(06,05,01,TO_DATE('12-26-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values   
(07,02,05,TO_DATE('11-25-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values   
(08,08,01,TO_DATE('04-10-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values   
(09,09,08,TO_DATE('04-10-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values   
(10,10,07,TO_DATE('10-18-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values 
(11,05,10,TO_DATE('11-10-2019','MM/DD/YYYY'))
 into ShowTime (ShowTimeID,MovieID,TheaterID,ShowTime) values   
(12,08,09,TO_DATE('12-26-2019','MM/DD/YYYY'))
select * from dual;
select * from ShowTime

insert all
  into Ticket(TicketID,ShowTimeID,Price) values
(01,02,99)
  into Ticket(TicketID,ShowTimeID,Price) values
(02,03,85)
  into Ticket(TicketID,ShowTimeID,Price) values
(03,04,200)
  into Ticket(TicketID,ShowTimeID,Price) values
(04,01,100)
  into Ticket(TicketID,ShowTimeID,Price) values
(05,05,150)
  into Ticket(TicketID,ShowTimeID,Price) values
(06,06,50)
  into Ticket(TicketID,ShowTimeID,Price) values
(07,07,250)
  into Ticket(TicketID,ShowTimeID,Price) values
(08,10,95)
  into Ticket(TicketID,ShowTimeID,Price) values
(09,09,250)
  into Ticket(TicketID,ShowTimeID,Price) values
(10,08,80)
select * from dual;
select * from Ticket

insert all
  into Reservation(ReserveID,TicketID,CustomerID,EmployeeID) values
(01,04,05,01)
  into Reservation(ReserveID,TicketID,CustomerID,EmployeeID) values
(02,01,03,03)
  into Reservation(ReserveID,TicketID,CustomerID,EmployeeID) values
(03,05,02,02)
  into Reservation(ReserveID,TicketID,CustomerID,EmployeeID) values
(04,02,04,02)
  into Reservation(ReserveID,TicketID,CustomerID,EmployeeID) values
(05,03,01,04)
  into Reservation(ReserveID,TicketID,CustomerID,EmployeeID) values
(06,04,05,01)
  into Reservation(ReserveID,TicketID,CustomerID,EmployeeID) values
(07,06,06,05)
  into Reservation(ReserveID,TicketID,CustomerID,EmployeeID) values
(08,05,07,07)
  into Reservation(ReserveID,TicketID,CustomerID,EmployeeID) values
(09,08,04,06)
  into Reservation(ReserveID,TicketID,CustomerID,EmployeeID) values
(10,10,08,10)
select * from dual;
select * from Reservation

insert all
   into Member(MemberID,CustomerID,Cash,Point) values
(01,02,50,1)
   into Member(MemberID,CustomerID,Cash,Point) values
(02,01,70,0)
   into Member(MemberID,CustomerID,Cash,Point) values
(03,04,50,1)
   into Member(MemberID,CustomerID,Cash,Point) values
(04,05,100,Null)
   into Member(MemberID,CustomerID,Cash,Point) values
(05,03,85,1)
   into Member(MemberID,CustomerID,Cash,Point) values
(06,02,50,1)
   into Member(MemberID,CustomerID,Cash,Point) values
(07,01,70,0)
   into Member(MemberID,CustomerID,Cash,Point) values
(08,08,50,1)
   into Member(MemberID,CustomerID,Cash,Point) values
(09,09,200,Null)
   into Member(MemberID,CustomerID,Cash,Point) values
(10,06,85,1)
select * from dual;
select * from Member

insert all
  into Payment(PaymentID,MemberID, Cash,Point) values
(01,04,100,Null)
  into Payment(PaymentID,MemberID, Cash,Point) values
(02,01,50,1)
  into Payment(PaymentID,MemberID, Cash,Point) values
(03,02,70,0)
  into Payment(PaymentID,MemberID, Cash,Point) values
(04,05,85,1)
  into Payment(PaymentID,MemberID, Cash,Point) values
(05,04,100,Null)
  into Payment(PaymentID,MemberID, Cash,Point) values
(06,01,50,1)
  into Payment(PaymentID,MemberID, Cash,Point) values
(07,02,70,0)
  into Payment(PaymentID,MemberID, Cash,Point) values
(08,05,85,1)
  into Payment(PaymentID,MemberID, Cash,Point) values
(09,04,100,Null)
  into Payment(PaymentID,MemberID, Cash,Point) values
(10,01,50,1)
  into Payment(PaymentID,MemberID, Cash,Point) values
(11,02,70,0)
  into Payment(PaymentID,MemberID, Cash,Point) values
(12,05,85,1)
select * from dual;
select * from Payment
-------------------Truy v?n---------------
----1 T?o r?ng bu?c
--a:T?o r?ng bu?c check cho c?t Price t? [20;300] c?a b?ng Ticket
alter table Ticket add constraint CK_Price Check( Price>=20 and Price<=300)

--b T?o r?ng bu?c Unique cho c?t Email c?a b?ng Customer và Employ
alter table Customer add constraint un_Email Unique(Email)
alter table Employee add constraint un_EmailNV Unique(Email)

----2 C?p nh?t
--a: C?p nh?t b?ng Customer thêm tr??ng Gender(Gi?i tính) ki?u int
alter table Customer add Gender int

--b: C?p nh?t gi?i tính cho Hoà Bình, Kim Lan, Lan Hoa, Kim Nhung là 0 còn l?i là 1
update Customer set Gender=case
When Name in(N'Quang Long',N'Nguy?n Tu?n',N'Công Ph??ng',N'Tu?n Anh', N'Bình Minh', N'Bùi Ph??c') then 1
when Name in(N'Hoà Bình',N'Kim Lan', N'Lan Hoa', N'Kim Nhung') then 0
end;
 select * from Customer
select * from Employee
/*--c: thêm tr??ng Gender(Gi?i tính) ki?u int cho b?ng Employee c?p nh?t Gender con trai là 1, con gái là 0
và hi?n th? gi?i tính cho Lan H??ng và Bích Hu?,Kim Hoa, Hoàng H?u,Bích Trà là N? còn l?i là Nam*/
alter table Employee add Gender int
update Employee set Gender=case
When Name in(N'Tùng Chi',N'Kiên C??ng',N'Tùng C?m',N'Tài Loi',N'Kiên ??nh',N'V?n Minh',N'V?n Quy?t') then 1
when Name in(N'Lan H??ng',N'Bích Hu?',N'Kim Hoa',N'Hoàng H?u',N'Bích Trà') then 0
end;
select Name, Gender,
case
When Gender = 1 then N'Nam'
when Gender = 0 then N'N?'
end as TextGender
 from Employee

-----3 s? d?ng not in
--a: Hi?n th? Phim mà không ???c công chi?u
 select * from Movie where MovieID not in (select MovieID from ShowTime)
--b: Hi?n th? thành viên không có phi?u thanh toán
 select * from Member where MemberID not in (select MemberID from Payment)

-----4: s? d?ng having
select MovieName, COUNT(a.MovieID) as Duoc_chieu_hon_1_lan from Movie a join ShowTime b
 on a.MovieID=b.MovieID join Ticket c  on c.ShowTimeID=b.ShowTimeID group by MovieName,a.MovieID 
 Having COUNT(a.MovieID)>1

-----5: T?ng d?n và gi?m d?n
--a: Hi?n th? giá theo m?c t?ng d?n
select * from Ticket order by Price asc

--b: Hi?n th? giá theo m?c gi?m d?n
select * from Ticket order by Price desc

-----6: Tìm tên khách hàng có ch? cái K
select * from Customer where Name Like N'%K%'

-----7:  ??a ra t?ng s? ti?n m?t v?i ?i?u ki?n point=1
select SUM(cash)as T?ng_ti?n_?ã_thanh_toán from Payment where Point=1

-----8: T?o view có tên  vwCustomerList ?? li?t kê thông tin t?t c? các khách hàng g?m t?t c? các c?t c?a b?ng Customer 
--- và c?t member, trong ?ó Gender hi?n th? là 'Male' thay cho 1, 'Female' thay cho 0 và 'Unknown' thay cho null

create view VwCustomerlist as
 select CustomerID,Name,TelephoneCustomer,Address,Email,BirthDate,CardID,UserName,Password,Gender,
 case
  when Gender=1 then 'Male'
  when Gender=0 then 'Female'
  else 'Unknown'
  end as TextGioiTinh
  from Customer;
  select * from VwCustomerlist
-----9: s?a view VwCustomerlist ?? nó ch?a các c?t g?m CustomerID, Name,Address, Email và Gender c?a b?ng Customer 
go
 CREATE OR REPLACE VIEW VwCustomerlist as
 select CustomerID,Name,Address,Email,Gender,
 case
  when Gender=1 then 'Male'
  when Gender=0 then 'Female'
  else 'Unknown'
 end  as TextGioiTinh
  from Customer;
   select * from VwCustomerlist