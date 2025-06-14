@echo off
echo Checking for google-services.json in wrong location...

if exist "src\main\java\max\ohm\oneai\google-services.json" (
    echo Found google-services.json in wrong location.
    echo Moving to correct location...
    
    if not exist "..\..\google-services.json" (
        copy "src\main\java\max\ohm\oneai\google-services.json" "..\..\google-services.json"
        echo File copied to app/google-services.json
    ) else (
        echo File already exists in correct location.
    )
    
    del "src\main\java\max\ohm\oneai\google-services.json"
    echo Removed file from incorrect location.
    echo Done!
) else (
    echo google-services.json is in the correct location.
)

echo.
echo Please rebuild your app after this fix.
pause 