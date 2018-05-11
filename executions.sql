---------------------------------RIHAN-----------------------------
------1

	EXEC CompanyByName 'shell'
	EXEC CompanyByName ''
	

	EXEC CompanyByAddress ''
    EXEC CompanyByAddress 'Nasr City'


	EXEC CompanyByType 'multinational'
	EXEC CompanyByType 'international'
	EXEC CompanyByType 'jjjjjj'
	


	-------------2

		EXEC CompaniesList




		----------------3
			EXEC CompanyInfo 'main@shell.us'


			--------------4
				EXEC DepartmentInfo 'philips@philipsn.v', 1


				------------------5
		EXEC Register 'adel.emam', 'morganahmedmorgan' , 'doola@gmail.com', '4/5/1972', 8 , 'Adel' , 'Mohamed' , 'Emam'





		-------------------6
	EXEC JobsWithVacancies 'marketing'
	EXEC JobsWithVacancies 'wnkas'
	





	-------------------7
		EXEC CompaniesAvgSalaries






----------------------REGISTERED USER----------------------------------------

--------------------1	

	declare @userornot BIT
	DECLARE @type varchar(20)
	EXEC [Login] 'ahmed.hisham' ,'123456' , @userornot , @type


	---------------2
EXEC RegisteredUserInfo 'ahmed.his'
EXEC RegisteredUserInfo 'ahmed.hisham'


-------------------3
	EXEC EditRegisteredUserInfo 'ahmed.hisham',null,null, '7/30/1997',null, null, null, null



	---------------------------------------------
---------jobseekers----------------------


------------------1
	EXEC SeekerApplyToJob 'sami.eladl','Trainer',3,'main@shell.us'



	-------------------2
	EXEC ViewJobQuestions 'Trainer',2,'philips@philipsn.v'
	EXEC ViewJobQuestions 'asdadw',2,'philips@philipsn.v'
	
	---------------------3
		EXEC SaveScore 'applicant.elhusseiny' ,0, 'Trainer', 3 , 'main@shell.us'




		-------------------------4
		
	EXEC StatusOfAllJobs 'sami.eladl'
	EXEC StatusOfAllJobs 'applicant.elhusseiny'
	



	------------------------5
	EXEC ChooseJob 'sami.eladl', 'Trainer' , 3 , 'main@shell.us' , 'Saturday'
	EXEC ChooseJob 'samadl', 'Ter' , 3 , 'main@shell.us' , 'Saturday'

	
	


	------------------------6
		EXEC DeleteApplication 'sami.eladl' , 'Trainer' ,3, 'main@shell.us'



----------------------------------------JOE---------------------------------

--------1
exec StaffMemberCheckIn 'Ali.Kamel'
select * from Attendance_Records




-----------2
exec StaffMemberCheckOut 'Mona.Zaki'
exec StaffMemberCheckOut 'Ahmed.Helmy'
exec StaffMemberCheckOut 'Ali.Kamel'






----------3
exec ViewAttendanceStaffMembers 'Mona.Zaki', '1/1/2015' , '1/1/2018'





--------4
exec ApplyForRequests 'Ahmed.Amr' , 'leave request' , '1/1/2018' , '1/4/2018' , 'Seif.Amgad' , 'Annual' ,null,null



-------5
exec ViewRequestStatus 'Ahmed.Amr' , '1/1/2018'





----------6
exec DeleteRequests 'Ahmed.Amr' , '1/1/2018' -----------------msh shaghala 3shan lazem ne3mel staff member msh hr wala manager 3shan el hr response myb2ash b 1





------------7
exec SendEmail 'Seif.Amgad' , 'Abdulfatah.Elsisi' , 'mohema' , 'eh ya reyasa'
exec SendEmail 'Seif.Amgad' , 'Ahmed.Amr', 'bro' , 'miss you'




-----------8
exec ViewEmails 'Abdulfatah.Elsisi'
exec ViewEmails 'Ahmed.Amr'
exec ViewEmails 'Seif.Amgad'





-----------9
exec ReplyToEmail 'Ahmed.Amr' , 'Seif.Amgad' , 'yasta' , 'wa7eshny aktar'





---------------10
exec ViewAnnouncememtsStaffMembers'Seif.Amgad'















-------------------------------------------------------------------------------------------------
------------------------------------KHAYAT-------------------------------------
----------------------------------------------------------------

















----------------1



