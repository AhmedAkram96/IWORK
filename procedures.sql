	-- USER
	--1
	go
	create PROCEDURE CompanyByName
	@name varchar(20),
	@error BIT output
	AS
	Begin
		set @error = 0
		if(exists( Select * From Companies c Where  @name = c.name))
			Select *
			From Companies c
			Where  @name = c.name
		else
				set @error = 1
	End
	
	--EXEC CompanyByName 'shell'
	--EXEC CompanyByName ''
	
	
	
	go
	
	create PROCEDURE CompanyByAddress
	@address varchar(20),
	@error BIT output
	AS
	Begin
		set @error = 0
		if(exists(Select * From Companies c Where  @address = c.[address]))
			Select *
			From Companies c
			Where  @address = c.[address]
		else
			set @error = 1
	End
	
	--EXEC CompanyByAddress ''
	--EXEC CompanyByAddress 'Nasr City'
	
	go
	
	CREATE PROCEDURE CompanyByType
	@type varchar(20)
	AS
	Begin
		if(exists(Select * From Companies c Where  @type = c.[type]))
			Select *
			From Companies c
			Where  @type = c.[type]
		else
			print ('404 Not Found')
	End
	
	--EXEC CompanyByType 'multinational'
	--EXEC CompanyByType 'mu'
	
	go
	
	--2
	create PROCEDURE CompaniesList
	AS
	Begin
		Select *
		From Companies
	End
	
	--EXEC CompaniesList
	
	go
	
	-- 3
	create PROC CompanyInfo
	@company varchar(20)
	AS
	Begin
		if(exists ( Select * from Companies q where @company = q.email))
			Select c.* , d.code as DepartmentNo, d.name as Department
			From Companies c, Departments d
			Where c.email LIKE d.company AND @company LIKE c.email
		else
			if( not exists ( Select * from Companies q where @company = q.email))
				print('404 Not Found')
	End
	
	--EXEC CompanyInfo 'main@shell.us'
	
	-- 4
	
	go
	
	create PROC DepartmentInfo
	@company varchar(20),
	@department INT
	AS
	Begin
		Select distinct *
		From Departments d, Jobs j
		Where d.company LIKE j.company AND @company LIKE d.company AND j.no_of_vacancies > 0 AND d.code = @department AND j.department = @department
	End
	
	--EXEC DepartmentInfo 'main@shell.us', 1
	
	
	go
	
	--5
	create PROC Register
	@username varchar(20),
	@password varchar(20),
	@personal_email varchar(20),
	@birth_date datetime,
	@years_of_experience int,
	@first_name varchar(20),
	@middle_name varchar(20),
	@last_name varchar(20)
	
	AS
	Begin
		INSERT INTO Users values (@username, @password, @personal_email, @birth_date, @years_of_experience, @first_name, @middle_name, @last_name)
	End
	
	--EXEC Register 'adel.emam', 'morganahmedmorgan' , 'doola@gmail.com', '4/5/1972', 8 , 'Adel' , 'Mohamed' , 'Emam'
	--Delete From Users where username = 'adel.emam'
	
	go
	
	--6
	create PROC JobsWithVacancies
	@string varchar(100)
	
	AS
	Begin
		if(exists(Select j.*,c.name as company_name From Jobs j, Companies c where j.title LIKE '%' + @string + '%'
		 OR j.short_description LIKE '%' + @string + '%'))
			Select  j.*, c.name as company_name
			From Jobs j inner join Companies c
			on (j.title LIKE '%' + @string + '%' OR j.short_description LIKE '%' + @string + '%') AND j.company = c.email
		else
			print ('404 Not Found')
	End
	
	--EXEC JobsWithVacancies 'marketing'
	--EXEC JobsWithVacancies 'wnkas'
	
	
	go
	
	--7
	create PROC CompaniesAvgSalaries
	
	AS
	Begin
		Select c.email, AVG(j.salary) as avgsalaries
		From Companies c inner join Jobs j
		On c.email = j.company
		group by c.email ORDER BY avgsalaries DESC
	End
	
	--EXEC CompaniesAvgSalaries
	
	-------------------------------------------------------------------------------------------------------
	
	-- Registered User
	--1
	go
	create PROC [Login]
	@username varchar(20),
	@password varchar(20),
	@userornot BIT output,
	@type varchar(20) output
	AS
	Begin
		if (Exists (Select * From Users u Where u.username = @username AND u.[password] = @password))
			set @userornot = 1
		else
			set @userornot = 0
		Print @userornot
		if(@userornot = 1)
			begin
				if(Exists (Select * From Managers u Where u.username = @username))
					set @type = 'Manager'
				else if(Exists (Select * From Hr_Employees u Where u.username = @username))
					set @type = 'HR employee'
				else
					set @type = 'Regular employee'
				print @type
			end
	End
	
	--declare @userornot BIT
	--DECLARE @type varchar(20)
	--EXEC [Login] 'ahmed.hisham' ,'123456' , @userornot , @type
	
	
	--2
	go
	
	create PROC RegisteredUserInfo
	@username varchar(20)
	AS
	Begin
		if( exists (Select * From Users u Where u.username = @username))
			begin
				Select *
				From Users u
				Where u.username = @username
			end
		else
			print('404 Not Fount')
	
	End
	
	--EXEC RegisteredUserInfo 'ahmed.his'
	--EXEC RegisteredUserInfo 'ahmed.hisham'
	
	--3
	go
	
	CREATE PROC EditRegisteredUserInfo
	@username varchar(20),
	@password varchar(20),
	@personal_email varchar(20),
	@birth_date datetime,
	@years_of_experience int,
	@first_name varchar(20),
	@middle_name varchar(20),
	@last_name varchar(20)
	
	AS
	Begin
		if(@password is not null)
			begin
			Update Users
			Set [password] = @password
			Where username = @username;
			end
		if(@personal_email is not null)
			begin
			Update Users
			Set personal_email = @personal_email
			Where username = @username;
			end
		if(@birth_date is not null)
			begin
			Update Users
			Set birth_date = @birth_date
			Where username = @username;
			end
		if(@years_of_experience is not null)
			begin
			Update Users
			Set years_of_experience = @years_of_experience
			Where username = @username;
			end
		if(@first_name is not null)
			begin
			Update Users
			Set first_name = @first_name
			Where username = @username;
			end
		if(@middle_name is not null)
			begin
			Update Users
			Set middle_name = @middle_name
			Where username = @username;
			end
		if(@last_name is not null)
			begin
			Update Users
			Set last_name = @last_name
			Where username = @username;
			end
	End
	
	--EXEC EditRegisteredUserInfo 'ahmed.hisham',null,null, '7/30/1997',null, null, null, null
	
	------------------------------------------------------------------------------------------------------------------------------------
	
	--job seeker
	--1
	go
	create PROC SeekerApplyToJob
	@username varchar(20),
	@jobtitle varchar(20),
	@dep int,
	@company varchar(20)
	AS
	Begin
		if(Exists (Select* From Users u,Jobs j Where u.username = @username AND j.title = @jobtitle AND j.department = @dep AND j.company = @company AND u.years_of_experience >= j.min_experience))
			insert into Jobs_apply_Job_Seekers values (@jobtitle,@dep,@company,@username,null,null,null)
	End
	
	--EXEC SeekerApplyToJob 'sami.eladl','Trainer',3,'main@shell.us'
	
	--2
	go
	create PROC ViewJobQuestions
	@job varchar(20),
	@dep int,
	@company varchar(20)
	AS
	Begin
		if(exists(select * from Jobs i where i.company = @company AND i.department = @dep AND i.title = @job))
			begin
				Select q.question
				From Questions q inner join Jobs_has_Questions jq
				On job = @job AND department = @dep AND company = @company And q.number = jq.question
			end
		else
			print('404 Not Found')
	End
	
	--EXEC ViewJobQuestions 'Manpower planning',2,'philips@philipsn.v'
	--EXEC ViewJobQuestions 'asdadw',2,'philips@philipsn.v'
	
	
	
	--3
	go
	CREATE PROC SaveScore
	@username varchar(20),
	@score int,
	@job varchar(20),
	@dep int,
	@company varchar(20)
	AS
	Begin
		Update Jobs_apply_Job_Seekers
		Set score = @score
		Where job = @job AND department = @dep AND company = @company AND job_seeker = @username
	End
	
	--EXEC SaveScore 'applicant.elhusseiny' ,0, 'Trainer', 3 , 'main@shell.us'
	
	--4
	go
	create PROC StatusOfAllJobs
	@username varchar(20)
	
	AS
	DECLARE @status Table( Job varchar(20) , Company varchar(50) , Department INT , Score INT ,HR_Response BIT, Manager_Response BIT, [Status] varchar(20))
	
	Begin
	
		insert into @status ( Job, Company, Department, Score, HR_Response, Manager_Response)
			Select j.job, j.company, j.department, j.score, j.hr_response, j.manager_response
			From Jobs_apply_Job_Seekers j
			Where j.job_seeker = @username
	
		update @status
		set [Status] = 'Accepted'
		where Manager_Response = 1
	
		update @status
		set [Status] = 'Rejected'
		where HR_Response = 0
		
		update @status
		set [Status] = 'In process'
		where HR_Response is Null AND Manager_Response is Null
	
		Select Job, Company, Department, Score, [Status]
		From @status
	
	End
	
	
	--EXEC StatusOfAllJobs 'sami.eladl'
	--EXEC StatusOfAllJobs 'applicant.elhusseiny'
	
	
	
	--5
	go
	create PROC ChooseJob
	@username varchar(20),
	@title varchar(20),
	@dep int,
	@company varchar(20),
	@dayoff varchar(20)
	AS
	Begin
		DECLARE @salary INT
		Select @salary = salary
		from Jobs j
		where j.title = @title AND j.department = @dep AND j.company = @company
	
		if(Exists(Select * From Jobs_apply_Job_Seekers j Where j.job = @title AND j.job_seeker = @username AND
			j.department = @dep AND j.company = @company AND j.manager_response = 1))
			begin
				insert into Staff_Members values (@username,30,'Friday and' + @dayoff, @salary ,@title, @dep, @company)
				insert into Jobs_Users values (@username, @title)
				update Jobs
				Set no_of_vacancies = no_of_vacancies-1
				where title = @title AND department = @dep AND company = @company
			end
		else
			print('NO!')
	End
	
	--EXEC ChooseJob 'sami.eladl', 'Trainer' , 3 , 'main@shell.us' , 'Saturday'
	--EXEC ChooseJob 'samadl', 'Ter' , 3 , 'main@shell.us' , 'Saturday'
	
	
	
	
	--6
	go
	create PROC DeleteApplication
	@username varchar(20),
	@title varchar(20),
	@dep int,
	@company varchar(20)
	AS
	Begin
		if(exists(Select * from Jobs_apply_Job_Seekers j where j.job_seeker = @username AND j.job = @title AND j.department = @dep AND j.company = @company AND j.manager_response is null))
			begin
			Delete From Jobs_apply_Job_Seekers Where job = @title AND job_seeker = @username AND department = @dep AND company = @company
			 end
		else
		print ('Cannot delete this application or it doesnt exist')
	End
	
	--EXEC DeleteApplication 'sami.eladl' , 'Trainer' ,3, 'main@shell.us'
	
	--delete from Jobs_apply_Job_Seekers where job_seeker = 'sami.eladl' AND job = 'Trainer'


