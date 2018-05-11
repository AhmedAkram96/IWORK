
create table Users(

username varchar(20) primary key ,
[password] varchar(20) not null,
personal_email varchar(50) unique not null,
birth_date datetime,
years_of_experience int not null,
first_name varchar(20) not null,
middle_name varchar(20) ,
last_name varchar(20) not null,
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date))  
);


create table Companies(
email varchar(50) primary key,
name varchar(20) not null,
[address] varchar(20) not null,
domain varchar(20) unique not null,
[type] varchar(20),
vision varchar(1000),
specialization varchar(20)
);


create table Company_phones(

company varchar(50),
phone varchar(20),                           
primary key (company ,phone),
FOREIGN KEY(company) REFERENCES Companies ON DELETE CASCADE ON UPDATE CASCADE
);



  create table Departments(

  code int,
  company varchar(50),
  name varchar(20),
  primary key (code, company),
  foreign key (company) references Companies ON DELETE CASCADE ON UPDATE CASCADE

  );
create table Jobs (
title varchar(20),
department int,
company varchar(50),
short_description varchar(50) not null,
detailed_description varchar(2000),
min_experience int not null,
salary decimal(10,2),
deadline datetime,
no_of_vacancies int not null,
working_hours int not null,
primary key (title,department ,company),
FOREIGN KEY( department,company) REFERENCES Departments ON DELETE CASCADE ON UPDATE CASCADE

);

create table Questions(
number int primary key identity,
question varchar(200) not null,
answer BIT not null

);

create table Jobs_has_Questions(
job varchar(20),
department int,
company varchar(50),
question int,
primary key (job,department ,company,question),
FOREIGN KEY(job,department,company) references Jobs  ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(question) references Questions  ON DELETE CASCADE ON UPDATE CASCADE


);
 create table Jobs_Users(
 
[user] varchar(20),
job varchar(20),
primary key([user], job),
foreign key([user]) references Users(username) ON DELETE CASCADE ON UPDATE CASCADE
);




create table Job_Seekers(

username varchar(20) primary key,
foreign key(username) references Users(username) ON DELETE CASCADE ON UPDATE CASCADE
);



create table Staff_Members(

username varchar(20) primary key,
annual_leaves int not null,                       
company_email   as    username +'@'+ LEFT(SUBSTRING(Company, CHARINDEX('@', Company) + 1, 100),100) ,
day_off varchar(30) not null,
salary decimal(10,2),
job varchar(20) not null,
department int not null,
company varchar(50) not null,
foreign key(job, department, company) references Jobs(title, department, company) ON DELETE cascade ON UPDATE CASCADE,
foreign key(username) references Users(username) ON DELETE CASCADE ON UPDATE CASCADE
);



create table Jobs_apply_Job_Seekers(

job varchar(20),
department int,
company varchar(50),
job_seeker varchar(20),
hr_response Bit,                       
manager_response Bit,                   
score int,
primary key(job, department, company, job_seeker),
foreign key(job, department, company) references Jobs ON DELETE CASCADE ON UPDATE CASCADE,
foreign key( job_seeker) references Job_Seekers ON DELETE CASCADE ON UPDATE CASCADE
);



create table Attendance_Records(

[date] datetime,
staff varchar(20),
start_time datetime,
end_time datetime,
primary key([date], staff),
foreign key(staff) references Staff_Members ON DELETE CASCADE ON UPDATE CASCADE
);



create table Emails(

serial_number  int primary key  Identity,
[subject] varchar(50),
[date] datetime not null,
body varchar(1000)
);



create table Staff_Members_send_Emails_Staff_Members(
email_number int ,
recipient varchar(20),
sender varchar(20) not null,
primary key(email_number, recipient),
foreign key(email_number) references Emails ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(recipient) references Staff_Members,
foreign key(sender) references Staff_Members
);


CREATE TABLE Hr_Employees (

username varchar(20) primary key ,
FOREIGN KEY (username) REFERENCES Staff_Members ON UPDATE CASCADE ON DELETE CASCADE

);






CREATE TABLE Regular_Employees (

username varchar(20) primary key ,
FOREIGN KEY (username) REFERENCES Staff_Members ON UPDATE CASCADE ON DELETE CASCADE

);






