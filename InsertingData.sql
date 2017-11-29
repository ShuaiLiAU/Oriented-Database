
/*now i will populate data into tables*/


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into Cinema_Table*/

insert into Cinema_Table values ('Event Cinema',92737330,'505-525 George St, Sydney NSW 2000');
insert into Cinema_Table values ('Verona',293606099,'17 Oxford St, Paddington, NSW, 2021');
insert into Cinema_Table values ('IMAX',292737300,'505-525 George St, Sydney, NSW, 2000');
insert into Cinema_Table values ('HOYTS',90033820,'Broadway Shopping Centre, Level 2, Chippendale, 2008, NSW');
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                /*the FIRST Movie*/
/*insert into Movie_Table*/


insert into Movie_Table values ('3 Idiots','http://www.imdb.com/title/tt1187043/?ref_=nv_sr_1','170 min','Farhan Qureshi and Raju Rastogi want to re-unite with their fellow collegian, Rancho, after faking a stroke aboard an Air India plane, and excusing himself from his wife.','M',to_date('2009/12/24','yyyy/mm/dd'),
                   Review_Table(Review_Type('Cory Myer','I asked my co-workers to recommend a Bollywood movie. I expected "Dumb and Dumber" by the title. It wasn not that at all. It is more of an inspirational comedy with some serious but good messages. A more accurate title would have been "The Legend of Rancho".',9,to_date('2011/11/20','yyyy/mm/dd'),'www.imdb.com'),
                                Review_Type('Naman Kapur ','"Whatever the problem in life is... just say to yourself "Aal Izz Well".. This wont solve your problems but it will give the courage to face it.." "Chase Excellence and success will follow".. " Life is not about getting marks, grades but chasing your dreams".. These are the golden rules which 3 IDIOTS teaches you in a very light and entertaining way.. The movie makes you laugh and in the process you learn many golden rules which can alter your life in a big manner...',9,to_date('2011/11/24','yyyy/mm/dd'),'www.imdb.com')),
                   Genre_Table(Genre_Type('Adventure'),
                               Genre_Type('Comedy')));
				   
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
				   
/*insert into Person_Table and its sub-tables*/

/*for Actor_Table*/

insert into Actor_Table values ('Aamir Khan',to_date('1966/03/14','yyyy/mm/dd'),'Bombay',null);
insert into Actor_Table values ('Kareena Khan',to_date('1980/09/21','yyyy/mm/dd'),'Mumbai',null);
insert into Actor_Table values ('Boman Irani',to_date('1959/12/02','yyyy/mm/dd'),'Bombay',null);

/*for Director_Table*/

insert into Director_Table values ('Rajkumar Hirani',to_date('1962/11/20','yyyy/mm/dd'),'Nagpur',null,(select ref(a) from Movie_Table a where a.movie_title='3 Idiots'));

/*for Writer_Table*/

insert into Writer_Table values ('Chetan Bhagat',to_date('1974/04/22','yyyy/mm/dd'),'New Delhi',null,(select ref(a) from Movie_Table a where a.movie_title='3 Idiots'));

/*for Crew_Table*/

insert into Crew_Table values ('Biography',to_date('1965/12/05','yyyy/mm/dd'),'London',null);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
			
/*for Role_Table*/

insert into Role_Table values ('Rancho',1,(select ref(a) from Actor_Table a where a.Actor_name='Aamir Khan'), (select ref(b) from Movie_Table b where b.movie_title='3 Idiots'));
insert into Role_Table values ('Pia',2,(select ref(a) from Actor_Table a where a.Actor_name='Kareena Khan'), (select ref(b) from Movie_Table b where b.movie_title='3 Idiots'));			
insert into Role_Table values ('Viru',3,(select ref(a) from Actor_Table a where a.Actor_name='Boman Irani'), (select ref(b) from Movie_Table b where b.movie_title='3 Idiots'));			
					   

/* for Job_Table*/

insert into Job_Table values ('fashion designer',(select ref(a) from Crew_Table a where a.Crew_name='Biography'),(select ref(b) from Movie_Table b where b.movie_title='3 Idiots'));

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into Award_Table*/