------------------------------------------------------------------------------------------------------------
---------------------------------------------------------Youssef------------------------------------
--------------------------------------------------------------------------------------------------------------------------

go

-------1
create proc StaffMemberCheckIn 
@myusername varchar(20)
as 
begin
if( exists(
Select *
From Staff_Members s
where s.username = @myusername and datename(dw,getdate()) not like '%' + s.day_off + '%') )

begin
if( not exists (Select *
From Staff_Members s, Attendance_Records ar
where s.username = @myusername and ar.staff = s.username and ar.[date] = date

))
insert into Attendance_Records values (GETDATE(), @myusername , CURRENT_TIMESTAMP, null)
else
print('cannot check in twice in the same day')
end
end


go

------------------------2
create proc StaffMemberCheckOut
@myusername varchar(20)
as 
begin
if( exists(
Select *
From Staff_Members s
where s.username = @myusername and datename(dw,getdate()) not like '%' + s.day_off + '%') )

begin
if( not exists (Select *
From Staff_Members s, Attendance_Records ar
where s.username = @myusername and ar.staff = s.username and ar.end_time is not null
))
begin
update Attendance_Records 
set end_time = CURRENT_TIMESTAMP
where staff = @myusername and end_time is null and [date] =  date
end
else print (' You already checked out today ')
end
end


