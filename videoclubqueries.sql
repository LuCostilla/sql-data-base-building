#add primary key and alter tables categories, old_data

select*
from categories;

alter table categories
add primary key(category_id);

alter table old_data
add foreign key (category_id) references categories(category_id);

-- alter table old_data
-- drop constraint old_data_ibfk_1;


#add primary key in actors and alter tables old_data


SET SQL_SAFE_UPDATES = 0;

alter table actors
drop primary key;

alter table actors modify `Full Name` varchar(100);

alter table old_data modify `Full Name` varchar(100);

alter table actors
add primary key(`Full Name`);

delete actors
from actors
where `Full Name` = ("SUSANDAVIS");

alter table old_data
add foreign key (`Full Name`) references actors(`Full Name`);

#add primary key in films (title) and alter tables old_data (title)

alter table films modify `title` varchar(100);
alter table old_data modify `title` varchar(100);


alter table films
add primary key(title);

alter table old_data
add foreign key (title) references films(title);


#add primary key in languages (language_id) and alter tables films (language_id)

alter table languages modify language_id varchar(100);
alter table films modify language_id varchar(100);

alter table languages
add primary key(language_id);

alter table films
add foreign key (language_id) references languages(language_id);


--  ------------------------------------------------------------------------- -- 
 -- 1 select film with title "AFRICAN EGG" with description, film_id and language_id
 
 select title, film_id, description, language_id
 from  films
 where title = 'AFRICAN EGG' ;
 
 -- 2) select films that " PENELOPEGUINESS " did, with FULLNAME, title)

select actors.`Full Name`, title
from  old_data

left join actors
on old_data.`Full Name` = actors.`Full Name`

where actors.`Full Name` = "PENELOPEGUINESS";

 -- 3) hacer un tabla temporal de query 2 select films that " PENELOPEGUINESS " actor did, with category_id and  (FULLNAME, category_id, title)

create temporary table temp1 as (select actors.`Full Name`, title
from  old_data

left join actors
on old_data.`Full Name` = actors.`Full Name`

where actors.`Full Name` = "PENELOPEGUINESS");

select* from temp1;

 -- 4) hacer inner join con category id y titulo de genre "Action" )

select old_data.title, categories.genre, old_data.`Full Name`
from  old_data

inner join categories
on old_data.category_id = categories.category_id

where categories.genre = "Action";

-- 5) hacer un inner join y un left join con category id y peliculas filtradas por rating R)

select films.title,`length`, rating
from  old_data

inner join categories
on old_data.category_id = categories.category_id

left join films
 on films.title = old_data.title
 
 where films.rating = "R" ;



