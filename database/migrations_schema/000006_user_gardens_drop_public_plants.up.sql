-- drop miss table public.plants, use reference.plants
alter table public.user_plants drop constraint if exists user_plants_id_plan_fk;
alter table public.user_tasks drop constraint if exists user_plants_id_plan_fk;
drop table if exists plants;

alter table public.user_plants add column garden_id bigint null;


-- сады пользователей
create table if not exists public.gardens (
	id bigint generated by default as identity primary key, -- идентификатор сада
    user_id bigint not null, -- идентификатор пользователя, владельца сада
	title varchar(512) not null, -- наименование сада
	description text null, -- описание сада
    -- location point null, -- координаты месторасположения сада, для возможных рекомендателньых систем и пр фич
    creator varchar(128) not null default current_user, -- пользователь, создавший запись
    created_at timestamptz not null default current_timestamp, -- дата-время создания записи
    modifier varchar(128) null, -- пользователь, внесший последние изменения
    modified_at timestamptz null, -- дата-время последних изменений
    constraint gardens_user_id_users_id_fk foreign key (user_id) references public.users(id_user) on delete cascade
);

-- column comments
comment on column public.gardens.id is 'garden identitfier';
comment on column public.gardens.user_id is 'user_id which is owner of the garden';
comment on column public.gardens.title is 'garden name';
comment on column public.gardens.description is 'garden description';
comment on column public.gardens.created_at is 'when record created';
comment on column public.gardens.creator is 'user, who created record';
comment on column public.gardens.modified_at is 'when record last updated';
comment on column public.gardens.modifier is 'user, who last updated record';