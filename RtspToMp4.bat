@echo off

REM 設定 RTSP 串流
set RTSP_URL=rtsp://[攝影機RTSP地址]

REM 設定 mp4 輸出的路徑
set OUTPUT_FILE=output.mp4

ffmpeg -rtsp_transport tcp -y -i %RTSP_URL% -c:v copy -t 00:05:00 %OUTPUT_FILE%