go

---------------------3
create proc ViewAttendanceStaffMembers
@myusername varchar(20),
@dateFrom datetime,
@dateTo datetime

as
begin


if(exists(
Select *
From Staff_Members s
where s.username = @myusername  ))
begin
select ar.staff, ar.start_time as 'check in time' , ar.end_time as 'check out time', (DATEDIFF(MINUTE,ar.start_time, ar.end_time))/60 as 'Duration' , (j.working_hours - (DATEDIFF(MINUTE,ar.start_time, ar.end_time))/60) as 'Missing hours'
from Attendance_Records ar, Jobs j, Staff_Members s
where ar.[date] >= @dateFrom and ar.[date] <= @dateTo and ar.staff = s.username
and s.job = j.title and s.department = j.department and s.company = j.company 
and s.username = @myusername
end
end



go

--------------------------4
create proc ApplyForRequests   
@myusername varchar(20),
@requesttype varchar(20) ,
@startdate datetime,
@enddate datetime,
@replacement varchar(20),
@leavetype varchar(20),
@destination varchar(50),
@purpose varchar(100)
as
begin
if( exists(
Select *
From Staff_Members s1, Staff_Members s2
where s1.username = @myusername and s2.username = @replacement and s1.username <> s2.username and s1.job = s2.job ))
 
begin
if(@requesttype Like '%trip%' and ((@destination is null) or (@purpose is null)))
print('destination/purpose cannot be left null')
else
if(@requesttype Like '%leave%' and @leavetype is null)
print ('leave type cannot be left null')
else 
if (exists( select * from Staff_Members s where  s.annual_leaves <  (DATEDIFF(DD,@startdate, @enddate))  and s.username = @myusername   ))
print ('request days more than ur annual leaves')

else
begin
if( exists(
Select * 
From Requests r, Staff_Members s
where s.username = r.applicant and (   (r.[start_date] < @startdate and r.end_date > @enddate ) or 
( @enddate between r.[start_date] and r.end_date ) or ( @startdate between r.[start_date] and r.end_date  )  )       ))
print('request overlapping another request')
else
 begin
 if(exists (select *
 from Managers m , Staff_Members s
 where m.username = @myusername  and s.username = m.username))
begin
insert into Requests ([start_date], applicant , end_date, request_date, hr_employee, hr_response, manager,
manager_response, manager_reason) values ( @startdate, @myusername , @enddate, GETDATE(),  null, 1, null,
1, null)
end

else  if(exists (select * from Hr_Employees hr , Staff_Members s
 where hr.username = @myusername  and s.username = hr.username ))
begin
insert into Requests ([start_date], applicant , end_date, request_date, hr_employee, hr_response, manager,
manager_response, manager_reason) values ( @startdate, @myusername , @enddate, GETDATE(),  null, 1, null,
null, null)
end

else 
begin
insert into Requests([start_date], applicant , end_date, request_date, hr_employee, hr_response, manager,
manager_response, manager_reason) values
(@startdate, @myusername, @enddate, GETDATE(), null, null, null,null,null)
end

if(@requesttype LIKE '%leave%')
insert into Leave_Requests values (@startdate, @myusername, @leavetype)
else if(@requesttype like '%trip%')
insert into Business_Trip_Requests values(@startdate, @myusername, @destination, @purpose)
end
end
end
else print('replacement not with the same job')
end



go

---------------------------5
create proc ViewRequestStatus
@myusername varchar(20),
@startdate datetime

as
begin
if(exists( select * from Staff_Members s where s.username = @myusername))


Select  r.hr_employee, r.hr_response, r.manager, r.manager_response, r.manager_reason
from Requests r
where r.start_date = @startdate and r.applicant = @myusername
end




go




--------------------------6
create proc DeleteRequests
@myusername varchar(20),
@startdate datetime

as
begin
if( exists(
Select * from Staff_Members s where s.username = @myusername ))
begin
delete from Requests
where Requests.[start_date] = @startdate and Requests.applicant = @myusername 
and Requests.hr_response is null and Requests.manager_response is null
end
end


go



---------------------7
create proc SendEmail
@myusername varchar(20),
@recipient varchar(20),
@subject varchar(50),
@body varchar(1000)

as
begin
if(exists(
Select *
From Staff_Members s1, Staff_Members s2
where s1.username = @myusername and s2.username = @recipient and s1.company = s2.company)
)

begin
insert into Emails ([subject],[date],body) values (@subject, GETDATE(), @body)
insert into Staff_Members_send_Emails_Staff_Members(email_number, recipient, sender)
values(IDENT_CURRENT('dbo.Emails'), @recipient, @myusername)
end
end





go





-------------------------8
create proc ViewEmails
@myusername varchar(20)

as
begin
if(exists( Select * from Staff_Members s where s.username = @myusername))
Select *
From Staff_Members_send_Emails_Staff_Members sm, Emails e
where e.serial_number = sm.email_number and sm.recipient = @myusername
end




go



----------------------9
create proc ReplyToEmail
@myusername varchar(20),
@recipient varchar(20),
@subject varchar(50),
@body varchar(1000)
as
begin
if(exists(
Select *
From Staff_Members s1, Staff_Members s2
where s1.username = @myusername and s2.username = @recipient and s1.company = s2.company and s1.username<>s2.username)
)
begin

if(exists(
Select*
From Staff_Members_send_Emails_Staff_Members sm1, Staff_Members_send_Emails_Staff_Members sm2
where sm1.recipient = @myusername and sm2.sender = @recipient and sm1.email_number=sm2.email_number  )
)begin
insert into Emails (subject,date,body) values (@subject, GETDATE(), @body)
insert into Staff_Members_send_Emails_Staff_Members (email_number, recipient, sender)
values(IDENT_CURRENT('dbo.Emails'),@recipient, @myusername)
end
else print('no emails to reply to')
end
else print('not same company')
end