insert into Award_Table values ('Best Actor (Bollywood)',
(select ref(a) from Movie_Table a where a.movie_title='3 Idiots'),
(select ref(b) from Actor_Table b where b.Actor_name='Aamir Khan'),
(select ref(c) from Director_Table c where c.Director_name='Rajkumar Hirani'),
(select ref(d) from Writer_Table d where d.Writer_name='Chetan Bhagat'),
(select ref(e) from Crew_Table e where e.Crew_name='Biography')
);

/*the Actor_Type vary as context*/


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into ShowTime_Table*/

insert into ShowTime_Table values (to_date('2017/10/04','yyyy/mm/dd'),'12:15 pm',(select ref(a) from Movie_Table a where a.movie_title='3 Idiots'),(select ref(b) from Cinema_Table b where b.cinema_name='Event Cinema'));

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                /*the Second Movie*/
/*insert into Movie_Table*/


insert into Movie_Table values ('Jobs','http://www.imdb.com/title/tt2357129/?ref_=fn_al_tt_2','128 min','"The story of Steve Jobs" ascension from college dropout into one of the most revered creative entrepreneurs of the 20th century.','PG-13',to_date('2013/08/29','yyyy/mm/dd'),
				   Review_Table(Review_Type('mcelroyronald','Steve Jobs isn not a nice guy... he uses people like they are toilet paper... and he is a taker. It is a great set-up for a slammin movie. Unfortunitely, this movie seems incomplete and without heart. More accurately, most of the scenes seem incomplete, disjointed and pointless. It all adds up to nothing.','3',to_date('2013/08/15','yyyy/mm/dd'),'www.imdb.com'),
				   				Review_Type('oalhinnawi','This Feelgood tragedy of the century isn not worth your money. Why the hell did they even make this movie in the first place!? Were there not enough documentaries and TV shows about Apple and Steve Jobs!? Did we really need a butchered version featuring Ashton Kutcher.','5',to_date('2013/08/16','yyyy/mm/dd'),'www.imdb.com')),
				   Genre_Table(Genre_Type('Biography'),
				   			   Genre_Type('Drama')));
				   
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
				   
/*insert into Person_Table and its sub-tables*/

/*for Actor_Table*/

insert into Actor_Table values ('Ashton Kutcher',to_date('1978/02/07','yyyy/mm/dd'),' Cedar Rapids',null);            
insert into Actor_Table values ('Josh Gad',to_date('1981/02/23','yyyy/mm/dd'),' Hollywood',null);                     


/*for Director_Table*/

insert into Director_Table values ('Joshua Michael Stern',to_date('1961/01/12','yyyy/mm/dd'),null,null,(select ref(a) from Movie_Table a where a.movie_title='Jobs'));


/*for Writer_Table*/

insert into Writer_Table values ('Matt Whiteley',null,null,null,(select ref(a) from Movie_Table a where a.movie_title='Jobs'));

/*for Crew_Table*/

insert into Crew_Table values ('John Debney',to_date('1956/08/18','yyyy/mm/dd'),'Glendale',null);                    


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
			
/*for Role_Table*/


insert into Role_Table values ('Steve Jobs',1,(select ref(a) from Actor_Table a where a.Actor_name='Ashton Kutcher'), (select ref(b) from Movie_Table b where b.movie_title='Jobs'));
insert into Role_Table values ('Steve Wozniak',2,(select ref(a) from Actor_Table a where a.Actor_name='Josh Gad'), (select ref(b) from Movie_Table b where b.movie_title='Jobs'));

				   

/* for Job_Table*/

insert into Job_Table values ('Provide music support',(select ref(a) from Crew_Table a where a.Crew_name='John Debney'),(select ref(b) from Movie_Table b where b.movie_title='Jobs'));

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into Award_Table*/

insert into Award_Table values (null,
(select ref(a) from Movie_Table a where a.movie_title='Jobs'),
(select ref(b) from Actor_Table b where b.Actor_name='Ashton Kutcher'),
(select ref(c) from Director_Table c where c.Director_name='Joshua Michael Stern'),
(select ref(d) from Writer_Table d where d.Writer_name='Matt Whiteley'),
(select ref(e) from Crew_Table e where e.Crew_name='John Debney')
);

