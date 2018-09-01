/* CONFIGURACION:
 * el nombre de la tabla sera impuesta en  plural y con el prefijo "t_".
 * los nombres de las claves primarias para las tablas seran en singular y con el prefijo "pk_".
 * las tablas de tipo relacion tendran el prefijo "rel_" y el nombre de las tablas relacionadas separadas por "_"
 * los nombre de las claves externas seran llamadas junto al prefijo "fk_" y el nombre de la llave en singular
 *
 * las sequencias tendran el prefijo "seq_" y el nombre de la tabla sin el prefijo de esta.
*/


create table trentino.t_usuarios(
	dni char(8) not null,
	email varchar(200) not null,
	contrasegna varchar(200) not null,
	suscriptcion date not null,
	activo boolean default false not null,
	id_rol integer not null,
	constraint pk_usuario primary key(dni),
	constraint fk_rol foreign key(id_rol) references trentino.t_roles(id)
)

create table trentino.t_roles(
	id integer not null,
	nombre varchar(50) not null,
	descripcion varchar(200),
	constraint pk_rol primary key(id)
)

create sequence trentino.seq_roles start with 1 increment by 1 maxvalue 50;

create table trentino.t_funcionalidades(
	id integer not null,
	nombre varchar(50) not null,
	descripcion varchar(200),
	constraint pk_funcionalidad primary key(id)
)
create sequence trentino.seq_funcionalidades start with 1 increment by 1 maxvalue 200;

create table trentino.rel_roles_funcionalidades(
  id_rol integer not null,
  id_funcionalidad integer not null,
  constraint pk_rol_funcionalidad primary key (id_rol,id_funcionalidad),
  constraint fk_rol foreign key(id_rol) references trentino.t_roles(id),
  constraint fk_funcionalidad foreign key(id_funcionalidad) references trentino.t_funcionalidades(id)
)

create table trentino.t_alumnos(
	id integer not null,
	dni char(8) default null,
	apellidos varchar(100),
	nombres varchar(100),
	nacimiento date,
	constraint pk_users primary key (id)
)
create sequence trentino.seq_alumnos start with 1 increment by 1 maxvalue 999999999;