go






--------------------------------------10
create proc ViewAnnouncememtsStaffMembers
@myusername varchar(20)
as
begin
if( exists
(Select *
From Staff_Members s 
where s.username = @myusername )
) begin

Select a.[date], a.title, a.hr_employee, a.[type], a.[description]
From Announcements a, staff_Members s1, staff_Members s2
where a.hr_employee = s1.username 
and s2.username = @myusername and s1.company = s2.company and a.[date] >= GETDATE() - 20

end 
end




go

































---------------------------------------------------------------------------------------------------------
-----------------------------------KHAYAT-------------------------
--------------------------------------------------------------------------------------





go

--------------------1



create proc AddJob
@username varchar (20),
@title VARCHAR (20) ,
@department INT ,
@company  VARCHAR (50),
@short_description VARCHAR (50),
@detailed_description VARCHAR (2000) ,
@min_experience INT ,
@salary DECIMAL (10, 2) ,
@deadline  DATETIME,
@no_of_vacancies INT,
@working_hours INT,
@questions varchar(50),
@answer bit

as 
declare @dep int
begin
select @dep =   department from Staff_Members where username=@username

if(exists( select hr.* from Hr_Employees hr where hr.username = @username) ) 
begin
insert into Jobs values (@title,@department,@company,@short_description,@detailed_description,@min_experience,@salary,@deadline,@no_of_vacancies,@working_hours)
insert into Questions( [question], [answer] ) values (@questions ,@answer)
insert into Jobs_has_Questions  values (@title ,@dep,@company ,@questions) 
end 
else print('acess denied')
end









-----------------2
go
create proc ViewJob
@username varchar(20)
as 
begin
if(exists( select hr.* from Hr_Employees hr where hr.username = @username) ) 
begin

select j.*
from Jobs j 
inner join Staff_Members s on s.department= j.department
where s.username= @username and j.company =s.company
end
else print('acess denied')
end
go


-----------------3
create proc EditJob
@username varchar(20),
@jobtitle varchar(20),
@department int,
@company varchar(20),
@short varchar(50),
@detailed varchar(2000),
@minexp int,
@salary decimal(10,2),
@deadline datetime,
@novacancies int,
@workinghrs int
as 
begin
if(exists (select * from HR_Employees where username = @username)
 and exists( select * from Jobs j 
		inner join Staff_Members s on s.company = j.company
		where j.title=@jobtitle and s.username = @username and s.department= j.department))

update Jobs
set short_description=@short ,detailed_description=@detailed 
,min_experience=@minexp, salary=@salary , deadline =@deadline , no_of_vacancies=@novacancies , working_hours=@workinghrs
where title = @jobtitle and department =@department and company =@company
else
print('wrong')
end
go


-------------------------4
create proc ViewApplications
@username varchar(20),
@job varchar(20)

as
begin
if(exists( select hr.* from Hr_Employees hr where hr.username = @username) ) 
begin


select j.job_seeker , j.score s, j.job from Jobs_apply_Job_Seekers j
inner join  Staff_Members s2 on s2.department= j.department and s2.company =j.company
where s2.username=@username and j.job=@job
end
else print('acess denied')
end


go

-----------------------------------5
create proc AcceptRejectApplications

 @username varchar(20),
 @applicant varchar(20),
 @hrresponse bit,
 @jobtitle varchar(20),
 @jobcompany varchar(20),
 @jobdepartment int

 as
 begin

if(exists(select * from Staff_Members s inner join Jobs_apply_Job_Seekers j on s.department =j.department and s.company=j.company inner join Hr_Employees hr on hr.username=@username where j.department=@jobdepartment and j.company=@jobcompany and j.job=@jobtitle and j.job_seeker=@applicant ))
begin
update Jobs_apply_Job_Seekers
set hr_response=@hrresponse
where job =@jobtitle and department=@jobdepartment and company=@jobcompany and job_seeker=@applicant

end
else print('acess denied')
end


go

-----------------------------6

create  proc PostAnnouncements 
 @username varchar(20),
 @title varchar(20),
 @type varchar(20),
 @description varchar(200)
 as
begin
if(exists( select hr.* from Hr_Employees hr where hr.username = @username) )
begin
insert into Announcements values (
CURRENT_TIMESTAMP ,
 @title ,
 @username ,
 @type ,
 @description 
 )
 
end
else print('acess denied')
end




go

--------------------7
create proc ViewRequestsHR
@username varchar(20)
as
begin 
if(exists( select hr.* from Hr_Employees hr where hr.username = @username) )
begin
select r.*  from Requests r 
inner join  Staff_Members s on r.applicant=s.username inner join Staff_Members s2 on s2.department=s.department
where s2.username=@username and r.manager is not null and r.manager_response is not null and  r.hr_response is null and s.company=s2.company
end
else print('acess denied')
end 


go
------------------------8------------

create proc accregRequestsHR
@hremployee varchar(20),
@response bit,
@staffmember varchar(20)

AS
if( exists (select * from Hr_Employees where username= @hremployee)
and exists (select * from Staff_Members where username= @staffmember)
and exists(select * from Staff_Members s1 
				inner join Staff_Members s2 on s1.company = s2.company 
				where s1.department = s2.department and s1.username = @hremployee and s2.username = @staffmember  ))