/*the Actor_Type vary as context*/




----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into ShowTime_Table*/

insert into ShowTime_Table values (to_date('2016/11/02','yyyy/mm/dd'),'13:20 pm',(select ref(a) from Movie_Table a where a.movie_title='Jobs'),(select ref(b) from Cinema_Table b where b.cinema_name='HOYTS'));

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                /*the Third Movie*/
/*insert into Movie_Table*/


insert into Movie_Table values ('Titanic','http://www.imdb.com/title/tt0120338/externalsites?ref_=tt_ql_dt_3','194 min','84 years later, a 100 year-old woman named Rose DeWitt Bukater tells the story to her granddaughter Lizzy Calvert, Brock Lovett, Lewis Bodine, Bobby Buell and Anatoly Mikailavich on the Keldysh about her life set in April 10th 1912, on a ship called Titanic when young Rose boards the departing ship with the upper-class passengers and her mother, Ruth DeWitt Bukater, and her fiancé, Caledon Hockley. Meanwhile, a drifter and artist named Jack Dawson and his best friend Fabrizio De Rossi win third-class tickets to the ship in a game. And she explains the whole story from departure until the death of Titanic on its first and last voyage April 15th, 1912 at 2:20 in the morning.>','M',to_date('1998/04/03','yyyy/mm/dd'),
				   Review_Table(Review_Type('Boyo-2','This movie re-wrote film history in every way. No one cares what anyone thinks about this movie, because it transcends criticism. Every flaw in the movie is easily overcome by the many amazing things the movie has going for it. It is an extremely beautiful movie, and I doubt many of us will see anything like it again. I have seen it more times than I care to count, and I still become transfixed every time, with a feeling which is hard to describe. One for the ages.','10',to_date('1998/07/30','yyyy/mm/dd'),'http://www.imdb.com/title/tt0120338/reviews?ref_=tt_urv'),
				   				Review_Type('sddavis63','I avoided watching this film for the longest time. Long before it was even released I had dismissed it as an over-hyped, over-blown, overly romanticized piece of Hollywood schmaltz, and I wanted nothing to do with it. I never watched it in the theatre. I shook my head in disbelief at the 11 Academy Awards - even though I had never seen it. Then I was asked to be a judge at a high school public speaking contest. One of the girls spoke about this movie. "It was so great," she said. "You really felt like you were on the ship." "Nonsense," I thought. I shared my feelings with my fellow judges. One looked at me and said, "you might be right, but if she liked the movie that much maybe shell want to learn more about the real Titanic. The movie must have done something right to get her so interested." "Well, maybe," thought I. Then it finally appeared on Pay TV. "OK," I thought, "Ill give it a look see." I didnt want to like it - and I didnt. I loved it! What a great movie.','9',to_date('2002/11/16','yyyy/mm/dd'),'http://www.imdb.com/title/tt0120338/reviews?ref_=tt_urv')),
				   Genre_Table(Genre_Type('Drama'),
				   			   Genre_Type('Romance')));
				   
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
				   
/*insert into Person_Table and its sub-tables*/

/*for Actor_Table*/

insert into Actor_Table values ('Leonardo DiCaprio',to_date('1974/11/11','yyyy/mm/dd'),' Hollywood Los Angeles California, USA',null);
insert into Actor_Table values ('Kate Winslet',to_date('1975/10/5','yyyy/mm/dd'),' Reading, Berkshire, England, UK',null);


/*for Director_Table*/

insert into Director_Table values ('James Cameron',to_date('1954/08/16','yyyy/mm/dd'),'Kapuskasing, Ontario, Canada',null,(select ref(a) from Movie_Table a where a.movie_title='Titanic'));


/*for Writer_Table*/

insert into Writer_Table values ('James Cameron',to_date('1954/08/16','yyyy/mm/dd'),'Kapuskasing, Ontario, Canada',null,(select ref(a) from Movie_Table a where a.movie_title='Titanic'));

/*for Crew_Table*/

