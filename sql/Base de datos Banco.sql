use Banco
Create table Clientes(Id_Cliente int primary key,
Nombre varchar(80) not null, 
Apellido varchar(80),
Email varchar(80),
Telefono bigint not null,  
FechaNacimiento date not null,
Fecha_Creacion datetime default getdate(),
Estado_Cliente varchar(20) not null)

ALTER TABLE Clientes
ADD CONSTRAINT UC_Email UNIQUE (Email);

create table Prestamos ( Prestamo_Id int primary key,
Id_Cliente int foreign key references Clientes (Id_Cliente),
Monton_Prestamo float not null,
Tasa_Interes float not null,
Fecha_Aprobacion date not null,
Plazo_meses int not null, 
Estado_Prestamo varchar(80))

create table Pagos_Prestamos (Pago_Id int primary key,
Prestamo_Id int foreign key references Prestamos (Prestamo_Id),
Monto_Pago float not null,
Fecha_Pago date not null)

create table Cuentas_Bancarias ( Numero_Cuenta int primary key,
Id_Cliente int foreign key references Clientes(Id_Cliente),
Estado_Cuenta varchar(80) not null,
Tipo_Cuenta varchar(20)not null,
Saldo float not null,
Fecha_Apertura date )

create table Transacciones (Transaccion_Id INT IDENTITY(1,1) PRIMARY KEY,
Cuenta_Id int foreign key references Cuentas_Bancarias (Numero_Cuenta),
Monton float not null,
Tipo_Transaccion varchar(70) not null,
Fecha_Transaccion date not null,
Descripcion varchar (80) not null
)

create table Sucursales
(Sucursal_Id int primary key ,
Nombre_Sucursal varchar (80) not null,
Direccion varchar (100) not null,
Ciudad varchar (80) not null,
Estado varchar (80) not null,
Telefono bigint not null)

Create table Empleados (
Empleado_Id int primary key,
Sucursal_Id int foreign key references Sucursales (Sucursal_Id),
Nombre varchar (80),
Apellido varchar (80),
Cargo varchar (70),
Email varchar (70),
Fecha_Ingreso varchar (80),
Salario float)

INSERT INTO Clientes (Id_Cliente, Nombre, Apellido, Email, Telefono, FechaNacimiento, Estado_Cliente)
VALUES 
(1, 'Juan', 'Pérez', 'juan.perez@email.com', 1234567890, '1985-05-15', 'Activo'),
(2, 'María', 'Gómez', 'maria.gomez@email.com', 9876543210, '1990-10-25', 'Activo');

INSERT INTO Prestamos (Prestamo_Id, Id_Cliente, Monton_Prestamo, Tasa_Interes, Fecha_Aprobacion, Plazo_meses, Estado_Prestamo)
VALUES 
(1, 1, 50000, 5.5, '2023-01-10', 12, 'Aprobado'),
(2, 2, 75000, 6.0, '2023-02-15', 24, 'Pendiente');

INSERT INTO Pagos_Prestamos (Pago_Id, Prestamo_Id, Monto_Pago, Fecha_Pago)
VALUES 
(1, 1, 5000, '2023-02-01'),
(2, 2, 3000, '2023-03-01');

INSERT INTO Cuentas_Bancarias (Numero_Cuenta, Id_Cliente, Estado_Cuenta, Tipo_Cuenta, Saldo, Fecha_Apertura)
VALUES 
(1001, 1, 'Activo', 'Ahorros', 15000.00, '2020-01-05'),
(1002, 2, 'Activo', 'Corriente', 25000.00, '2021-03-10');


INSERT INTO Transacciones (Cuenta_Id, Monton, Tipo_Transaccion, Fecha_Transaccion, Descripcion)
VALUES 
(1001, 2000.00, 'Depósito', '2023-03-15', 'Depósito mensual'),
(1002, 1500.00, 'Retiro', '2023-04-10', 'Retiro de efectivo');

INSERT INTO Sucursales (Sucursal_Id, Nombre_Sucursal, Direccion, Ciudad, Estado, Telefono)
VALUES 
(1, 'Sucursal Centro', 'Av. Principal 123', 'Ciudad X', 'Activo', 123456789),
(2, 'Sucursal Norte', 'Calle Secundaria 456', 'Ciudad Y', 'Activo', 987654321);


