use GIUDataBase
--Use master

Insert Into Users Values('Lecturer 1', 'Pass 1', 'Email 1', 'phone 1', 'Lecturers')--    1 : 6
Insert Into Users Values('Lecturer 2', 'Pass 2', 'Email 2', 'phone 2', 'Lecturers')
Insert Into Users Values('Lecturer 3', 'Pass 3', 'Email 3', 'phone 3', 'Lecturers')
Insert Into Users Values('Lecturer 4', 'Pass 4', 'Email 4', 'phone 4', 'Lecturers')
Insert Into Users Values('Lecturer 5', 'Pass 5', 'Email 5', 'phone 5', 'Lecturers')
Insert Into Users Values('Lecturer 6', 'Pass 6', 'Email 6', 'phone 6', 'Lecturers')

Insert Into Users Values('EE 1', 'Pass 7', 'Email 7', 'phone 7', 'External examiners')		-- 7 : 12
Insert Into Users Values('EE 2', 'Pass 8', 'Email 8', 'phone 8', 'External examiners')
Insert Into Users Values('EE 3', 'Pass 9', 'Email 9', 'phone 9', 'External examiners')
Insert Into Users Values('EE 4', 'Pass 10', 'Email 10', 'phone 10', 'External examiners')
Insert Into Users Values('EE 5', 'Pass 11', 'Email 11', 'phone 11', 'External examiners')
Insert Into Users Values('EE 6', 'Pass 12', 'Email 12', 'phone 12', 'External examiners')

Insert Into Users Values('TA 1', 'Pass 13', 'Email 13', 'phone 13', 'Teaching assistants')		-- 13 : 18
Insert Into Users Values('TA 2', 'Pass 14', 'Email 14', 'phone 14', 'Teaching assistants')
Insert Into Users Values('TA 3', 'Pass 15', 'Email 15', 'phone 15', 'Teaching assistants')
Insert Into Users Values('TA 4', 'Pass 16', 'Email 16', 'phone 16', 'Teaching assistants')
Insert Into Users Values('TA 5', 'Pass 17', 'Email 17', 'phone 17', 'Teaching assistants')
Insert Into Users Values('TA 6', 'Pass 18', 'Email 18', 'phone 18', 'Teaching assistants')

Insert Into Users Values('Student 1', 'Pass 19', 'Email 19', 'phone 19', 'Students')		 -- 19 : 24
Insert Into Users Values('Student 2', 'Pass 20', 'Email 20', 'phone 20', 'Students')
Insert Into Users Values('Student 3', 'Pass 21', 'Email 21', 'phone 21', 'Students')
Insert Into Users Values('Student 4', 'Pass 22', 'Email 22', 'phone 22', 'Students')
Insert Into Users Values('Student 5', 'Pass 23', 'Email 23', 'phone 23', 'Students')
Insert Into Users Values('Student 6', 'Pass 24', 'Email 24', 'phone 24', 'Students')

Insert Into Users Values('Company 1', 'Pass 25', 'Email 25', 'phone 25', 'Companies')			-- 25 : 30
Insert Into Users Values('Company 2', 'Pass 26', 'Email 26', 'phone 26', 'Companies')
Insert Into Users Values('Company 3', 'Pass 27', 'Email 27', 'phone 27', 'Companies')
Insert Into Users Values('Company 4', 'Pass 28', 'Email 28', 'phone 28', 'Companies')
Insert Into Users Values('Company 5', 'Pass 29', 'Email 29', 'phone 29', 'Companies')
Insert Into Users Values('Company 6', 'Pass 30', 'Email 30', 'phone 30', 'Companies')

Insert Into Users Values('Coordinator 1', 'Pass 31', 'Email 31', 'phone 31', 'Coordinators')			-- 30 : 35
Insert Into Users Values('Coordinator 2', 'Pass 32', 'Email 32', 'phone 32', 'Coordinators')
Insert Into Users Values('Coordinator 3', 'Pass 33', 'Email 33', 'phone 33', 'Coordinators')
Insert Into Users Values('Coordinator 4', 'Pass 34', 'Email 34', 'phone 34', 'Coordinators')
Insert Into Users Values('Coordinator 5', 'Pass 35', 'Email 35', 'phone 35', 'Coordinators')
Insert Into Users Values('Coordinator 6', 'Pass 36', 'Email 36', 'phone 36', 'Coordinators')



