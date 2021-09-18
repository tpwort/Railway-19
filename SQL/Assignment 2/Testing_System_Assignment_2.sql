-- create database: TestingManagerment
DROP DATABASE IF EXISTS TestingManagerment;
CREATE DATABASE 		TestingManagerment;
USE					 	TestingManagerment;

-- create table:	Department
DROP TABLE IF EXISTS	Department;
CREATE TABLE			Department (
	Department_ID					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Department_Name					VARCHAR(20) UNIQUE KEY NOT NULL
    );

 -- create table:	Position
DROP TABLE IF EXISTS	`Position`;
CREATE TABLE	 		`Position` (
	Position_ID						SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Position_Name					ENUM('Dev', 'Test', 'scrum Master', 'PM') UNIQUE KEY NOT NULL
    );
 
 -- create table: Account
DROP TABLE IF EXISTS	`Account`;
CREATE TABLE			`Account`(
	Account_ID						SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Email							VARCHAR(30) UNIQUE KEY,
    Username						VARCHAR (30) UNIQUE KEY NOT NULL CHECK(LENGTH(Username)>=8),
    FullName						VARCHAR(50) NOT NULL,
    Department_ID					SMALLINT UNSIGNED NOT NULL,
    Position_ID						SMALLINT UNSIGNED NOT NULL,
    Create_Date						DATETIME DEFAULT(now()),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
    FOREIGN KEY (Position_ID) REFERENCES `Position` (Position_ID)
    );
    
-- create table: Group
DROP TABLE IF EXISTS	`Group`;
CREATE TABLE			`Group` (
	Group_ID						SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    GroupName						VARCHAR(50) UNIQUE KEY NOT NULL CHECK(length(GroupName)>=8),
    Creator_ID						SMALLINT UNSIGNED NOT NULL,
    Create_Date						DATETIME DEFAULT(now()),
    FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID)
    );

-- create table: GroupAccount
DROP TABLE IF EXISTS	GroupAccount;
CREATE TABLE			GroupAccount (
	Group_ID						SMALLINT UNSIGNED NOT NULL,
    Account_ID						SMALLINT UNSIGNED NOT NULL,
    JoinDate						DATETIME DEFAULT(now()),
    FOREIGN KEY(Group_ID) REFERENCES `Group`(Group_ID),
    FOREIGN KEY(Account_ID) REFERENCES `Account`(Account_ID) 
    ); 
    
-- create table: TypeQuestion
DROP TABLE IF EXISTS	TypeQuestion;    
CREATE TABLE	 		TypeQuestion (
	Type_ID							SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TypeName						ENUM('Essay', 'Multiple-Choice') NOT NULL 
    );

-- create table: CategoryQuestion
DROP TABLE IF EXISTS	CategoryQuestion;      
CREATE TABLE	 		CategoryQuestion (
	Category_ID						SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    CategoryName					VARCHAR(30) UNIQUE KEY CHECK(LENGTH(CategoryName)>=8)
    );
    
    
-- create table: Question
DROP TABLE IF EXISTS	Question;    
CREATE TABLE			Question (
	Question_ID						SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Content							NVARCHAR(50) UNIQUE KEY NOT NULL,
    Category_ID						SMALLINT UNSIGNED NOT NULL,
    Type_ID							SMALLINT UNSIGNED NOT NULL,
    Creator_ID						SMALLINT UNSIGNED NOT NULL,
    Create_Date						DATETIME DEFAULT(now()),
    FOREIGN KEY (Type_ID) REFERENCES TypeQuestion(Type_ID),
    FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID),
    FOREIGN KEY(Category_ID) REFERENCES CategoryQuestion(Category_ID)
    );    

-- create table: Answer
DROP TABLE IF EXISTS	Answer;    
CREATE TABLE	 		Answer (
	Answer_ID						SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Content							VARCHAR(200),
    Question_ID						SMALLINT UNSIGNED NOT NULL,
    isCorrect						NCHAR(7) NOT NULL,
    FOREIGN KEY(Question_ID) REFERENCES Question(Question_ID)
    ); 

-- create table: Exam
DROP TABLE IF EXISTS	Exam;     
CREATE TABLE			Exam (
	Exam_ID							SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `Code`							SMALLINT UNSIGNED UNIQUE KEY NOT NULL,
    Title							NVARCHAR(50) NOT NULL,
    Category_ID						SMALLINT UNSIGNED NOT NULL,
    Duration						VARCHAR(20) NOT NULL,
    Creator_ID						SMALLINT UNSIGNED NOT NULL,
    Create_Date						DATETIME DEFAULT(now()),
    FOREIGN KEY(Category_ID) REFERENCES CategoryQuestion(Category_ID)
    );

-- create table: ExamQuestion
DROP TABLE IF EXISTS	ExamQuestion;    
CREATE TABLE	 		ExamQuestion (
	Exam_ID							SMALLINT UNSIGNED PRIMARY KEY NOT NULL,
    Question_ID						SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY(Exam_ID) REFERENCES Exam(Exam_ID)
    ); 
    
    
-- Insert data to table
-- Department table
INSERT INTO department (Department_Name)
VALUES					('D1'),
						('D2'),
						('D3'),
						('D4'),
						('D5');

-- Position table                        
INSERT INTO `position` (Position_Name)
VALUES					('Dev'), 
						('Test'), 
                        ('scrum Master'), 
                        ('PM');

