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

create table curso_escolar(
id_curso_escolar integer (10) primary key not null,
anyo_inicio year(4),
anyo_fin year (4)
);

create table grado(
id_grado integer (10) primary key not null,
nombre varchar (100)
);
create table departamento (
id_departamento integer (10) primary key not null,
nombre varchar (50)
);

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

create table alumno_se_matricula_asignatura(
id_alumno_se_matricula_asignatura integer (10) primary key not null,
id_alumno integer (10) not null,
foreign key (id_alumno)references alumno (id_alumno),
id_asignatura integer (10) not null,
foreign key (id_asignatura) references asignatura(id_asignatura),
id_curso_escolar integer (10) not null,
foreign key (id_curso_escolar)references curso_escolar(id_curso_escolar)
);

