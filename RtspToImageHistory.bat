@echo off
setlocal

REM 設定 RTSP 串流
set RTSP_URL=rtsp://[攝影機RTSP地址]

REM 設定 jpg 輸出的路徑
set OUTPUT_FOLDER=[輸出的資料夾]

:LOOP_JPG
set CURRENT_TIMESTAMP=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

REM 產生新的檔名，包含時間戳記
set OUTPUT_FILE=%OUTPUT_FOLDER%\output_%CURRENT_TIMESTAMP%.jpg

ffmpeg -rtsp_transport tcp -y -i %RTSP_URL% -ss 00:00:01 -f image2 -vframes 1 %OUTPUT_FILE%

echo Image capture completed. Waiting for the next iteration...

REM 等待10秒
timeout /nobreak /t 10 >nul

REM 回到迴圈開頭
goto LOOP_JPG

endlocal
