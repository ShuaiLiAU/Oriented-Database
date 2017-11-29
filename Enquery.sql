drop view v_a_table;
drop view v_b_table;
drop view v_c_table;
drop view v_d_table;
drop view v_e_table;
drop view v_f_table;

---OMDB Queries

---5.1

select r.actor_ref.actor_name, r.role_name
from role_table r
where r.movie_ref.movie_title='Titanic'
order by role_crediorder;

---5.2

create view v_a_table (movie_title, director_name, genre_description, actor_name) as
select m.movie_title, a.director_ref.director_name, gen.genre_description, a.actor_ref.actor_name
from movie_table m, table(m.movie_genre) gen, award_table a
where m.movie_title=a.movie_ref.movie_title;

select distinct movie_title, director_name, genre_description
from v_a_table
where actor_name='Cate Blanchett';


---5.3
-----------(2017/10/21: Saturday)--------

create view v_b_table(movie_title, director_name, actor_name, Ratings, cinema_name, session_date) as
select m.movie_title, a.director_ref.director_name, a.actor_ref.actor_name, r.Ratings(), s.cinema_ref.cinema_name, s.session_date
from movie_table m, table(m.movie_review) r, award_table a, showtime_table s
where m.movie_title=a.movie_ref.movie_title and m.movie_title=s.movie_ref.movie_title;

select distinct movie_title, director_name, actor_name, Ratings
from v_B_table
where cinema_name='Verona' and session_date=to_date('2017/10/21','yyyy/mm/dd') ;

---5.4

create view v_c_table(cinema_name, movie_title, director_name, session_date, session_time) as
select s.cinema_ref.cinema_name, s.movie_ref.movie_title, a.director_ref.director_name, s.session_date, s.session_time
from showtime_table s, award_table a
where s.movie_ref.movie_title=a.movie_ref.movie_title;

select * from v_c_table
where movie_title='Wind River';


---5.5

select a.director_ref.director_name, a.actor_ref.actor_name, a.actor_ref.Age()
from award_table a
where a.director_ref.director_name = a.actor_ref.actor_name;


---5.6

select distinct a.director_ref.director_name, a.movie_ref.movie_title, a.movie_ref.movie_releasedate, a.award_type
from award_table a
where award_type='Best Director Academy Awards';


---5.7

select distinct a.movie_ref.movie_title, a.director_ref.director_name, r.Ratings()
from award_table a, movie_table m, table(m.movie_review) r
where a.award_type like '%Academy Awards%';

---5.8

create view v_d_table(movie_title, cinema_name, session_date, session_time, genre_description, Ratings) as
select m.movie_title, s.cinema_ref.cinema_name, s.session_date, s.session_time, g.genre_description, r.Ratings()
from movie_table m, table(m.movie_genre) g, table(m.movie_review) r, showtime_table s
where m.movie_title=s.movie_ref.movie_title;

select distinct movie_title, cinema_name, session_date, session_time
from v_d_table
where genre_description='Comedy' and Ratings > 4;

---5.9

create view v_e_table(movie_title,movie_storyline,director_name,genre_description) as
select m.movie_title,m.movie_storyline,a.director_ref.director_name,g.genre_description
from movie_table m, table(m.movie_genre) g, award_table a
where m.movie_title=a.movie_ref.movie_title;

select distinct movie_title,director_name
from v_e_table
where movie_storyline like '%satire%' and genre_description not like '%comedy%';

---5.10

-----(2017/10/22 is Sunday)----

create view v_f_table(movie_title, director_name, Ratings, session_date) as
select a.movie_ref.movie_title, a.director_ref.director_name, r.Ratings(), s.session_date
from award_table a, movie_table m, table(m.movie_review) r, showtime_table s
where m.movie_title = a.movie_ref.movie_title and m.movie_title = s.movie_ref.movie_title;

select distinct movie_title, director_name, Ratings
from v_f_table
where session_date=to_date('2017/10/22','yyyy/mm/dd') 
and Ratings = (select max(r.Ratings()) from movie_table m, table(m.movie_review) r);
