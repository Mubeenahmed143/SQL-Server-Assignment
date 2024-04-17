create database Assignment;
use Assignment;


CREATE TABLE students (
    student_id INT PRIMARY KEY IDENTITY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
	email VARCHAR(50),
    gender VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50)
);

select * from students;


create proc sp_students

(
@choice NVARCHAR(50),
@student_id INT ,
@first_name VARCHAR(50),
@last_name VARCHAR(50),
@email VARCHAR(50),
@gender VARCHAR(50),
@address VARCHAR(100),
@city VARCHAR(50)
)

as
begin

if @choice='insert'

begin

 insert into students values
 (@first_name,@last_name,@email,@gender,@address,@city)

 end

 if @choice='select'

 begin

   select * from students

   end

   if @choice='update'

   begin

   update students set
   first_name=@first_name,last_name=@last_name,
   email=@email,gender=@gender,address=@address,city=@city
   where student_id=@student_id

   end

   else if @choice='delete'

   begin

    delete from students where student_id=@student_id

	end

	end

	exec sp_students @choice='insert' ,@student_id = 2 , @first_name = 'aisha' , @last_name = 'ali',
	@email='aish@gmail.com' , @gender = 'Female' , @address = 'norht nazimabad' , @city = 'islamabad';

	exec sp_students @choice='select'
	select * from students;

	exec sp_students @choice='update' ,@student_id = 2 , @first_name = 'mubeen' , @last_name = 'ahmed',
	@email='mubeen@gmail.com' , @gender = 'Male' , @address = 'musharraf' , @city = 'karachi';

	exec sp_students @choice='delete' ,@student_id = 3 , @first_name = 'aisha' , @last_name = 'ali',
	@email='aish@gmail.com' , @gender = 'Female' , @address = 'norht nazimabad' , @city = 'islamabad';