Insert Into Coordinator Values(30)
Insert Into Coordinator Values(31)
Insert Into Coordinator Values(32)
Insert Into Coordinator Values(33)
Insert Into Coordinator Values(34)
Insert Into Coordinator Values(35)


Insert Into Lecturer Values (1, 'Schedule 1')
Insert Into Lecturer Values (2, 'Schedule 2')
Insert Into Lecturer Values (3, 'Schedule 3')
Insert Into Lecturer Values (4, 'Schedule 4')
Insert Into Lecturer Values (5, 'Schedule 5')
Insert Into Lecturer Values (6, 'Schedule 6')

Insert Into External_Examiner Values (7, 'Schedule 7')
Insert Into External_Examiner Values (8, 'Schedule 8')
Insert Into External_Examiner Values (9, 'Schedule 9')
Insert Into External_Examiner Values (10, 'Schedule 10')
Insert Into External_Examiner Values (11, 'Schedule 11')
Insert Into External_Examiner Values (12, 'Schedule 12')

Insert Into Teaching_Assistant Values (12, 'Schedule 12')
Insert Into Teaching_Assistant Values (13, 'Schedule 13')
Insert Into Teaching_Assistant Values (14, 'Schedule 14')
Insert Into Teaching_Assistant Values (15, 'Schedule 15')
Insert Into Teaching_Assistant Values (16, 'Schedule 16')
Insert Into Teaching_Assistant Values (17, 'Schedule 17')



Insert Into Faculty Values (1, 'CS',		1)   --Faculty code ,name , dean id
Insert Into Faculty Values (2, 'DB',		2)
Insert Into Faculty Values (3, 'DSA',		3)
Insert Into Faculty Values (4, 'OS',		4)
Insert Into Faculty Values (5, 'Math',		5)
Insert Into Faculty Values (6, 'Physics',	6)
Insert Into Faculty Values (7, 'Bio',		1)
Insert Into Faculty Values (8, 'Fashion',	2)
Insert Into Faculty Values (9, 'Chemistry',	3)



Insert Into Major values (1, 1, 'Software Engine') -- Major_Code  Faculty_code  Major_Name 
Insert Into Major values (2, 2, 'Media Informatics')
Insert Into Major values (3, 3, 'AR')
Insert Into Major values (4, 4, 'VR')
Insert Into Major values (5, 5, 'Mashines')
Insert Into Major values (6, 6, 'Algebra')



Insert Into Bachelor_Project Values('code 1', 'BP1', 'Sub1', 'D1')
Insert Into Bachelor_Project Values('code 2', 'BP2', 'Sub2', 'D2')
Insert Into Bachelor_Project Values('code 3', 'BP3', 'Sub3', 'D3')
Insert Into Bachelor_Project Values('code 4', 'BP4', 'Sub4', 'D4')
Insert Into Bachelor_Project Values('code 5', 'BP5', 'Sub5', 'D5')
Insert Into Bachelor_Project Values('code 6', 'BP6', 'Sub6', 'D6')
Insert Into Bachelor_Project Values('code 7', 'BP7', 'Sub7', 'D7')
Insert Into Bachelor_Project Values('code 8', 'BP8', 'Sub8', 'D8')

Insert Into BachelorSubmittedMaterials Values('code 1', 'Materials 1')
Insert Into BachelorSubmittedMaterials Values('code 2', 'Materials 2')
Insert Into BachelorSubmittedMaterials Values('code 3', 'Materials 3')
Insert Into BachelorSubmittedMaterials Values('code 4', 'Materials 4')
Insert Into BachelorSubmittedMaterials Values('code 5', 'Materials 1')
Insert Into BachelorSubmittedMaterials Values('code 6', 'Materials 2')
Insert Into BachelorSubmittedMaterials Values('code 7', 'Materials 3')
Insert Into BachelorSubmittedMaterials Values('code 8', 'Materials 1')