exec AddJob 'Ahmed.Helmy', 'Manpower planning' ,2, 'philips@philipsn.v.','good','long',6,200,'1/1/2009',7,8



---------------------2
exec ViewJob 'Ahmed.Helmy'






--------------------3
exec EditJob 'Ahmed.Helmy' , 'Manpower planning' , 2 , 'philips@philipsn.v' , ' Responsible for employees development' , 'To provide advice and guidance on all aspects of the Human Resources function relating to recruitment and selection matters and associated terms and conditions.' , 10 , 20000.00 , '1/1/2018' , 10 , 10





-------------------4
exec ViewApplications 'Ahmed.Helmy' , 'Manpower planning'




-------------------5
exec AcceptRejectApplications 'Ahmed.Helmy' , 'Mohamed.Ashraf' , 1, 'Manpower planning' , 'philips@philipsn.v'  , 2 




---------------------6
exec PostAnnouncements 'Ahmed.Helmy'  , 'ann 2' , 'trip2' , 'hanetgama3 3and el B b ezn ellah'



--------------------------7
exec ViewRequestsHR 'Ahmed.Amr'






-------------8
execute accregRequestsHR 'Nour.Elnady' , 1 ,'Ahmed.Amr'



---------------------9
exec ViewAttendanceHR 'Mona.Zaki' , '1/1/2015' , '1/1/2019'






----------------10




EXEC ViewAttendancePerYear 'adel.emam', 2017










---------------------11



EXEC HighAchievers 'January' , 2017




------------------------------------------------------------------
-----------------------------------------regular employees--------------------------
-----------------------------------------------------



----------------1


EXEC ViewMyProjectsRegularEmployee 'adel.emam'

------------------2

EXEC ViewTasksRegularEmployee 'adel.emam' , 'Update Database'


-----------------3
EXEC FinalizingTask 'adel.emam', 'task one', 'main@shell.us' , 'Update Database'


-----------------4
exec WorkOnTaskAgain 'adel.emam' , 'task one' , 'main@shell.us' , 'Update Database'






















---------------------MANAGERS-------------------

-------------1
execute spViewRequests 'yousra.ellouzy'



-----------------2
execute spAccRejRequests 'youssef.yasser' , 1 , null , 'fadl.meto'
execute spAccRejRequests 'yousra.ellouzy ' , 0 , 'no time for execuses' , 'ahmed.medany'





------------------3
execute spViewAppManager 'ahmed.ezz' , 'Officer'






----------------------4
execute spAccRejAppManager 1, 'Mohamed.Ashraf' , 'ahmed.ezz'
execute spAccRejAppManager 1, 'sami.eladl' , 'youssef.yasser'




-----------------------5

execute CreateProject 'first project' , 'main@shell.us' , '5/5/2018' , '6/6/2018' , 'youssef.yasser' --department 1
execute CreateProject 'second project' , 'main@shell.us' , '5/5/2018' , '6/6/2018' , 'yousra.ellouzy' -- department 2 , same time project 1
execute CreateProject 'third project' , 'main@shell.us' , '6/1/2018' , '7/6/2018' , 'tarek.elwakil'  -- departemnt 2 , same time










------------------------6


  execute spAssignEmployeesToProjects 'second project' , 'main@shell.us' , 'ahmed.medany' , 'yousra.ellouzy'
 execute spAssignEmployeesToProjects 'first project' , 'main@shell.us' , 'elset.korya' , 'youssef.yasser'





 -----------------------7

 execute spRemoveEmployeeFromProject 'youssef.yasser' , 'first project'





 -------------------------8
 execute spDefineTask 'second task' , 'second project' , 'main@shell.us' , '5/6/2018' , 'explore oil' , 'yousra.ellouzy'




 --------------------9


 execute spAssignRegularEmployeeToTask 'yousra.ellouzy', 'second task' , 'ahmed.medany' , 'second project' 





 -----------------10


 execute spChangeRegularEmployee 'fadl.meto' , 'elset.korya' , 'second task' , 'youssef.yasser'










 ---------------------11


 execute spViewTasks 'first project' , 'open' 



 --------------------------12




 update Tasks
 set status = 'finished'
 where manager ='yousra.ellouzy' and name='second task'


execute spCheckFinishedTask 'youssef.yasser' , 1 , '6/6/2018' , 'first project' , 'second task'
execute spCheckFinishedTask 'yousra.ellouzy' , 0 , '6/6/2018' , 'second project' , 'second task'

