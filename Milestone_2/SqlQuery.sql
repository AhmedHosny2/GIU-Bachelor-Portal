/*
use master
go
 alter database GIUDataBase set single_user with rollback immediate
 drop database GIUDataBase
Create DataBase GIUDataBase;
Use GIUDataBase;
*/


	go 

	CREATE Procedure UserRegister
	@usertype varchar(20),
	@userName varchar(20),
	@email varchar(50),
	@first_name varchar(20),
	@last_name varchar(20),
	@birth_date datetime,
	@GPA decimal(3,2),
	@semester int,
	@address varchar(100),
	@faculty_code varchar(10),
	@major_code varchar(10),
	@company_name varchar(20),
	@representative_name varchar(20),
	@representative_email varchar(50),
	@phone_number varchar(20),
	@country_of_residence varchar(20),
	@users_id int output,
	@password varchar(10) output
	AS
		If(@userName is null or @email is null or @usertype is null or @phone_number is null)
			print 'Not enough inputs to make a user!!!!'
		Else
		Begin
			If(
			@usertype = 'Students' and not (@first_name is null or @last_name is null or 
			@major_code is null or @birth_date is null or @address is null or @semester is null or
			@GPA is null or not Exists(select * from Major m where @major_code = m.Major_Code))
			or 
			@usertype = 'Companies' and not (@company_name is null or @representative_name is null or
			@representative_email is null or @address is null)
			or
			@usertype = 'Lecturers' and not (@userName is null) 
			or
			@usertype = 'Teaching assistants' and not (@userName is null) 
			or
			@usertype = 'External examiners' and not (@userName is null) 
			or
			@usertype = 'Coordinators' and not (@userName is null))
			Begin
				IF(NOT Exists(select * from Users where Email = @email or Username=@userName))
				Begin			-- 1
					Set @password =LEFT(REPLACE(NEWID(),'-',''),10) 
					INSERT INTO Users values(@userName,@password,@email,@phone_number,@usertype);
					select @users_id =users_id
					from Users
					where Username=@userName
					If(@usertype = 'Students')
						insert into Student(sid,first_name, last_name, major_code, Date_Of_Birth, Adress, semester, GPA)
						values			   (@users_id,@first_name, @last_name, @major_code, @birth_date, @address, @semester, @GPA)
					Else if(@usertype = 'Companies')
						insert into Company(Company_id,Name, representative_name, representative_email, Location)
						values (@users_id,@company_name, @representative_name, @representative_email , @address)
					Else if(@usertype = 'Lecturers')
						insert into Lecturer(Lecturer_id) values (@users_id)
					Else if(@usertype = 'Teaching assistants')
						insert into Teaching_Assistant(TA_id) values (@users_id)
					Else if(@usertype = 'External examiners')
						insert into External_Examiner(EE_id) values (@users_id)
					Else if(@usertype = 'Coordinators')
						insert into Coordinator(coordinator_id) values (@users_id)
				End
				else
				begin
					Set @users_id = -1
					Set @password = -1
					print 'please enter another mail/Username, this element is duplicated!'
				end
			End
			Else
			begin
				Set @users_id = -1
				Set @password = 0
				print 'Not Enough Inputs For This User Type/This User Type is Invalid!/Or Foreign key constraint'
			end
		End
		
	

		--drop Procedure UserLogin


		--drop Procedure UserLogin
	go 
	Create Procedure UserLogin --2 a
	 @email varchar(50),
	 @password varchar(10),
	 @success bit output,
	 @user_id int output
	 AS
		
		if (not exists(Select Email From Users Where Email = @email))
			Begin
				SET @success = 0;
				SET @user_id = -2;
			End

		Else if (not exists(Select Password From Users Where Password=@password))
			Begin
				SET @success = 0;
				SET @user_id = -3;
			End

		Else if (exists(select users_id from Users where Email = @email AND Password=@password))
			Begin
				SET @success = 1;
				SET @user_id=(select users_id from Users where Email = @email AND Password=@password);
			End
		Else
			Begin
				SET @success = 0;
				SET @user_id = -4;
			End
	
	go  

	Create Procedure ViewProfile
	@user_id int
	AS
		declare @usertype varchar(20)
		Set @usertype = (Select User_type From Users where users_id = @user_id)
		If(@usertype = 'Students')
			SELECT * FROM Users inner join Student on users_id = sid where users_id=@user_id
		Else if(@usertype = 'Companies')
			SELECT * FROM Users inner join Company on users_id = Company_id where users_id=@user_id
		Else if(@usertype = 'Lecturers')
			SELECT * FROM Users inner join Lecturer on users_id = Lecturer_id where users_id=@user_id
		Else if(@usertype = 'Teaching assistants')
			SELECT * FROM Users inner join Teaching_Assistant on TA_id = users_id where users_id=@user_id
		Else if(@usertype = 'External examiners')
			SELECT * FROM Users inner join External_Examiner on EE_id = users_id where users_id=@user_id
		Else if(@usertype = 'Coordinators')
			SELECT * FROM Users inner join Coordinator on coordinator_id = users_id where users_id=@user_id
		Else 
			print ('Enter valid id ')

			--exec ViewProfile 100			

			--drop Procedure ViewBachelorProjects
go




