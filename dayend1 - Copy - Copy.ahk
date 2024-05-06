Gui, Font, S12 CDefault, Verdana

Gui, Show, x448 y134 h281 w453, New GUI Window
Gui, Add, Picture, x12 y9 w220 h50 , C:\Users\dk048606\Desktop\cerner-logo.png

Gui, Add, GroupBox, x242 y9 w200 h60 , Utilities
Gui, Add, GroupBox, x12 y69 w430 h70 ,
Gui, Add, GroupBox, x12 y139 w430 h130 , Documentations
 
Gui, Font, S12 CDefault, Verdana

Gui, Add, Radio, x252 y29 w90 h30 , Queries
Gui, Add, Radio, x352 y29 w80 h30 , Emails

Gui, Add, Radio, x332 y199 w80 h30 , Initial
Gui, Add, Radio, x212 y169 w90 h30 , GIS Job
Gui, Add, Radio, x22 y199 w180 h30 , Claim Follower Job
Gui, Add, Radio, x22 y169 w180 h30 , Jobs Running Long
Gui, Add, Radio, x332 y169 w90 h30 , Blocking
Gui, Add, Radio, x212 y229 w120 h30 , Distribution
Gui, Add, Radio, x22 y229 w150 h30 , Tier 2 requests
Gui, Add, Radio, x212 y199 w90 h30 , Triplets
Gui, Add, Radio, x332 y229 w100 h30 , DeadLock

Gui, Add, Text, x142 y89 w10 h20 , |
Gui, Add, Text, x282 y89 w10 h20 , |
Gui, Add, Text, x202 y109 w10 h30 , |

Gui, Font, S8 CBlue Underline, Verdana
Gui, Add, Text, x42 y89 w90 h20 , Paging Groups
Gui, Add, Text, x172 y89 w100 h20 , Remedy Queues
Gui, Add, Text, x302 y89 w110 h20 , Customer Contacts
Gui, Add, Text, x82 y109 w120 h20 , Environment Names
Gui, Add, Text, x212 y109 w170 h20 , Custom Handling Instructions


Return

GuiClose:
ExitApp