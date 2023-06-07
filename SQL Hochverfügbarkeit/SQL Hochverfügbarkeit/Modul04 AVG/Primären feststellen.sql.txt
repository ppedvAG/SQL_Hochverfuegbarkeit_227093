DECLARE @preferredReplica int

SET @preferredReplica = (SELECT [master].sys.fn_hadr_backup_is_preferred_replica('AG1'))

select @preferredReplica

select * from sys.dm_hadr_availability_group_states
select * from sys.dm_hadr_availability_replica_states
select * from sys.dm_hadr_availability_replica_cluster_nodes
select @@SERVERNAME
select * from sys.dm_hadr_availability_replica_cluster_states
select * from sys.dm_hadr_availability_replica_states


select top 1 Replica_id from sys.dm_hadr_cached_database_replica_states
where ag_name = 'AGGRUPPE'



------------------------------------------------------------------

declare @repID as uniqueidentifier

select @repID = replica_id from
	sys.dm_hadr_availability_replica_cluster_states rps
	where replica_server_name= @@SERVERNAME
	and
	Replica_id = 
	(select top 1 Replica_id from sys.dm_hadr_cached_database_replica_states
	where ag_name = 'AGGRUPPE')


IF (select role_desc from sys.dm_hadr_availability_replica_states
where replica_id= @repid) = 'PRIMARY'
SELECT 'machmal'
ELSE
SELECT 'lass bleiben'

