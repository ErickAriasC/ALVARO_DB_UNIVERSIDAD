create database db_universidad;
use db_universidad;

create table alumno (
id_alumno integer (10) primary key not null,
nif varchar(9) not null,
nombre  varchar (25)not null,
apellido1 varchar (50)not null,
apellido2 varchar (50)not null,
ciudad varchar (25)not null,
direccion varchar (50)not null,
telefono varchar (9)not null,
fecha_nacimiento date not null,
sexo enum ('H','M') not null
);
insert into alumno(id_alumno,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo) 
values(5,'e2e3e4e5e','mirian','ardila','martinez','putumayo','BARRI0 llanitos #13-19','123456789','2023-05-18',2);
select*from alumno;

#cambiar un valor agregado en sexo
update alumno 
set sexo=2
where id_alumno=2;

create table curso_escolar(
id_curso_escolar integer (10) primary key not null,
anyo_inicio year(4),
anyo_fin year (4)
);
insert into  curso_escolar (id_curso_escolar,anyo_inicio,anyo_fin) values (5,'2011','2017');
select*from curso_escolar;

create table grado(
id_grado integer (10) primary key not null,
nombre varchar (100)
);
insert into grado(id_grado,nombre) values (5,'EFUC');
select*from grado;

create table departamento (
id_departamento integer (10) primary key not null,
nombre varchar (50)
);
insert into departamento(id_departamento,nombre) values (5,'AGRONOMIA');
select*from departamento;

create table profesor (
id_profesor integer (10) primary key not null,
nif varchar(9) not null,
nombre  varchar (25)not null,
apellido1 varchar (50)not null,
apellido2 varchar (50)not null,
ciudad varchar (25)not null,
direccion varchar (50)not null,
telefono varchar (9)not null,
fecha_nacimiento date not null,
sexo enum ('H','M') not null,
id_departamento integer (10) not null,
foreign key (id_departamento)references departamento(id_departamento)
);
insert into profesor(id_profesor,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo,id_departamento) 
values(5,'k2k3k4k5k','angel','cordoba','tabares','medellin','BARRI0 huerta #13-19','123456789','1990-05-08',1,5);
select*from profesor;

create table asignatura (
id_asignatura integer (10) primary key not null,
nombre varchar (100) not null,
creditos float not null,
tipo enum('basica','obligatoria','optiva') not null,
curso tinyint (3)not null,
cuatrimenstre tinyint (3)not null,
id_profesor integer (10) not null,
foreign key(id_profesor)references profesor(id_profesor),
id_grado integer (10) not null,
foreign key (id_grado)references grado(id_grado)
);
insert into asignatura(id_asignatura,nombre,creditos,tipo,curso,cuatrimenstre,id_profesor,id_grado)values(5,'economia',1,1,17,2,4,1);
select*from asignatura;

create table alumno_se_matricula_asignatura(
id_alumno_se_matricula_asignatura integer (10) primary key not null,
id_alumno integer (10) not null,
foreign key (id_alumno)references alumno (id_alumno),
id_asignatura integer (10) not null,
foreign key (id_asignatura) references asignatura(id_asignatura),
id_curso_escolar integer (10) not null,
foreign key (id_curso_escolar)references curso_escolar(id_curso_escolar)
);
insert into alumno_se_matricula_asignatura(id_alumno_se_matricula_asignatura,id_alumno,id_asignatura,id_curso_escolar)values (5,1,2,2);
select*from alumno_se_matricula_asignatura;