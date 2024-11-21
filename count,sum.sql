use Banco
select* from Transacciones
select count(*) from Transacciones WHERE Fecha_Transaccion BETWEEN '2024-01-01' AND '2024-01-31';

select * from Transacciones where Tipo_Transaccion not in ('Transferencia')

select * from Prestamos
select sum (Monton_Prestamo) as montos_prestamos_rechazados from Prestamos where Estado_Prestamo in ('Rechazado')

select Id_Cliente, COUNT(*) from Prestamos where Estado_Prestamo in ('Pendiente') group by Id_Cliente

select Tipo_Transaccion, sum (Monton)as monto_por_tipo from Transacciones group by Tipo_Transaccion  having COUNT(*) >5

select* from Sucursales

select Ciudad ,count (*) as Cantidad_sucursales from Sucursales group by Ciudad order by Cantidad_sucursales desc;

select* from Prestamos where Estado_Prestamo in ('Pendiente') and Monton_Prestamo > 500000

select Tipo_Transaccion, avg (monton) as promedio_por_tipo from Transacciones group by Tipo_Transaccion

select count (*) from Clientes where Estado_Cliente in ('Activo') and Apellido like 'G%'

select * from Clientes

select*  from  Transacciones where Tipo_Transaccion in ('Retiro') and Fecha_Transaccion  between '2024-03-01' and '2024-03-01'

select * from Empleados select min (Fecha_Ingreso) as 'FechaAntigua' from Empleados

select * from Prestamos select Estado_Prestamo,COUNT(*) as 'TotalPrestamos', avg(Monton_Prestamo) as 'Promedio' from Prestamos group by Estado_Prestamo

select * from Clientes
select FechaNacimiento from Clientes where Estado_Cliente='Activo' group by FechaNacimiento order by FechaNacimiento desc

Select * from Empleados
Select SUM(Salario) from Empleados where Nombre not in ('Maria','Camila','Ana')

Select * from Cuentas_Bancarias
Select AVG(Saldo) from Cuentas_Bancarias where Estado_Cuenta = 'Activa' and Saldo between 500 and 2000

Select * from Clientes Select COUNT(*) from Clientes where Estado_Cliente in ('Activo','Inactivo')

select * from Prestamos
select SUM(Monton_Prestamo) from Prestamos where Estado_Prestamo='Aprobado' and Plazo_Meses > 15

select * from Cuentas_Bancarias
select Tipo_Cuenta,COUNT(*),SUM(Saldo) AS 'SaldoTotal' from Cuentas_Bancarias group by Tipo_Cuenta order by SaldoTotal desc

select * from Empleados 
select AVG(Salario) from Empleados where Cargo IN ('Cajero','Asistente')

select * from Prestamos
select * from Prestamos where Estado_Prestamo='Aprobado' and Tasa_Interes < 0.06 order by Monton_Prestamo asc