begin
	if(exists (select * from Requests where applicant =@staffmember and manager_response =1))
	begin
		if( not exists (select * from Hr_Employees where username=@staffmember))
		if(@response =1)
		begin 
		
			if(exists (select * from Leave_Requests where type='Annual' and applicant=@staffmember))
			begin

				declare @dayoff varchar(50)
				select @dayoff =  day_off   from Staff_Members where username=@staffmember
				declare @test int
				select @test =  annual_leaves  from Staff_Members where username=@staffmember
				declare @start datetime
				select @start =  start_date  from Requests where applicant=@staffmember
				declare @end datetime
				select @end =  end_date from Requests where applicant=@staffmember

				while(@start <> @end)
				begin 
					if(CHARINDEX(DATENAME(dw,@start),@dayoff)=0 )
					begin
				  	set @test = @test-1
					end
					set @start = DATEADD(d,1,@start) 
				end

				update Requests
				set hr_response =1 , hr_employee =@hremployee
				where applicant =@staffmember
				update Staff_Members
				set annual_leaves=@test
				where username=@staffmember

			end

			else
			update Requests
			set hr_response =1 , hr_employee =@hremployee
			where applicant =@staffmember

		end
		
		else
			update Requests
			set hr_response =0 , hr_employee =@hremployee
			where applicant =@staffmember

		else----------------------------------

		begin 
		
			if(exists (select * from Leave_Requests where type='Annual' and applicant=@staffmember))
			begin

				declare @dayof varchar(50)
				select @dayof =  day_off   from Staff_Members where username=@staffmember
				declare @testt int
				select @testt =  annual_leaves  from Staff_Members where username=@staffmember
				declare @startt datetime
				select @startt =  start_date  from Requests where applicant=@staffmember
				declare @endd datetime
				select @endd =  end_date from Requests where applicant=@staffmember

				while(@startt <> @endd)
				begin 
					if(CHARINDEX(DATENAME(dw,@startt),@dayof)=0 )
					begin
				  	set @testt = @testt-1
					end
					set @startt = DATEADD(d,1,@startt) 
				end
				update Staff_Members
				set annual_leaves=@testt
				where username=@staffmember

			end

			print('approved by HR manager')

		end
	
		---------------------------------
	end
	else
	print('the request is rejected by the MANAGER no change will happen  or the applicant is not in the same department')


end
else
print('wrong')
--------------------------
go


---------------------------9

create proc ViewAttendanceHR
@myusername varchar(20),
@dateFrom datetime,
@dateTo datetime

as

begin
select ar.staff, ar.start_time as 'check in time' , ar.end_time as 'check out time', (DATEDIFF(MINUTE,ar.start_time, ar.end_time))/60 as Duration , (j.working_hours - (DATEDIFF(MINUTE,ar.start_time, ar.end_time))/60) as 'Missing hours'
from Attendance_Records ar, Jobs j, Staff_Members s, Staff_Members s2
where ar.[date] >= @dateFrom and ar.[date] <= @dateTo and ar.staff = s2.username
and s2.job = j.title and s2.department = j.department and s2.company = j.company 
and s.username = @myusername and s2.department = s.department  and s.company =s2.company
end




go


---------------------------------




--HR_Employees

--10

go

CREATE PROC ViewAttendancePerYear
@employee varchar(20),
@year INT

AS
	DECLARE @result Table ( [Month] varchar(30) , Total_Hours INT)
	insert into @result values ( 'January' , 0)
	insert into @result values ( 'February' , 0)
	insert into @result values ( 'March' , 0)
	insert into @result values ( 'April' , 0)
	insert into @result values ( 'May' , 0)
	insert into @result values ( 'June' , 0)
	insert into @result values ( 'July' , 0)
	insert into @result values ( 'August' , 0)
	insert into @result values ( 'September' , 0)
	insert into @result values ( 'October' , 0)
	insert into @result values ( 'November' , 0)
	insert into @result values ( 'December' , 0)
	DECLARE @total INT
	DECLARE @att2 Table ([date] datetime , staff varchar(20), start_time datetime, end_time datetime , [hours] AS DATEDIFF(HOUR,start_time,end_time))
Begin

	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 1

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'January'

------------------------
	Delete From @att2
------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 2

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'February'

------------------------
	Delete From @att2
------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 3

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'March'

	------------------------
	Delete From @att2
	------------------------

	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 4

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'April'
	------------------------------
	Delete From @att2
	------------------------------

	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 5

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'May'
	------------------------------
	Delete From @att2
	------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 6

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'June'
	-------------------------------
	Delete From @att2
	-------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 7

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'July'
	------------------------------
	Delete From @att2
	------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 8

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'August'
	---------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 9

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'September'
	---------------------------------
	Delete From @att2
	---------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 10

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'October'
	---------------------------------
	Delete From @att2
	---------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 11

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'November'
	---------------------------------
	Delete From @att2
	---------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 12

	Select @total = Sum([hours])
	From @att2
	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'December'


	-------------
	select *
	From @result


End


--EXEC ViewAttendancePerYear 'ahmed.hisham', 2017

--Insert into Attendance_Records values ('5/5/2017', 'ahmed.hisham', '7:00:00' , '15:00:00')
--Insert into Attendance_Records values ('1/1/2017', 'ahmed.hisham', '7:00:00' , '15:00:00')
--Insert into Attendance_Records values ('1/3/2017', 'ahmed.hisham', '7:00:00' , '16:00:00')
--Insert into Attendance_Records values ('1/3/2017', 'ahmed.akram', '7:00:00' , '17:00:00')
--Insert into Attendance_Records values ('1/4/2017', 'ahmed.akram', '7:00:00' , '18:00:00')

/*
Insert into Attendance_Records values ('5/5/2017', 'mohamed.emam', '7:00:00' , '15:00:00')
Insert into Attendance_Records values ('1/1/2017', 'mohamed.emam', '7:00:00' , '15:00:00')
Insert into Attendance_Records values ('1/3/2017', 'mohamed.emam', '7:00:00' , '16:00:00')
Insert into Attendance_Records values ('1/3/2017', 'adel.emam', '7:00:00' , '17:00:00')
Insert into Attendance_Records values ('1/4/2017', 'adel.emam', '7:00:00' , '18:00:00')

Insert into Attendance_Records values ('5/5/2017', 'wa7ed.keda', '7:00:00' , '10:00:00')
Insert into Attendance_Records values ('1/1/2017', 'wa7ed.keda', '7:00:00' , '15:00:00')
Insert into Attendance_Records values ('1/3/2017', 'wa7ed.keda', '7:00:00' , '16:00:00')
Insert into Attendance_Records values ('1/3/2017', 'wa7ed.tany', '7:00:00' , '10:00:00')
Insert into Attendance_Records values ('1/4/2017', 'wa7ed.tany', '7:00:00' , '10:00:00')


update Attendance_Records
Set end_time = '15:00:00'
where date = '1/1/2017' AND staff = 'mohamed.emam'
*/
------------------------------