INSERT INTO Empleados (Empleado_Id, Sucursal_Id, Nombre, Apellido, Cargo, Email, Fecha_Ingreso, Salario)
VALUES 
(1, 1, 'Carlos', 'Martínez', 'Gerente', 'carlos.martinez@email.com', '2020-06-01', 3000.00),
(2, 2, 'Lucía', 'Fernández', 'Cajera', 'lucia.fernandez@email.com', '2021-09-15', 2000.00);

SELECT * FROM Clientes;
SELECT * FROM Prestamos;
SELECT * FROM Pagos_Prestamos;
SELECT * FROM Cuentas_Bancarias;
SELECT * FROM Transacciones;
SELECT * FROM Sucursales;
SELECT * FROM Empleados;

INSERT INTO Clientes (Id_Cliente, Nombre, Apellido, Email, Telefono, FechaNacimiento, Estado_Cliente)
VALUES 
(1, 'Juan', 'Pérez', 'juan.perez@email.com', 1234567890, '1985-05-15', 'Activo'),
(2, 'María', 'Gómez', 'maria.gomez@email.com', 9876543210, '1990-10-25', 'Activo'),
(3, 'Luis', 'Martínez', 'luis.martinez@email.com', 1122334455, '1988-03-12', 'Inactivo');

INSERT INTO Clientes (Id_Cliente, Nombre, Apellido, Email, Telefono, FechaNacimiento, Estado_Cliente)
VALUES 
(4, 'Ana', 'Sánchez', 'ana.sanchez@email.com', 2233445566, '1992-07-22', 'Activo'),
(5, 'Diego', 'Ramírez', 'diego.ramirez@email.com', 3344556677, '1980-12-10', 'Activo'),
(6, 'Sofía', 'Torres', 'sofia.torres@email.com', 4455667788, '1995-04-30', 'Inactivo');
INSERT INTO Prestamos (Prestamo_Id, Id_Cliente, Monton_Prestamo, Tasa_Interes, Fecha_Aprobacion, Plazo_meses, Estado_Prestamo)
VALUES 
(4, 4, 60000, 5.0, '2023-04-01', 12, 'Aprobado'),
(5, 5, 40000, 5.7, '2023-05-15', 24, 'Pendiente'),
(6, 6, 80000, 4.8, '2023-06-20', 36, 'Aprobado');

INSERT INTO Pagos_Prestamos (Pago_Id, Prestamo_Id, Monto_Pago, Fecha_Pago)
VALUES 
(4, 4, 6000, '2023-05-01'),
(5, 5, 2500, '2023-06-01'),
(6, 6, 4000, '2023-07-05');

INSERT INTO Cuentas_Bancarias (Numero_Cuenta, Id_Cliente, Estado_Cuenta, Tipo_Cuenta, Saldo, Fecha_Apertura)
VALUES 
(1004, 4, 'Activo', 'Ahorros', 20000.00, '2021-02-10'),
(1005, 5, 'Activo', 'Corriente', 30000.00, '2020-08-15'),
(1006, 6, 'Inactivo', 'Ahorros', 10000.00, '2019-03-22');

INSERT INTO Transacciones (Cuenta_Id, Monton, Tipo_Transaccion, Fecha_Transaccion, Descripcion)
VALUES 
(1004, 2500.00, 'Depósito', '2023-07-15', 'Depósito mensual'),
(1005, 500.00, 'Retiro', '2023-08-10', 'Retiro para compra'),
(1006, 750.00, 'Depósito', '2023-09-20', 'Depósito de ahorro');

INSERT INTO Sucursales (Sucursal_Id, Nombre_Sucursal, Direccion, Ciudad, Estado, Telefono)
VALUES 
(4, 'Sucursal Este', 'Calle del Este 101', 'Ciudad A', 'Activo', 321654987),
(5, 'Sucursal Oeste', 'Calle del Oeste 202', 'Ciudad B', 'Activo', 654321789),
(6, 'Sucursal Internacional', 'Av. Global 303', 'Ciudad C', 'Activo', 789123456);

INSERT INTO Empleados (Empleado_Id, Sucursal_Id, Nombre, Apellido, Cargo, Email, Fecha_Ingreso, Salario)
VALUES 
(4, 4, 'Javier', 'Castro', 'Supervisor', 'javier.castro@email.com', '2021-03-01', 2800.00),
(5, 5, 'Patricia', 'Mendoza', 'Asesora', 'patricia.mendoza@email.com', '2022-05-10', 2200.00),
(6, 6, 'Roberto', 'Ríos', 'Gerente', 'roberto.rios@email.com', '2020-12-01', 3500.00);