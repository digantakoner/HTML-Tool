Gui, Font, S12 CDefault, Verdana
Gui, Add, DropDownList, x32 y19 w410 h3000 gselect vlist, Check Blocking in DB | Check Status Of Quartz Scheduler from DB | Specific GUID to mark complete job | Determine the jvm for quartz | Log View Of Triplets | Quartz Jobs not running | Report Topic Log Query | Status Of Cube Job | Delete Cubes If Job Is Marked Complete | Long Running Article | Model Or Custom Article | 4.1 Report Job Query | Model Or Custom Job | ODE Job Status Query | ARP Job Status Query | Check If Job Is Skipping Records | Release Skipped Records | Release Single Skipped Record | Check For Record Count | Check for record with tag | Time required for one sp to run in full reload | Check for Skipped Records | Long Running SP job | DB backup progress | Wait for file | 01END troubleshooting | Database Version | Kill Long Running Article | Replication Status | Run a job in full reload | Check if SP job is hung | ETL records | Delay Reason | Substitution value change | Failed Job History | Cube Job Progress | Total Number Of Jobs in Scheduler | Job Information | Model RDE flow | RDE ETA query | ODE ETA query
Gui, Add, Button, x152 y49 w120 h30 gbutton, OK
Gui, Show, x494 y135 h87 w468, Queries List

select:
Gui,Submit,NoHide
Tooltip, %list%
Return

button:
Gui,Submit,NoHide
Gui,%list%
Return

GuiClose:
ExitApp