CREATE Procedure ViewBachelorProjects -- 2 c
@ProjectType varchar(20),
@User_id int
AS
	If (Exists(Select * from Users where users_id = @User_id) or @User_id = -1)
	begin
		If (@ProjectType ='all' and @User_id =-1)
			Select s.sid, bp.*, i.*, a.*, a.L_id as 'L_id2'
			From Bachelor_Project bp left join Industrial i on bp.code = i.Industrial_code
			left join Academic a on bp.code = a.Academic_code
			left join Student s on s.Assigned_Project_code = bp.code
			Order by bp.code
		Else If (@ProjectType ='all')
			Select s.sid, bp.*, i.*, a.*, a.L_id as 'L_id2'
			From Bachelor_Project bp left join Industrial i on bp.code = i.Industrial_code
			left join Academic a on bp.code = a.Academic_code
			left join Student s on s.Assigned_Project_code = bp.code
			Where s.sid = @User_id
			Order by bp.code
		Else If (@ProjectType !='all' and @User_id =-1)		
			Begin
			If (@ProjectType = 'Industrial')
				Select s.sid, bp.*, i.*
				From Bachelor_Project bp inner join Industrial i on bp.code = i.Industrial_code
				left join Student s on s.Assigned_Project_code = bp.code
				Order by s.sid, bp.code
			Else If (@ProjectType = 'Academic')
				Select s.sid, bp.*, a.*, a.L_id as 'L_id2'
				From Bachelor_Project bp inner join Academic a on bp.code = a.Academic_code
				left join Student s on s.Assigned_Project_code = bp.code
				Order by s.sid, bp.code
			End
		Else If (@ProjectType !='all')	
			Begin
			If (@ProjectType = 'Industrial')
				Select s.sid, bp.*, i.*
				From Bachelor_Project bp inner join Industrial i on bp.code = i.Industrial_code
				left join Student s on s.Assigned_Project_code = bp.code
				where sid = @User_id
			Else If (@ProjectType = 'Academic')
				Select s.sid, bp.*, a.*, a.L_id as 'L_id2'
				From Bachelor_Project bp inner join Academic a on bp.code = a.Academic_code
				left join Student s on s.Assigned_Project_code = bp.code
				where sid = @User_id
			End
		end
		else
			print 'Invalid Id'
		
go

Create Procedure MakePreferencesLocalProject -- 3 a
@sid int,
@bachelor_code varchar(10),
@preference_number int,
@Error_Flag int output
AS
if(@preference_number<1 or @preference_number>100)
set @Error_Flag=3;
else
begin
    If (not exists(Select * From Student Where sid = @sid)) Set @Error_Flag=1;
    else if(@preference_number is null or not exists(Select * From Bachelor_Project Where code = @bachelor_code))
    Set @Error_Flag=2;
    Else
        Begin
        If (Exists(select PreferenceNumber from StudentPreferences where sid = @sid AND PCode=@bachelor_code))
        Begin
        Set @Error_Flag=0;
            Update StudentPreferences
            Set PreferenceNumber = @preference_number
            Where sid = @sid and PCode = @bachelor_code
        END 
        ELSE
            if (Exists(select * from Student s  inner join  MajorHasBachelorProject mm on  mm.Major_code=s.Major_code))
            begin
            Set @Error_Flag=0;
            
            Insert Into  StudentPreferences Values (@sid,@bachelor_code, @preference_number)
            end
        End

	end	



go 

Create Procedure ViewMyThesis 
@sid int,
@title varchar(50),@Error_Flag int output
AS
    If (not exists(Select * From Student Where sid = @sid))
    begin
    set @Error_Flag=-1;
    end
    else if( not Exists(Select * From Thesis Where sid = @sid and Title = @title))
    begin
    set @Error_Flag=-2;
    end
    else
    begin
        Update Thesis
        Set Total_grade = (Select (d.EE_grade + d.Lecturer_grade) / 2 From GradeAcademicThesis d
                           Where d.sid = sid and d.Title = Title)
        Where sid = @sid and Exists(
            Select * From GradeAcademicThesis d Where d.sid = sid and d.Title = Title
            and d.L_id is not Null and d.EE_id is not Null
        )
        Update Thesis
        Set Total_grade = (Select (d.Company_grade + d.Employee_grade)/2 From GradeIndustrialThesis d
                           Where d.sid = sid and d.Title = Title)
        Where sid = @sid and Exists(
            Select * From GradeIndustrialThesis d Where d.sid = sid and d.Title = Title
            and C_id is not Null and E_id is not Null
        )
        Select * From Thesis Where sid = @sid and Thesis.Title=@title Order By Total_grade, Title
    end
   

go

Create Procedure SubmitMyThesis 
@sid int,
@title varchar(50),
@PDF_Document varchar(1000),
@Error_Flag int output
As
    If (not exists(Select * From Student Where sid = @sid))Set @Error_Flag=1;
    else if( @PDF_Document is null)set @Error_Flag=2;    
    Else
        Begin
        set @Error_Flag=0;    
        If(Exists(Select * From Thesis Where sid = @sid and Title = @title))
            Update Thesis
            Set PDF_doc = @PDF_Document
            Where sid = @sid and Title = @title
        Else
            Insert Into Thesis(sid,Title,PDF_doc) Values (@sid,@title, @PDF_Document);
        End


go

