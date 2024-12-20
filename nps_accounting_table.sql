USE [NPS]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM dbo.systypes WHERE name = N'ipaddress')
exec sp_droptype N'ipaddress'
GO

EXEC sp_addtype N'ipaddress', N'nvarchar (15)', N'not null'
GO

CREATE TABLE [dbo].[accounting_data](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[Computer_Name] [nvarchar](255) NOT NULL,
	[Packet_Type] [tinyint] NOT NULL,
	[User_Name] [nvarchar](255) NULL,
	[F_Q_User_Name] [nvarchar](255) NULL,
	[Called_Station_Id] [nvarchar](255) NULL,
	[Calling_Station_Id] [nvarchar](255) NULL,
	[Callback_Number] [nvarchar](255) NULL,
	[Framed_IP_Address] [ipaddress] NULL,
	[NAS_Identifier] [nvarchar](255) NULL,
	[NAS_IP_Address] [ipaddress] NULL,
	[NAS_Port] [bigint] NULL,
	[Client_Vendor] [smallint] NULL,
	[Client_IP_Address] [ipaddress] NULL,
	[Client_Friendly_Name] [nvarchar](255) NULL,
	[Port_Limit] [int] NULL,
	[NAS_Port_Type] [tinyint] NULL,
	[Connect_Info] [nvarchar](255) NULL,
	[Framed_Protocol] [tinyint] NULL,
	[Service_Type] [tinyint] NULL,
	[Authentication_Type] [tinyint] NULL,
	[NP_Policy_Name] [nvarchar](255) NULL,
	[Reason_Code] [int] NULL,
	[Class] [nvarchar](255) NULL,
	[Session_Timeout] [int] NULL,
	[Idle_Timeout] [int] NULL,
	[Termination_Action] [int] NULL,
	[EAP_Friendly_Name] [nvarchar](150) NULL,
	[Acct_Status_Type] [int] NULL,
	[Acct_Delay_Time] [int] NULL,
	[Acct_Input_Octets] [int] NULL,
	[Acct_Output_Octets] [int] NULL,
	[Acct_Session_Id] [nvarchar](255) NULL,
	[Acct_Authentic] [int] NULL,
	[Acct_Session_Time] [int] NULL,
	[Acct_Input_Packets] [int] NULL,
	[Acct_Output_Packets] [int] NULL,
	[Acct_Terminate_Cause] [int] NULL,
	[Acct_Multi_Session_Id] [nvarchar](255) NULL,
	[Acct_Link_Count] [smallint] NULL,
	[Acct_Interim_Interval] [int] NULL,
	[Tunnel_Type] [tinyint] NULL,
	[Tunnel_Medium_Type] [int] NULL,
	[Tunnel_Client_Endpoint] [nvarchar](255) NULL,
	[Tunnel_Server_Endpoint] [nvarchar](255) NULL,
	[Acct_Tunnel_Connection] [nvarchar](255) NULL,
	[Tunnel_Pvt_Group_Id] [nvarchar](255) NULL,
	[Tunnel_Assignment_Id] [nvarchar](255) NULL,
	[Tunnel_Preference] [int] NULL,
	[MS_Acct_Auth_Type] [smallint] NULL,
	[MS_Acct_EAP_Type] [smallint] NULL,
	[MS_RAS_Version] [nvarchar](255) NULL,
	[MS_RAS_Vendor] [smallint] NULL,
	[MS_CHAP_Error] [nvarchar](255) NULL,
	[MS_CHAP_Domain] [nvarchar](255) NULL,
	[MS_MPPE_Encryption_Types] [tinyint] NULL,
	[MS_MPPE_Encryption_Policy] [tinyint] NULL,
	[Proxy_Policy_Name] [nvarchar](255) NULL,
	[Provider_Type] [tinyint] NULL,
	[Provider_Name] [nvarchar](255) NULL,
	[Remote_Server_Address] [ipaddress] NULL,
	[MS_RAS_Client_Name] [nvarchar](255) NULL,
	[MS_RAS_Client_Version] [nvarchar](255) NULL,
	[MS_Quarantine_State] [int] NULL,
	[MS_RAS_Correlation_ID] [nvarchar](255) NULL,
	[MS_Network_Access_Server_Type] [nvarchar](255) NULL,
	CONSTRAINT [PK_accounting_data] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]

GO
