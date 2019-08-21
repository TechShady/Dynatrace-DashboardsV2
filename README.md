# Dynatrace-DashboardsV2
Dynatrace Dashboards (ver 174+)

Prereqs:
  1. The upload script uses Curl and Powershell. 
  2. Define a user action naming rule for each funnel step (Applications->[Your App]->Edit->User Actions->Naming Rules)
  3. Keep the user action naming rule to 15 characters or less with no spaces (spaces will be allowed in future release)
  4. Add a session property for revenue if it applies for your application (Applications->[Your App]->Edit->Session and User action prop)
  5. Generate a read/write token (Settings->Integration->Dynatrace API->Generate Token)

Deployment Steps:
  1. Download zip for entire repository
  2. Unzip into any directory
  3. Open command prompt, run Upload.bat and pass in your token (i.e. Upload.bat whhehdhsb-98dd)
  4. You will be prompted for the following info:<br/>
    A. Tenant Name (i.e. SaaS: aaa54321.live.dynatrace.com Managed: xyz123.dynatrace-managed.com/e/<Env UUID>)<br/>
    B. Dashboard Owner (ID that you loginto Dynatrace with)<br/>
    C. Funnel Name (any name you want for your funnel name, spaces fine)<br/>
    D. App NAme (any name you want for your app, spaces fine)<br/>
    C. Do you have a session property for revenue (Y/N)<br/>
    D. If Y, you will be prompted for the sessionproperty (case sensitive)<br/>
    E. Promotion User Action (Used if you application has marketing promotions to direct traffic. If this is the case, define a user action naming rule for that action and enter it here. Otherwise hit return)<br/>
    F. Funnel Step 1 - 12 (Enter each funnel step in the correct order. Hit return when you have completed the last funnel step)<br/>
    
Adding a custom dashboard into the BizOps Ovrview Dashbaord
  1. run UploadCustom.bat and pass in your token (i.e. UploadCustom.bat whhehdhsb-98dd)
  2. You will be prompted for the following info:<br/>
    A. Tenant Name<br/>
    B. Custom Dashboard ID (the ID shows up in the URL when you open it)<br/>
    C. Overview Dashboard ID (the ID shows up in the URL when you open it)<br/>
    D. Custom Dashboard Link Name (Any name, spaces fine)<br/>
    E. Position (1-5) - This number will replace any of the 5 bottom links in the Main Overview Dashboard<br/>
    
Adding additional funnels:
  1. Important - ***Start with a fresh set of JSON files***
  2. Follow the same steps under Deployment Steps
  3. You will be prompted for a three digit identifier. The default deployment uses 313. Chose any other set of unique digits.
  4. Repeat as many times as needed
