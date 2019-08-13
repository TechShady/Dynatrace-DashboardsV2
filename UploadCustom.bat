@echo off
set "dashboardid="
set "overviewid="
set "dashboardname="
set "tenant="
set "posnum="
REM Gather environment details
set /p tenant="Enter Tenant (i.e. aaa54321.live.dynatrace.com): "
set /p dashboardid="Enter Custom Dashboard ID: "
set /p overviewid="Enter Overview Dashboard ID: "
set /p dashboardname="Enter Custom Dashboard Name: "
set /p posnum="Enter Position (1-5): "
REM Get Custom Dashboard
curl -X GET "https://%tenant%/api/config/v1/dashboards/%dashboardid%" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" > Custom1.json
REM Add Hook
powershell -Command "Get-ChildItem -Path %CD%\Custom1.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '}]') {(Get-Content $_ | ForEach {$_ -replace '}]', '},{"""name""": """Markdown""","""tileType""": """MARKDOWN""","""configured""": true,"""bounds""": {"""top""": 0,"""left""": 1558,"""width""": 152,"""height""": 38},"""tileFilter""": {"""timeframe""": null,"""managementZone""": null},"""markdown""": """## [Return](#dashboard;id=6e481cc8-bea9-46ba-b1f8-23ebcc1da313)"""}]'}) | Set-Content $_ -encoding UTF8}}"
REM Upload Custom Dashboard
curl -X PUT "https://%tenant%/api/config/v1/dashboards/%dashboardid%" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\Custom1.json
REM Get Overview Dashboard
curl -X GET "https://%tenant%/api/config/v1/dashboards/%overviewid%" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" > CustomOverview.json
REM Update Overview Dashboard
if %posnum%==1 (powershell -Command "Get-ChildItem -Path %CD%\CustomOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Logs') {(Get-Content $_ | ForEach {$_ -replace 'Logs', '%dashboardname%'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path %CD%\CustomOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'logmonitoring') {(Get-Content $_ | ForEach {$_ -replace 'logmonitoring', 'dashboard;id=%dashboardid%'}) | Set-Content $_ -encoding UTF8}}")
if %posnum%==2 (powershell -Command "Get-ChildItem -Path %CD%\CustomOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Service View') {(Get-Content $_ | ForEach {$_ -replace 'Service View', '%dashboardname%'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path %CD%\CustomOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'newservices') {(Get-Content $_ | ForEach {$_ -replace 'newservices', 'dashboard;id=%dashboardid%'}) | Set-Content $_ -encoding UTF8}}")
if %posnum%==3 (powershell -Command "Get-ChildItem -Path %CD%\CustomOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'All PurePaths') {(Get-Content $_ | ForEach {$_ -replace 'All PurePaths', '%dashboardname%'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path %CD%\CustomOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'servicecalls;timeframe=last2h') {(Get-Content $_ | ForEach {$_ -replace 'servicecalls;timeframe=last2h', 'dashboard;id=%dashboardid%'}) | Set-Content $_ -encoding UTF8}}")
if %posnum%==4 (powershell -Command "Get-ChildItem -Path %CD%\CustomOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Slow PurePaths') {(Get-Content $_ | ForEach {$_ -replace 'Slow PurePaths', '%dashboardname%'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path %CD%\CustomOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'servicecalls;timeframe=last2h;servicefilter=0%1E0%1118000000%144611686018427387') {(Get-Content $_ | ForEach {$_ -replace 'servicecalls;timeframe=last2h;servicefilter=0%1E0%1118000000%144611686018427387', 'dashboard;id=%dashboardid%'}) | Set-Content $_ -encoding UTF8}}")
if %posnum%==5 (powershell -Command "Get-ChildItem -Path %CD%\CustomOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'User Sessions') {(Get-Content $_ | ForEach {$_ -replace 'User Sessions', '%dashboardname%'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path %CD%\CustomOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'usersearchoverview') {(Get-Content $_ | ForEach {$_ -replace 'usersearchoverview', 'dashboard;id=%dashboardid%'}) | Set-Content $_ -encoding UTF8}}")
REM Upload Overview Dashboard
curl -X PUT "https://%tenant%/api/config/v1/dashboards/%overviewid%" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\CustomOverview.json
echo 
echo          ********* Custom Dashboard Added to Dynatrace BizOps *********
