create TABLE CLIENTE(
rut INTEGER primary KEY,
nacionalidad VARCHAR(20),
nombre VARCHAR(30),
fecha_nacimiento DATE,
estado_civil VARCHAR(10));

create TABLE TARJETA_CREDITO(
numero_de_tarjeta INTEGER primary KEY,
rut_cliente INTEGER references CLIENTE(rut),
fecha_de_vencimiento DATE,
fecha_de_emision DATE,
saldo INTEGER,
limite_credito INTEGER,
estado_tarjeta BOOL);

create table CUENTA_BANCARIA(
id_cuenta INTEGER primary key,
rut_cliente INTEGER references CLIENTE(rut),
saldo_disponible INTEGER,
estado_cuenta BOOL,
ultimo_movimiento TIMESTAMP,
tipo_moneda VARCHAR(10),
fecha_apertura DATE,
tipo_cuenta VARCHAR(10)
);

create table TRANSACCION(
	n_transaccion INTEGER primary key,
	cuenta_asociada INTEGER references CUENTA_ASOCIADA(id_cuenta),
    cuenta_destino INTEGER references CUENTA_ASOCIADA(id_cuenta),,
	fecha DATE,
	estado_transaccion BOOL,
	monto INTEGER,
);

create table CUENTA_AHORRO(
id_cuenta INTEGER primary key references CUENTA_BANCARIA(id_cuenta),
interes REAL
);

create table CUENTA_CORRIENTE(
id_cuenta INTEGER primary key references CUENTA_BANCARIA(id_cuenta),
costo_mantencion INTEGER
);

create table CUENTA_VISTA(
id_cuenta INTEGER primary key references CUENTA_BANCARIA(id_cuenta)
);

create table TARJETA_DEBITO(
numero_de_tarjeta INTEGER primary key,
cuenta_asociada INTEGER references CUENTA_BANCARIA(id_cuenta),
Estado_de_tarjeta BOOL,
Fecha_de_vencimiento DATE,
Fecha_de_emision DATE
) 

create table INVERSION(
id_inversion INTEGER primary key,
rut_cliente INTEGER references CLIENTE(rut),
cuenta_asociada INTEGER references CUENTA_BANCARIA(id_cuenta),
monto_invertido INTEGER,
tasa_de_rendimiento real
);

create table PLAZO_FIJO(
id_inversion_fijo INTEGER primary key references INVERSION(id_inversion),
estado_inversion BOOL,
fecha_termino_de_plazo DATE
); 

create table PLAZO_RENOVABLE(
id_inversion_renovable INTEGER primary key references INVERSION(id_inversion),
estado_inversion BOOL,
fecha_termino_de_plazo DATE
); 

create table PLAZO_INDEFINIDO(
id_inversion_indefinido INTEGER primary key references INVERSION(id_inversion)
); 

create table PRESTAMO_O_CREDITO(
id_prestamo INTEGER primary key,
rut_cliente INTEGER references CLIENTE(rut),
estado BOOL,
fecha_vencimiento DATE,
numero_cuotas INTEGER,
tasa_interes REAL,
monto INTEGER,
tipo_interes VARCHAR(10),
fecha_inicio DATE
);

create table CUOTAS(
id_cuota INTEGER primary key,
id_prestamo INTEGER references PRESTAMO_O_CREDITO(id_prestamo),
id_cuenta INTEGER references CUENTA_BANCARIA(id_cuenta),
estado BOOL,
fecha_vencimiento DATE
) 

create table EMPLEADO (
	rut INTEGER primary key,
	sucursal INTEGER,
	salario INTEGER,
	cargo varchar(15),
	nombre varchar(30),
	fecha_contrato DATE
);

create table SUCURSAL(
	id_empresa INTEGER primary key,
	ubicacion varchar(30),
	fecha_inicio TIME,
	fecha_fin TIME
);