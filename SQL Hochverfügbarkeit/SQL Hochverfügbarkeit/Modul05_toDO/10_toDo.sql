/*

Auf was muss man achten , wenn ein FO geschehen ist

Bei allen DB Lösungen fehlen die Logins und die Jobs

Logins (master) -- SID

Rechte aber in der DB (user) --SID

0 Probleme , wenn Windows Konten aus AD verwendet

Aber nicht bei SQL Konten

*/

sp_help_revlogin

--auf Quellserver ausführen und dann Ergebis kopieren auf Zielserver und ausführen


use lsd --Liste aller verwaisten Benutzer
sp_change_users_login 'Report'


--ein pass Login wird angelegt
sp_change_users_login 'Auto_fix', 'Hans', 'Hans', 'ppedv2019!'

--zu einem best User ein Login per SID angepasst 
sp_change_users_login 'Update_one', 'Hans', 'Hans'


--Alternative: contained Database
--Dinge aus SystemDb , sind plötzlich Dinge in der DB
--teilweise: master (Login)  nix aus msdb (jobs, zeitpläne, Wartung)

--1. dem Server CDB erlauben

EXEC sys.sp_configure N'contained database authentication', N'1'
GO
RECONFIGURE WITH OVERRIDE
GO
USE [master]
GO
ALTER DATABASE [LSD] SET CONTAINMENT = PARTIAL WITH NO_WAIT
GO



sp_change_users_login

sp_help_revlogin









ContainedDatabase


*/
select * from syslogins