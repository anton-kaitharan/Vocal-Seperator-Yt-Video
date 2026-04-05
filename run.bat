@echo off
setlocal enabledelayedexpansion
cd /d "F:\ANTONY BACKUP\ASUS VIVO BACKP\New Volume\YouTubeTools"

:: Force demucs to store/load models from this folder instead of C drive
set "TORCH_HOME=%CD%\models"
set "XDG_CACHE_HOME=%CD%\models"

call demucs_ext\Scripts\activate

echo ===============================
echo  Bulk YouTube Vocal Remover
echo ===============================

:loop
set "url="
set "title="
set "start="
set "end="

set /p url=Paste YouTube URL (or type exit): 
if /i "!url!"=="exit" exit

set /p title=Enter output filename (without extension): 
if "!title!"=="" set "title=output_%random%"

set /p start=Start time (hh:mm:ss or Enter to skip): 
set /p end=End time   (hh:mm:ss or Enter to skip): 

:: Clean playlist/extra params from URL
for /f "tokens=1 delims=&" %%U in ("!url!") do set "url=%%U"

echo.
echo Output file: !title!_karoke.wav
echo.

:: Delete any leftover files for this title from a previous failed run
del /q "!title!_input.wav" 2>nul

:: Download audio — saved as <title>_input.wav
yt-dlp.exe -f bestaudio -x --audio-format wav -o "!title!_input.%%(ext)s" "!url!"

if not exist "!title!_input.wav" (
    echo Download or conversion to WAV failed!
    goto loop
)

:: Run Demucs vocal separation
echo Running Demucs...
demucs --two-stems=vocals "!title!_input.wav"

if not exist "separated\htdemucs\!title!_input\no_vocals.wav" (
    echo Demucs failed - no_vocals.wav not found!
    goto cleanup
)

:: Process audio
echo Processing audio...
if "!start!"=="" (
    ffmpeg\bin\ffmpeg.exe -y ^
        -i "separated\htdemucs\!title!_input\no_vocals.wav" ^
        -af "silenceremove=start_periods=1:start_duration=0.5:start_threshold=-40dB,areverse,silenceremove=start_periods=1:start_duration=0.5:start_threshold=-40dB,areverse" ^
        "!title!_karoke.wav"
) else (
    ffmpeg\bin\ffmpeg.exe -y ^
        -ss !start! -to !end! ^
        -i "separated\htdemucs\!title!_input\no_vocals.wav" ^
        -af "silenceremove=start_periods=1:start_duration=0.5:start_threshold=-40dB,areverse,silenceremove=start_periods=1:start_duration=0.5:start_threshold=-40dB,areverse" ^
        "!title!_karoke.wav"
)

if exist "!title!_karoke.wav" (
    echo.
    echo [OK] Saved: !title!_karoke.wav
) else (
    echo [ERROR] FFmpeg failed - output file was not created.
)

:cleanup
echo Cleaning up temp files...
if exist "separated\htdemucs\!title!_input" rmdir /s /q "separated\htdemucs\!title!_input"
if exist "!title!_input.wav" del /q "!title!_input.wav"

echo.
goto loop