go
-- helper for 11




CREATE PROC ViewAttendancePerYearIncName
@employee varchar(20),
@year INT

AS
	DECLARE @result Table ( [Month] varchar(30) ,username varchar(20), Total_Hours INT)
	insert into @result values ( 'January' ,@employee, 0)
	insert into @result values ( 'February',@employee , 0)
	insert into @result values ( 'March',@employee , 0)
	insert into @result values ( 'April',@employee , 0)
	insert into @result values ( 'May',@employee , 0)
	insert into @result values ( 'June',@employee , 0)
	insert into @result values ( 'July',@employee , 0)
	insert into @result values ( 'August',@employee , 0)
	insert into @result values ( 'September',@employee , 0)
	insert into @result values ( 'October',@employee , 0)
	insert into @result values ( 'November',@employee , 0)
	insert into @result values ( 'December',@employee , 0)
	DECLARE @total INT
	DECLARE @att2 Table ([date] datetime , staff varchar(20), start_time datetime, end_time datetime , [hours] AS DATEDIFF(HOUR,start_time,end_time))
Begin

	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 1

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'January'

------------------------
	Delete From @att2
------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 2

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'February'

------------------------
	Delete From @att2
------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 3

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'March'

	------------------------
	Delete From @att2
	------------------------

	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 4

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'April'
	------------------------------
	Delete From @att2
	------------------------------

	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 5

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'May'
	------------------------------
	Delete From @att2
	------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 6

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'June'
	-------------------------------
	Delete From @att2
	-------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 7

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'July'
	------------------------------
	Delete From @att2
	------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 8

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'August'
	---------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 9

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'September'
	---------------------------------
	Delete From @att2
	---------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 10

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'October'
	---------------------------------
	Delete From @att2
	---------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 11

	Select @total = Sum([hours])
	From @att2

	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'November'
	---------------------------------
	Delete From @att2
	---------------------------------
	Insert Into @att2 (date, staff, start_time, end_time)
	select *
	From Attendance_Records r
	Where r.staff = @employee AND year(r.date) = @year AND  month(r.date) = 12

	Select @total = Sum([hours])
	From @att2
	if(@total is not null)
		update @result
		set Total_Hours = @total
		where [Month] Like 'December'

	-----------------
	update @result
	set username = @employee
	-------------
	select *
	From @result


End



--EXEC ViewAttendancePerYearIncName 'ahmed.hisham' ,2017


-----------------------------------

--11
go


CREATE PROC HighAchievers
@month varchar(30),
@year INT

AS

DECLARE @firstn varchar(20)
DECLARE @secondn varchar(20)
DECLARE @thirdn varchar(20)
DECLARE @finaljumbo Table ([month] varchar(20), [Name] varchar(20), total INT)
DECLARE @empcopy Table ([username] varchar(20))
DECLARE @counter INT
DECLARE @tmpusername varchar(20)

Begin
	Select @counter = Count(*) From Regular_Employees

	Insert Into @empcopy
	Select username From Regular_Employees

		While(@counter > 0)
			begin
				Select Top 1 @tmpusername = username From @empcopy
				Insert Into @finaljumbo
				EXEC ViewAttendancePerYearIncName @tmpusername,@year

				Set @counter = @counter - 1
				Delete From @empcopy where username = @tmpusername
			end
		
		
		Select Top 3 *
		From @finaljumbo AS X
		where not exists(Select * from Tasks t Where t.regular_employee = X.[Name] AND t.status <> 'Fixed') AND X.month Like @month
		order by total	DESC
End

--EXEC HighAchievers 'January' , 2017

--EXEC ViewAttendancePerYearIncName 'adel.emam', 2017

------------------------------------------






















































------------------------------------------------------------------------------------------------------------
----------------------------el regular---------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------











go 





--1
go

CREATE PROC ViewMyProjectsRegularEmployee
@username varchar(20)
As
Begin
	if(exists( Select * from Regular_Employees r where r.username = @username ))
		begin
			Select p.*
			From Managers_assign_Project_Regular_Employees mp, Projects p
			where mp.regular_employee = @username and p.manager = mp.manager and p.[name] = mp.project_name
		end
	else print('404 Regular Employee Not Found')
End

--insert into Projects values ('Update Database','main@shell.us','2/5/2017','12/12/2017','youssef.yasser')
--insert into Managers_assign_Project_Regular_Employees values ('Update Database', 'main@shell.us' , 'adel.emam' , 'youssef.yasser')
--insert into Staff_Members values('adel.emam',24,'doola@shell.us','Friday and Sunday',32000,'Trainer',1,'main@shell.us')
--insert into Regular_Employees values ('adel.emam')

--EXEC ViewMyProjectsRegularEmployee 'adel.emam'

go

--2

CREATE PROC ViewTasksRegularEmployee
@username varchar(20),
@project varchar(40)

As
Begin
	if(exists( Select * From Regular_Employees r Where r.username = @username ))
		begin
			if(exists( Select * From Projects p Where p.[name] = @project) AND exists(Select * From Managers_assign_Project_Regular_Employees z Where z.regular_employee = @username AND z.project_name = @project ))
				begin

					select t.*
					from Tasks t
					where t.project = @project
				
				end
			else print('project doesnt exist')
		end
	else print('you are not a regular employee, ko5 ya baba')
End


--Insert into Tasks values ('task one','Update Database','main@shell.us', '10/11/2017' , 'Open' , 'update table announcements', 'adel.emam' , 'youssef.yasser')
--EXEC ViewTasksRegularEmployee 'adel.emam' , 'Update Database'





go

--3

create proc FinalizingTask
@username varchar(20),
@task varchar(40),
@company varchar(50),
@project  varchar(40)

