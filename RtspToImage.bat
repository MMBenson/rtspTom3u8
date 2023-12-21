@echo off

REM 設定 RTSP 串流
set RTSP_URL=rtsp://[攝影機RTSP地址]

REM 設定圖檔輸出的路徑
set OUTPUT_FOLDER=輸出的路徑

ffmpeg -rtsp_transport tcp -y -i %RTSP_URL% -ss 00:00:01 -f image2 -vframes 1 %OUTPUT_FOLDER%\output.jpg