CREATE TABLE Managers (

username varchar(20) primary key ,
type varchar (30),
FOREIGN KEY (username) REFERENCES Staff_Members ON UPDATE CASCADE ON DELETE CASCADE

);





CREATE TABLE Announcements (

[date] datetime,
title varchar(50),
hr_employee varchar(20),
[type] varchar(20),
[description] varchar(200),
PRIMARY KEY ([date], title, hr_employee),
FOREIGN KEY (hr_employee) REFERENCES Hr_Employees ON UPDATE CASCADE ON DELETE CASCADE

);




CREATE TABLE Requests(

[start_date] datetime,
applicant varchar(20),
end_date datetime not null,
request_date datetime not null,
total_days AS (DATEDIFF(dd,[start_date] ,  end_date) ),
hr_response BIT,
manager_response BIT,
manager_reason varchar(60),
hr_employee varchar(20),
manager varchar(20),
PRIMARY KEY([start_date], applicant),

FOREIGN KEY(applicant) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(hr_employee) REFERENCES Hr_Employees,
FOREIGN KEY(manager) REFERENCES Managers



);



CREATE TABLE Leave_Requests(
[start_date] datetime,
applicant varchar(20),
[type] varchar(20) not null,
FOREIGN KEY([start_date], applicant) REFERENCES Requests ON DELETE CASCADE ON UPDATE CASCADE

);



CREATE TABLE Business_Trip_Requests(
[start_date] datetime,
applicant varchar(20),
destination varchar(50) not null,
purpose varchar(100) not null,
FOREIGN KEY([start_date], applicant) REFERENCES Requests ON DELETE CASCADE ON UPDATE CASCADE

);



create table HR_Employees_apply_replace_Requests (

[start_date] datetime ,
applicant varchar(20)  ,
hr_employee varchar(20) NOT NULL,
replacement varchar(20) NOT Null ,

PRIMARY KEY([start_date], applicant),
FOREIGN KEY([start_date],applicant) REFERENCES Requests ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(hr_employee) REFERENCES HR_Employees ,
FOREIGN KEY(replacement) REFERENCES HR_Employees
);



create table Regular_Employees_apply_replace_Requests(
[start_date] datetime,
applicant varchar(20)   ,
reg_employee varchar(20) NOT NULL,
replacement varchar(20) NOT Null ,

PRIMARY KEY([start_date], applicant),
FOREIGN KEY([start_date],applicant) REFERENCES Requests ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(reg_employee) REFERENCES Regular_Employees,
FOREIGN KEY(replacement) REFERENCES Regular_Employees
);


create table Managers_apply_replace_Requests(
[start_date] datetime ,
applicant varchar(20)  ,
manager varchar(20) NOT NULL ,
replacement varchar(20) NOT NULL ,

PRIMARY KEY(start_date, applicant),
FOREIGN KEY(start_date,applicant) REFERENCES Requests ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(Manager) REFERENCES Managers ,
FOREIGN KEY(replacement) REFERENCES Managers
);



create table Projects (

name varchar(40) ,
company varchar(50), 
[start_date] datetime not null,
end_date datetime not null,
manager varchar(20),
PRIMARY KEY(name,company),
FOREIGN KEY(company) REFERENCES Companies ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(manager) REFERENCES Managers

);


create table Managers_assign_Project_Regular_Employees(

project_name varchar(40),
company varchar(50),
regular_employee varchar (20),
manager varchar(20),

PRIMARY KEY(project_name, company, regular_employee),

FOREIGN KEY(project_name, company) REFERENCES Projects ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(regular_employee) REFERENCES Regular_Employees,
FOREIGN KEY(manager)REFERENCES Managers
);


create Table Tasks(

name varchar(40),
project varchar(40),
company varchar(50),
deadline datetime not null,
[status] varchar(20) default 'Open',
[description] varchar(5000) not null,
regular_employee varchar(20),
manager varchar(20),

PRIMARY KEY(name, project, company),


FOREIGN KEY(project, company) REFERENCES Projects ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(regular_employee) REFERENCES Regular_Employees,
FOREIGN KEY(manager) REFERENCES Managers
);

create table Task_Comments(
task_name varchar(40),
project varchar(40),
company varchar(50),
comment varchar(200),

PRIMARY KEY(task_name, project, company, comment),

FOREIGN KEY(task_name, project, company) REFERENCES Tasks ON DELETE CASCADE ON UPDATE CASCADE
);









