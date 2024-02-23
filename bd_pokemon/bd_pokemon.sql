drop database if exists bd_pokemon;
create database bd_pokemon;
use bd_pokemon;

create table pokemon (
id_pokemon int not null,
DNI int not null,
descripción varchar (50) not null,
nombre_pokemon varchar (25) not null,
primary key (id_pokemon)
);

create table tipo (
id_tipo int not null,
nombre varchar (30) not null,
debilidades_tipo varchar (25) not null,
fortalezas_tipo varchar (25) not null,
primary key (id_tipo)
);

create table entrenador (
DNI int not null,
id_liga int not null,
nombre_entrenador varchar (25) not null,
apellidos varchar (25) not null,
edad int not null,
primary key (DNI)
);

create table liga (
id_liga int not null,
lideres varchar (30) not null,
ganador varchar (50) not null,
primary key (id_liga)
);

create table centro_pokemon (
id_centro int not null,
nombre_ciudad varchar (25) not null,
zona_intercambio_pokemon boolean,
primary key (id_centro)
);

create table gimnasios (
id_gimnasio int not null,
tipo_gimnasio varchar (20) not null,
lider varchar (50) not null,
primary key (id_gimnasio)
);

create table ciudades (
id_ciudad int not null,
descripcion varchar (60) not null,
nombre varchar (30) not null,
primary key (id_ciudad)
);

create table tiendas (
id_tienda int not null,
nombre_tienda varchar (30) not null,
inventario varchar (90), 
primary key (id_tienda)
);

create table asistencia (
id_centro int not null,
id_pokemon int not null,
primary key (id_pokemon,id_centro)
);

create table combates (
id_gimnasio int not null,
DNI int not null,
primary key (id_gimnasio, DNI)
);

create table pueden_tener_tienda (
id_ciudad int not null,
id_tienda int not null,
primary key (id_tienda, id_ciudad)
); 

create table pueden_tener_centro (
id_ciudad int not null,
id_centro int not null,
primary key (id_ciudad,id_centro)
); 

create table pueden_tener_gimnasio (
id_ciudad int not null,
id_gimnasio int not null,
primary key (id_ciudad,id_gimnasio)
); 

create table pertenecen_tipo (
id_pokemon int not null,
id_tipo int not null,
primary key (id_pokemon, id_tipo)
);

-- Relaciones


ALTER TABLE asistencia
ADD CONSTRAINT fk_id_pokemon1 FOREIGN KEY (id_pokemon) REFERENCES pokemon(id_pokemon),
ADD CONSTRAINT fk_centro_pokemon1 FOREIGN KEY (id_centro) REFERENCES centro_pokemon(id_centro);

ALTER TABLE combates
ADD CONSTRAINT fk_id_gimnasio1 FOREIGN KEY (id_gimnasio) REFERENCES gimnasios(id_gimnasio),
ADD CONSTRAINT fk_DNI1 FOREIGN KEY (DNI) REFERENCES entrenador(DNI);

ALTER TABLE pertenecen_tipo
ADD CONSTRAINT fk_id_pokemon2 FOREIGN KEY (id_pokemon) REFERENCES pokemon(id_pokemon),
ADD CONSTRAINT fk_id_tipo1 FOREIGN KEY (id_tipo) REFERENCES tipo(id_tipo);

ALTER TABLE pokemon
ADD CONSTRAINT fk_DNI2 FOREIGN KEY (DNI) REFERENCES entrenador(DNI);

ALTER TABLE entrenador
ADD CONSTRAINT fk_id_liga FOREIGN KEY (id_liga) REFERENCES liga(id_liga);

ALTER TABLE pueden_tener_tienda
ADD CONSTRAINT fk_id_ciudad FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad),
ADD CONSTRAINT fk_id_tienda FOREIGN KEY (id_tienda) REFERENCES tiendas(id_tienda);

ALTER TABLE pueden_tener_centro
ADD CONSTRAINT fk_id_ciudad2 FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad),
ADD CONSTRAINT fk_centro_pokemon2 FOREIGN KEY (id_centro) REFERENCES centro_pokemon(id_centro);