insert into Crew_Table values ('James Horner',to_date('1953/08/14','yyyy/mm/dd'),'Santa Barbara County, California, USA',null);


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
			
/*for Role_Table*/

insert into Role_Table values ('Jack Dawson',1,(select ref(a) from Actor_Table a where a.Actor_name='Leonardo DiCaprio'), (select ref(b) from Movie_Table b where b.movie_title='Titanic'));
insert into Role_Table values ('Rose Dewitt Bukater',2,(select ref(a) from Actor_Table a where a.Actor_name='Kate Winslet'), (select ref(b) from Movie_Table b where b.movie_title='Titanic'));			
					   

/* for Job_Table*/

insert into Job_Table values ('Provide music support',(select ref(a) from Crew_Table a where a.Crew_name='James Horner'),(select ref(b) from Movie_Table b where b.movie_title='Titanic'));

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*insert into Award_Table*/


insert into Award_Table values ('Best Director Academy Awards',
(select ref(a) from Movie_Table a where a.movie_title='Titanic'),
(select ref(b) from Actor_Table b where b.Actor_name='Leonardo DiCaprio'),
(select ref(c) from Director_Table c where c.Director_name='James Cameron'),
(select ref(d) from Writer_Table d where d.Writer_name='James Cameron'),
(select ref(e) from Crew_Table e where e.Crew_name='James Horner')
);


insert into Award_Table values ('Best Music Original Song Academy Awards',
(select ref(a) from Movie_Table a where a.movie_title='Titanic'),
(select ref(b) from Actor_Table b where b.Actor_name='Leonardo DiCaprio'),
(select ref(c) from Director_Table c where c.Director_name='James Cameron'),
(select ref(d) from Writer_Table d where d.Writer_name='James Cameron'),
(select ref(e) from Crew_Table e where e.Crew_name='James Horner')
);


/*the Actor_Type vary as context*/


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into ShowTime_Table*/

insert into ShowTime_Table values (to_date('2017-10-21','yyyy/mm/dd'),'18:00',(select ref(a) from Movie_Table a where a.movie_title='Titanic'),(select ref(b) from Cinema_Table b where b.cinema_name='Verona'));

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                /*the Fourth Movie*/
/*insert into Movie_Table*/


insert into Movie_Table values ('The Curious Case of Benjamin Button','http://www.imdb.com/title/tt0421715/externalsites?ref_=tt_ql_dt_3','166 min','On the day that Hurricane Katrina hits New Orleans, elderly Daisy Williams (nee Fuller) is on her deathbed in a New Orleans hospital. At her side is her adult daughter, Caroline. Daisy asks Caroline to read to her aloud the diary of Daisys lifelong friend, Benjamin Button>','M',to_date('2008/11/26','yyyy/mm/dd'),
				   Review_Table(Review_Type('male_j08','I had been awaiting to see this movie for some time. Alas, it was Christmas Day and you bet I was there to see the movie on opening day. I set my expectations really high on this film. ','8',to_date('2008/12/25','yyyy/mm/dd'),'http://www.imdb.com/title/tt0421715/reviews?ref_=tt_urv'),
				   				Review_Type('h-rabbit','This film is worthy of a 10 rating simply because of its imaginative and complex nature, I mean, I couldnt bring myself to know why this simple idea of a man aging backwards hadnt sprouted up before.','10',to_date('2002/11/16','yyyy/mm/dd'),'http://www.imdb.com/title/tt0421715/reviews?ref_=tt_urv')),
				   Genre_Table(Genre_Type('Drama'),
				   			   Genre_Type('Romance'),
							   Genre_Type('Romance')));
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				   
				   /*insert into Person_Table and its sub-tables*/

/*for Actor_Table*/

insert into Actor_Table values ('Brad Pitt',to_date('1963/11/18','yyyy/mm/dd'),'Shawnee, Oklahoma, USA',null);
insert into Actor_Table values ('Cate Blanchett',to_date('1969/04/14','yyyy/mm/dd'),' Melbourne, Victoria, Australia',null);


/*for Director_Table*/

