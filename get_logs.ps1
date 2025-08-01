adb logcat -d | Where-Object {$_ -match "UnifiedImg2Img"} | Select-Object -Last 100
