@ECHO OFF

powershell -ExecutionPolicy Bypass -Command "& {Set-Content -NoNewline -Path <FAT32 PARTITION DRIVE LETTER>:\switch.cfg -Value \"set os_switch=1`n\"}"