ALTER TABLE pueden_tener_gimnasio
ADD CONSTRAINT fk_id_ciudad3 FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad),
ADD CONSTRAINT fk_id_gimnasio2 FOREIGN KEY (id_gimnasio) REFERENCES gimnasios(id_gimnasio);

-- Datos

-- Tabla pokemon
insert into liga VALUES ('12','Johnny','Mickey');
insert into liga VALUES ('23','Pandu','Nichel');
insert into liga VALUES ('34','Fermin','Illojoao');
insert into liga VALUES ('45','Serin','John');
insert into liga VALUES ('56','Gorum','Diego');
insert into liga VALUES ('67','Malenia','Mangiare');
insert into liga VALUES ('78','Blake','Santiago');
insert into liga VALUES ('89','Warto','Blas');
insert into liga VALUES ('99','Blas','Abascal');

insert into entrenador VALUES ('4166568','45','John','McTavis','19');
insert into entrenador VALUES ('5504697','12','Mickey','Boo','18');
insert into entrenador VALUES ('3213434','34','Illojoao','Lmdshow','25');
insert into entrenador VALUES ('4878920','56','Diego','Salirrosas','20');
insert into entrenador VALUES ('5789206','23','Nichel','Pedromo','18');
insert into entrenador VALUES ('6243253','67','Mangiare','Ahokey','22');
insert into entrenador VALUES ('1453667','78','Santiago','Gil','29');
insert into entrenador VALUES ('8654757','99','Abascal','Sanchez','31');
insert into entrenador VALUES ('4156789','89','Blas','Rothfuss','40');

insert into pokemon VALUES ('1','4166568','Nace con una semilla en el lomo','Bulbasur');
insert into pokemon VALUES ('2','5504697','Es venenoso','Ivysaur');
insert into pokemon VALUES ('3','3213434','Evolución final de Bulbasur','Venusaur');
insert into pokemon VALUES ('4','4878920','Pokemon que quema fleje','Charmander');
insert into pokemon VALUES ('5','5789206','Pokemon que quema más','Charmeleon');
insert into pokemon VALUES ('6','6243253','Evolución final de Charmander','Charmander');
insert into pokemon VALUES ('7','1453667','Es una tortuga que escupe','Squirtle');
insert into pokemon VALUES ('8','8654757','Es una tortuga fachera','Wartotle');
insert into pokemon VALUES ('9','4156789','Evolución final Squirtle','Blastoise');

insert into tipo VALUES ('1','Planta','Fuego','Agua');
insert into tipo VALUES ('2','Fuego','Agua','Planta');
insert into tipo VALUES ('3','Agua','Planta','Fuego');

insert into ciudades VALUES ('24','Ciudad Del Vicio, donde los Pokemon tienen adiccion','ViceCity');
insert into ciudades VALUES ('25','Ciudad donde hay una falla','SanAndreas');
insert into ciudades VALUES ('26','Ciudad que se parece a Nueva York','LibertyCity');
insert into ciudades VALUES ('27','Ciudad donde te crecen las paletas','Pueblo Paleta');
insert into ciudades VALUES ('28','Ciudad donde las casas son color carmín','Ciudad Carmín');
insert into ciudades VALUES ('29','Ciudad donde las casas son color azul','Ciudad Azulona');
insert into ciudades VALUES ('30','Ciudad donde las casas son color plata','Ciudad Plateada');
insert into ciudades VALUES ('31','Ciudad donde la mafia de Twitch te dispara','Ciudad Twitch');
insert into ciudades VALUES ('32','Sin datos sobre la ciudad :(','Andorra');

insert into centro_pokemon VALUES ('10','ViceCity',True);
insert into centro_pokemon VALUES ('11','SanAndreas',False);
insert into centro_pokemon VALUES ('12','LibertyCity',True);
insert into centro_pokemon VALUES ('13','Pueblo Paleta',True);
insert into centro_pokemon VALUES ('14','Ciudad Carmín',False);
insert into centro_pokemon VALUES ('15','Ciudad Azulona',True);
insert into centro_pokemon VALUES ('16','Ciudad Plateada',True);
insert into centro_pokemon VALUES ('17','Ciudad Twitch',False);
insert into centro_pokemon VALUES ('18','Andorra',True);

