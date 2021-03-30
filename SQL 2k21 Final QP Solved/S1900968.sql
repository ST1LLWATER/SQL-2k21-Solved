create table Branch(
BranchNo int primary key,
BranchName varchar(255) not null,
City varchar(255) not null,
Pincode int
);

create table Staff(
StaffNo int primary key,
FName varchar(255) not null,
LName varchar(255),
Position varchar(255),
Gender char,
Salary float,
BranchNo int,
foreign key (BranchNo) references Branch(BranchNo)
on delete cascade
);

create table Clients(
ClientNo int primary key,
Fname varchar(255) not null,
LName varchar(255),
PhoneNo varchar(255)
);

create table PropertyForRent(
PropertyNo int primary key,
City varchar(255) default "Shillong",
Pincode int,
Rooms int,
Rent int,
BranchNo int,
ClientNo int,
foreign key (BranchNo) references Branch(BranchNo),
foreign key (ClientNo) references Clients(ClientNo)
);

insert into Branch
values(1,"Rynjah","Shillong",793001),
(2,"Thane","Mumbai",110212),
(3,"GS Road","Guwahati",310012);

insert into Staff
values(101,"Akshay","Singh","Staff Member","M",45000,1),
(102,"Preeti","Rai","Staff Member","F",40000,2),
(103,"Akash","Sharma","Manager","M",50000,3),
(104,"Avneet","Sen","Head Officer","F",52000,2);

insert into Clients
values(201,"Kaushik","Kumar","7254676890"),
(202,"Nidreshikha","Sharma","6008786501"),
(203,"Tushar","Singh","7085714523");

insert into PropertyForRent
values(301,"Thane",110011,5,20000,1,202),
(302,"Meerut",225016,7,30000,2,202),
(303,"Thiruvananthapuram",901210,5,18000,1,201),
(304,"Tura",793112,6,25000,3,203),
(305,"Shillong",793001,4,15000,3,203),
(306,"Noida",101172,6,23000,3,203);

select *
from branch
inner join staff
on branch.BranchNo=staff.BranchNo;

select *
from staff
where salary>(select AVG(salary) from staff);

select Salary as Old_Salary, Salary+(0.10*Salary) as New_Salary
from staff;

create view TotalProperty as
select ClientNo,count(PropertyNo),sum(rent)
from PropertyForRent
group by ClientNo;

select *
from totalproperty