Create Procedure ViewMyProgressReports    
@sid int,
@date datetime,@Error_Flag int output
AS 
    If (not exists( select * from ProgressReport where sid=@sid AND Date=@date))
    begin
    set @Error_Flag=0;
    
    end
    else
    begin
    set @Error_Flag=1;
        IF(@date is not NULL)
            select * from ProgressReport where sid=@sid AND Date=@date;
        ELSE 
            select * from ProgressReport where sid=@sid ORDER BY Date DESC;
    end


go

Create Procedure ViewMyDefense
@sid int,
@Error_Flag int output
AS
   
        Update Defense
        Set Total_Grade = (Select (EE_grade + Lecturer_grade )/ 2 From GradeAcademicDefense d
                           Where d.sid = sid and d.Location = Location)
        Where sid = @sid and Exists(
            Select * From GradeAcademicDefense d Where d.sid = sid and d.Location = Location
            and d.EE_id is not Null and d.L_id is not Null
        )
        Update Defense
        Set Total_Grade = (Select employee_grade + company_grade / 2 From GradeIndustrialDefense d
                           Where d.sid = sid and d.Location = Location)
        Where sid = @sid and Exists(
            Select * From GradeIndustrialDefense d Where d.sid = sid and d.Location = Location
            and d.E_id is not Null and d.C_id is not Null
        )
        if(Exists(
            Select * From GradeAcademicDefense d Where d.sid = sid and d.Location = Location
            and d.EE_id is not Null and d.L_id is not Null
        ) and Exists(
            Select * From GradeIndustrialDefense d Where d.sid = sid and d.Location = Location
            and d.E_id is not Null and d.C_id is not Null
        ) )
        begin
        set @Error_Flag=1;
        end
        else
        begin
        set @Error_Flag=0;
        Select * From Defense Where sid = @sid Order By Date, Time
        end

go 
Create Procedure UpdateMyDefense 
@sid int,
@defense_content varchar(1000),
@Error_Flag int output
As
    If(Not Exists(Select * From Student Where sid = @sid)) set @Error_Flag=1; 
    
    else if(Exists(Select * From Defense Where sid = @sid ) and @defense_content is not null)
    begin
        Update Defense
        Set Defense.Content = @defense_content
        Where Defense.sid = @sid;
        set @Error_Flag=0;
    end
    Else
    Set  @Error_Flag=2;
    
   
go


Create Procedure ViewMyBachelorProjectGrade 
@sid int,
@BachelorGrade decimal(4,2) output,
@Error_Flag int output
As    
    if(@sid is not null and Exists(Select * from Student Where Student.sid=@sid))
    begin
    set @Error_Flag=0;
    Update Student
    Set TotalBachelorGrade = (Select distinct 0.3*t.Total_grade+0.3*d.Total_grade+
        0.4*p.ComulativeProgressReportGrade From Thesis t
        inner join Defense d on t.sid = d.sid
        inner join ProgressReport p on p.sid = t.sid
        Where t.sid = @sid)
    Where sid = @sid and Exists(
        Select * From Thesis t
        inner join Defense d on t.sid = d.sid
        inner join ProgressReport p on p.sid = t.sid
        Where t.sid = @sid
        and t.Total_grade <> 0
        and d.Total_Grade <> 0
        and p.ComulativeProgressReportGrade <> 0
    )
    Set @BachelorGrade = (Select TotalBachelorGrade
    From Student s Where s.sid = @sid)
    End
    else 
    set @Error_Flag=1;


go 

create function getSupervisor(@sid int)
returns int
begin
	declare @l_id int
	set @l_id = ((select iPro.L_id from Industrial iPro
		where (select Assigned_Project_code from student s where s.sid = @sid) = iPro.Industrial_code)
	Union
	(select aPro.L_id from Academic aPro
		where (select Assigned_Project_code from student s where s.sid = @sid) = aPro.Academic_code))
	return @l_id
end


go


drop proc if exists ViewNotBookedMeeting
	
go

Create Procedure ViewNotBookedMeeting -- 3 h
@sid int,@Error_Flag int output
as
    if(Exists(Select m.* from Meeting m
    where @sid not in (select ma2.Attendant_id from MeetingAttendents ma2
        where ma2.Meeting_ID = m.Meeting_ID) and
    m.L_id = dbo.getSupervisor(@sid)))
begin
SET @Error_Flag=1;
Select m.* from Meeting m
    where @sid not in (select ma2.Attendant_id from MeetingAttendents ma2
        where ma2.Meeting_ID = m.Meeting_ID) and
    m.L_id = dbo.getSupervisor(@sid)
    Order By m.Date
end
else 
set @Error_Flag=0;

go

Create Procedure BookMeeting   
@sid int,
@meeting_id int,
@Error_Flag int output
As
    If (not exists(Select * From Student Where sid = @sid))
        Set @Error_Flag=1;
    else if( not exists(Select * From Meeting Where Meeting_ID = @meeting_id))
    set @Error_Flag=2;
    Else if (dbo.getSupervisor(@sid) != (select L_id from meeting m where m.Meeting_ID = @meeting_id))
        Set @Error_Flag=3;
    Else if (not exists(select * from MeetingAttendents where Meeting_ID = @meeting_id and Attendant_id = @sid))
        begin
        set @Error_Flag=0;
        insert into MeetingAttendents values (@meeting_id,@sid)
        end
    Else
        set @Error_Flag=4;


