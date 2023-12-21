@echo off
setlocal

REM 設定 RTSP 串流
set RTSP_URL=rtsp://[攝影機RTSP地址]

REM 設定 mp4 輸出的資料夾
set BASE_OUTPUT_FILE=[output]

:LOOP
set CURRENT_TIMESTAMP=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

REM 產生新的檔名，包含時間戳記
set OUTPUT_FILE=%BASE_OUTPUT_FILE%_%CURRENT_TIMESTAMP%.mp4

ffmpeg -rtsp_transport tcp -i %RTSP_URL% -c:v copy -t 00:05:00 %OUTPUT_FILE%

echo Conversion completed. Waiting for the next iteration...

REM 等待10秒
timeout /nobreak /t 10 >nul

REM 回到迴圈開頭
goto LOOP

endlocal