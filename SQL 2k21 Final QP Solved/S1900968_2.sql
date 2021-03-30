create table Freelancers(
WorkerId int primary key,
FirstName varchar(255) not null,
LastName varchar(255),
City varchar(255) default "Shillong",
PhoneNo varchar(255),
skill varchar(255) not null
);

create table Clients_1(
ClientId int primary key,
FirstName varchar(255) not null,
LastName varchar(255),
City varchar(255) default "Shillong",
PhoneNo varchar(255)
);

create table HiredJobs(
WorkerId int,
ClientId int,
Startdate date,
Enddate date,
Payment float,
primary key(WorkerId,ClientId,Startdate),
foreign key (WorkerId) references freelancers(WorkerId),
foreign key (ClientId) references Clients_1(ClientId)
);

insert into freelancers
values(1,"Akash","Chopra","Shillong","7009856754","Photographer"),
(2,"Akshay","Singh","Tura","6009087678","Programmer"),
(3,"Priyanka","Das","Meerut","7098710234","Developer");

insert into Clients_1
values(101,"Nitish","Kumar","Shillong","6768978001"),
(102,"Amisha","Sharma","Shillong","3212390876"),
(103,"Monika","Das","Bareilly","6523410023"),
(104,"Puja","Rai","Tura","7089714008"),
(105,"Nishant","Sen","Shillong","1700427656");

insert into HiredJobs
values(1,101,"2021-01-03","2021-03-05",40000),
(1,102,"2021-01-07","2021-03-07",50000),
(3,103,"2020-04-18","2021-06-15",45000),
(2,104,"2021-01-15","2021-03-20",30000),
(1,105,"2020-06-12","2020-10-12",60000);

select max(payment) as Highest_Payment,min(payment) as Min_Payment, max(payment)-min(payment) as DifferenceOfPayments
from HiredJobs;

select *
from freelancers
inner join HiredJobs 
on freelancers.WorkerId=hiredjobs.WorkerId;

select clients_1.ClientId,clients_1.FirstName,clients_1.Lastname,clients_1.city,clients_1.phoneno,hiredjobs.startdate
from clients_1
inner join hiredjobs
on clients_1.clientId=hiredjobs.clientId
where startdate between "2021-01-01" AND "2021-01-31";

create view TotalJobs as
select WorkerId, count(clientid), Sum(payment)
from hiredjobs
group by WorkerId;

select * 
from TotalJobs

