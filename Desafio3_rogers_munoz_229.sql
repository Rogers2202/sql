create table usuarios (id SERIAL, email VARCHAR(50), nombre VARCHAR(50), apellido VARCHAR(50), rol VARCHAR ); ---Creacion tabla Usuarios

insert into usuarios (email, nombre, apellido, rol) 
values ('camila@gmail.com' ,'camila','perez', 'usuario');
insert into usuarios (email, nombre, apellido, rol) 						---Creacion de usuarios
values ('pamela@gmail.com' ,'pamela','sepulveda', 'administrador');
insert into usuarios (email, nombre, apellido, rol) 
values ('rogers@gmail.com' ,'rogers','manriquez', 'administrador');
insert into usuarios (email, nombre, apellido, rol) 
values ('fabian@gmail.com' ,'fabian','alvarez', 'usuario');
insert into usuarios (email, nombre, apellido, rol) 
values ('maximiliano@gmail.com' ,'maximiliano','gamboa', 'usuario');

select * from usuarios;
select * from posts
select * from comentarios;


create table posts (id serial, titulo VARCHAR(50), contenido text , fecha_creacion timestamp, fecha_actualizacion timestamp , destacado boolean , usuario_id bigint); 

insert into posts (titulo, contenido,fecha_creacion ,fecha_actualizacion,destacado, usuario_id ) 
values ('tendencia' ,'programacion','2020-05-25', '2023-11-20',true, 3);
insert into posts (titulo, contenido,fecha_creacion ,fecha_actualizacion,destacado, usuario_id )  					---- creacion tabla posts
values ('inteligencia artificial' ,'tecnologia','2021-07-15', '2025-01-06',true, 2);
insert into posts (titulo, contenido,fecha_creacion ,fecha_actualizacion,destacado, usuario_id ) 
values ('entrenamientos' ,'capacitacion','2018-12-29', '2024-10-01',false, 1);
insert into posts (titulo, contenido,fecha_creacion ,fecha_actualizacion,destacado, usuario_id ) 
values ('fotografia' ,'paisajismo','2024-09-21', '2025-01-20',false, 5);
insert into posts (titulo, contenido,fecha_creacion ,fecha_actualizacion,destacado, usuario_id ) 
values ('aprendizajes' ,'analisis','2022-10-30', '2024-04-16',false, null )

create table comentarios (id serial, contenido VARCHAR(50), fecha_creacion timestamp, usuario_id bigint , post_id bigint); 

insert into comentarios (contenido, fecha_creacion ,usuario_id , post_id ) 
values ('comentario destacado' ,'2024-11-20',1 , 1);
insert into comentarios (contenido, fecha_creacion ,usuario_id , post_id )               -----creacion tabla comentarios
values ('increible' ,'2025-01-20',2 , 1);
insert into comentarios (contenido, fecha_creacion ,usuario_id , post_id ) 
values ('lo mas rescatable' ,'2024-11-20',3 , 1);
insert into comentarios (contenido, fecha_creacion ,usuario_id , post_id ) 
values ('buen tacto con esto' ,'2025-01-28',1 , 2);
insert into comentarios (contenido, fecha_creacion ,usuario_id , post_id ) 
values ('podria mejorar' ,'2024-12-25',2 , 2);

------------ Requerimientos Pregunta 2----------------
select nombre, u.email, p.titulo , p.contenido  
from usuarios u 
inner join posts p 
on u.id = p.usuario_id ;
------------ Requerimientos Pregunta 3----------------
select u.id, p.titulo, p.contenido  
from usuarios u 
inner join posts p 
on u.id = p.usuario_id 
and u.rol = 'administrador';
------------ Requerimientos Pregunta 4----------------
select u.id, email, count (p.usuario_id ) as cantidad_post
from usuarios u
left join  posts p 
on u.id = p.usuario_id 
group by  u.id, email 
order by u.id;
------------ Requerimientos Pregunta 5----------------
select u.email 
from usuarios u 
inner join posts p 
on u.id = p.usuario_id 
group by u.email 
order by count (p.id) desc 
limit 1
;
------------ Requerimientos Pregunta 6----------------
select u.nombre ,max(p.fecha_creacion ) as ultimo_post
from usuarios u 
inner join posts p 
on  u.id = p.usuario_id
group by u.nombre 
order by ultimo_post desc
;
------------ Requerimientos Pregunta 7----------------
select  p.titulo ,p.contenido
from usuarios u 
inner join posts p  
on u.id = p.usuario_id 
inner join comentarios c 
on p.usuario_id = c.post_id
group by p.titulo, p.contenido
order by count(c.post_id ) desc
;

select * from usuarios;
select * from posts;
select * from comentarios;

------------ Requerimientos Pregunta 8----------------

select u.email,	p.titulo, p.contenido, c.contenido as Cont_comentarios
from posts p 
left join comentarios c 
on p.usuario_id = c.post_id
inner join usuarios u 
on c.post_id  = u.id 
group by u.email, p.titulo, p.contenido, c.contenido ;

------------ Requerimientos Pregunta 9----------------

select  distinct on (u.nombre) u.nombre,c.contenido, c.fecha_creacion
from usuarios u 
inner join comentarios c 
on u.id = c.usuario_id 
inner join (select usuario_id, max(fecha_creacion ) as ultima_fecha 
			from comentarios c group by usuario_id ) sub 
on c.usuario_id = sub.usuario_id  and  sub.ultima_fecha = c.fecha_creacion
order by u.nombre,  c.fecha_creacion desc; 

------------ Requerimientos Pregunta 10 ----------------

select u.email ,count(c.contenido ) as comentarios
from usuarios u 
left join comentarios c 
on u.id = c.usuario_id
group by u.email, c.usuario_id 
having c.usuario_id is null 
;