insert into gimnasios VALUES ('11','Agua','Misty');
insert into gimnasios VALUES ('22','Planta','Elvira');
insert into gimnasios VALUES ('33','Fuego','Guillermo');
insert into gimnasios VALUES ('44','Fantasma','Santorum');
insert into gimnasios VALUES ('55','Lucha','Xokas');
insert into gimnasios VALUES ('66','Roca','Brock');
insert into gimnasios VALUES ('77','Electrico','Pepe');
insert into gimnasios VALUES ('88','Tierra','Pandu');

insert into tiendas VALUES ('1','Kraken','Muchas sustancias sospechosas');
insert into tiendas VALUES ('2','PaquitoElChocolatero','x300 barras de chocolate milka');
insert into tiendas VALUES ('3','PokeballsLocas','x643 pokeballs de calidad');
insert into tiendas VALUES ('4','El Rincon De Charmander','x50 mecheros');
insert into tiendas VALUES ('5','Casa Del Coletas','x76 gomas para el pelo');
insert into tiendas VALUES ('6','Spar','Siempre Cerca de ti');
insert into tiendas VALUES ('7','Mercadona','x99P Papas de Hacendado Caras');
insert into tiendas VALUES ('8','ElectronicVoltorb','x99 Ordenadores');
insert into tiendas VALUES ('9','Colossus','x99 Tabaco');

insert into pueden_tener_centro VALUES ('24','10');
insert into pueden_tener_centro VALUES ('25','11');
insert into pueden_tener_centro VALUES ('26','12');
insert into pueden_tener_centro VALUES ('27','13');
insert into pueden_tener_centro VALUES ('28','14');
insert into pueden_tener_centro VALUES ('29','15');
insert into pueden_tener_centro VALUES ('30','16');
insert into pueden_tener_centro VALUES ('31','17');
insert into pueden_tener_centro VALUES ('32','18');

insert into pueden_tener_tienda VALUES ('24','1');
insert into pueden_tener_tienda VALUES ('25','2');
insert into pueden_tener_tienda VALUES ('26','3');
insert into pueden_tener_tienda VALUES ('27','4');
insert into pueden_tener_tienda VALUES ('28','5');
insert into pueden_tener_tienda VALUES ('29','6');
insert into pueden_tener_tienda VALUES ('30','7');
insert into pueden_tener_tienda VALUES ('31','8');
insert into pueden_tener_tienda VALUES ('32','9');

insert into pueden_tener_gimnasio VALUES ('24','11');
insert into pueden_tener_gimnasio VALUES ('25','22');
insert into pueden_tener_gimnasio VALUES ('26','33');
insert into pueden_tener_gimnasio VALUES ('27','44');
insert into pueden_tener_gimnasio VALUES ('28','55');
insert into pueden_tener_gimnasio VALUES ('29','66');
insert into pueden_tener_gimnasio VALUES ('30','77');
insert into pueden_tener_gimnasio VALUES ('31','88');

insert into asistencia VALUES ('10','2');
insert into asistencia VALUES ('11','3');
insert into asistencia VALUES ('12','5');
insert into asistencia VALUES ('13','1');
insert into asistencia VALUES ('14','4');
insert into asistencia VALUES ('15','6');
insert into asistencia VALUES ('16','7');
insert into asistencia VALUES ('17','8');
insert into asistencia VALUES ('18','9');

insert into pertenecen_tipo VALUES ('1','1');
insert into pertenecen_tipo VALUES ('2','1');
insert into pertenecen_tipo VALUES ('3','1');
insert into pertenecen_tipo VALUES ('4','2');
insert into pertenecen_tipo VALUES ('5','2');
insert into pertenecen_tipo VALUES ('6','2');
insert into pertenecen_tipo VALUES ('7','3');
insert into pertenecen_tipo VALUES ('8','3');
insert into pertenecen_tipo VALUES ('9','3');

insert into combates VALUES ('11','5504697');
insert into combates VALUES ('22','3213434');
insert into combates VALUES ('33','1453667');
insert into combates VALUES ('44','8654757');
insert into combates VALUES ('55','4156789');
insert into combates VALUES ('66','6243253');
insert into combates VALUES ('77','4166568');
insert into combates VALUES ('88','5789206');









