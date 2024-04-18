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
@student_id INT=null ,
@first_name VARCHAR(50)=null,
@last_name VARCHAR(50)=null,
@email VARCHAR(50)=null,
@gender VARCHAR(50)=null,
@address VARCHAR(100)=null,
@city VARCHAR(50)=null
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

	drop proc sp_students

	exec sp_students @choice='insert' , @first_name = 'murtaza' , @last_name = 'sadiq',
	@email='aish@gmail.com' , @gender = 'male' , @address = 'korangi' , @city = 'karachi';

	exec sp_students @choice='select'
	

	exec sp_students @choice='update' ,@student_id = 4 , @first_name = 'ali' , @last_name = 'raza',
	@email='ali@gmail.com' , @gender = 'Male' , @address = 'orangi' , @city = 'quetta';

	exec sp_students @choice='delete' ,@student_id = 3 , @first_name = 'aisha' , @last_name = 'ali',
	@email='aish@gmail.com' , @gender = 'Female' , @address = 'norht nazimabad' , @city = 'islamabad';