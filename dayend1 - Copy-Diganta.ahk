#SingleInstance force
End::
 
Gui destroy

Gui, Font, S12 CDefault, Verdana

Gui, Show, x448 y134 h281 w453, Dayend Simplified - by Diganta Koner
Gui, Add, Picture, x12 y9 w220 h50 , C:\Users\dk048606\Desktop\cerner-logo.png

Gui, Add, GroupBox, x242 y9 w200 h60 , Utilities
Gui, Add, GroupBox, x12 y69 w430 h70 ,
Gui, Add, GroupBox, x12 y139 w430 h130 , Documentations

Gui, Add, Radio, x252 y29 w90 h30 gqueries, Queries
Gui, Add, Radio, x352 y29 w80 h30 , Emails

Gui, Add, Radio, x332 y199 w80 h30 ginitial, Initial
Gui, Add, Radio, x212 y169 w90 h30 gGIS, ODE Job
Gui, Add, Radio, x22 y199 w180 h30 gT2, Tier 2 requests
Gui, Add, Radio, x22 y169 w180 h30 gLJR, Jobs Running Long
Gui, Add, Radio, x332 y169 w90 h30 gT1, Blocking
Gui, Add, Radio, x212 y229 w120 h30 gDistr, Distribution
Gui, Add, Radio, x22 y229 w150 h30 gCR, Reporting Jobs
Gui, Add, Radio, x212 y199 w90 h30 gTrp, Triplets
Gui, Add, Radio, x332 y229 w100 h30 gDeadlock, DeadLock

Gui, Add, Text, x142 y89 w10 h20 , |
Gui, Add, Text, x282 y89 w10 h20 , |
Gui, Add, Text, x202 y109 w10 h30, |

Gui, Font, S8 CBlue Underline, Verdana,

Gui, Add, Text, x42 y89 w90 h20 gPaging vPaging , Paging Groups
Gui, Add, Text, x172 y89 w100 h20 gRemedy vRemedy , Remedy Queues
Gui, Add, Text, x302 y89 w110 h20 gContacts vContacts, Customer Contacts
Gui, Add, Text, x82 y109 w120 h20 gEnvironment vEnvironment, Environment Names
Gui, Add, Text, x212 y109 w170 h20 , Custom Handling Instructions

; Moves the window to the center of the screen
WinExist("A")
WinGetPos,,, sizeX, sizeY
WinMove, (A_ScreenWidth/2)-(sizeX/2), (A_ScreenHeight/2)-(sizeY/2) 

Return
;---------------------------------------------------------------------------
Paging:
Run file://cernerwhq1/general/CernerHS_IRC/HS_CAMGoLive/test_file.xlsx                     ;file:C:\Users\dk048606\Documents\test_file.xlsx
Return
Remedy:
Run file://cernerwhq1/general/CernerHS_IRC/HS_CAMGoLive/test_file1.xlsx 
Return 
Contacts:
Run file://cernerwhq1/general/CernerHS_IRC/HS_CAMGoLive/test_file2.xlsx
Return
Environment:
Run file://cernerwhq1/general/CernerHS_IRC/HS_CAMGoLive/test_file3.xlsx
Return
;---------------------------------------------------------------------------

queries:
Gui Destroy
Gui, Show, x494 y135 h87 w468, Queries List
Gui, Font, S12 CDefault, Verdana
Gui, Add, DropDownList, x32 y19 w410 h3000 vlist
,Check Blocking in DB
|Check Status Of Quartz Scheduler from DB
|Specific GUID to mark complete job
|Determine the jvm for quartz
|Log View Of Triplets
|Quartz Jobs not running
|Report Topic Log Query
|Status Of Cube Job
|Delete Cubes If Job Is Marked Complete
|Long Running Article
|Model Or Custom Article
|4.1 Report Job Query
|Model Or Custom Job
|ODE Job Status Query
|ARP Job Status Query
|Check If Job Is Skipping Records
|Release Skipped Records
|Release Single Skipped Record
|Check For Record Count
|Check for record with tag
|Time required for one sp to run in full reload
|Check for Skipped Records
|Long Running SP job
|DB backup progress
|Wait for file
|01END troubleshooting
|Database Version
|Kill Long Running Article
|Replication Status
|Run a job in full reload
|Check if SP job is hung
|ETL records
|Delay Reason
|Substitution value change
|Failed Job History
|Cube Job Progress
|Total Number Of Jobs in Scheduler
|Job Information
|Model RDE flow
|RDE ETA query
|ODE ETA query

Gui, Add, Button, x152 y49 w120 h30 gbutton, OK

return

button: 
Gui, Submit
Sleep 500

if (list == "Check Blocking in DB ") 
{
Send sp_who2
Gui, Destroy
Return
}