-- Account table
INSERT INTO `account` 	( Email, 				Username, 		FullName, 				Department_ID,	 Position_ID)
VALUES					('tpwort@gmail.com', 	'Hoang Dung', 	'Hoang Thi Thuy Dung', 		1, 				1 ),
						('tpwort1@gmail.com', 	'Hoang Dung1', 	'Hoang Thi Thuy Dung1', 	2, 				2 ),
						('tpwort2@gmail.com', 	'Hoang Dung2', 	'Hoang Thi Thuy Dung2', 	1, 				3 ),
						('tpwort3@gmail.com', 	'Hoang Dung3', 	'Hoang Thi Thuy Dung3', 	3, 				4 ),
						('tpwort4@gmail.com', 	'Hoang Dung4', 	'Hoang Thi Thuy Dung4', 	4, 				2 ),
						('tpwort5@gmail.com', 	'Hoang Dung5', 	'Hoang Thi Thuy Dung5', 	5, 				1 ),
						('tpwort6@gmail.com', 	'Hoang Dung6', 	'Hoang Thi Thuy Dung6', 	2, 				4 ),
						('tpwort7@gmail.com', 	'Hoang Dung7', 	'Hoang Thi Thuy Dung7', 	3, 				3 ),
						('tpwort8@gmail.com', 	'Hoang Dung8', 	'Hoang Thi Thuy Dung8', 	4, 				2 ),
						('tpwort9@gmail.com', 	'Hoang Dung9', 	'Hoang Thi Thuy Dung9', 	1, 				1 );

-- Group table
INSERT INTO `group` ( GroupName, Creator_ID)
VALUES				('Hoang@ Dung', '1'),
					('Hoang@ Dung1', '1'),
					('Hoang@ Dung2', '1'),
                    ('Hoang@ Dung3', '1'),
                    ('Hoang@ Dung4', '1'),
                    ('Hoang@ Dung5', '1'),
                    ('Hoang@ Dung6', '1'),
                    ('Hoang@ Dung7', '1'),
                    ('Hoang@ Dung8', '1'),
                    ('Hoang@ Dung9', '1');
-- groupaccount table
INSERT INTO groupaccount (Group_ID, Account_ID )
VALUES						('1', '1'),
							('2', '3'),
							('3', '2'),
							('6', '1'),
							('6', '5'),
							('4', '7'),
							('5', '7'),
							('5', '8'),
							('1', '3'),
							('9', '9');
                            
-- typequestion table
INSERT INTO typequestion 	(TypeName)
VALUES						('Essay'), 
							('Multiple-Choice');                            

-- categoryquestion table
INSERT INTO categoryquestion 	(CategoryName)
VALUES							('Category Dung'),
								('Category1 Dung'),
                                ('Category2 Dung'),
                                ('Category3 Dung'),
                                ('Category4 Dung'),
                                ('Category5 Dung'),
                                ('Category6 Dung');
                                
-- question table
INSERT INTO question 			( Content, 										Category_ID, 	Type_ID, 	Creator_ID )
VALUES							('Nước biển màu gì?', 							'1', 			'1', 		'10'),
								('Lá cây mùa thu màu gì?', 						'4', 			'1', 		'2'),
                                ('Mùa đông lạnh?', 								'2', 			'2', 		'1'),
                                ('1 năm có mấy mùa?', 							'3', 			'1', 		'2'),
                                ('Cá sống dưới nước?', 							'6', 			'2', 		'3'),
                                ('Khỉ sống trên bờ?', 							'1', 			'2', 		'4'),
                                ('Nấu ăn phải dùng nồi?', 						'7', 			'2', 		'6'),
                                ('Mẹ thích ăn đồ ba nấu?', 						'2', 			'2', 		'5');

-- answer table
INSERT INTO answer 				( Content, 		Question_ID, 	isCorrect)
VALUES							('Xanh dương',	1 ,				'Đúng'),
								('Vàng',		2 ,				'Đúng'),
                                ('Đúng',		3 ,				'Đúng'),
                                ('4 mùa',		4 ,				'Đúng'),
                                ('Đúng',		5 ,				'Đúng'),
                                ('Đúng',		6 ,				'Đúng'),
                                ('Đúng',		7 ,				'Đúng'),
                                ('Sai',			8 ,				'Đúng');

-- Exam table
INSERT INTO exam 		(  `Code`, 	Title, 						Category_ID, 	Duration, 				Creator_ID) 
VALUES					('00001', 	'Câu hỏi đơn giản', 		1, 				'10 ` ', 				1 ),
						('00002', 	'Câu hỏi đơn giản2', 		2, 				'10 ` ', 				2 ),
                        ('00003', 	'Câu hỏi đơn giản3', 		3, 				'10 ` ', 				3 ),
                        ('00004', 	'Câu hỏi đơn giản4', 		4, 				'10 ` ', 				4 ),
                        ('00005', 	'Câu hỏi đơn giản5', 		5, 				'10 ` ', 				5 ),
                        ('00006', 	'Câu hỏi đơn giản6', 		6, 				'10 ` ', 				6 ),
                        ('00007', 	'Câu hỏi đơn giản7', 		7, 				'10 ` ', 				7 ),
                        ('00008', 	'Câu hỏi đơn giản8', 		1, 				'10 ` ', 				8 ),
                        ('00009', 	'Câu hỏi đơn giản9', 		2, 				'10 ` ', 				1 ),
                        ('000010', 	'Câu hỏi đơn giản10',	 	3, 				'10 ` ', 				2 );
                        
-- examquestion table
INSERT INTO examquestion 	(Exam_ID, 		Question_ID)
VALUES						(1, 			1),
							(2, 			3),
							(3, 			2),
							(4, 			4),
							(5, 			6),
							(6, 			5),
							(7, 			8),
							(8, 			7),
							(9, 			1);
													                               
								                                

								


												                                                   
    
    