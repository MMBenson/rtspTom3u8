@echo off
setlocal

REM 設定 RTSP 串流
set RTSP_URL=rtsp://[攝影機RTSP連結]

REM 設定 M3U8 輸出的路徑
set OUTPUT_FILE=output.m3u8

REM 使用 FFmpeg 將 RTSP 轉成 M3U8 格式
ffmpeg -i %RTSP_URL% -c:v copy -hls_wrap 10 %OUTPUT_FILE%

echo Conversion completed.

endlocal