go
Create Procedure ViewMeeting -- 3 j
@meeting_id int,
@sid int,
@Error_Flag int output
As
    If (Exists(Select * From Student Where sid = @sid )and Exists(select * from Meeting where Meeting_ID=@meeting_id))
    Begin
    set @Error_Flag=1;
   
            Select M.* , MTL.ToDoList 
            from Meeting M left join MeetingToDoList MTL on M.Meeting_ID=MTL.Meeting_ID  
            where M.Meeting_ID =@meeting_id
    End
    Else
    set @Error_Flag=0;


go
Create Procedure StudentAddToDo -- 3 k
@meeting_id int, 
@to_do_list varchar(200),
@Error_Flag int output
As 
    if(Exists(select * from Meeting where @meeting_id = Meeting_ID))
    begin
    set @Error_Flag=0;
        Insert Into MeetingToDoList Values(@meeting_id, @to_do_list)
        end
    else
        set @Error_Flag=1;




go
Create Procedure AddEmployee -- 4 a

@ComapnyID int, @email varchar(50), @name varchar(20), @phone_number varchar(20),
@field varchar(25),

@StaffID int output , @ComapnyID_2 int output, @password varchar(10) output

as
	If (not exists(Select* From Company Where @ComapnyID = Company_id))
		Begin
			Set @StaffID = -2;
			Set @ComapnyID_2 = -2;
		End
	Else If (exists(Select* From Employee Where @email = Email))
		Begin
			Set @StaffID = -3;
			Set @ComapnyID_2 = -3;
		End
	Else
		Begin
			Set @password = LEFT(REPLACE(NEWID(),'-',''),10) 
			Insert Into Employee Values (@ComapnyID, @name,@password,@email,@field,@phone_number)
			select @StaffID = Staff_id, @ComapnyID_2 = Company_id
			from Employee
			where Email = @email
			print concat('Staff ID: ', @StaffID, '   Company ID: ', @ComapnyID_2, '   Password: ', @password)
		End

go

Create Procedure CompanyCreateLocalProject -- 4 b
@company_id int, @proj_code varchar(10), @title varchar(50), @description varchar(200),
@major_code varchar(10),

@erfolg int output
as
	If (not exists(Select* From Company Where @company_id = Company_id))
		Begin
			Set @erfolg = -2;
		End
	Else If (exists(Select* From Bachelor_Project Where @proj_code = code))
		Begin
			Set @erfolg = -3;
		End
	Else If (not exists(Select* From Major Where @major_code = Major_Code))
		Begin
			Set @erfolg = -4;
		End
	Else
		Begin
			Insert into Bachelor_Project (code, Name, Description) Values (@proj_code,@title,@description)
			Insert into Industrial (Industrial_code, C_id) Values (@proj_code, @company_id)
			Insert into MajorHasBachelorProject values (@major_code, @proj_code)
			Set @erfolg = 1;
		End


go

Create Procedure AssignEmployee			
	@bachelor_code varchar(10),
	@staff_id int,
	@Company_id int,

	@staff_id_2  int output 
as
	If (not exists(Select* From Company Where @company_id = Company_id))
		Begin
			Set @staff_id_2 = -2;
		End
	Else If (not exists(Select* From Bachelor_Project Where @bachelor_code = code))
		Begin
			Set @staff_id_2 = -4;
		End
	Else If (not exists(Select* From Employee Where @staff_id = Staff_id))
		Begin
			Set @staff_id_2 = -3;
		End
	Else
		Begin
			set @staff_id_2 = @staff_id

			Update Industrial
			set E_id = @staff_id
			where Industrial_code = @bachelor_code and C_id = @Company_id

			select *
			from Bachelor_Project bp inner join Industrial i on i.Industrial_code=bp.code
			where bp.code=@bachelor_code
		End
	

go

Create Procedure CompanyGradeThesis
@Company_id int,
@sid int,
@thesis_title varchar(50),
@Company_grade Decimal(4,2),

@success int Output
As
	If (not exists(Select* From Company Where @company_id = Company_id))
		Begin
			Set @success = -2;
		End
	Else If (not exists(Select* From Student Where @sid = sid))
		Begin
			Set @success = -3;
		End
	Else If (not exists(Select* From Thesis Where @thesis_title = Title))
		Begin
			Set @success = -4;
		End
	Else If (not exists(Select* From Thesis Where @sid = sid and @thesis_title = Title))
		Begin
			Set @success = -5;
		End
	Else
		Begin
			if exists(Select * from Company where Company_id = @Company_id)
			begin
				if exists (Select * from Thesis where @sid=sid And @thesis_title=Title)
					if exists(Select * from GradeIndustrialThesis where @sid=sid And @thesis_title=Title) 
					update GradeIndustrialThesis
					set Company_grade=@Company_grade, C_id=@Company_id
					where @sid=sid And @thesis_title=Title 
					else insert Into GradeIndustrialThesis Values (@Company_id,null,@sid,@thesis_title,@Company_grade,0.0)
				else print 'Thesis does not exist!'
			end
			else print 'Company does not exist!'
		End

go
Create Procedure CompanyGradedefense
@Company_id int,
@sid int,
@defense_location varchar(5),
@Company_grade Decimal(4,2),

@success int Output

