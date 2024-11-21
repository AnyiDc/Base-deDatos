use Banco

select* from Sucursales
select* from Empleados

select* from Empleados inner join Sucursales on Empleados.Sucursal_Id = Sucursales.Sucursal_Id

select Nombre,Nombre_Sucursal from Empleados inner join Sucursales on Empleados.Sucursal_Id = Sucursales.Sucursal_Id

select * from Transacciones left join Cuentas_Bancarias on Transacciones.Transaccion_Id =Cuentas_Bancarias.Id_Cliente

select * from Clientes inner join Cuentas_Bancarias on Clientes.Id_Cliente = Cuentas_Bancarias.Id_Cliente

--para ver los prestamos aprobados por cliente y tengan estado activo
select* from Prestamos inner join Clientes on Prestamos.Id_Cliente=Clientes.Id_Cliente where Estado_Prestamo = 'Aprovado'
--obtener las transacciones de las cuentas activas y la fecha de transsccion haya sido entre los tres primeros meses del año
select* from Cuentas_Bancarias inner join Transacciones on Cuentas_Bancarias.Numero_Cuenta =Transacciones.Cuenta_Id where Estado_Cuenta ='Activo'
and (Fecha_Transaccion between '2023-01-01' and '2023-03-31')
--mostrar todos los cliente y  sus prestamos inclusos aquellos que no tienen prestamo
select* from Clientes left join Prestamos on Clientes.Id_Cliente = Prestamos.Id_Cliente
select* from Clientes right join Prestamos on Clientes.Id_Cliente = Prestamos.Id_Cliente
select* from Clientes inner join Prestamos on Clientes.Id_Cliente = Prestamos.Id_Cliente


--mostrar todas las transsaciones realizadas por el clinte con id = 1,2,4
select* from Transacciones inner join Cuentas_Bancarias
--Mostra las transacciones realizadas por clientes con un estado activo y en las que el monto sea 3000,4000,7000
select* from Sucursales
--mostras los emleados que estan desde el año 2020 hasta la actualidad y pertencen a la sucursalx

select* from Empleados inner join Sucursales on Empleados.Sucursal_Id = Sucursales.Sucursal_Id where Fecha_Ingreso between '2020-01-01' and '2024-10-31'

--mostrar las cuentas tipo ahorro que realizaron transacciones en octubre de 2023

select* from Cuentas_Bancarias join Transacciones on Cuentas_Bancarias.Numero_Cuenta = Transacciones.Cuenta_Id
where Tipo_Cuenta = 'ahorros' and Fecha_Transaccion between '2023-10-01' and '2023-10-31' 

--listar los prestamos con monto superior a 500000 para cliente activos

select* from Prestamos join Clientes on Prestamos.Id_Cliente = Clientes.Id_Cliente
WHERE Monton_Prestamo> 5000000 AND Estado_Cliente = 'Activo'

--mostrar el saldo promedio de las cuentas corrientes de clientes con  estado activo
select avg (saldo) from Clientes join Cuentas_Bancarias on Clientes.Id_Cliente = Cuentas_Bancarias.Id_Cliente 
where Estado_Cliente = 'activo' and Tipo_Cuenta ='Corriente'


select* from Cuentas_Bancarias
select* from Transacciones
--obtener las transacciones realizadas  en el mes de octubre  junto con el nombre del cliente y su saldo en la cuenta
select Nombre,Saldo from Transacciones join Cuentas_Bancarias
on Transacciones.Cuenta_Id = Cuentas_Bancarias.Numero_Cuenta join Clientes on Cuentas_Bancarias.Id_Cliente = Clientes.Id_Cliente 
where Fecha_Transaccion between '2023-10-01' and '2023-10-31' 
--mostrar el total de las transacciones realizadas por cada cliente 