if (list == "Check Status Of Quartz Scheduler from DB ")
{
Send SELECT top 100 JobSts.CredTime,{enter}JobSts.ObjId, JobType.Name,EvntSts.MsgSts.GUID,{enter}--JobSts.StsCd, EvntSts.MsgSts.StsVal, JobSts.StsCd,EvntSts.MsgSts.TotChildExpMsgQty,{enter}EvntSts.MsgSts.TotChildFailMsgQty,{enter}EvntSts.MsgSts.TotChildSuccMsgQty FROM EvntSts.MsgSts{enter}JOIN JobStsAsynchInfo on JobStsAsynchInfo.MsgStsGuid = EvntSts.MsgSts.GUID{enter}JOIN jobSts ON JobStsAsynchInfo.JobStsObjId = jobSts.ObjId{enter}JOIN Job ON jobSts.jobObjid = Job.ObjId{enter}JOIN JobType ON JobType.ObjId = Job.JobTypeObjId AND JobType.Name like '`%Sched`%' --mdnecSched--RecalSched--RcupdSched{enter}--and  datediff (day, JobSts.CredTime, (select max (RunDate) from job))<=3{enter}order by JobSts.credTime desc
Gui, Destroy
Return
}

if (list == "Specific GUID to mark complete job ") 
{
Send SELECT top 100 JobSts.CredTime, JobSts.ObjId, JobType.Name,{enter}EvntSts.MsgSts.GUID, JobSts.StsCd, EvntSts.MsgSts.StsVal, JobSts.StsCd,{enter}EvntSts.MsgSts.TotChildExpMsgQty,EvntSts.MsgSts.TotChildFailMsgQty,{enter}EvntSts.MsgSts.TotChildSuccMsgQty{enter}FROM EvntSts.MsgSts{enter}JOIN JobStsAsynchInfo on JobStsAsynchInfo.MsgStsGuid = EvntSts.MsgSts.GUID{enter}JOIN jobSts ON JobStsAsynchInfo.JobStsObjId = jobSts.ObjId{enter}JOIN Job ON jobSts.jobObjid = Job.ObjId{enter}JOIN JobType ON JobType.ObjId = Job.JobTypeObjId{enter}AND JobType.Name like '`%Sched`%' --mdnecSched--RecalSched--RcupdSched{enter}--and  datediff (day, JobSts.CredTime, (select max (RunDate) from job))<=3{enter}order by JobSts.credTime desc{enter}
Gui, Destroy
Return
}

if(list == "Determine the jvm for quartz ")
{
Send DECLARE @GUID varchar(255){enter}SET @GUID = 'Put the GUID Here'{enter}SELECT  sts.serverName{enter}FROM JobStsAsynchInfo info{enter}JOIN JobSts sts ON (info.JobStsObjId = sts.ObjId){enter} WHERE info.MsgStsGuid = @GUID 
Gui, Destroy
Return
}

if(list == "Log View Of Triplets ")
{
Send Select top 50 JobBypassObj.credtime, JobType.Name, CLobObj.DataStreamText, CLobObj.DataLenVal, * from JobBypassObj{enter}JOIN jobType on JobBypassObj.JobTypeObjId = JobType.objId{enter}JOIN DayEndJobExcpData on DayEndJobExcpData.JobBypassObjObjId = JobBypassObj.objId{enter}JOIN CLobObj on CLobObj.ObjId = DayEndJobExcpData.CLobObjObjId{enter}--Where JobType.Name like '`%Sched`%'{enter}order by JobBypassObj.CreDTime desc
Gui, Destroy
Return
}