As
Begin
	if(exists( Select * From Regular_Employees r Where r.username = @username))
		begin
			if( exists( Select * From Tasks t Where t.[name] = @task AND t.company = @company AND t.project = @project AND t.regular_employee = @username AND t.[status] <> 'closed' 
				AND t.deadline > GETDATE())) 
				begin
					update Tasks
					set [status] = 'Fixed'
					where regular_employee = @username AND [name] = @task AND company = @company AND project = @project
				end
			else print('This task does not exist or one of the entries is wrong')
		end
	else print ('You are not authorized to do this')
End

/*update Tasks
set deadline = '12/11/2017'
where name = 'task one' */

/*update Tasks
set status = 'Open'
where name = 'task one' */

--EXEC FinalizingTask 'adel.emam', 'task one', 'main@shell.us' , 'Update Database'
--EXEC FinalizingTask 'ahmed.hisham', 'task one', 'main@shell.us' , 'Update Database'




go


--4


create proc WorkOnTaskAgain
@username varchar(20),
@taskname varchar(40),
@company varchar (50),
@project varchar (40)


AS
Begin
	if(exists( select * from Regular_Employees r where r.username = @username))
	begin
		if( exists( select * from Tasks t where t.name = @taskname AND t.project = @project AND t.company = @company))
		begin
			update Tasks
			set status = 'Assigned'
			where name = @taskname AND project = @project AND company = @company AND deadline > GETDATE()

		end
	end
End















--------------------------------------------------------------------------------------------------------------
-------------------------------------AKRAM-----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------





























----------1---------------------------


go


go
create proc spViewRequests
@username varchar(20)
AS
if( exists ( select * from Managers m where m.username = @username) )
begin
if(exists (select * from Managers m where m.username = @username AND m.[type] = 'HR'))
begin
select r.*
from Requests r 
inner join Staff_Members s1 on s1.username = @username
inner join Staff_Members s2 on  s2.username =r.applicant 
where s1.department = s2.department  and s1.company = s2.company 
end
else
begin
select r.*
from Requests r 
inner join Staff_Members s1 on s1.username = @username
inner join Staff_Members s2 on r.applicant = s2.username
where s1.department = s2.department  and s1.company = s2.company and not exists( select * from Hr_Employees h where h.username =s2.username)
end
end
else
print('sorry , you are not supposed to view this' )







--------------------------2------------------------------
go

create proc spAccRejRequests 
@manager varchar(20),
@approval bit,
@reason varchar(60),
@applicant varchar(60)
AS
if( exists ( select * from Managers m where m.username = @manager) 
and exists (select * from Staff_Members s1
				inner join Staff_Members s2 on s1.company =s2.company
				where s1.username =@manager and s2.username =@applicant and s1.department = s2.department))
begin

if( @approval =1  )
update  Requests 
set manager_response  = 1 , manager =@manager 
where applicant = @applicant 
else

begin
update Requests 
set manager_response =0 , manager_reason= @reason , manager=@manager
where applicant = @applicant 
end

end

else

print('sorry, you are not supposed to view this' )



--execute spAccRejRequests 'youssef.yasser' , '1' , null , 'fadl.meto'
--execute spAccRejRequests 'yousra.ellouzy ' , 0 , 'no time for execuses' , 'ahmed.medany'





-------------------3-----------------------

go


create proc spViewAppManager
@manager varchar(20),
@job varchar(20)

AS if( exists ( select * from Managers m where m.username = @manager) 
and exists (select * from Jobs where title=@job))

select distinct s.username, s.personal_email, s.birth_date ,s.years_of_experience, s.first_name , s.middle_name, s.last_name, s.age , j1.short_description, j1.detailed_description ,j1.min_experience, j1.no_of_vacancies, j1.salary,j1.deadline , j.score
from Users s 
	inner join Jobs_apply_Job_Seekers j on j.job_seeker=s.username 
	inner join Jobs j1 on j.job = j1.title
	inner join Staff_Members s1 on s1.company = j1.company
where j.job=@job  and s1.department = j.department and s1.company = j.company and s1.username =@manager and j.hr_response=1

else
print('wrong entries')




------------------4--------------------

go 

create proc spAccRejAppManager
@approval bit,
@applicant varchar(20), 
@manager varchar(20)

AS
if( exists ( select * from Managers m where m.username = @manager) )

if(@approval=1)
update Jobs_apply_Job_Seekers
set manager_response =1
where job_seeker=@applicant

else
update Jobs_apply_Job_Seekers
set manager_response = 0
where job_seeker = @applicant

else
print('wrong entries')

--execute spAccRejAppManager 1, 'Mohamed.Ashraf' , 'ahmed.ezz'
--execute spAccRejAppManager 1, 'sami.eladl' , 'youssef.yasser'










-----------------------------5-------------------
go
create proc CreateProject
@projectName varchar(40),
@companyMail varchar(50),
@start_date datetime,
@end_date datetime,
@managerName varchar(20)

AS
if(exists (select * from Managers where username = @managerName ) and  exists (select * from Companies c where c.email = @companyMail )  
																					 and exists (select * from Companies c
																					inner join Staff_Members s on s.company = c.email
																					where s.username = @managerName and s.company = @companyMail) )
insert into Projects values (@projectName ,  @companyMail , @start_date , @end_date , @managerName)

else 
print('there is an error in your entries, check the company mail and the manager name again ')


--execute CreateProject 'first project' , 'main@shell.us' , '5/5/2018' , '6/6/2018' , 'youssef.yasser' --department 1
--execute CreateProject 'second project' , 'main@shell.us' , '5/5/2018' , '6/6/2018' , 'yousra.ellouzy' -- department 2 , same time project 1
--execute CreateProject 'third project' , 'main@shell.us' , '6/1/2018' , '7/6/2018' , 'tarek.elwakil'  -- departemnt 2 , same time

--execute CreateProject 'first project' , 'philips@philipsn.v' , '5/5/2018' , '6/6/2018' , 'Ali.kamel'  --department 3
--execute CreateProject 'second project' , 'philips@philipsn.v' , '7/5/2018' , '8/6/2018' , 'Karim.Kamal' --department 3 different time project 1

--execute CreateProject 'fourth project' , 'main@shell.us' , '5/5/2017' , '6/6/2017' , 'yousra.ellouzy' --department 2




---------------------6-----------------------

go