As
	If (not exists(Select* From Company Where @company_id = Company_id))
		Begin
			Set @success = -2;
		End
	Else If (not exists(Select* From Student Where @sid = sid))
		Begin
			Set @success = -3;
		End
	Else If (not exists(Select* From Defense Where @defense_location = Location))
		Begin
			Set @success = -4;
		End
	Else If (not exists(Select* From Defense Where @sid = sid and @defense_location = Location))
		Begin
			Set @success = -5;
		End
	Else
		Begin
			if exists(Select * from Company where Company_id = @Company_id)
			begin
				if exists (Select * from Defense where @sid=sid AND @defense_location=Location  )
					if exists (Select * from GradeIndustrialDefense where @sid=sid AND @defense_location=Location)	
					update GradeIndustrialDefense
					Set company_grade=@Company_grade, C_id = @Company_id
					where  @sid=sid AND @defense_location=Location
					else 
					Insert into GradeIndustrialDefense Values  (@Company_id,null,@sid,@defense_location,@Company_grade,0.0)
				else print 'Defense does not exist!'
			end
			else print 'Company does not exist!'
		End


go

Create Procedure CompanyGradePR
@Company_id int,
@sid int,
@date datetime,
@Company_grade decimal(4,2),

@success int Output

As	
	If (not exists(Select* From Company Where @company_id = Company_id))
		Begin
			Set @success = -2;
		End
	Else If (not exists(Select* From Student Where @sid = sid))
		Begin
			Set @success = -3;
		End
	Else If (not exists(Select* From ProgressReport Where @date = Date))
		Begin
			Set @success = -4;
		End
	Else If (not exists(Select* From ProgressReport Where @sid = sid and @date = Date))
		Begin
			Set @success = -5;
		End
	Else
		Begin
			if exists (select * from Student s where s.sid = @sid and exists(select * from Industrial i where i.Industrial_code = s.Assigned_Project_code))
				if exists (Select * from ProgressReport where @sid=sid AND Date= @date)
					Begin
						update ProgressReport
						set UpdatingUser_id=@Company_id, Grade = @Company_grade
						where @sid=sid AND Date= @date   

						Update ProgressReport
						set ComulativeProgressReportGrade = (SELECT AVG(Grade)
						FROM ProgressReport
						WHERE sid = @sid)
						Where sid = @sid
					end
				else
					print 'Progress Report does not exist!'
			else
				print 'He is not assigned to Industrial Project!'
		End



go 



create Procedure LecturerCreateLocalProject					
@Lecturer_id int, @proj_code varchar(10), @title varchar(50), @description varchar(200),
@major_code varchar(10)
As
	if (exists(select * from Bachelor_Project where code = @proj_code))
		print 'Already existing project!'
	else if (not exists(select * from Major where Major_code = @major_code))
		print 'Major does not exist!'
	else
	begin
		Insert into Bachelor_Project values (@proj_code,@title,null,@description)
		Insert into Academic values (@proj_code, @Lecturer_id, null, null)
		Insert into MajorHasBachelorProject values (@major_code, @proj_code)
	end



go									

Create Procedure SpecifyThesisDeadline
@deadline datetime
As	
	If @deadline is null
		print 'Please enter a deadline'
	else
	begin
		Insert Into Thesis (sid)
		select sid from Student s
		where not Exists(select sid From Thesis t where t.sid = s.sid)
		Update Thesis
		set Deadline=@deadline
	end

go

Create Procedure CreateMeeting
@Lecturer_id int, @start_time time, @end_time time, @date datetime, @meeting_point varchar(5)
As
	if ( @start_time is null or @end_time is null or @date is null or @meeting_point is null)
		print 'Invalid parameters'
	else if(Exists(select * from Meeting m where m.STime = @start_time and @meeting_point = m.Meeting_Point))
		print 'There is another meeting in this location at the same time!'
	else if(Exists(select * from Meeting m where @Lecturer_id = m.L_id and @start_time = m.STime))
		print 'You have another meeting at the same time!'
	else
	begin
		if (Exists(select * from Lecturer where Lecturer_id = @Lecturer_id))
			insert into Meeting Values ( @Lecturer_id,@start_time,@end_time,@date,@meeting_point)
		else print 'Lecturer does not exist'
	end
	

go

Create Procedure LecturerAddToDo
	@meeting_id int,
	@to_do_list varchar(200)
	As
	if(not Exists(select * from Meeting where @meeting_id = Meeting_ID))
		print 'Meeting does not exist'
	else if(Exists(select * from MeetingToDoList mt where mt.Meeting_ID = @meeting_id))
		update MeetingToDoList
		set ToDoList = @to_do_list
		where Meeting_ID = @meeting_id
	else
		Insert Into MeetingToDoList Values(@meeting_id, @to_do_list)

go

Create Procedure ViewMeetingLecturer
	@Lecturer_id int,
	@meeting_id int
	As
	If @Lecturer_id is not null
	Begin
		If @meeting_id != ''
			Select * 
			From Meeting M left outer join MeetingToDoList mtl  left outer join MeetingAttendents MA on MA.Meeting_ID=mtl.Meeting_ID on M.Meeting_ID=MA.Meeting_ID
			Where M.Meeting_ID = @meeting_id and L_id = @Lecturer_id
		else
			Select *
			From Meeting M
			Where M.L_id = @Lecturer_id
			Order By M.Date
	end
	else
		print 'Invalid Input!'

go

Create Procedure ViewEE

	As
	Select *
	From External_Examiner EE1
	Where EE1.EE_id  not In
		(Select LREE.EE_id
		From LecturerRecommendEE LREE)


go

