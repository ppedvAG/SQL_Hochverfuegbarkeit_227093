--Diagnose 
ALTER SERVER CONFIGURATION SET DIAGNOSTICS LOG ON; 

ALTER SERVER CONFIGURATION SET DIAGNOSTICS LOG OFF;  

ALTER SERVER CONFIGURATION  
SET DIAGNOSTICS LOG PATH = 'C:\_SQLBACKUPS\STDINSTANZ';  

ALTER SERVER CONFIGURATION   
SET DIAGNOSTICS LOG MAX_SIZE = 10 MB;  

ALTER SERVER CONFIGURATION   
SET FAILOVER CLUSTER PROPERTY HealthCheckTimeout = 30000;  


--Level setzen
ALTER SERVER CONFIGURATION SET FAILOVER CLUSTER PROPERTY FailureConditionLevel = 5;  

--F�r AVG
ALTER AVAILABILITY GROUP AG1 SET (FAILURE_CONDITION_LEVEL = 5);  
ALTER AVAILABILITY GROUP AG1 SET (HEALTH_CHECK_TIMEOUT = 60000);  




!!md c:\Logs

EXEC sp_server_diagnostics;

EXEC sp_server_diagnostics 5;

/*

Ebene	Bedingung	und Beschreibung
0	Kein automatischer Failover oder Neustart	
	Gibt an, dass bei einer Fehlerbedingung nicht automatisch ein Failover oder Neustart ausgel�st wird. 
	Diese Ebene ist nur f�r die Systemwartung vorgesehen.

1	Failover oder Neustart bei Serverausfall	
	Gibt an, dass ein Neustart oder ein Failover des Server ausgel�st wird, 
	wenn die folgende Bedingung zutrifft:

	SQL Server-Dienst ist ausgefallen.

2	Failover oder Neustart bei nicht reagierendem Server	
	Gibt an, dass ein Neustart oder ein Failover des Server ausgel�st wird, 
	wenn eine der folgenden Bedingungen zutrifft:

	SQL Server-Dienst ist ausgefallen.

	SQL Server-Instanz reagiert nicht 
	(die Ressourcen-DLL kann von sp_server_diagnostics keine Daten innerhalb der 
	durch die HealthCheckTimeout-Einstellungen vorgegebenen Zeit empfangen).

3*	Failover oder Neustart bei wichtigen Serverfehlern	
	Gibt an, dass ein Neustart oder ein Failover des Server ausgel�st wird, wenn eine der folgenden Bedingungen zutrifft:

	SQL Server-Dienst ist ausgefallen.

	SQL Server-Instanz reagiert nicht 
		(die Ressourcen-DLL kann von sp_server_diagnostics keine Daten innerhalb der durch die 
		HealthCheckTimeout-Einstellungen vorgegebenen Zeit empfangen).

		Gespeicherte Systemprozedur sp_server_diagnostics gibt einen Systemfehler zur�ck.

4	Failover oder Neustart auf mittelschweren Serverfehlern	Gibt an, 
	dass ein Neustart oder ein Failover des Server ausgel�st wird, wenn eine der folgenden Bedingungen zutrifft:

	SQL Server-Dienst ist ausgefallen.

	SQL Server-Instanz reagiert nicht 
	(die Ressourcen-DLL kann von sp_server_diagnostics keine Daten innerhalb der durch die 
	HealthCheckTimeout-Einstellungen vorgegebenen Zeit empfangen).

	Gespeicherte Systemprozedur sp_server_diagnostics gibt einen Systemfehler zur�ck.

	Gespeicherte Systemprozedur sp_server_diagnostics gibt einen Ressourcenfehler zur�ck.

5	Failover oder Neustart bei qualifizierten Fehlerbedingungen	

	Gibt an, dass ein Neustart oder ein Failover des Server ausgel�st wird, wenn eine der folgenden Bedingungen zutrifft:

	SQL Server-Dienst ist ausgefallen.

	SQL Server-Instanz reagiert nicht 
	(die Ressourcen-DLL kann von sp_server_diagnostics keine Daten innerhalb der durch die
	HealthCheckTimeout-Einstellungen vorgegebenen Zeit empfangen).

	Gespeicherte Systemprozedur sp_server_diagnostics gibt einen Systemfehler zur�ck.

	Gespeicherte Systemprozedur sp_server_diagnostics gibt einen Ressourcenfehler zur�ck.

	Gespeicherte Systemprozedur sp_server_diagnostics gibt Fehler bei der Abfrageverarbeitung zur�ck.
*/