insert into Director_Table values ('David Fincher',to_date('1962/08/28','yyyy/mm/dd'),'Denver, Colorado, USA',null,(select ref(a) from Movie_Table a where a.movie_title='The Curious Case of Benjamin Button'));


/*for Writer_Table*/

insert into Writer_Table values ('Eric Roth',to_date('1945/03/22','yyyy/mm/dd'),'New York City, New York, USA',null,(select ref(a) from Movie_Table a where a.movie_title='The Curious Case of Benjamin Button'));

/*for Crew_Table*/

insert into Crew_Table values ('Alexandre Desplat',to_date('1961/08/23','yyyy/mm/dd'),'Paris, Île-de-France, France, California, USA',null);
insert into Crew_Table values ('Greg Cannom',null,'USA',null);
insert into Crew_Table values ('Donald Graham Burt',null,null,null);
	   
				   
				   
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
			
/*for Role_Table*/

insert into Role_Table values ('Benjamin Button',1,(select ref(a) from Actor_Table a where a.Actor_name='Brad Pitt'), (select ref(b) from Movie_Table b where b.movie_title='The Curious Case of Benjamin Button'));
insert into Role_Table values ('Daisy',2,(select ref(a) from Actor_Table a where a.Actor_name='Cate Blanchett'), (select ref(b) from Movie_Table b where b.movie_title='The Curious Case of Benjamin Button'));			
					   

/* for Job_Table*/

insert into Job_Table values ('Provide music support',(select ref(a) from Crew_Table a where a.Crew_name='Alexandre Desplat'),(select ref(b) from Movie_Table b where b.movie_title='The Curious Case of Benjamin Button'));
insert into Job_Table values ('special makeup creator and applicator',(select ref(a) from Crew_Table a where a.Crew_name='Greg Cannom'),(select ref(b) from Movie_Table b where b.movie_title='The Curious Case of Benjamin Button'));
insert into Job_Table values ('Production Design',(select ref(a) from Crew_Table a where a.Crew_name='Donald Graham Burt'),(select ref(a) from Movie_Table a where a.movie_title='The Curious Case of Benjamin Button'));

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into Award_Table*/

insert into Award_Table values ('Best Achievement in Makeup Academy Awards',
(select ref(a) from Movie_Table a where a.movie_title='The Curious Case of Benjamin Button'),
(select ref(b) from Actor_Table b where b.Actor_name='Cate Blanchett'),
(select ref(c) from Director_Table c where c.Director_name='David Fincher'),
(select ref(d) from Writer_Table d where d.Writer_name='Eric Roth'),
(select ref(e) from Crew_Table e where e.Crew_name='Greg Cannom')
);


insert into Award_Table values ('Best Achievement in Art Direction',
(select ref(a) from Movie_Table a where a.movie_title='The Curious Case of Benjamin Button'),
(select ref(b) from Actor_Table b where b.Actor_name='Cate Blanchett'),
(select ref(c) from Director_Table c where c.Director_name='David Fincher'),
(select ref(d) from Writer_Table d where d.Writer_name='Eric Roth'),
(select ref(e) from Crew_Table e where e.Crew_name='Donald Graham Burt')
);


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into ShowTime_Table*/

insert into ShowTime_Table values (to_date('2017/10/22','yyyy/mm/dd'),'13:00',(select ref(a) from Movie_Table a where a.movie_title='The Curious Case of Benjamin Button'),(select ref(b) from Cinema_Table b where b.cinema_name='IMAX'));

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                /*the Fifth Movie*/
/*insert into Movie_Table*/