Create Procedure RecommendEE
	@Lecturer_id int,
	@proj_code varchar(10),
	@EE_id int
	As
	if (not exists(Select * From Lecturer Where Lecturer_id = @Lecturer_id))
		print 'Lecturer does not exist'
	Else if (not exists(Select * From External_Examiner Where EE_id = @EE_id))
		print 'External Examiner does not exist'
	Else if (not exists(Select * From Academic Where Academic_code = @proj_code))
		print 'Project does not exist'
	Else
		Insert Into LecturerRecommendEE Values(@Lecturer_id, @EE_id, @proj_code)

go

Create Procedure SuperviseIndustrial
	@Lecturer_id int,
	@proj_code varchar(10)
	As
	If (Not Exists(select * from Lecturer l where l.Lecturer_id = @Lecturer_id))
		print 'Lectuerer doesnt exist'
	Else if (Not Exists(select * from Industrial l where l.Industrial_code = @proj_code))
		print 'Project doesnt exist'
	Else if (Exists(select * from Industrial l where l.Industrial_code = @proj_code and l.L_id = @Lecturer_id))
		print 'Already supervising project'
	else
		Update Industrial
		Set L_id = @Lecturer_id
		Where Industrial_code = @proj_code

go
Create Procedure LecGradeThesis
    @Lecturer_id int,
    @sid int,
    @thesis_title varchar(50),
    @Lecturer_grade Decimal(4,2)
    As
    If exists(Select * From Thesis Where @sid = sid And @thesis_title = Title)
        If exists(Select * From GradeAcademicThesis Where sid = @sid And Title = @thesis_title)
		    Update GradeAcademicThesis
		    Set Lecturer_grade = @Lecturer_grade
		    Where sid = @sid And Title = @thesis_title and  L_id = @Lecturer_id
		Else
		    Insert Into GradeAcademicThesis Values(@Lecturer_id, null, @sid, @thesis_title, 00.00, @Lecturer_grade)
	Else print 'Thesis does not exist'


go
Create Procedure LecGradedefense
    @Lecturer_id int,
    @sid int,
    @defense_location varchar(5),
    @Lecturer_grade Decimal(4,2)
    As
    If exists(Select * From Defense Where @sid = sid And @defense_location = Location)
        If exists(Select * From GradeAcademicDefense Where sid = @sid And Location = @defense_location)
			Update GradeAcademicDefense
			Set Lecturer_grade = @Lecturer_grade
			Where sid = @sid And Location = @defense_location and  L_id = @Lecturer_id
        Else
			Insert Into GradeAcademicDefense Values(@Lecturer_id, null, @sid, @defense_location, 00.00, @Lecturer_grade)
    Else print 'Defense does not exist'

go
Create Procedure LecCreatePR
	@Lecturer_id int,
	@sid int,
	@date datetime,
	@content varchar(1000)
	As
	if (not Exists(select * from Lecturer where Lecturer_id = @Lecturer_id))	
		print 'Lecturer does not exist!'
	Else if (not Exists(select * from Student where sid = @sid))	
		print 'Student  does not exist!'
	Else if (Exists(select * from ProgressReport pr where pr.sid = @sid and pr.Date = @date))
		print 'Already Existing Progress Report'
	Else
		Insert Into ProgressReport Values(@sid, @date, @content, 00.00, @Lecturer_id, 00.00)


go

Create Procedure LecGradePR
    @Lecturer_id int,
    @sid int,
    @date datetime,
    @Lecturer_grade Decimal(4,2)
    As
	If @Lecturer_grade is null
		print 'Please enter grade'
	Else If(not exists(Select * From Lecturer l Where @Lecturer_id = l.Lecturer_id))
		print 'Lectuerer doesnt exist'
	Else If exists(Select * From ProgressReport Where @sid = sid And @date = Date)
        Begin
			Update ProgressReport
			Set UpdatingUser_id = @Lecturer_id, Grade = @Lecturer_grade
			Where sid = @sid And Date = @date
			Update ProgressReport
			set ComulativeProgressReportGrade = (SELECT AVG(Grade)
			FROM ProgressReport
			WHERE sid = @sid)
			Where sid = @sid
        End
    Else print 'Progress Report does not exist'


go


Create Procedure TACreatePR
    @TA_id int,
    @sid int,
    @date datetime,
    @content varchar(1000),
    @erfolg int output

    As
    if (not Exists(select * from Teaching_Assistant where TA_id = @TA_id))
        set @erfolg =-1;
    Else if (not Exists(select * from Student where sid = @sid))
    set @erfolg = -2;
    else
    Insert Into ProgressReport Values(@sid, @date, @content, 00.00, @TA_id, 00.00)

go

Create Procedure TAAddToDo
    @meeting_id int,
    @to_do_list varchar(200),
    @erfolg int output
    As
    if(Exists(select * from Meeting where @meeting_id = Meeting_ID))
        Insert Into MeetingToDoList Values(@meeting_id, @to_do_list)
    else
        set @erfolg=-1;


go

Create Procedure EEGradeThesis 
@EE_id int,
@sid int,
@thesis_title varchar(50),
@EE_grade Decimal(4,2),
@erfolg int output
    as
    If (not exists (select * from External_Examiner e where e.EE_id=@EE_id ))
        set @erfolg=-1;
        else if(not exists (select * from Student e where e.sid=@sid ))
                set @erfolg=-2;
        else if(not exists (select * from Thesis e where e.Title=@thesis_title  ))
                set @erfolg=-3;

    
    Else
    Begin
        If exists(Select * From Thesis Where @sid = sid And @thesis_title = Title)
            If exists(Select * From GradeAcademicThesis Where sid = @sid And Title = @thesis_title)
            Update GradeAcademicThesis
            Set EE_grade = @EE_grade
            Where sid = @sid And Title = @thesis_title and  EE_id = @EE_id
            Else
            Insert Into GradeAcademicThesis Values(null, @EE_id, @sid, @thesis_title, @EE_grade, 00.00)
        Else         set @erfolg=-5;      

    End

