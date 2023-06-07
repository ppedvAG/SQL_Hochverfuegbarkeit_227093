 SELECT * 
  ,CONVERT(xml,event_data) AS 'xml_data'  
  FROM 
  sys.fn_xe_file_target_read_file
 ('C:\_SQLBACKUP\Diagnose_0_133271678682930000.xel',NULL,NULL,NULL)  

  SELECT  
xml_data.value('(event/@name)[1]','varchar(max)') AS 'Name'  
,xml_data.value('(event/@package)[1]','varchar(max)') AS 'Package'  
,xml_data.value('(event/@timestamp)[1]','datetime') AS 'Time'  
,xml_data.value('(event/data[@name=''state'']/value)[1]','int') AS 'State'  
,xml_data.value('(event/data[@name=''state_desc'']/text)[1]','varchar(max)') AS 'State Description'  
,xml_data.value('(event/data[@name=''failure_condition_level'']/value)[1]','int') AS 'Failure Conditions'  
,xml_data.value('(event/data[@name=''node_name'']/value)[1]','varchar(max)') AS 'Node_Name'  
,xml_data.value('(event/data[@name=''instancename'']/value)[1]','varchar(max)') AS 'Instance Name'  
,xml_data.value('(event/data[@name=''creation time'']/value)[1]','datetime') AS 'Creation Time'  
,xml_data.value('(event/data[@name=''component'']/value)[1]','varchar(max)') AS 'Component'  
,xml_data.value('(event/data[@name=''data'']/value)[1]','varchar(max)') AS 'Data'  
,xml_data.value('(event/data[@name=''info'']/value)[1]','varchar(max)') AS 'Info'  
FROM  
 ( SELECT object_name AS 'event'  
  ,CONVERT(xml,event_data) AS 'xml_data'  
  FROM sys.fn_xe_file_target_read_file('C:\_SQLBACKUP\Diagnose_0_133271678682930000.xel',NULL,NULL,NULL)   
)   
AS XEventData  
ORDER BY Time;  
  
  


-- Resource Monitor
select xml_data.value('(./Record/ResourceMonitor/Notification)[1]', 'VARCHAR(max)') AS [Notification],
    xml_data.value('(/resource/memoryReport/entry[@description=''Working Set'']/@value)[1]', 'bigint')/1024 AS [SQL_Mem_in_use_MB],
    xml_data.value('(/resource/memoryReport/entry[@description=''Available Paging File'']/@value)[1]', 'bigint')/1024 AS [Avail_Pagefile_MB],
    xml_data.value('(/resource/memoryReport/entry[@description=''Available Physical Memory'']/@value)[1]', 'bigint')/1024 AS [Avail_Physical_Mem_MB],
    xml_data.value('(/resource/memoryReport/entry[@description=''Available Virtual Memory'']/@value)[1]', 'bigint')/1024 AS [Avail_VAS_MB],
    xml_data.value('(/resource/@lastNotification)[1]','varchar(100)') as 'LastNotification',
    xml_data.value('(/resource/@outOfMemoryExceptions)[1]','bigint') as 'OOM_Exceptions'
FROM  
 ( SELECT object_name AS 'event'  
  ,CONVERT(xml,event_data) AS 'xml_data'  
  FROM sys.fn_xe_file_target_read_file('C:\_SQLBACKUP\Diagnose_0_133271678682930000.xel',NULL,NULL,NULL)   
)   
AS XEventData  


CREATE TABLE SpServerDiagnosticsResult  
(  
      create_time DateTime,  
      component_type sysname,  
      component_name sysname,  
      state int,  
      state_desc sysname,  
      data xml  
);  

INSERT INTO SpServerDiagnosticsResult  
EXEC sp_server_diagnostics ; --Parameter für Wiedergolung geht hier nicht

--aber so

WAITFOR Delay '00:00:05'
GO 5

SELECT create_time,
       component_name,
       state_desc, * 
FROM SpServerDiagnosticsResult;