insert into Movie_Table values ('Wind River','http://www.imdb.com/title/tt5362988/?ref_=nv_sr_1','107min','A veteran tracker with the Fish and Wildlife Service helps to investigate the murder of a young Native American woman, and uses the case as a means of seeking redemption for an earlier act of irresponsibility which ended in tragedy.','MA15+',to_date('2017/08/10','yyyy/mm/dd'),
				   Review_Table(Review_Type('Troy_Campbell ',' There has been next to no fanfare for the release of this murder mystery. Which is surprising, considering the talent involved in front of the camera (Jeremy Renner, Elizabeth Olsen) and behind it (writer-director Taylor Sheridan). ','9',to_date('2017/08/11','yyyy/mm/dd'),'http://www.imdb.com/title/tt5362988/reviews?ref_=tt_urv'),
				   				Review_Type('wlk68','I was lucky enough to see this at the Nantucket Film Festival back in June and I thought it was excellent. And based on the response of the people around me in the packed theater, I wasnt the only one. The applause at the end was loud and long. The movie ended up coming in second at the festival, right behind behind The Big Sick.','10',to_date('201706/23','yyyy/mm/dd'),'http://www.imdb.com/title/tt5362988/reviews?ref_=tt_urv')),
				   Genre_Table(Genre_Type('Drama'),
				   			   Genre_Type('Crime'),
							   Genre_Type('Mystery')));
				   
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
				   
/*insert into Person_Table and its sub-tables*/

/*for Actor_Table*/

insert into Actor_Table values ('Kelsey Asbille',to_date('1991/09/09','yyyy/mm/dd'),'Columbia, South Carolina, USA',null);  
insert into Actor_Table values ('Jeremy Renner',to_date('1971/01/07','yyyy/mm/dd'),' Modesto, California, USA',null);       


/*for Director_Table*/

insert into Director_Table values ('Taylor Sheridan',to_date('1970/05/21','yyyy/mm/dd'),'Cranfills Gap, Texas, U.S.',null,(select ref(a) from Movie_Table a where a.movie_title='Wind River'));


/*for Writer_Table*/

insert into Writer_Table values ('Taylor Sheridan',to_date('1970/05/21','yyyy/mm/dd'),'Cranfills Gap, Texas, U.S.',null,(select ref(a) from Movie_Table a where a.movie_title='Wind River'));

/*for Crew_Table*/

insert into Crew_Table values ('Nick Cave',to_date('1957/09/22','yyyy/mm/dd'),'Warracknabeal, Victoria, Australia',null); 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
			
/*for Role_Table*/

insert into Role_Table values ('Natalie',1,(select ref(a) from Actor_Table a where a.Actor_name='Kelsey Asbille'), (select ref(b) from Movie_Table b where b.movie_title='Wind River'));
insert into Role_Table values ('Cory Lambert',2,(select ref(a) from Actor_Table a where a.Actor_name='Jeremy Renner'), (select ref(b) from Movie_Table b where b.movie_title='Wind River'));					   

/* for Job_Table*/

insert into Job_Table values ('Provide music support',(select ref(a) from Crew_Table a where a.Crew_name='Nick Cave'),(select ref(b) from Movie_Table b where b.movie_title='Wind River'));
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into Award_Table*/

insert into Award_Table values ('Best Director Cannes Film Festival',
(select ref(a) from Movie_Table a where a.movie_title='Wind River'),
(select ref(b) from Actor_Table b where b.Actor_name='Kelsey Asbille'),
(select ref(c) from Director_Table c where c.Director_name='Taylor Sheridan'),
(select ref(d) from Writer_Table d where d.Writer_name='Taylor Sheridan'),
(select ref(e) from Crew_Table e where e.Crew_name='Nick Cave')
);

/*the Actor_Type vary as context*/

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into ShowTime_Table*/

insert into ShowTime_Table values (to_date('2017/10/22','yyyy/mm/dd'),'16:00',(select ref(a) from Movie_Table a where a.movie_title='Wind River'),(select ref(b) from Cinema_Table b where b.cinema_name='IMAX'));

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                /*the Sixth Movie*/
/*insert into Movie_Table*/


