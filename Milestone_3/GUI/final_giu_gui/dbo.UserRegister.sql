
	Create Procedure UserRegister --1 a
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
					Set @password = null
					Set @users_id = -1
					print 'please enter another mail/Username, this element is duplicated!'
				end
			End
			Else
			begin
				print 'Not Enough Inputs For This User Type/This User Type is Invalid!/Or Foreign key constraint'
				Set @password = null
				Set @users_id = -1
			end
		End
		
		/*exec UserRegister 'Students' ,'fdszdg', 'adsfgsdfgsd' ,
						'dasfgdsf','dsfgsdfg', '2011/11/11',
						0.1, 50, 'M3ady',
						1,1000, 'CompanyName',
						'RepName','RepEmail',00000000000,'Residence',
						@users_id output,@password output*/

		/*exec UserRegister 'UserType' ,'Username', 'Email' ,
						'first_name','last_name', 'Birthdate',
						'Gpa', 'Semester', 'Address',
						'FacultyCode','MajorCode', 'CompanyName',
						'RepName','RepEmail','Phone','Residence',
						@users_id output,@password output

		Declare @users_id int   ,  @password varchar(10)
		exec UserRegister 'Students' ,'Mostafa', 'mostafas email' , 'Mostafa','Hossam', '2004-01-03', 1.5
		, 3, 'Mektam/Maadi' , null, 'Major 1',null,null,null,'0110690779','Egypt',@users_id output,@password output

		Declare @users_id int   ,  @password varchar(10)
		exec UserRegister 'Companies' ,'MostafaCompany', 'mostafas email company' , null,null, null, null
		, null, 'Cairo', null,null, 'MostafaCompany','mostafaRep','mostafaEmailRep','0110690779',null,@users_id output,@password output

		Declare @users_id int   ,  @password varchar(10)
		exec UserRegister 'Lecturers' ,'Slim', 'SlimMail',
						null,null,null,
						null,null,null,
						null,null, null,
						null,null,'011100034576',null,
						@users_id output,@password output
					
		Declare @users_id int   ,  @password varchar(10)
		exec UserRegister 'Teaching assistants' ,'Leqaa', 'LeqaaMail',
						null,null,null,
						null,null,null,
						null,null, null,
						null,null,':)',null,
						@users_id output,@password output

		Declare @users_id int   ,  @password varchar(10)
		exec UserRegister 'External examiners' ,'Doctor Nada', 'DoctorsMail',
						null,null,null,
						null,null,null,
						null,null, null,
						null,null,'Idk',null,
						@users_id output,@password output

		Declare @users_id int   ,  @password varchar(10)
		exec UserRegister 'Coordinators' ,'LeqaaBardo', 'LeqaaMailBardo',
						null,null,null,
						null,null,null,
						null,null, null,
						null,null,':)',null,
						@users_id output,@password output*/
			--			Declare @users_id int   ,  @password varchar(10)
		--exec UserRegister 'Students' ,'sdfdeedd', 'sdf lol ' , 'Mostafa','Hossam', '2004-01-03', 1.5
		--, 3, 'Mektam/Maadi' , null, '2',null,null,null,'0110690779','Egypt',@users_id output,@password output


		--drop Procedure UserLogin