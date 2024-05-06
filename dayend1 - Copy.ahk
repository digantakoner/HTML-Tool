#SingleInstance force
F10::
 
Gui destroy

Gui, Font, S12 CDefault, Verdana

Gui, Show, x448 y134 h281 w453, Dayend Simplified
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
Gui, Add, Radio, x22 y229 w150 h30 gCR, Crystal report 
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
Gui, Font, S12 CDefault, Verdana
Gui, Add, DropDownList, x32 y19 w410 h3000 vlist
,Check Blocking in DB
|Check Status Of Quartz Scheduler from DB
;|Specific GUID to mark complete job | Determine the jvm for quartz | Log View Of Triplets | Quartz Jobs not running | Report Topic Log Query | Status Of Cube Job | Delete Cubes If Job Is Marked Complete | Long Running Article | Model Or Custom Article | 4.1 Report Job Query | Model Or Custom Job | ODE Job Status Query | ARP Job Status Query | Check If Job Is Skipping Records | Release Skipped Records | Release Single Skipped Record | Check For Record Count | Check for record with tag | Time required for one sp to run in full reload | Check for Skipped Records | Long Running SP job | DB backup progress | Wait for file | 01END troubleshooting | Database Version | Kill Long Running Article | Replication Status | Run a job in full reload | Check if SP job is hung | ETL records | Delay Reason | Substitution value change | Failed Job History | Cube Job Progress | Total Number Of Jobs in Scheduler | Job Information | Model RDE flow | RDE ETA query | ODE ETA query
Gui, Add, Button, x152 y49 w120 h30 gbutton, OK
Gui, Show, x494 y135 h87 w468, Queries List
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
Send SELECT top 100 JobSts.CredTime, JobSts.ObjId, JobType.Name,EvntSts.MsgSts.GUID, JobSts.StsCd, EvntSts.MsgSts.StsVal, JobSts.StsCd,EvntSts.MsgSts.TotChildExpMsgQty, EvntSts.MsgSts.TotChildFailMsgQty, EvntSts.MsgSts.TotChildSuccMsgQty FROM EvntSts.MsgSts JOIN JobStsAsynchInfo on JobStsAsynchInfo.MsgStsGuid = EvntSts.MsgSts.GUID JOIN jobSts ON JobStsAsynchInfo.JobStsObjId = jobSts.ObjId JOIN Job ON jobSts.jobObjid = Job.ObjId JOIN JobType ON JobType.ObjId = Job.JobTypeObjId AND JobType.Name like '`%Sched' order by JobSts.credTime desc
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
Gui, Add, Radio, x22 y189 w140 h30 gClaims, ODE Jobs
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