insert into Movie_Table values ('Spider-Man Homecoming','http://www.imdb.com/title/tt2250912/','133min','satire.Thrilled by his experience with the Avengers, Peter returns home, where he lives with his Aunt May, under the watchful eye of his new mentor Tony Stark, Peter tries to fall back into his normal daily routine - distracted by thoughts of proving himself to be more than just your friendly neighborhood Spider-Man - but when the Vulture emerges as a new villain, everything that Peter holds most important will be threatened.','M',to_date('2017/09/08','yyyy/mm/dd'),
				   Review_Table(Review_Type('Eric Jones','This is what I was afraid of when Disney took over marvel,it should have been called Spider-Man,high school musical ,I know it,s comic-book movie ,but we came a long way to show that comics are not just for kids ,but this sets us back ,none of the characters are like they are in the comics ,Peter was a nerdy school kid but not like this ,flash was a big school bully ,but this flash is a wimp ,my grandmother could take him ,and aunt May is a hottie in this movie ,not the old caring aunt of the comics ,why ,why ,hope this is not a trend ,the suits sucks too.i know they are trying to hit a new up to date audience ,but really.good graphics and action but lame characters and story .guess I,m just getting old .','1',to_date('2017/07/25','yyyy/mm/dd'),'http://www.imdb.com/title/tt2250912/reviews?ref_=tt_urv'),
				   				Review_Type('sundevilemily','I saw Spider-Man Homecoming on the opening night of the movie,and its my favorite Spider Man movie since the 2nd Spider Man movie from the original series.Tom Holland who plays as Spider Man in the Marvel Cinematic Universe does a terrific job on being passed the mantle of playing Spider Man.Michael Keaton also does a great job as playing as the main bad guy of the movie Vulture.The new take on Spider Man of not being dark and gritty its nice to see for a change.And I have a feeling that Tom Holland will keep impressing me on his performance as Spider Man in future Marvel movies.','10',to_date('2017/07/09','yyyy/mm/dd'),'http://www.imdb.com/title/tt2250912/reviews?ref_=tt_urv')),
				   Genre_Table(Genre_Type('Drama'),
				   			   Genre_Type('Romance'),
							   Genre_Type('Romance')));
				   
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
				   
/*insert into Person_Table and its sub-tables*/

/*for Actor_Table*/

insert into Actor_Table values ('Tom Holland',to_date('1996/06/01','yyyy/mm/dd'),' Kingston upon Thames, England, UK',null);     
insert into Actor_Table values ('Michael Keaton',to_date('1951/09/05','yyyy/mm/dd'),' Coraopolis, Pennsylvania, USA',null);      


/*for Director_Table*/

insert into Director_Table values ('Jon Watts',to_date('1981/06/28','yyyy/mm/dd'),'Fountain, Colorado, USA',null,(select ref(a) from Movie_Table a where a.movie_title='Spider-Man Homecoming'));


/*for Writer_Table*/

insert into Writer_Table values ('John Francis Daley',to_date('1985/07/20','yyyy/mm/dd'),'Wheeling, Illinois, USA',null,(select ref(a) from Movie_Table a where a.movie_title='Spider-Man Homecoming'));

/*for Crew_Table*/

insert into Crew_Table values ('Michael Giacchino',to_date('1967/10/10','yyyy/mm/dd'),' Riverside, New Jersey, USA',null);         

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
			
/*for Role_Table*/

insert into Role_Table values ('Peter Parker',1,(select ref(a) from Actor_Table a where a.Actor_name='Tom Holland'), (select ref(b) from Movie_Table b where b.movie_title='Spider-Man Homecoming'));
insert into Role_Table values ('Adrian Toomes',2,(select ref(a) from Actor_Table a where a.Actor_name='Michael Keaton'), (select ref(b) from Movie_Table b where b.movie_title='Spider-Man Homecoming'));			
					   

/* for Job_Table*/

insert into Job_Table values ('Provide music support',(select ref(a) from Crew_Table a where a.Crew_name='Michael Giacchino'),(select ref(b) from Movie_Table b where b.movie_title='Spider-Man Homecoming'));

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into Award_Table*/

insert into Award_Table values (null,
(select ref(a) from Movie_Table a where a.movie_title='Spider-Man Homecoming'),
(select ref(b) from Actor_Table b where b.Actor_name='Tom Holland'),
(select ref(c) from Director_Table c where c.Director_name='Jon Watts'),
(select ref(d) from Writer_Table d where d.Writer_name='John Francis Daley'),
(select ref(e) from Crew_Table e where e.Crew_name='Michael Giacchino')
);

/*the Actor_Type vary as context*/

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into ShowTime_Table*/