Insert into Student values (19, 'Student 1', 'yehia', 1, '2003-03-22', 'obour', 1, 0.7, 0.0, null)
Insert into Student values (20, 'Student 2', 'yehia', 1, '2003-03-22', 'obour', 1, 0.9, 0.0,	null)
Insert into Student values (21, 'Student 3', 'yehia', 2, '2003-03-22', 'obour', 1, 1.2, 0.0,	null)
Insert into Student values (22, 'Student 4', 'yehia', 2, '2003-03-22', 'obour', 2, 1.4, 0.0,	null)
Insert into Student values (23, 'Student 5', 'yehia', 3, '2003-03-22', 'obour', 2, 1.5, 0.0, null)
Insert into Student values (24, 'Student 6', 'yehia', 3, '2003-03-22', 'obour', 3, 1.7, 0.0,	null)



Insert Into Company values (25, 'Apple'   , 'Name1', '@mail', 'locaiton1')
Insert Into Company values (26, 'Tesla'   , 'Name2', '@mail', 'locaiton2')
Insert Into Company values (27, 'Amazon'  , 'Name3', '@mail', 'locaiton3')
Insert Into Company values (28, 'Google'  , 'Name4', '@mail', 'locaiton4')
Insert Into Company values (29, 'Aqua'    , 'Name5', '@mail', 'locaiton5')
Insert Into Company values (30, 'Marshel' , 'Name6', '@mail', 'locaiton6')


																				-- 1 : 16
Insert Into Employee Values(25, 'UName1', 'Pass1', 'EMail1', 'F1', 'Phone1')	-- 1 : 5
Insert Into Employee Values(25, 'UName2', 'Pass2', 'EMail2', 'F2', 'Phone2')
Insert Into Employee Values(25, 'UName3', 'Pass3', 'EMail3', 'F3', 'Phone3')
Insert Into Employee Values(25, 'UName4', 'Pass4', 'EMail4', 'F4', 'Phone4')
Insert Into Employee Values(25, 'UName5', 'Pass5', 'EMail5', 'F5', 'Phone5')

Insert Into Employee Values(26, 'UName6', 'Pass6', 'EMail6', 'F6', 'Phone6')	-- 6 : 10
Insert Into Employee Values(26, 'UName7', 'Pass7', 'EMail7', 'F7', 'Phone7')
Insert Into Employee Values(26, 'UName8', 'Pass8', 'EMail8', 'F8', 'Phone8')
Insert Into Employee Values(26, 'UName9', 'Pass9', 'EMail9', 'F9', 'Phone9')
Insert Into Employee Values(26, 'UName10', 'Pass10', 'EMail10', 'F10', 'Phone10')

Insert Into Employee Values(27, 'UName11', 'Pass11', 'EMail11', 'F11', 'Phone11')	-- 11
Insert Into Employee Values(27, 'UName12', 'Pass12', 'EMail12', 'F12', 'Phone12')	-- 12

Insert Into Employee Values(28, 'UName13', 'Pass13', 'EMail13', 'F13', 'Phone13')	-- 13
Insert Into Employee Values(28, 'UName14', 'Pass14', 'EMail14', 'F14', 'Phone14')	-- 14

Insert Into Employee Values(29, 'UName15', 'Pass15', 'EMail15', 'F15', 'Phone15')	-- 15
Insert Into Employee Values(30, 'UName16', 'Pass16', 'EMail16', 'F16', 'Phone16')	-- 16