create  proc spAssignEmployeesToProjects
@projectName varchar(40),
@companyMail varchar(50),
@regularEmployee varchar(20),
@manager varchar(20) 

AS
if(exists (select * from Managers where username = @manager )    --manager exist
and exists (select * from Regular_Employees where username = @regularEmployee)   --regular employee exist
and exists  (select * from Staff_Members s1                            -- regular and manager same department 
	inner join Staff_Members s2 on s1.company =s2.company
    where s1.username= @manager and s2.username = @regularEmployee
	and s1.company= s2.company and s1.department = s2.department and s1.company = @companyMail)

		and exists( select * from Projects p 
		            inner join Staff_Members s1 on  p.company = s1.company
					inner join Staff_Members s2 on s2.company = s1.company
					where s2.username = @manager and p.manager =s1.username and s1.department = s2.department )

					and (not exists (select * from projects p
					              inner join Managers_assign_Project_Regular_Employees m on m.regular_employee=@regularEmployee
								      where p.end_date > CURRENT_TIMESTAMP) )
									  
					)
insert into Managers_assign_Project_Regular_Employees values (@projectName , @companyMail , @regularEmployee , @manager)

else
 print('one of your entries is wrong')


  --execute spAssignEmployeesToProjects 'second project' , 'main@shell.us' , 'ahmed.medany' , 'yousra.ellouzy'
 --execute spAssignEmployeesToProjects 'first project' , 'main@shell.us' , 'elset.korya' , 'youssef.yasser'
 ------------------7------------------------

go

create proc spRemoveEmployeeFromProject
@manager varchar(20),
@projectName varchar(20)
AS
if(exists (select * from Managers where username = @manager ) )

delete from  Managers_assign_Project_Regular_Employees where regular_employee in  (select  regular_employee from Managers_assign_Project_Regular_Employees
								                                                           where project_name=@projectName
                                                                                              except (select regular_employee from Tasks where
																							 project=  @projectName ))

else
print('wrong entries')


-----------------8-----------------
go
 create proc spDefineTask

 @Taskname varchar(40),
 @projectName varchar(40),
 @company varchar(50),
 @deadline datetime ,
 @description      VARCHAR (5000) , 
 @manager          VARCHAR (20) 

 AS

if(exists (select * from Managers where username = @manager ) --manager exist

	 and exists (select * from Projects p where p.name =@projectName and p.end_date >= @deadline ) -- check if projects exist 

     and exists  (select * from Staff_Members s1                           
	                inner join Projects p on p.manager = s1.username
					inner join Staff_Members s2 on s1.company = s2.company
					where s2.username=@manager and  s1.department =s2.department and p.name = @projectName ))

		--  and exists (select * from Managers_assign_Project_Regular_Employees where regular_employee=@regular_employee and project_name=@projectName and company=@company)
	      

	insert into Tasks values (@Taskname , @projectName , @company, @deadline , 'open', @description, null, @manager);
	 
else
	 print('wrong entries')



go 


--execute spDefineTask 'second task' , 'first project' , 'main@shell.us' , '5/6/2018' , 'explore oil' , 'youssef.yasser'


-------------------------------9---------------------------

go

create proc spAssignRegularEmployeeToTask

@managername varchar(20),
@taskname varchar(40),
@regular_employee varchar(20),
@projectName varchar(40)

AS

 if (exists (select * from Managers where username = @managername )
       and (exists (select * from Managers_assign_Project_Regular_Employees m where m.regular_employee = @regular_employee))
          and (exists(select * from Tasks t
	              inner join Projects p on t.project = p.name
				  where  p.name = @projectName and  t.name= @taskname and t.manager = @managername and regular_employee is null)))

update Tasks 
set regular_employee = @regular_employee
where manager =@managername and name =@taskname and project =@projectName and regular_employee is null

else
print(' wrong entries')

--execute spAssignRegularEmployeeToTask 'youssef.yasser', 'second task' , 'fadl.meto' , 'first project' 

---------------------------10----------------------------

go 
create proc spChangeRegularEmployee
@current varchar(20),
@replacer varchar(20),
@taskname varchar(40),
@manager varchar(20)
AS
if( exists (select * from Managers where username = @manager )
and exists (select * from Tasks where name= @taskname and regular_employee=@current and manager =@manager)
  and exists (select * from Staff_Members s1
			inner join Staff_Members s2 on s2.company =s1.company
			where s1.department = s2.department and s1.username =@current and s2.username =@replacer))

update Tasks 
set regular_employee = @replacer
where regular_employee = @current

else
print('wrong entries')


--execute spChangeRegularEmployee 'fadl.meto' , 'elset.korya' , 'second task' , 'youssef.yasser'


-----------11--------

go
create proc spViewTasks
@projectname varchar(40),
@status varchar(20)
AS

if( exists (select * from Projects where name=@projectname ))
select * from Tasks where status = @status and project = @projectname

else
print('wrong entries')


--execute spViewTasks 'first project' , 'open' 


-----------------12------------------


go
create proc spCheckFinishedTask
@manager varchar(20),
@acceptance bit,
@deadline datetime,
@projectname varchar(40),
@taskname varchar(40)
AS
declare @regular varchar(20)
select @regular = regular_employee from Tasks t where t.name=@taskname
if( exists (select * from Managers where username = @manager )
 and exists(select *from projects p
				inner join Tasks t on t.project =p.name 
				where t.name=@taskname and p.name = @projectname and t.manager =@manager and (t.status = 'fixed' or t.status = 'Fixed')))
begin
if(@acceptance =1)
update Tasks
set status = 'Closed'
where manager =@manager and name =@taskname

else
begin
execute spChangeRegularEmployee @regular , @regular , @taskname , @manager 
update Tasks
set status = 'Assigned'
where manager =@manager  and name =@taskname

update Tasks
set deadline = @deadline
where manager =@manager and name =@taskname
end
end
else
print('wrong entries')



--execute spCheckFinishedTask 'youssef.yasser' , 1 , '6/6/2018' , 'first project' , 'second task'
--execute spCheckFinishedTask 'yousra.ellouzy' , 0 , '6/6/2018' , 'second project' , 'second task'







go