go

Create Procedure EEGradedefense
@EE_id int,
@sid int,
@defense_location varchar(5),
@EE_grade Decimal(4,2),
@erfolg int output
    as
    if(not exists (select * from External_Examiner e where e.EE_id=@EE_id))
    set @erfolg= -1;
    else if(not exists (select * from Student s where s.sid=@sid))
    set @erfolg = -2 ;

    else  if(not exists (select * from Defense d where d.Location=@defense_location and sid = @sid))
    set @erfolg= -3;
    Else
    Begin
        If exists(Select * From Defense Where @sid = sid And @defense_location = Location)
            If exists(Select * From GradeAcademicDefense Where sid = @sid And Location  = @defense_location)
            Update GradeAcademicDefense
            Set EE_grade = @EE_grade
            Where sid = @sid And Location = @defense_location and EE_id = @EE_id
            Else
            Insert Into GradeAcademicDefense Values(null, @EE_id, @sid, @defense_location, @EE_grade, 00.00)
        
    End


go

go

Create Procedure ViewUsers 
@User_type varchar(20),
@User_id int,
@erfolg int output
    As
    if(not exists (select * from Users where users_id=@User_id) and @User_id!=-1)
    set @erfolg = -1 ;
    else 
    begin
    set @erfolg = 0 ;
    if  @User_id =-1 AND @User_type ='All Users'
    begin
    Select *
    From Users
    Order by Users_id
    end

    else if @User_id =-1 
    Select *
    From Users
    where Users.User_type=@User_type
    Order by Users_id

    else 
    Select *
    From Users
    where Users.users_id=@User_id
    end




go


Create Procedure AssignTAs 
@coordinator_id int,
@TA_id int,
@proj_code varchar(10),
@erfolg int output
As
    If (not Exists(select * from Coordinator c where c.coordinator_id = @coordinator_id))
    set @erfolg =-1;
    Else If (not exists(Select * From Teaching_Assistant Where @TA_id = TA_id))
        set @erfolg =-2;
    Else If (not exists(Select * From Academic Where @proj_code = Academic_code))
        set @erfolg =-3;
    Else
        Update Academic
        Set TA_id = @TA_id
        Where Academic_code = @proj_code


go

create function getBachelorProjectName(@sid int)
returns varchar(50)
begin
	declare @name varchar(50)
	set @name = (select bp.Name from Student s inner join Bachelor_Project bp on s.Assigned_Project_code = bp.code where s.sid = @sid)
	return @name
end

go

Create Procedure AssignAllStudentsToLocalProject 
	As
	begin
	create table studentsWithNoProject (sid int)
	insert into studentsWithNoProject
		Select s.sid
		From Student s
		Where
		s.Assigned_Project_code is null
		order by GPA

	Declare @i int = 1
	Declare @maxSid int = (select s.sid from studentsWithNoProject s order by s.sid desc OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY)

	While @i <= @maxSid
	begin
		if(Exists(select * from studentsWithNoProject s where s.sid = @i))
		begin
			update Student
			set Assigned_Project_code = (Select sp.PCode
				from studentsWithNoProject sw
				inner join Student s on s.sid = sw.sid
				inner join StudentPreferences sp on s.sid = sp.sid
				where s.sid = st.sid and not exists(select * from Student where Assigned_Project_code = sp.PCode)
				ORDER BY PreferenceNumber
				OFFSET 0 ROWS
				FETCH NEXT 1 ROWS ONLY)
			from Student st
			where st.sid = @i

			delete from StudentPreferences
			where StudentPreferences.sid = @i

			if(exists(select * from Thesis where sid = @i))
				update Thesis
				set Title = dbo.getBachelorProjectName(@i)
				where sid = @i
			else
			begin
				insert into Thesis(sid, Title) values (@i, dbo.getBachelorProjectName(@i))
			end
		end
		set @i = @i + 1
	end

	Select s.sid, bp.code, bp.Description,bp.Name,bp.Submitted_Materials
	From studentsWithNoProject swnp
	inner join Student s
	on s.sid = swnp.sid
	inner join Bachelor_Project bp
	on s.Assigned_Project_code = bp.code

	drop table studentsWithNoProject
	end

go

Create Procedure ViewRecommendation 
@lecture_id int,
@erfolg int output
As
    If (not Exists(select * from Lecturer l where l.Lecturer_id = @lecture_id )and @lecture_id !=-1)
    set @erfolg =-1;
    else begin
    If (@lecture_id =-1)
        Select *
        From LecturerRecommendEE
        Order by EE_id
    else
        Select *
        From LecturerRecommendEE
            where L_id  =@lecture_id
        Order by L_id, EE_id
        end

go