Insert Into Meeting Values(1, '10:34:23', '10:40:23', '2022-04-22', 'MePo1')
Insert Into Meeting Values(2, '10:34:23', '10:40:23', '2022-04-22', 'MePo2')
Insert Into Meeting Values(3, '10:34:23', '10:40:23', '2022-04-22', 'MePo3')
Insert Into Meeting Values(3, '10:34:23', '10:40:24', '2022-04-22', 'MePo3')
Insert Into Meeting Values(4, '10:34:23', '10:40:24', '2022-04-10', 'MePo4')
Insert Into Meeting Values(4, '10:34:23', '10:40:25', '2022-04-20', 'MePo5')
Insert Into Meeting Values(4, '10:34:23', '10:40:26', '2022-04-21', 'MePo6')
Insert Into Meeting Values(4, '10:34:23', '10:40:27', '2022-04-23', 'MePo7')

Insert Into Academic Values('code 1', 1, 12, 7)
Insert Into Academic Values('code 2', 1, 13, 8)
Insert Into Academic Values('code 3', 2, 14, 9)
Insert Into Academic Values('code 4', 2, 15, 10)

Insert Into Industrial Values('code 5', 25, 3, 1)
Insert Into Industrial Values('code 6', 25, 3, 2)
Insert Into Industrial Values('code 7', 25, 4, 3)
Insert Into Industrial Values('code 8', 25, 4, 4)

Insert Into StudentPreferences Values(19, 'Code 1', 1)
Insert Into StudentPreferences Values(19, 'Code 2', 2)
Insert Into StudentPreferences Values(19, 'Code 3', 3)

Insert Into StudentPreferences Values(20, 'Code 2', 1)
Insert Into StudentPreferences Values(20, 'Code 3', 50)
Insert Into StudentPreferences Values(20, 'Code 6', 4)

Insert Into StudentPreferences Values(21, 'Code 3', 25)
Insert Into StudentPreferences Values(21, 'Code 7', 3)
Insert Into StudentPreferences Values(21, 'Code 1', 1)

Insert Into StudentPreferences Values(22, 'Code 3', 100)
Insert Into StudentPreferences Values(22, 'Code 4', 22)
Insert Into StudentPreferences Values(22, 'Code 1', 1)

Insert Into StudentPreferences Values(23, 'Code 3', 100)
Insert Into StudentPreferences Values(23, 'Code 4', 22)
Insert Into StudentPreferences Values(23, 'Code 2', 1)

Insert Into StudentPreferences Values(24, 'Code 8', 100)
Insert Into StudentPreferences Values(24, 'Code 4', 22)
Insert Into StudentPreferences Values(24, 'Code 1', 1)

Insert Into Thesis values (19, 'Thesis1', '2004-04-25', 'PDF Doc 1', 0.0)
Insert Into Thesis values (20, 'Thesis2', '2004-04-10', 'PDF Doc 2', 0.0)
Insert Into Thesis values (21, 'Thesis3', '2010-02-25', 'PDF Doc 3', 0.0)
Insert Into Thesis values (22, 'Thesis4', '2002-12-25', 'PDF Doc 4', 0.0)






Insert Into LecturerRecommendEE Values (1, 7, 'code 1')
Insert Into LecturerRecommendEE Values (1, 8, 'code 2')



Insert Into Defense values (19, 'Loc1', 'Content1', '10:40:23', '2022-04-22', 0.0)
Insert Into Defense values (20, 'Loc2', 'Content2', '10:40:23', '2022-04-22', 0.0)
Insert Into Defense values (21, 'Loc3', 'Content3', '10:40:23', '2022-04-22', 0.0)
Insert Into Defense values (22, 'Loc4', 'Content4', '10:40:23', '2022-04-22', 0.0)



Insert Into ProgressReport Values(19, '2022-02-22', 'Content1', 0.0, null, 0.0)
Insert Into ProgressReport Values(19, '2022-02-23', 'Content1', 0.0, null, 0.0)
Insert Into ProgressReport Values(20, '2022-02-23', 'Content2', 0.0, null, 0.0)
Insert Into ProgressReport Values(21, '2022-02-22', 'Content1', 0.0, null, 0.0)
Insert Into ProgressReport Values(22, '2022-02-23', 'Content2', 0.0, null, 0.0)
