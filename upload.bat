@echo off
set "tenant="
set "owner="
set "funnel="
set "overview="
set "revproperty="
set "revflag=False"
set "revenue="
set "promstep="
set "f1step="
set "f2step="
set "f3step="
set "f4step="
set "f5step="
set "f6step="
set "f7step="
set "f8step="
set "f9step="
set "f10step="
set "f11step="
set "f12step="
set "stepcount=3"
REM Gather environment details
set /p tenant="Enter Tenant (i.e. aaa54321.live.dynatrace.com): "
set /p owner="Enter Dashboard Owner (ID you use to sign into Dynatrace): "
set /p funnel="Enter Funnel Name (i.e. Shopping Funnel): "
set /p overview="Enter Overview Name (i.e. EasyTravel Overview): "
set /p revproperty="Do you have a session property for revenue? (Y/N): "
if %revproperty%==Y (set /p revenue="Enter Revenue Session Property: "
set "revflag=True")
set /p promstep="Enter Promotion User Action: "
set /p f1step="Enter The 1st Funnel Step User Action: "
set /p f2step="Enter The 2nd Funnel Step User Action: "
set /p f3step="Enter The 3rd Funnel Step User Action: "
set "laststep=%f3step%"
set /p f4step="Enter The 4th Funnel Step User Action: "
if defined f4step (set "laststep=%f4step%"
set stepcount=4
set /p f5step="Enter The 5th Funnel Step User Action: ")
if defined f5step (set "laststep=%f5step%"
set stepcount=5
set /p f6step="Enter The 6th Funnel Step User Action: ")
if defined f6step (set "laststep=%f6step%"
set stepcount=6
set /p f7step="Enter The 7th Funnel Step User Action: ")
if defined f7step (set "laststep=%f7step%"
set stepcount=7
set /p f8step="Enter The 8th Funnel Step User Action: ")
if defined f8step (set "laststep=%f8step%"
set stepcount=8
set /p f9step="Enter The 9th Funnel Step User Action: ")
if defined f9step (set "laststep=%f9step%"
set stepcount=9
set /p f10step="Enter The 10th Funnel Step User Action: ")
if defined f10step (set "laststep=%f10step%"
set stepcount=10
set /p f11step="Enter The 11th Funnel Step User Action: ")
if defined f11step (set "laststep=%f11step%"
set stepcount=11
set /p f12step="Enter The 12th Funnel Step User Action: ")
if defined f12step (set "laststep=%f12step%"
set stepcount=12)
echo Transforming Dashboards. Please wait...
@echo off
REM Replace all tenant names
powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'MyTenant') {(Get-Content $_ | ForEach {$_ -replace 'MyTenant', '%tenant%'}) | Set-Content $_ -encoding UTF8}}"
REM Replace all owner names
powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'MyEmail') {(Get-Content $_ | ForEach {$_ -replace 'MyEmail', '%owner%'}) | Set-Content $_ -encoding UTF8}}"
REM Replace all funnel names
powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'MyFunnel') {(Get-Content $_ | ForEach {$_ -replace 'MyFunnel', '%funnel%'}) | Set-Content $_ -encoding UTF8}}"
REM Replace all overview names
powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'MyOverview') {(Get-Content $_ | ForEach {$_ -replace 'MyOverview', '%overview%'}) | Set-Content $_ -encoding UTF8}}"
REM Replace revenue system property name
if %revproperty%==Y (powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'revenueproperty') {(Get-Content $_ | ForEach {$_ -replace 'revenueproperty', '%revenue%'}) | Set-Content $_ -encoding UTF8}}")
REM Replace Promotion names
powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'PromStep') {(Get-Content $_ | ForEach {$_ -replace 'PromStep', '%promstep%'}) | Set-Content $_ -encoding UTF8}}"
REM Replace Funnel step names
powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step1') {(Get-Content $_ | ForEach {$_ -replace 'Step1', '%f1step%'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step2') {(Get-Content $_ | ForEach {$_ -replace 'Step2', '%f2step%'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step3') {(Get-Content $_ | ForEach {$_ -replace 'Step3', '%f3step%'}) | Set-Content $_ -encoding UTF8}}"
if defined f4step (powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step4') {(Get-Content $_ | ForEach {$_ -replace 'Step4', '%f4step%'}) | Set-Content $_ -encoding UTF8}}")
if defined f5step (powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step5') {(Get-Content $_ | ForEach {$_ -replace 'Step5', '%f5step%'}) | Set-Content $_ -encoding UTF8}}")
if defined f6step (powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step6') {(Get-Content $_ | ForEach {$_ -replace 'Step6', '%f6step%'}) | Set-Content $_ -encoding UTF8}}")
if defined f7step (powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step7') {(Get-Content $_ | ForEach {$_ -replace 'Step7', '%f7step%'}) | Set-Content $_ -encoding UTF8}}")
if defined f8step (powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step8') {(Get-Content $_ | ForEach {$_ -replace 'Step8', '%f8step%'}) | Set-Content $_ -encoding UTF8}}")
if defined f9step (powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step9') {(Get-Content $_ | ForEach {$_ -replace 'Step9', '%f9step%'}) | Set-Content $_ -encoding UTF8}}")
if defined f10step (powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step10') {(Get-Content $_ | ForEach {$_ -replace 'Step10', '%f10step%'}) | Set-Content $_ -encoding UTF8}}")
if defined f11step (powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step11') {(Get-Content $_ | ForEach {$_ -replace 'Step11', '%f11step%'}) | Set-Content $_ -encoding UTF8}}")
if defined f12step (powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'Step12') {(Get-Content $_ | ForEach {$_ -replace 'Step12', '%f12step%'}) | Set-Content $_ -encoding UTF8}}")
powershell -Command "Get-ChildItem -Path %CD%\*.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'LastStep') {(Get-Content $_ | ForEach {$_ -replace 'LastStep', '%laststep%'}) | Set-Content $_ -encoding UTF8}}"
echo Uploading Dashboards...
@echo off
REM Upload dashboards
curl -X PUT "https://%tenant%/api/config/v1/dashboards/65312f05-ca6c-4896-b2b4-1bc8ce3da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\Funnel%stepcount%.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/0d81ee7c-f7ba-4626-a087-60b76ecda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\ConversionAnalysisF%revflag%.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/c16cb11a-22be-41ab-a336-412369ada313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\DuratioinAnalysis%revflag%.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7afde609-dbbe-486f-b2c0-0bde4c4da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\AbandonsAnalysis%revflag%.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/8a487b1b-c491-41f7-adf2-7460165da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\ErrorAnalysis%revflag%.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/ba9ecfe5-e7ec-451d-a187-060a724da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\ConversionAnalysisO%revflag%.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7eb2b38c-bae4-46c5-8955-c3eabb9da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\RageAnalysis%revflag%.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7f063e1f-e142-44f1-81a0-523f7e5da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\NonEngagedAnalysis%revflag%.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/6e481cc8-bea9-46ba-b1f8-23ebcc1da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\Overview%revflag%.json
if %revproperty%==Y (curl -X PUT "https://%tenant%/api/config/v1/dashboards/f8c73b94-d5ef-4cbf-bcb8-d866c91da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\RevenueAnalysis.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/834e194e-a9bc-406a-9696-40afcc0da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\RiskRevenueAnalysis.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/361e6756-3227-43bb-9fdd-69305feda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\LostRevenueAnalysis.json)
curl -X PUT "https://%tenant%/api/config/v1/dashboards/1fc1af04-a855-43cb-855c-c32f4ecda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep1.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/2662ddb8-dd6a-4345-a1bc-7ff069eda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep2.json
if defined f4step (curl -X PUT "https://%tenant%/api/config/v1/dashboards/10a69069-74c2-4eba-b18a-6856d91da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep3.json)
if defined f5step (curl -X PUT "https://%tenant%/api/config/v1/dashboards/10a69069-74c2-4eba-b18a-6856d91da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep3.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7f64e3ef-239c-416a-b3a4-66b99beda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep4.json)
if defined f6step (curl -X PUT "https://%tenant%/api/config/v1/dashboards/10a69069-74c2-4eba-b18a-6856d91da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep3.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7f64e3ef-239c-416a-b3a4-66b99beda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep4.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac15-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep5.json)
if defined f7step (curl -X PUT "https://%tenant%/api/config/v1/dashboards/10a69069-74c2-4eba-b18a-6856d91da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep3.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7f64e3ef-239c-416a-b3a4-66b99beda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep4.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac15-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep5.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac06-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep6.json)
if defined f8step (curl -X PUT "https://%tenant%/api/config/v1/dashboards/10a69069-74c2-4eba-b18a-6856d91da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep3.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7f64e3ef-239c-416a-b3a4-66b99beda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep4.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac15-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep5.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac06-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep6.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac07-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep7.json)
if defined f9step (curl -X PUT "https://%tenant%/api/config/v1/dashboards/10a69069-74c2-4eba-b18a-6856d91da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep3.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7f64e3ef-239c-416a-b3a4-66b99beda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep4.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac15-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep5.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac06-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep6.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac07-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep7.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac08-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep8.json)
if defined f10step (curl -X PUT "https://%tenant%/api/config/v1/dashboards/10a69069-74c2-4eba-b18a-6856d91da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep3.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7f64e3ef-239c-416a-b3a4-66b99beda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep4.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac15-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep5.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac06-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep6.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac07-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep7.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac08-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep8.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac09-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep9.json)
if defined f11step (curl -X PUT "https://%tenant%/api/config/v1/dashboards/10a69069-74c2-4eba-b18a-6856d91da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep3.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7f64e3ef-239c-416a-b3a4-66b99beda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep4.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac15-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep5.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac06-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep6.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac07-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep7.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac08-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep8.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac09-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep9.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac10-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep10.json)
if defined f12step (curl -X PUT "https://%tenant%/api/config/v1/dashboards/10a69069-74c2-4eba-b18a-6856d91da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep3.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/7f64e3ef-239c-416a-b3a4-66b99beda313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep4.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac15-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep5.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac06-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep6.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac07-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep7.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac08-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep8.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac09-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep9.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac10-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep10.json
curl -X PUT "https://%tenant%/api/config/v1/dashboards/a7340848-3f03-4155-ac11-d8ea4a7da313" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @%CD%\FunnelAnalysisStep11.json)
echo 
echo          ********* Welcome to Dynatrace BizOps *********