Create Procedure AssignEE 
@coordinator_id int,
@EE_id int,
@proj_code varchar(10),
@erfolg int output
    As
    If (not exists(Select * From Coordinator c Where @coordinator_id = c.coordinator_id))
            set @erfolg =-1;
    Else If (not exists(Select * From External_Examiner Where @EE_id = EE_id))
            set @erfolg =-2;
    Else If (not exists(Select * From Academic Where @proj_code = Academic_code))
            set @erfolg =-3;
    Else
        Update Academic
        Set EE_id = @EE_id
        Where @proj_code = Academic_code


go

Create Procedure ScheduleDefense 
    @sid int,
    @date datetime,
    @time time,
    @location varchar(5),
    @erfolg int output
        As

        If (not exists(Select * From Student Where sid = @sid))
                set @erfolg = -1;
		Else If (exists (Select * From Defense Where @sid = sid and @location = Location))
			Begin
				Update Defense
				Set Date = @date, Time = @time
				Where @sid = sid and @location = Location
				set @erfolg = -10;
			End
        Else
            Insert Into Defense(sid,Date,Time,Location) values (@sid, @date, @time, @location)

	
go

Create Procedure EmployeeGradeThesis 
@Employee_id int,
@sid int,
@thesis_title varchar(50),
@Employee_grade Decimal(4,2),

@success int Output

	As
	If (not exists(Select* From Employee Where @Employee_id = Staff_id))
		Begin
			Set @success = -2;
		End
	Else If (not exists(Select* From Student Where @sid = sid))
		Begin
			Set @success = -3;
		End
	Else If (not exists(Select* From Thesis Where @thesis_title = Title))
		Begin
			Set @success = -4;
		End
	Else If (not exists(Select* From Thesis Where @sid = sid and @thesis_title = Title))
		Begin
			Set @success = -5;
		End
	Else
		Begin
			If (@Employee_id is null or @sid is null or @thesis_title is null or @Employee_grade is null)
				print 'Invalid Parameters'
			Else
			Begin
				If exists(Select * From Thesis Where @sid = sid And @thesis_title = Title)
					If exists(Select * From GradeIndustrialThesis Where sid = @sid And Title = @thesis_title)
					Update GradeIndustrialThesis
					Set @Employee_grade = Employee_grade, @Employee_id = E_id
					Where sid = @sid And Title = @thesis_title
					Else
					Insert Into GradeIndustrialThesis Values(null, @Employee_id, @sid, @thesis_title, 00.00, @Employee_grade)
				Else print 'Thesis does not exist'
			End
		End

go

Create Procedure EmployeeGradedefense 
@Employee_id int,
@sid int,
@defense_location varchar(5),
@Employee_grade Decimal(4,2),

@success int Output

	As

	If (not exists(Select* From Employee Where @Employee_id = Staff_id))
		Begin
			Set @success = -2;
		End
	Else If (not exists(Select* From Student Where @sid = sid))
		Begin
			Set @success = -3;
		End
	Else If (not exists(Select* From Defense Where @defense_location = Location))
		Begin
			Set @success = -4;
		End
	Else If (not exists(Select* From Defense Where @sid = sid and @defense_location = Location))
		Begin
			Set @success = -5;
		End
	Else
		Begin
			If (@Employee_id is null or @sid is null or @defense_location is null or @Employee_grade is null)
				print 'Invalid Parameters'
			Else
			Begin
				If exists(Select * From Defense Where @sid = sid And @defense_location = Location)
					If exists(Select * From GradeIndustrialDefense Where sid = @sid And Location  = @defense_location)
						Update GradeIndustrialDefense
						Set employee_grade = @Employee_grade, E_id = @Employee_id
						Where sid = @sid And Location = @defense_location
					Else
					  Insert Into GradeIndustrialDefense Values(null, @Employee_id, @sid, @defense_location, 00.00, @Employee_grade)
				Else print 'Defense does not exist'
			End
		End


go

Create Procedure EmployeeCreatePR
	@Employee_id int,
	@sid int,
	@date datetime,
	@content varchar(1000),

	@success int Output

	As
		if (not Exists(select * from Employee where Staff_id = @Employee_id))	
			Set @success = -2;
		Else if (not Exists(select * from Student where sid = @sid))	
			Set @success = -3;
		Else if (Exists(select * from ProgressReport where sid = @sid and @date = Date))	
			Set @success = -4;
		Else 
		begin 
			Insert Into ProgressReport Values(@sid, @date, @content, 00.00, @Employee_id, 00.00)
		end 

go
Create Proc EmployeeLogin
	@email varchar(64),
	@password varchar(64),

	@success int output,
	@user_id int output

	As
		If (not exists(Select * From Employee Where @email = Email))
		Begin
			Set @success = -2;
			Set @user_id = -2;
		End
		Else if (not exists(Select * From Employee Where @password = Password))
			Begin
				SET @success = -3;
				SET @user_id = -3;
			End

		Else if (not exists(Select * From Employee Where @email = Email and @password = Password))
			Begin
				SET @success = -4;
				SET @user_id = -4;
			End
		Else
			Begin
				SET @success = 1;
				SET @user_id=(Select Staff_id From Employee Where @email = Email and @password = Password);
			End




go
Create Proc EmpViewProfile
	
	@user_id int,
	@success int Output
	AS
		if (not exists(Select * From Employee Where @user_id = Staff_id))
			Set @success = -1;
		Else
			Select * From Employee Where @user_id = Staff_id



go
Create Proc GetUserType
	
	@user_id int,
	@userType Varchar(20) output
	As
		Select @userType = User_type From Users Where @user_id = users_id
