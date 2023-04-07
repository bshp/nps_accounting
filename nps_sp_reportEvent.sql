USE [NPS]
GO

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[report_event]
    @doc ntext
AS

SET NOCOUNT ON

DECLARE @idoc int
EXEC sp_xml_preparedocument @idoc OUTPUT, @doc

/*
    All RADIUS attributes written to the ODBC format logfile are declared here.  
    One additional attribute is added: @record_timestamp.
    The value of @record_timestamp is the UTC time the record was inserted in the database.

    Refer to IAS-Formatted Log Files in Online Help on www.technet.com for information on interpreting these values.
*/

DECLARE @record_timestamp datetime2(3)

SET @record_timestamp = SYSDATETIME()

INSERT accounting_data
SELECT
    COALESCE(Event_Timestamp,@record_timestamp),
    Computer_Name,
    Packet_Type,
    [User_Name],
    F_Q_User_Name,
    Called_Station_Id,
    Calling_Station_Id,
    Callback_Number,
    Framed_IP_Address,
    NAS_Identifier,
    NAS_IP_Address,
    NAS_Port,
    Client_Vendor,
    Client_IP_Address,
    Client_Friendly_Name,
    Port_Limit,
    NAS_Port_Type,
    Connect_Info,
    Framed_Protocol,
    Service_Type,
    Authentication_Type,
    NP_Policy_Name,
    Reason_Code,
    Class,
    Session_Timeout,
    Idle_Timeout,
    Termination_Action,
    EAP_Friendly_Name,
    Acct_Status_Type,
    Acct_Delay_Time,
    Acct_Input_Octets,
    Acct_Output_Octets,
    Acct_Session_Id,
    Acct_Authentic,
    Acct_Session_Time,
    Acct_Input_Packets,
    Acct_Output_Packets,
    Acct_Terminate_Cause,
    Acct_Multi_Session_Id,
    Acct_Link_Count,
    Acct_Interim_Interval,
    Tunnel_Type,
    Tunnel_Medium_Type,
    Tunnel_Client_Endpoint,
    Tunnel_Server_Endpoint,
    Acct_Tunnel_Connection,
    Tunnel_Pvt_Group_Id,
    Tunnel_Assignment_Id,
    Tunnel_Preference,
    MS_Acct_Auth_Type,
    MS_Acct_EAP_Type,
    MS_RAS_Version,
    MS_RAS_Vendor,
    MS_CHAP_Error,
    MS_CHAP_Domain,
    MS_MPPE_Encryption_Types,
    MS_MPPE_Encryption_Policy,
    Proxy_Policy_Name,
    Provider_Type,
    Provider_Name,
    Remote_Server_Address,
    MS_RAS_Client_Name,
    MS_RAS_Client_Version,
    MS_Quarantine_State
FROM OPENXML(@idoc, '/Event')
WITH (
    Computer_Name nvarchar(255) './Computer-Name',
    Packet_Type tinyint './Packet-Type',
    [User_Name] nvarchar(255) './User-Name',
    F_Q_User_Name nvarchar(255) './Fully-Qualifed-User-Name',
    Called_Station_Id nvarchar(255) './Called-Station-Id',
    Calling_Station_Id nvarchar(255) './Calling-Station-Id',
    Callback_Number nvarchar(255) './Callback-Number',
    Framed_IP_Address nvarchar(15) './Framed-IP-Address',
    NAS_Identifier nvarchar(255) './NAS-Identifier',
    NAS_IP_Address nvarchar(15) './NAS-IP-Address',
    NAS_Port int './NAS-Port',
    Client_Vendor smallint './Client-Vendor',
    Client_IP_Address nvarchar(15) './Client-IP-Address',
    Client_Friendly_Name nvarchar(255) './Client-Friendly-Name',
    Event_Timestamp datetime2(0) './Event-Timestamp',
    Port_Limit int './Port-Limit',
    NAS_Port_Type tinyint './NAS-Port-Type',
    Connect_Info nvarchar(255) './Connect-Info',
    Framed_Protocol tinyint './Framed-Protocol',
    Service_Type tinyint './Service-Type',
    Authentication_Type tinyint './Authentication-Type',
    NP_Policy_Name nvarchar(255) './NP-Policy-Name',
    Reason_Code int './Reason-Code',
    Class nvarchar(255) './Class',
    Session_Timeout int './Session-Timeout',
    Idle_Timeout int './Idle-Timeout',
    Termination_Action int './Termination-Action',
    EAP_Friendly_Name nvarchar(150) './EAP-Friendly-Name',
    Acct_Status_Type int './Acct-Status-Type',
    Acct_Delay_Time int './Acct-Delay-Time',
    Acct_Input_Octets int './Acct-Input-Octets',
    Acct_Output_Octets int './Acct-Output-Octets',
    Acct_Session_Id nvarchar(255) './Acct-Session-Id',
    Acct_Authentic int './Acct-Authentic',
    Acct_Session_Time int './Acct-Session-Time',
    Acct_Input_Packets int './Acct-Input-Packets',
    Acct_Output_Packets int './Acct-Output-Packets',
    Acct_Terminate_Cause int './Acct-Terminate-Cause',
    Acct_Multi_Session_Id nvarchar(255) './Acct-Multi-Session-Id',
    Acct_Link_Count smallint './Acct-Link-Count',
    Acct_Interim_Interval int './Acct-Interim-Interval',
    Tunnel_Type tinyint './Tunnel-Type',
    Tunnel_Medium_Type int './Tunnel-Medium-Type',
    Tunnel_Client_Endpoint nvarchar(255) './Tunnel-Client-Endpt',
    Tunnel_Server_Endpoint nvarchar(255) './Tunnel-Server-Endpt',
    Acct_Tunnel_Connection nvarchar(255) './Acct-Tunnel-Connection',
    Tunnel_Pvt_Group_Id nvarchar(255) './Tunnel-Pvt-Group-Id',
    Tunnel_Assignment_Id nvarchar(255) './Tunnel-Assignment-Id',
    Tunnel_Preference int './Tunnel-Preference',
    MS_Acct_Auth_Type smallint './MS-Acct-Auth-Type',
    MS_Acct_EAP_Type smallint './MS-Acct-EAP-Type',
    MS_RAS_Version nvarchar(255) './MS-RAS-Version',
    MS_RAS_Vendor smallint './MS-RAS-Vendor',
    MS_CHAP_Error nvarchar(255) './MS-CHAP-Error',
    MS_CHAP_Domain nvarchar(255) './MS-CHAP-Domain',
    MS_MPPE_Encryption_Types tinyint './MS-MPPE-Encryption-Types',
    MS_MPPE_Encryption_Policy tinyint './MS-MPPE-Encryption-Policy',
    Proxy_Policy_Name nvarchar(255) './Proxy-Policy-Name',
    Provider_Type tinyint './Provider-Type',
    Provider_Name nvarchar(255) './Provider-Name',
    Remote_Server_Address nvarchar(15) './Remote-Server-Address',
    MS_RAS_Client_Name nvarchar(255) './MS-RAS-Client-Name',
    MS_RAS_Client_Version nvarchar(255) './MS-RAS-Client-Version',
/*
    NAP-specific information, available from NPS starting with Windows Server 2008. 
*/
    MS_Quarantine_State int './MS-Quarantine-State'
   )

EXEC sp_xml_removedocument @idoc

SET NOCOUNT OFF

GO
