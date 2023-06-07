/*
RecoveryModel FULL

SIMPLE
es werden TX autom verworfen nach Commit .. Das Tlog leert sich selber
TLog kann nicht gesichert werden


BULK
I U D aber BULK nur rudimentär

LogShipping

FULL
ausführlich Protkollierung
auf Sekunde restorebar

Spiegelung braucht FULL


Die Kommunikation zw den Servern via Endpunkte erledigt entweder ein dediziertes Konto 
oder sonst das SQL Dienstkonto der jeweiligen Instanzen


zu tun:

1. Ein Login auf beiden Seiten für das Dienstkonto des SQL Server: schulung\svcSQL
2. Dem Login ein Recht auf den Endpunkt einrichten

Tipp: registrierte Server.. Abfrage wird auf allen Server ausgeführt

Autom FO und Redirect des Client:

man braucht Zeugeninstanz

auf jedem Client den SQLNCLI verwenden und dort den Failoverpartner eintragen:
[oledb] Connectionstring
; Everything after this line is an OLE DB initstring
Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security Info=False;User ID="";Initial Catalog=LSMIRROR;Data Source=NodeOne;Initial File Name="";Failover Partner=NodeTwo;Server SPN=""



*/
USE [master]
GO
CREATE LOGIN [SQLDOM\svcSQL] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO



--Login für SQL Dienstkonto, da dies verwendet wird, wenn man kein dediziertes Konto angegeben hat...
CREATE LOGIN [schulung\svcSQL] FROM WINDOWS 

--Zugriffsrechte auf Spiegelungsendpunkt geben
GRANT CONNECT ON ENDPOINT::Spiegelung TO [SQLDOM\svcSQL]

--evtl von beiden Seiten aus das Script ausführen

USE MASTER

TCP://NodeONE.SQLDOM.dom:5022

--Auf HVSQL2
ALTER DATABASE MIrrorDB 
 SET PARTNER = 'TCP://HV-SQL1.SQLDOM.dom:5022'
GO 

USE MASTER

ALTER DATABASE Spiegelei 
 SET PARTNER = 'TCP://NodeOne.SQLDOM.dom:5022'
GO 





use Spiegelei

create table test (id int identity, spx char(4100))



insert into test 
select 'XY'
GO 30000



--Spiegelungsmonitor.. rechte Maustaste auf DB.. Tasks

--Failover auf Prinzipalseite
ALTER DATABASE <database_name> SET PARTNER FAILOVER;
GO

--auf Spiegel
--zwingend
--Eventuell nicht synchronisiert

ALTER DATABASE <database_name> SET PARTNER FORCE_SERVICE_ALLOW_DATA_LOSS





