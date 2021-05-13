-- Блог растения пользователя
create table if not exists blogs(
	id_blog bigint generated by default as identity primary key,
	id_user bigint not null,
	id_user_plant bigint not null,
	name_blog varchar(25) not null,
	description text,
	created_at timestamp not null default current_timestamp,
	modified_at timestamp,
	-- constraints:
	constraint blogs_id_user_fk foreign key (id_user) references users (id_user) on
	delete cascade,
	constraint blogs_id_user_plant_fk foreign key (id_user_plant) references user_plants (id_user_plant) on
	delete cascade
);
-- Пост в блоге
create table if not exists posts(
	id_post bigint generated by default as identity primary key,
	id_blog bigint not null,
	text_post text not null,
	created_at timestamp not null default current_timestamp,
	modified_at timestamp,
	-- constraints:
	constraint posts_id_blog_fk foreign key (id_blog) references blogs (id_blog) on
	delete cascade
);