if(list == "Quartz Jobs not running ")
{
Send SELECT TOP 100 * into  {#}temp FROM {enter}(SELECT  EvntSts.MsgSts.*, JobSts.stsCd,{enter}rowNumber = ROW_NUMBER() OVER(PARTITION BY jobType.Name ORDER{enter}BY EvntSts.MsgSts.CreDTime desc){enter}FROM EvntSts.MsgSts{enter}JOIN JobStsAsynchInfo on JobStsAsynchInfo.MsgStsGuid ={enter}EvntSts.MsgSts.GUID{enter}JOIN JobSts ON JobStsAsynchInfo.JobStsObjId = jobSts.ObjId{enter}JOIN Job ON jobSts.jobObjid = Job.ObjId{enter}JOIN JobType ON JobType.ObjId = Job.JobTypeObjId{enter}WHERE jobType.Name like '`%sched`%') tmpTable{enter}WHERE tmpTable.rowNumber > 1{enter}AND tmpTable.stsVal in ('P', 'N'){enter}AND tmpTable.stsCd = 'RUN'{enter}UPDATE JobSts{enter}SET StsCd = 'MRK', StpDTime = getDate(),{enter}lastCngDTime = getDate(){enter}WHERE ObjId in{enter}(SELECT JobStsObjId from jobStsAsynchInfo{enter}WHERE MsgStsGuid in (select guid from {#}temp)){enter}UPDATE EvntSts.MsgSts{enter}SET StsVal = 'M', lastCngDTime = getDate(){enter}WHERE GUID in (select guid from {#}temp)
Gui, Destroy
Return
}

if(list == "Report Topic Log Query ")
{
Send select * from smsdbr.sms_rpt_topic_log {enter} where datediff (day, log_dtime, getdate()) =0{enter}and log_name = 'Put the sp name'{enter}--and log_step > 19{enter}order by 4 desc, 3 desc 
Gui, Destroy
Return
}

if(list == "Status Of Cube Job ")
{
Send select a.id_num,{enter}a.executor_id,{enter}a.obj_id,{enter}case when a.tsk_type in (31,32,33) and a.obj_id = -1 then 'Process Shared Dimensions'{enter}when a.tsk_type in (31,32,33) then c.CubeName{enter}else b.name end ArticleName,{enter}d.FileName,{enter}a.tsk_type,{enter}a.obj_tsk_seq,{enter}a.obj_tsk_sts,{enter}a.start_dtime,{enter}a.end_dtime{enter}from smsdbr.sms_sch_obj_tsk_ctl a{enter}left join smsdbr.WPBArticles b on a.obj_id = b.ArticleId{enter}left join smsdbr.WPBCube c on a.Obj_Id = c.CubeId{enter}left join smsdbr.WPBCRArticle z on b.ArticleId = z.CRArticleID{enter}left join smsdbr.WPBCRFile d on z.CRFileId = d.CRFileId{enter}where a.executor_id like 'Put cube job name'{enter}order by a.executor_id,a.obj_id 
Gui, Destroy
Return
}

if(list == "Delete Cubes If Job Is Marked Complete ")
{
Send delete from smsdbr.sms_sch_obj_tsk_ctl where executor_id = 'Put cube job name'
Gui, Destroy
Return
}

if(list == "Long Running Article ")
{
Send select * from smsdss.schedcubecrystal where executorid like 'Put job name'{enter}and Articlename like 'Put article name fetch the details from the query "for cube and crystal report job"' order by 1 desc
Gui, Destroy
Return
}

if(list == "Model Or Custom Article ")
{
Send DECLARE @ArticleNames Varchar(8000){enter}SET @ArticleNames='Put article name fetch the details from the query "for cube and crystal report job"'{enter}--Provide the article name within single quotes; for multiple articles,name should be separated by comma as has been done here{enter}Select WA.ArticleID Article_ID,WA.Name Article_Name,WF.FileName CrystalReport_Name,{enter}CASE{enter}WHEN WF.ModelID IS NULL THEN 'Custom'{enter}WHEN WF.ModelID='' THEN 'Custom'ELSE 'Model'END as Type from smsdbr.WPBArticles WA{enter}JOIN smsdbr.WPBCRArticle WCA ON WA.ArticleID=WCA.CRArticleID{enter}JOIN smsdbr.WPBCRFile WF ON WCA.CRFileID=WF.CRFileID{enter}where WA.Name IN (SELECT Parameter FROM dbo.fn_getparmtable(@ArticleNames))
Gui, Destroy
Return
}

if(list == "4.1 Report Job Query ")
{
Send select a.id_num, a.executor_id,a.obj_id,{enter}case when a.tsk_type in (31,32,33) and a.obj_id = -1 then 'Process Shared Dimensions'else b.name end ArticleName,d.FileName,a.tsk_type,{enter} a.obj_tsk_seq, a.obj_tsk_sts, a.start_dtime, a.end_dtime{enter}from smsdbr.sms_sch_obj_tsk_ctl a{enter}left join smsdbr.WPBArticles b on a.obj_id = b.ArticleId{enter}left join smsdbr.WPBCRArticle z on b.ArticleId = z.CRArticleID{enter}left join smsdbr.WPBCRFile d on z.CRFileId = d.CRFileId{enter}where executor_id like 'Put Job Name' and obj_tsk_sts<>1{enter}order by a.executor_id,a.obj_id 
Gui, Destroy
Return
}

if(list == "Model Or Custom Job ")
{
SetKeyDelay 5,0
Send select top 500 a.obj_name,a.userid,  a.job_name as Job_Name,start_Dtime as Start_DTime, end_dtime as End_DTime,'Apptype'='RDE',{enter}case  when userid in('smsdss','smsmir','dbo','soaradmin') and replace(userid,'_','#')  not like '%#%' and replace(userid,'\','#')  not like '`%{#}`%'then 'MODEL'{enter}when userid NOT in('smsdss','smsmir','dbo','soaradmin') and   (replace(userid,'_','{#}')    like '`%{#}`%' or replace(userid,'{\}','{#}')   like '`%{#}`%')then 'Custom'{enter}when userid NOT in('smsdss','smsmir','dbo','soaradmin') and   replace(userid,'{_}','{#}')   not like '`%{#}`%' and replace(userid,'{\}','{#}')  not like '`%{#}`%'{enter}and job_name  not like '`%CUBTST' and  job_name not like '`%CUBES' and  job_name not like'`%MCUBES' and  job_name not like '`%WCUBES'{enter}and  job_name not like '`%WSFCUB' and  job_name not like '`%WSFRPT'  and  job_name not like '`%MSFCUB' and  job_name not like '`%MSFRPT'{enter}and  job_name not like '03DSFCUB' and  job_name not like '`%RPTOPR' and  job_name not like '04ADRPT'{enter}then 'Custom'{enter}when userid NOT in('smsdss','smsmir','dbo','soaradmin') and   replace(userid,'{_}','{#}')   not like '`%{#}`%' and replace(userid,'{\}','{#}')   not like '`%{#}`%'and (job_name like '`%CUBTST' or job_name like '`%CUBES' or job_name like '`%MCUBES' or job_name like '`%WCUBES'{enter}or job_name like '`%WSFCUB' or  job_name like '`%WSFRPT'  or job_name like '`%MSFCUB' or job_name like '`%MSFRPT'{enter}or job_name like '03DSFCUB' or job_name like '`%RPTOPR' or job_name like '04ADRPT')then 'MODEL'{enter}else 'UNDT' end as JobGenre,   GETDATE() as LstChgDate{enter}from smsdbr.sched_Exec_hist a where a.job_name='XXXX' --put jobname here
Gui, Destroy
Return
}

if(list == "ODE Job Status Query ")
{
Send select job.objid, name,jobsts.servername, jobsts.strdtime,{enter}jobsts.stpdtime, stscd, itemsselno, itemsprcsno, lastitemobjid, curritemobjid{enter}from job, jobsts{enter}where job.objid = jobobjid{enter}and name like 'jobname'{enter}--and datediff (day, rundate, (select max (rundate) from job))<=0{enter}--and strdtime > '2006-01-19 00:03:02.000'{enter}--and stpdtime < '2004-06-28 21:00:00.000'{enter}--and (stscd like 'run' or stscd like 'err'){enter}order by jobsts.credtime desc
Gui, Destroy
Return
}

if(list == "ARP Job Status Query ")
{
SetKeyDelay 5,0
Send select job.name,{enter}Job.RunDate,{enter}jobsts.servername,{enter}jobsts.strdtime,{enter}jobsts.stpdtime,{enter}jobsts.stscd,{enter}jobsts.itemsSelNo,{enter}jobsts.itemsprcsno,{enter} case{enter} when (jobsts.stscd = 'END'and jobsts.itemsprcsno > 0) then {enter}convert(numeric(10,5),(datediff(second,strdtime,isnull(stpdtime, getdate()))))/jobsts.itemsprcsNo{enter}when (jobsts.stscd = 'ERR'and jobsts.itemsprcsno > 0) then{enter}convert(numeric(10,5),(datediff(second,strdtime,isnull(jobsts.LastCngDTime, getdate()))))/jobsts.itemsprcsNo --used LastCngDTime for correct reading{enter}when (jobsts.stscd = 'RUN' and jobsts.itemsprcsno > 0) then{enter}convert(numeric(10,5),(datediff(second,strdtime,isnull(jobsts.LastCngDTime, getdate()))))/jobsts.itemsprcsNo --usedLastCngDTime for correct reading {enter} else jobsts.itemsSelNo end PrcsRate,{enter}EvntSts.MsgSts.DestQueueName,{enter}EvntSts.MsgSts.StsVal,{enter}EvntSts.MsgSts.totchildexpmsgqty,{enter} EvntSts.MsgSts.totchildFailmsgqty,{enter}EvntSts.MsgSts.totchildRcvmsgqty,{enter}EvntSts.MsgSts.totchildSuccmsgqty,{enter}JobStsAsynchInfo.GrpId,{enter}JobStsAsynchInfo.GrpTypeDesc,{enter} JobStsAsynchInfo.GrpTypeId,{enter}JobStsAsynchInfo.GrpTypeMne,JobStsAsynchInfo.MaxMsgRqstNo,{enter}case{enter}when (jobsts.stscd = 'END' and jobsts.itemsprcsno > 0) then 0{enter}when (jobsts.stscd = 'ERR' and jobsts.itemsprcsno > 0) then 0{enter}when (jobsts.stscd = 'RUN' and (jobsts.itemsSelNo - jobsts.itemsprcsno) > 0) then{enter}dateadd(second, (convert(numeric(10,5),(datediff{enter}(second,strdtime,isnull(stpdtime, getdate()))))/jobsts.itemsprcsNo) * (jobsts.itemsSelNo - jobsts.itemsprcsno),getdate()){enter}else 0 {enter} end EstEndTime{enter}from jobsts{enter}join job{enter}on jobsts.jobobjid = job.objid{enter}join jobtype{enter}on job.jobtypeobjid = jobtype.objid{enter}left join JobStsAsynchInfo{enter}on JobStsAsynchInfo.JobStsObjId = JobSts.ObjId{enter}left join EvntSts.MsgSts on EvntSts.MsgSts.GUID = JobStsAsynchInfo.MsgStsGuid{enter}where strdtime between GETDATE()-1 and GETDATE(){enter}and job.name like '`%claim`%'{enter}--and jobsts.stscd in ('RUN'){enter}order by jobsts.strdtime desc
Gui, Destroy
Return
}

if(list == "Check If Job Is Skipping Records ")
{
Send select * from JobBypassObj{enter}order by 5 desc 
Gui, Destroy
Return
}

if(list == "Release Skipped Records ")
{
Send Declare @objidstring varchar(4000){enter}-- Forming the comma separated string{enter}Select @objidstring = COALESCE(@objidstring +',' , '') + rtrim(convert(char(20),objid)) from Dayendjobexcpdata{enter}where objid in{enter}(select top 200 objid from Dayendjobexcpdata{enter}where  jobbypassobjobjid in{enter}(select objid from jobbypassobj{enter}where rsntext not like '`%charm`%' and rsntext not like '`%{#}`%')){enter}exec DayEndJobExcpDataUpd1 @objidstring
Gui, Destroy
Return
}

if(list == "Release Single Skipped Record ")
{
Send update DayEndJobExcpData set JobBypassObjObjId=null where JobBypassObjObjId in( select objid from JobBypassObj where RsnText like '`%ssbinm`%' and rsntext not like '`%{#}`%'){enter}delete from jobbypassobj where RsnText like '`%ssbinm`%' and rsntext not like '`%{#}`%'{enter}where RsnText like '`%ssbinm`%' and rsntext not like '`%{#]`%' 
Gui, Destroy
Return
}

if(list == "Check For Record Count ")
{
Send select (select top 1 a.name from job a where a.jobtypeobjid = b.jobtypeobjid) as jobname,b.jobtypeobjid as jobtypeid, count(*) as count{enter}from jobbypassobj b{enter}where rsntext not like '`%{#}`%'group by  b.jobtypeobjid
Gui, Destroy
Return
}

if(list == "Check for record with tag ")
{
Send select (select top 1 a.name from job a where a.jobtypeobjid = b.jobtypeobjid) as jobname,b.jobtypeobjid as jobtypeid, count(*) as count from jobbypassobj b{enter}where rsntext like '`%{#}`%'{enter}group by  b.jobtypeobjid
Gui, Destroy
Return
}

if(list == "Time required for one sp to run in full reload ")
{
Send select * from smsdbr.sms_prcs_ctrl {enter} where prcs_name='RemitRespCLineFctLoadsp' {enter} order by prcs_version desc 
Gui, Destroy
Return
}

if(list == "Check for Skipped Records ")
{
Send Run query select count(*) from Batch where StsCd=2
Gui, Destroy
Return
}

if(list == "Long Running SP job ")
{
Send DECLARE @stringBeingSought NVARCHAR(MAX) -- the string we're looking for. The variable to become a parameter if you wish to extend this sp {enter} DECLARE @handle SMALLINT    -- the spid of the process {enter} DECLARE @sql NVARCHAR(MAX)  -- the dynamic SQL {enter} DECLARE @isRunning BIT  -- the result {enter} DECLARE @table TABLE ( EventType nvarchar(30) , [Parameters] int , EventInfo nvarchar(4000) )   -- the table variable holding the result of DBCC INPUTBUFFER execution {enter} SET @isRunning = 0 {enter} SET @stringBeingSought = 'sp_ALongRunningProcedure' –desired SP to check here. {enter} DECLARE procs CURSOR FOR SELECT session_id FROM sys.dm_exec_requests WHERE status IN ('running', 'suspended', 'pending', 'runnable') ORDER BY session_id DESC  -- these are the processes to examine {enter} OPEN procs {enter} FETCH NEXT FROM procs INTO @handle {enter} WHILE @@FETCH_STATUS=0 {enter} BEGIN {enter} BEGIN TRY {enter} DELETE FROM @table {enter} SET @sql = 'DBCC INPUTBUFFER(' + CAST(@handle AS NVARCHAR) + ')' {enter} INSERT INTO @table {enter} EXEC (@sql) {enter} SELECT @sql = EventInfo FROM @table {enter} END TRY {enter} BEGIN CATCH {enter} SET @sql = '' {enter} END CATCH {enter} IF CHARINDEX( @stringBeingSought, @sql, 0 ) > 0 {enter} BEGIN {enter} SET @isRunning = 1 {enter} END {enter} FETCH NEXT FROM procs INTO @handle {enter} END {enter} CLOSE procs DEALLOCATE procs {enter} SELECT ISNULL(@isRunning, 0) 
Gui, Destroy
Return
}

if(list == "DB backup progress ")
{
Send SELECT r.session_id,r.command,CONVERT(NUMERIC(6,2),r.percent_complete) {enter} AS [Percent Complete],CONVERT(VARCHAR(20),DATEADD(ms,r.estimated_completion_time,GetDate()),20) AS [ETA completion Time], {enter} CONVERT(NUMERIC(10,2),r.total_elapsed_time/1000.0/60.0) AS [Elapsed Min], {enter} CONVERT(NUMERIC(10,2),r.estimated_completion_time/1000.0/60.0) AS [ETA Min], {enter} CONVERT(NUMERIC(10,2),r.estimated_completion_time/1000.0/60.0/60.0) AS [ETA Hours], {enter} CONVERT(VARCHAR(1000),(SELECT SUBSTRING(text,r.statement_start_offset/2, {enter} CASE WHEN r.statement_end_offset = -1 THEN 1000 ELSE (r.statement_end_offset-r.statement_start_offset)/2 END) {enter} FROM sys.dm_exec_sql_text(sql_handle))) {enter} FROM sys.dm_exec_requests r WHERE command IN ('RESTORE DATABASE','BACKUP DATABASE') {enter} SELECT session_id as SPID, command, a.text AS Query, start_time, percent_complete, dateadd(second,estimated_completion_time/1000, getdate()) as estimated_completion_time {enter} FROM sys.dm_exec_requests r CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) a {enter} WHERE r.command in ('BACKUP DATABASE','RESTORE DATABASE') 
Gui, Destroy
Return
}

if(list == "Wait for file ")
{
Send select * from smsdbr.sms_intf_prcs where cnx_id like 'put file name here' {enter} update smsdbr.sms_intf_prcs set last_per_from  ='2016-09-04 03:00:17.000', last_per_to ='2016-09-04 03:00:17.000' where cnx_id like '%glGJI0_gl%'
Gui, Destroy
Return
}

if(list == "01END troubleshooting ")
{
Send select RptPrcsDate SF_Rpt_Prcs_Date from smsdss.RptPrcsDate {enter} select max(prcs_date) DW_prcs_Date from smsdss.prcs_dates_ctrl {enter} update smsdss.RptPrcsDate set RptPrcsDate='2016-11-04 00:00:00.000' {enter} update smsdss.RptPrcsDate set RptPrcsDTime='2016-11-04 00:00:00.000'
Gui, Destroy
Return
}

if(list == "Database Version ")
{
Send select * from DbVersRls
Gui, Destroy
Return
}

if(list == "Kill Long Running Article ")
{
Send update smsdbr.sms_sch_obj_tsk_ctl {enter} set obj_tsk_sts = -1 where obj_id like 'put the objid here'
Gui, Destroy
Return
}

if(list == "Replication Status ")
{
Send select h.time, {enter} h.comments, {enter} left(a.name,60) as 'Distribution Job', {enter} h.start_time {enter} from distribution.dbo.MSdistribution_history h,{enter} distribution.dbo.MSdistribution_agents a {enter} where a.id = h.agent_id {enter} -- and h.comments = 'No replicated transactions are available.' -- uncomment to check for just the end message {enter} order by 3 asc, {enter} time desc
Gui, Destroy
Return
}

if(list == "Run a job in full reload ")
{
Send select * from smsdss.ss_profile where pf_key = 'pick the sp from the msv error' {enter} delete from smsdss.ss_profile where pf_key = 'pick the sp from the msv error'
Gui, Destroy
Return
}

if(list == "Check if SP job is hung ")
{
Send sp_spaceused 'smsdss.WklstDtlTrendFct' 
Gui, Destroy
Return
}

if(list == "ETL records ")
{
Send select count(*) from SFETL.ETLBlPerPending (nolock) where PrcsStsCd='U' {enter} SELECT GETDATE() AS ExecTime , count(*) AS Cnt FROM sfetl.ETLPtDxPending WHERE PrcsStsCd = 'U' and LastCngDTime <= (SELECT MAX(LastCngDTime) MaxLastCngDTime FROM SFETl.ETLApplDatePending ) 
Gui, Destroy
Return
}

if(list == "Delay Reason ")
{
Send select avg(datediff(ss,start_dtime,end_dtime)/60) as Avg_Run_Time ,job_name,userid into {#}temp1 from smsdbr.sched_exec_hist {enter} where end_dtime{>=}'put date here' -- Put the date since when the average require {enter} group by job_name,userid having COUNT(*)>1 {enter} order by 1 desc {enter} select datediff(ss,start_dtime,end_dtime)/60 as Curr_Run_Time,end_dtime,start_dtime, job_name into {#}temp2 from smsdbr.sched_exec_hist {enter} where end_dtime>='2017-04-12'  --Put the current date {enter} select  a.job_name as Job_Name,a.userid,   Start_DTime, end_dtime as End_DTime, Curr_Run_Time, Avg_Run_Time,(Curr_Run_Time - Avg_Run_Time) as DelayBy, {enter} case {enter} when a.userid in('smsdss','smsmir','dbo','soaradmin','smssched','smscbm','smsmsq') {enter} then 'MODEL' when a.userid NOT in('smsdss','smsmir','dbo','soaradmin','smssched','smscbm','smsmsq') and   ( {enter} replace(a.userid,'{_}'{,}'{#}')   like '`%{#}`%' or replace(a.userid,'{\}','{#}') like '`%{#}`%' ) {enter} and (a.job_name  like '`%CUBTST' or a.job_name  like '`%CUBES' or  a.job_name  like '`%MCUBES' or a.job_name  like '`%WCUBES' {enter} or a.job_name  like '`%WSFCUB' or  a.job_name  like {enter} '`%WSFRPT'  or a.job_name  like '`%MSFCUB' or a.job_name  like '`%MSFRPT'or  a.job_name  like '03DSFCUB' or a.job_name  like '`%RPTOPR' or a.job_name  like '04ADRPT' or a.job_name  like '1DMRPT'or a.job_name   like '01EMTEVA' or a.job_name  like '`%RPTMID'  or a.job_name  like '00DMRFSH' or a.job_name  like '01EDMW' OR a.job_name like '`%SHRDIM') {enter} then 'MODEL' {enter} when a.userid NOT in('smsdss','smsmir','dbo','soaradmin','smssched','smscbm','smsmsq') and   replace(a.userid,'{_}','{#}')   not like '`%{#}`%' {enter} and replace(a.userid,'{\}'{,}{#}')   not like '`%{#}`%'
{enter} and (a.job_name like '`%CUBTST' or a.job_name like '`%CUBES' or a.job_name like '`%MCUBES' or a.job_name like '`%WCUBES' {enter} or a.job_name like '`%WSFCUB' or  a.job_name like '`%WSFRPT'  or a.job_name like '`%MSFCUB' or a.job_name like '`%MSFRPT' {enter} or a.job_name like '03DSFCUB' or a.job_name like '`%RPTOPR' or a.job_name like '04ADRPT' {enter} or a.job_name  like '1DMRPT' {enter} or a.job_name  like '01EMTEVA' OR  a.job_name  like '`%RPTMID'  or a.job_name  like '00DMRFSH' or a.job_name  like '01EDMW' {enter} OR a.job_name like '`%SHRDIM' {enter}) {enter}then MODEL' {enter} when a.userid NOT in('smsdss','smsmir','dbo','soaradmin','smssched','smscbm','smsmsq') and   ({enter} replace(a.userid,'{_}','{#}')   like '`%{#}`%' {enter} or replace(a.userid,'{\}','{#}') {enter}like`%{#}`% ) {enter} and (a.job_name not like '`%CUBTST' and a.job_name not like '`%CUBES' and  a.job_name not like '`%MCUBES' and a.job_name not like '`%WCUBES' {enter} and {enter} a.job_name not like '`%WSFCUB' and  a.job_name not like '`%WSFRPT'  and a.job_name not like 'MSFCUB' and a.job_name not like '`%MSFRPT' {enter} and  a.job_name not like '03DSFCUB' and a.job_name not like '`%RPTOPR' and a.job_name not like '04ADRPT' {enter} and a.job_name not like '1DMRPT' {enter} and a.job_name not  like '01EMTEVA' and a.job_name not like 'RPTMID'{enter} and a.job_name  not like '00DMRFSH' and a.job_name not like '01EDMW' {enter} and  a.job_name not like '`%SHRDIM' {enter}  ) {enter} then 'Custom' {enter} when a.userid NOT in {enter} ('smsdss','smsmir','dbo','soaradmin','smssched','smscbm','smsmsq') and   replace(a.userid,'{_}','{#}')   not like '`%{#}`%' {enter} and replace(a.userid,'{\}','{#}')  not like '`%{#}`%' {enter} and a.job_name  not like '`%CUBTST' and  a.job_name not like '`%CUBES' and  a.job_name not like {enter} '`%MCUBES' and  a.job_name not like '`%WCUBES' {enter} and  a.job_name not like '`%WSFCUB' and  a.job_name not like '`%WSFRPT'  and  a.job_name not like '`%MSFCUB' and  a.job_name not like '`%MSFRPT' {enter} and  a.job_name not like '03DSFCUB' and  a.job_name not like '`%RPTOPR' and {enter}a.job_name not like '04ADRPT' and a.job_name not like '1DMRPT' {enter} and a.job_name not like '01EMTEVA' and a.job_name not like '`%RPTMID' {enter}and a.job_name  not like '00DMRFSH' and a.job_name not like '01EDMW' {enter}and a.job_name not like '`%SHRDIM' {enter} then 'Custom' {enter} else 'UNDETERMINED' {enter} end as Type {enter} from {#}temp1 a {enter}join {#}temp2 b on
a.job_name=b.job_name {enter} where b.Curr_Run_Time-a.avg_Run_Time>05 -- Fill This up {enter} order by 4 desc {enter} drop table {#}temp1 {enter} drop table {#}temp2
Gui, Destroy
Return
}



return
;-------------------------------------------------------------------------------------------------

initial:
Gui Destroy
Gui, Add, Radio, x22 y29 w140 h30 gDist, Distribution
Gui, Add, Radio, x22 y69 w140 h30 gDB, DB Blocking
Gui, Add, Radio, x22 y109 w140 h30 gLRJ, Long Running Job
Gui, Add, Radio, x22 y149 w140 h30 gTJ, Triplet Jobs
Gui, Add, Radio, x22 y189 w140 h30 , ODE Jobs
Gui, Add, Radio, x22 y229 w140 h30 gJob, Job Abends
Gui, Show, x127 y87 h268 w212, Initial Doc
Return

Dist:
Sleep 1050
SetKeyDelay 35, 20
Send Logged into the sql job monitor and found that the distribution is running fine.
return

DB:
Sleep 1050
SetKeyDelay 5, 0
Send Logged into the database and did not find any SPIDs which is blocking the database. Will update from time to time if we find any blockings and take care accordingly.
return

LRJ:
Sleep 1050
SetKeyDelay 5,0
Send Job is running long since it has picked up larger number of records as compared to previous business date. There is no blocking and the number of rows are getting updated at regular intervals. Monitoring the progress.
return

TJ:
Sleep 1050
SetKeyDelay 5,0
Send Logged into the database and found that the triplet jobs are running fine. Will update further details from time to time.
return

T2:
Sleep 1050
SetKeyDelay 5,0
Send Model Job "put job type" "put job name" abended due to error "put MSV error".Restart the job a couple of times but it failed to finish. Requesting dayend tier 2 to kindly look into the issue. Job is lying in abended state in the scheduler.
return

GIS:
Gui Destroy
Gui, Add, Radio, x22 y19 w160 h30 , DBA related Jobs
Gui, Add, Radio, x22 y59 w160 h30 , Claims related Jobs
Gui, Add, Radio, x22 y99 w160 h30 , GIS Jobs
Gui, Add, Radio, x22 y139 w160 h30 , PA Jobs
Gui, Add, Radio, x22 y179 w160 h30 , Reimbursement Jobs
Gui, Add, Radio, x22 y219 w160 h30 , Architecture Jobs
Gui, Show, x586 y172 h262 w215, ODE Jobs
Return


LJR:
Sleep 1050
SetKeyDelay 5,0
Send Long running job/article "put job name here" seems auto corrected/completed successfully now hence closing issue.
return

Job:
Sleep 1050
SetKeyDelay 5,0
Send Checking the job. Will restart if required and update further.
return

T1:
Sleep 1050
SetKeyDelay 5,0
Send Logged into the database and observed there is no blocking issue.The issue seems to have been a temporary one.Hence closing alarm as blocking does not persist anymore.
return

Distr:
Sleep 1050
SetKeyDelay 5,0
Send TND-DSS_TNX distribution status in the app server has been checked and verified to be working fine at this moment.The issue with the TND-TNX_DSS was temporary and requires no action to be taken at this time.Hence closing the alarm.
return

CR:
Sleep 1050
SetKeyDelay 5,0
Send The refresh failed for Crystal Article "put crystal artcile id and name" while trying to produce file "put the location":  Error Number: 5 - Error in DSSReport.Job finished on restart.Closing the alarm.
return

Trp:
Gui Destroy
Gui, Add, Radio, x82 y699 w200 h40 , Radio
Gui, Add, Radio, x22 y19 w240 h50 g1, Job failed and Next Instance successfull
Gui, Add, Radio, x22 y79 w240 h50 g2, Job failed and Next Instance also failed
Gui, Add, Radio, x22 y139 w240 h50 g3, Job Not Running and Splitting
Gui, Add, Radio, x22 y199 w240 h50 g4, Job Not running scheduler processing reocrds
Gui, Add, Radio, x22 y259 w240 h50 g5, Job running long and completed
Gui, Add, Radio, x22 y319 w240 h50 g6, Job running long and skipping
Gui, Show, x127 y87 h394 w292, Quartz Documents
Return

1:
Sleep 1050
SetKeyDelay 5,0
Send As per Default Action (in Job failed section) we check the followings:Identified the failing Job in the scheduler and check the job status. Found the next job instance completed successfully.So, closing the CAM alarm based on our observation.
return

2:
Sleep 1050
SetKeyDelay 5,0
Send As per Default Action (in Job failed section) we check the followings:Identified the failing Job in the scheduler and check the job status. Found the job was not successful and other jobs are also failing. Next we check the condition of the JVMs and found that the JVM is not running. Fixed the issue with JVM and post which the jobs started running successfully. So, closing the CAM alarm based on the observations.
return

3:
Sleep 1050
SetKeyDelay 5,0
Send As per Default Action (Job in Skipped- Previous Job is Still Splitting ) we check the followings:Checked the job status in the scheduler and found that the job was not running (triplets jobs are stuck).Next it was found that the job in skip mode, So, we referred the resolution steps mention therein the default action.So as per resolution steps mentioned therein, the offending GUID has been marked complete with the help of SQL statement mentioned there. Post which the issue got resolved.Closing the CAM alarm after resolving the issue.
return

4:
Sleep 1050
SetKeyDelay 5,0
Send As per Default Action (Job in Skipped- Previous Job is Still Splitting ) we check the followings:Checked the job status in the scheduler and found that the job was running.Next it was found that the job is processing records actively, so we waited for the job to complete.Later the job  completed. So, closing the CAM alarm based on the observations.
return

5:
Sleep 1050
SetKeyDelay 5,0
Send As per Default Action (in Job in Progress (Long Running) section) we check the followings:Checked the job status in the scheduler and found that the job was in progress and processing records actively.so we waited for the job to complete.Later the job  completed. So, closing the CAM alarm based on the observations.
return

6:
Sleep 1050
SetKeyDelay 5,0
Send As per Default Action (in Job in Progress (Long Running) section) we check the followings:Checked the job status in the scheduler and found that the job was still in progress, but not processing any records.Next it was found that the job in skip mode. So JVM has been recycled, post which issue got resolved.Closing the CAM alarm after resolving the issue.
return

Deadlock:
Sleep 1050
SetKeyDelay 5,0
Send Load job "job name" abended due to error ""SQLSTATE = 40001 [Microsoft][SQL Server Native Client 11.0][SQL Server]Transaction (Process ID 86) was deadlocked on lock | communication buffer resources with another process and has been chosen as the deadlock victim. Rerun the transaction.. ". Job finished on restart.Closing the alarm.
return

;GuiClose:
ExitApp