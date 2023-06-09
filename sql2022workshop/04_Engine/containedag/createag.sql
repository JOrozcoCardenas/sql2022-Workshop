USE master;
GO
CREATE AVAILABILITY GROUP [ag1]
    WITH (CLUSTER_TYPE = NONE, CONTAINED)
    FOR REPLICA ON
        N'<node1>' WITH (
            ENDPOINT_URL = N'tcp://<node1>:5022',
		    AVAILABILITY_MODE = ASYNCHRONOUS_COMMIT,
		    FAILOVER_MODE = MANUAL,
		    SEEDING_MODE = AUTOMATIC,
            SECONDARY_ROLE (ALLOW_CONNECTIONS = ALL)
		    ),
        N'<node2>' WITH (
		    ENDPOINT_URL = N'tcp://<node2>:5022',
		    AVAILABILITY_MODE = ASYNCHRONOUS_COMMIT,
		    FAILOVER_MODE = MANUAL,
		    SEEDING_MODE = AUTOMATIC,
		    SECONDARY_ROLE (ALLOW_CONNECTIONS = ALL)
			);
GO
ALTER AVAILABILITY GROUP [ag1] GRANT CREATE ANY DATABASE;
GO