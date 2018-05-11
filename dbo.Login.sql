CREATE PROC [Login]
@username varchar(20),
@password varchar(20),
@userornot BIT output,
@type varchar(50) output
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
		end
End

--declare @userornot BIT
--DECLARE @type varchar(20)
--EXEC [Login] 'ahmed.hisham' ,'123456' , @userornot , @type


--2