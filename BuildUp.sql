drop table award_table;
drop table job_table;
drop table crew_table;
drop table writer_table;
drop table director_table;
drop table role_table;---
drop table actor_table;
drop table showtime_table;
drop table cinema_table;
drop table movie_table;
/
drop type award_type;
drop type job_type;
drop type crew_type;
drop type writer_type;
drop type director_type;
drop type role_type;---
drop type actor_type;
drop type showtime_type;
drop type cinema_type;
drop type movie_type;
drop type review_type force;
drop type genre_type force;
drop type review_table;
drop type genre_table;
/


/*From now on, all the statements are all about the building of tables*/
create type Genre_Type as object
(
    genre_description varchar2(50)
);

/

create type Genre_Table as table of Genre_Type;

/
/* there will a function in here*/
create type Review_Type as object
(
    reviewer varchar2(40),
    review_text varchar2(2000),
    review_score integer,
    review_date date,
    review_scource varchar2(200),
    member function Ratings return number
);

/

create type Review_Table as table of Review_Type;

/

create type Movie_Type as object
(
    movie_title varchar2(50),
    movie_website varchar2(200),
    movie_runtime varchar2(10),
    movie_storyline varchar2(2000),
    movie_mrp varchar2(10),
    movie_releasedate date,
    movie_review Review_Table,
    movie_genre Genre_Table
);

/

create table Movie_Table of Movie_Type OBJECT id system generated
nested table movie_review store as Review_tab
nested table movie_genre store as Genre_tab;

/

create or replace type body Review_Type as
member function Ratings return number is 
review_average integer;
begin
select AVG(b.review_score) into review_average from Movie_Table a, table(a.movie_review) b
where b.reviewer is not null;
return review_average;
end Ratings;
end;

/* the function of Ratings is finished*/
/

create type Cinema_Type as object
(
    cinema_name varchar2(20),
    cinema_phone integer,
    cinema_address varchar(100)
);

/

create table Cinema_Table of Cinema_Type Object id system generated;

/

create type ShowTime_Type as object
(
    session_date date,
    session_time varchar2(20),
    movie_ref REF Movie_Type,
    cinema_ref REF Cinema_Type
);

/

create table ShowTime_Table of ShowTime_Type object id system generated;
/

alter table ShowTime_Table
add(scope for (movie_ref) is Movie_Table);

/

alter table ShowTime_Table
add(scope for (cinema_ref) is Cinema_Table);

/*from here to create the supertype and subtypes*/

create type Actor_Type as object
(	
	actor_name varchar2(40),
    actor_born date,
    actor_hometown varchar(100),
    actor_datedied date,
	member function Age return number,
	member function ActorAge return number
);

/

create table Actor_Table of Actor_Type object id system generated;

/
----------------------new type-------------------------

create type Role_Type as object
(
    role_name varchar2(20),
    role_crediorder integer,
    actor_ref REF Actor_Type,
    movie_ref REF Movie_Type

);

/

create table Role_Table of Role_Type object id system generated;

/

alter table Role_Table
add (scope for (actor_ref) is Actor_Table);

/ 

alter table Role_Table
add (scope for (movie_ref) is Movie_Table);

------------------------INSERT FINISH------------------------------

/

create or replace type body Actor_Type as 
	member function Age return number is
	begin
		if actor_datedied is null then
			return extract (year from sysdate) - extract(year from actor_born);
		else 
			return extract (year from actor_datedied) - extract(year from actor_born);
		end if;
	end Age;
	member function ActorAge return number is
	begin
		--return extract (year from movie_releasedate) - extract(year from actor_born);
        return 0;
	end ActorAge;
end;

/

create type Director_Type as object
(
    director_name varchar2(40),
    director_born date,
    director_hometown varchar(100),
    director_datedied date,
    movie_ref REF Movie_Type,
    member function Age return number
);

/

create table Director_Table of Director_Type object id system generated;

/

alter table Director_Table
add (scope for (movie_ref) is Movie_Table);

/

create or replace type body Director_Type as 
	member function Age return number is
	begin
		if director_datedied is null then
            return extract (year from sysdate) - extract(year from director_born);
		else 
			return extract (year from director_datedied) - extract(year from director_born);
		end if;
	end Age;
end;

/

create type Writer_Type as object
(
    writer_name varchar2(40),
    writer_born date,
    writer_hometown varchar(100),
    writer_datedied date,
    movie_ref REF Movie_Type,
    member function Age return number
);
/

create table Writer_Table of Writer_Type object id system generated;

/

alter table Writer_Table
add (scope for (movie_ref) is Movie_Table);

/

create or replace type body Writer_Type as 
	member function Age return number is
	begin
		if writer_datedied is null then
			return extract (year from sysdate) - extract(year from writer_born);
		else 
			return extract (year from writer_datedied) - extract(year from writer_born);
		end if;
	end Age;
end;

/

create type Crew_Type as object
(
    crew_name varchar2(40),
    crew_born date,
    crew_hometown varchar(100),
    crew_datedied date,
	member function Age return number
);

/

create table Crew_Table of Crew_Type object id system generated;

/
--------------INSERT NEW TYPE------------

create type Job_Type as object
(
    job_description varchar2(2000),
    crew_ref REF Crew_Type,
	movie_ref REF Movie_Type
);

/

create table Job_Table of Job_Type object id system generated; 

/

alter table Job_Table
add (scope for (crew_ref) is Crew_Table);

/ 

alter table Job_Table
add (scope for (movie_ref) is Movie_Table);


--------------------INSERT FINISH--------------------

/

create or replace type body Crew_Type as 
	member function Age return number is
	begin
		if crew_datedied is null then
			return extract (year from sysdate) - extract(year from crew_born);
		else 
			return extract (year from crew_datedied) - extract(year from crew_born);
		end if;
	end Age;
end;

/


create type Award_Type as object
(
    award_type varchar(200),
    movie_ref REF Movie_Type,
    actor_ref REF Actor_Type,
    director_ref REF Director_Type,
    writer_ref REF Writer_Type,
    crew_ref REF Crew_Type
);

/

create table Award_Table of Award_Type object id system generated;

/

alter table Award_Table
add (scope for (movie_ref) is Movie_Table);

/

alter table Award_Table
add (scope for (actor_ref) is Actor_Table);

/

alter table Award_Table
add (scope for (director_ref) is Director_Table);

/

alter table Award_Table
add (scope for (writer_ref) is Writer_Table);

/

alter table Award_Table
add (scope for (crew_ref) is Crew_Table);



/*now the basic function of the tables has been completely built*/

/*I am trying to insert some data to tset my tables*/






