Use GIUDataBase;
	CREATE TABLE Users( 
			users_id INT identity,
			Username Varchar(20) Unique,
			Password Varchar(10) ,
			Email  Varchar(50) Unique,
			Phone_number  Varchar(20),
			User_type varchar(20),
			PRIMARY KEY(users_id)
	);


	CREATE TABLE Lecturer( 
			Lecturer_id INT,
			Schedule Varchar(64),
			PRIMARY KEY(Lecturer_id),
			FOREIGN KEY (Lecturer_id) REFERENCES Users(users_id) on update cascade on delete cascade
	);


	CREATE TABLE LecturerFields(
			Lecturer_id INT,
			field Varchar(64),
			PRIMARY KEY(Lecturer_id,field),
			FOREIGN KEY (Lecturer_id) REFERENCES Lecturer(Lecturer_id) on update cascade on delete cascade
	);

	Create Table Faculty(
	
		Faculty_Code Int,				
		Name Varchar(20),
		Dean Int,						

		Primary Key(Faculty_Code),
		Foreign Key(Dean) References Lecturer on update cascade on delete set null,
	);

	Create Table Major(
	
		Major_Code varchar(10),		
		Faculty_code Int,				
		Major_Name Varchar(20),			

		Primary Key(Major_Code),
		Foreign Key(Faculty_code) References Faculty on update cascade on delete cascade,
	);

	CREATE TABLE Company( 
			Company_id INT,
			Name Varchar(64),
			Representative_name Varchar(64),
			Representative_Email  Varchar(64),
			Location  Varchar(64),
			PRIMARY KEY (Company_id),
			FOREIGN KEY (Company_id) REFERENCES Users(users_id) on update cascade on delete cascade

	);
	
	CREATE TABLE Employee( 
			Staff_id INT  identity,		
			Company_id INT,
			Username Varchar(64),
			Password Varchar(64),
			Email  Varchar(64),
			Field  Varchar(64),
			Phone  Varchar(64),
			PRIMARY KEY(Company_id,Staff_id),
			FOREIGN KEY (Company_id) REFERENCES Company(Company_id) on update cascade on delete cascade
	);

	CREATE TABLE External_Examiner( 
			EE_id INT,
			Schedule Varchar(64),
			PRIMARY KEY(EE_id),
			FOREIGN KEY (EE_id) REFERENCES Users(users_id) on update cascade on delete cascade
	);

	CREATE TABLE Teaching_Assistant(
			TA_id INT,
			Schedule Varchar(64),
			PRIMARY KEY(TA_id),
			FOREIGN KEY (TA_id) REFERENCES Users(users_id) on update cascade on delete cascade
	);

	CREATE TABLE Coordinator(
			coordinator_id INT,
			PRIMARY KEY(coordinator_id),
			FOREIGN KEY (coordinator_id) REFERENCES Users(users_id) on update cascade on delete cascade

	);

	CREATE TABLE Bachelor_Project(
			code Varchar(10),
			Name Varchar(64),
			Submitted_Materials TEXT,
			Description TEXT,
			PRIMARY KEY(code)
	);

	CREATE TABLE Student(
			sid INT,
			first_name Varchar(64),
			last_name Varchar(64),
			Major_code varchar(10),
			Date_Of_Birth Date,
			Adress  Varchar(64),
			Age As Year(Current_Timestamp) - Year(Date_Of_Birth),
			Semester tinyINT,
			GPA DECIMAL(4,2),
			TotalBachelorGrade DECIMAL(4,2),
			Assigned_Project_code Varchar(10),
			PRIMARY KEY(sid),
			FOREIGN KEY (sid) REFERENCES Users on update cascade on delete cascade,
			FOREIGN KEY (Major_code) REFERENCES Major, 
			FOREIGN KEY (Assigned_Project_code) REFERENCES Bachelor_Project
			
	);

	CREATE TABLE BachelorSubmittedMaterials(
			Code Varchar(10),
			Material TEXT,
			PRIMARY KEY(Code),
			FOREIGN KEY (Code) REFERENCES Bachelor_Project(code) on update cascade on delete cascade
	);

	

	Create Table Academic(
	
		Academic_code Varchar(10),		
		L_id Int,						
		TA_id Int,						
		EE_id Int,						

		Primary Key(Academic_code),
		Foreign Key(Academic_code) References Bachelor_Project on update cascade on delete cascade,
		Foreign Key(L_id) References Lecturer,
		Foreign Key(TA_id) References Teaching_Assistant,	
		Foreign Key(EE_id) References External_Examiner,
	);

	Create Table Industrial(
	
		Industrial_code Varchar(10),	
		C_id Int,						
		L_id Int,						
		E_id Int,						

		Primary Key(Industrial_code),
		Foreign Key(Industrial_code) References Bachelor_Project on update cascade on delete cascade,
		Foreign Key(C_id) References Company,
		Foreign Key(L_id) References Lecturer,
		Foreign Key(C_id, E_id) References Employee(Company_id, Staff_id),
	);

	Create Table Meeting(

		Meeting_ID Int Identity,				
		L_id Int,						
		STime Time,						
		ETime Time,						
		Duration As DATEDIFF(MINUTE ,STime ,ETime),		
		Date DateTime,					
		Meeting_Point Varchar(5),

		Primary Key(Meeting_ID),
		Foreign Key(L_id) References Lecturer 
	);


	Create Table MeetingToDoList(
	
		Meeting_ID Int,					
		
		ToDoList VarChar(200),

		Primary Key(Meeting_ID,ToDoList),
		Foreign Key(Meeting_ID) References Meeting 
	);


	Create Table MeetingAttendents(
	
		Meeting_ID Int,				
		Attendant_id Int,				
	
		Primary Key(Meeting_ID, Attendant_id),
		Foreign Key(Meeting_ID) References Meeting on update cascade on delete cascade,
		Foreign Key(Attendant_id) References Users
	);

	Create Table Thesis(-- joe

		sid Int,

		Title Varchar(50) default 'nope with no title ',
		Deadline DateTime,
		PDF_doc Varchar(20),
		Total_grade DECIMAL(4,2), 

		Primary Key(sid, Title),
		Foreign Key(sid) References Student on update cascade on delete cascade
	
	);


	create Table Defense(

		sid int,
		Location varchar(5), 
		Content varchar(400), 
		Time datetime, 
		Date datetime,
		Total_Grade Decimal(4,2),

		Primary key (sid,location),
		Foreign key (sid) references Student 

	);

	create Table ProgressReport(

		sid int,
		Date datetime,
		Content varchar(1000),
		Grade Decimal(4,2), 
		UpdatingUser_id int,
		ComulativeProgressReportGrade Decimal(4,2), 
		Primary key (sid, Date),
		Foreign key (sid) references Student on update cascade on delete cascade,
		Foreign key (UpdatingUser_id) references Users 

	);

	create Table GradeIndustrialPR(

		C_id int,
		sid int,
		Date datetime,
		Company_grade DECIMAL(4,2), 
		Lecturer_grade DECIMAL(4,2),

		Primary key (sid, Date),
		Foreign key (C_id) references Company on update cascade on delete set null,
		Foreign key (sid, Date) references ProgressReport(sid, Date)

	);

	create Table GradeAcademicPR(

		L_id int,
		sid int,
		Date datetime,
		Lecturer_grade Decimal(4,2),
		Primary key (sid, Date),
		Foreign key (L_id) references Lecturer on update cascade on delete set null,
		Foreign key (sid, Date) references ProgressReport(sid, Date)

	)

	create Table GradeAcademicThesis(
		EE_id int,
		sid int,
		Title varchar(50),
		EE_grade decimal(4,2),
		Lecturer_grade decimal(4,2),
		Primary key(sid, Title),
		Foreign key (L_id) references Lecturer on update cascade on delete set null,
		Foreign key (EE_id) references External_Examiner,
		Foreign key (sid, Title) references Thesis(sid, Title)

	);

	create Table GradeIndustrialThesis(

		C_id int,
		E_id int,
		sid int,
		Title varchar(50),
		Company_grade DECIMAL(4,2), 
		Employee_grade DECIMAL(4,2), 
		Primary Key(sid, Title),
		Foreign key (C_id) references Company on update cascade on delete set null,
		Foreign key (C_id, E_id) references Employee(Company_id, Staff_id),
		Foreign key (sid, Title) references Thesis(sid,Title)

	);




		create table GradeAcademicDefense( 
			L_id int,
			EE_id int,
			sid int,
			Location varchar(5),
			EE_grade decimal(4,2),		
			Lecturer_grade decimal(4,2),
			primary key (sid, Location),
			foreign key (L_id) references Lecturer,
			foreign key (EE_id) references External_Examiner,
			foreign key (sid, Location) references Defense(sid, location)
		);



		create table GradeIndustrialDefense( 
			C_id int,
			E_id int,
			sid int,
			Location varchar(5),
			company_grade DECIMAL(4,2),
			employee_grade DECIMAL(4,2),
			primary key (sid,Location),
			foreign key (sid, Location) references Defense(sid,location) on update  cascade on delete cascade,
			foreign key (C_id) references Company,
			foreign key (C_id,E_id) references Employee(Company_id, Staff_id)
		);

	create table LecturerRecommendEE 
	(
		L_id int,
		EE_id int,
		PCode Varchar(10),		

		primary key(EE_id,PCode),
		foreign key (L_id) references Lecturer on update  cascade on delete set null,
		foreign key (EE_id) references External_Examiner,
		foreign key (PCode) references Academic
	);


	create table StudentPreferences (

		sid int,
		PCode Varchar(10),		
		PreferenceNumber int,
		primary key (sid,PCode),

		foreign key (sid) references Student on update  cascade on delete cascade,
		foreign key (PCode) references Bachelor_Project
	);

	create table MajorHasBachelorProject( 

		Major_code  varchar(10),
		Project_code Varchar(10), 
		primary key(Major_code,Project_code),
		foreign key (Major_code) references Major  on update  cascade on delete cascade,
		foreign key (Project_code) references Bachelor_Project

	);