insert into ShowTime_Table values (to_date('2017/10/21','yyyy/mm/dd'),'17:00',(select ref(a) from Movie_Table a where a.movie_title='Spider-Man Homecoming'),(select ref(b) from Cinema_Table b where b.cinema_name='Event Cinema'));

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                /*the Seventh Movie*/
/*insert into Movie_Table*/


insert into Movie_Table values ('Ambavi Suramis tsikhitsa','http://www.imdb.com/title/tt0087606/fullcredits?ref_=tt_ql_1','88min','A film version of a well-known Georgian folk-tale. A young boy has to be immured into the walls of a fortress in order to stop it from crumbling to pieces.',null,to_date('1986/04/01','yyyy/mm/dd'),
				   Review_Table(Review_Type('Okada_Toru','Paradjanov made four films for which he is best known: Shadows Of Forgotten Ancestors and Color Of Pomegranates in the sixties; Legend Of Surami Fortress and Ashik Kerib in the eighties. In case you dont already know, between the sixties and the eighties he spent over a decade in a Soviet prison. I find this to be the strongest and most hypnotic one of the bunch, made soon after his release. One should take advantage of any opportunity to see these on the big screen.','10',to_date('2003/11/26','yyyy/mm/dd'),'http://www.imdb.com/title/tt0087606/reviews?ref_=tt_urv')),
				   			
				   Genre_Table(Genre_Type('Drama')));
				   
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
				   
/*insert into Person_Table and its sub-tables*/

/*for Actor_Table*/

insert into Actor_Table values ('Dodo Abashidze',to_date('1924/05/01','yyyy/mm/dd'),'Tiflis, Transcaucasian SFSR, USSR',to_date('1990/01/26','yyyy/mm/dd'));    


/*for Director_Table*/

insert into Director_Table values ('Dodo Abashidze',to_date('1924/05/01','yyyy/mm/dd'),'Tiflis, Transcaucasian SFSR, USSR',to_date('1990/01/26','yyyy/mm/dd'),(select ref(a) from Movie_Table a where a.movie_title='Ambavi Suramis tsikhitsa'));


/*for Writer_Table*/

insert into Writer_Table values ('Daniel Chonqadze',to_date('1830/03/18','yyyy/mm/dd'),'Kvavili, Georgia, Russian Empire',to_date('1880/06/29','yyyy/mm/dd'),(select ref(a) from Movie_Table a where a.movie_title='Ambavi Suramis tsikhitsa'));

/*for Crew_Table*/

insert into Crew_Table values ('Jansug Kakhidze',to_date('1936/05/26','yyyy/mm/dd'),'Tbilisi, Georgia, USSR',to_date('2002/03/07','yyyy/mm/dd'));           


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
			
/*for Role_Table*/

insert into Role_Table values ('Osman-Agha',1,(select ref(a) from Actor_Table a where a.Actor_name='Dodo Abashidze'), (select ref(b) from Movie_Table b where b.movie_title='Ambavi Suramis tsikhitsa'));
			   

/* for Job_Table*/

insert into Job_Table values ('Provide music support',(select ref(a) from Crew_Table a where a.Crew_name='Jansug Kakhidze'),(select ref(b) from Movie_Table b where b.movie_title='Ambavi Suramis tsikhitsa'));

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into Award_Table*/

insert into Award_Table values ('Best Director Sitges Catalonian International Film Festival',
(select ref(a) from Movie_Table a where a.movie_title='Ambavi Suramis tsikhitsa'),
(select ref(b) from Actor_Table b where b.Actor_name='Dodo Abashidze'),
(select ref(c) from Director_Table c where c.Director_name='Dodo Abashidze'),
(select ref(d) from Writer_Table d where d.Writer_name='Daniel Chonqadze'),
(select ref(e) from Crew_Table e where e.Crew_name='Jansug Kakhidze')
);


/*the Actor_Type vary as context*/

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*insert into ShowTime_Table*/

insert into ShowTime_Table values (to_date('2017/10/27','yyyy/mm/dd'),'19:00',(select ref(a) from Movie_Table a where a.movie_title='Ambavi Suramis tsikhitsa'),(select ref(b) from Cinema_Table b where b.cinema_name='HOYTS'));

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

