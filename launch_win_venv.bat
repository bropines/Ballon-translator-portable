@echo off

:: Navigate to the directory where the script is located
cd /d %~dp0

:: Set temporary directories for environment variables
set APPDATA=tmp
set USERPROFILE=tmp
set TEMP=tmp

:: Point PADDLE_PATH to the correct portable python directory
set "PADDLE_PATH=%~dp0python\Lib\site-packages\torch\lib"
set "PATH=%PADDLE_PATH%;%PATH%"
echo "Added torch\lib to PATH: %PADDLE_PATH%"

:: Check for updates using Git
set "PATH=%cd%\git\cmd;%PATH%"
git pull
timeout /t 3

:: Set up Python environment
set "PYTHON=%cd%\python\python.exe"
set "PATH=%cd%\python;%cd%\python\Scripts;%PATH%"
mkdir tmp 2>NUL

:: CORE FIX: Upgrade pip to a specific stable version
echo Ensuring pip version is 24.0...
"%PYTHON%" -m pip install --upgrade pip==24.0

:: CRITICAL FIX: Check if the pip installation succeeded
if errorlevel 1 (
    echo.
    echo ERROR: Failed to install or upgrade pip.
    echo Please check error messages above. Try running as Administrator.
    pause
    exit /b
)
echo Pip upgrade complete.
echo.

:: Check if Python is runnable
"%PYTHON%" -c "" >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :check_pip
echo Couldn't launch python
goto :show_stdout_stderr

:: Check if pip is runnable
:check_pip
"%PYTHON%" -mpip --help >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :launch
echo Pip is not available after installation attempt.
goto :show_stdout_stderr

:: Launch the main application
:launch
echo Starting the application...
"%PYTHON%" launch.py --debug %*

if errorlevel 1 (
    echo.
    echo The application exited with an error code: %errorlevel%.
) else (
    echo The application finished.
)
goto :endofscript

:: Error reporting block for setup issues
:show_stdout_stderr
echo.
echo exit code: %errorlevel%
for /f %%i in ("tmp\stdout.txt") do set size=%%~zi
if %size% equ 0 goto :show_stderr
echo.
echo stdout:
type tmp\stdout.txt

:show_stderr
for /f %%i in ("tmp\stderr.txt") do set size=%%~zi
if %size% equ 0 goto :show_stderr_end
echo.
echo stderr:
type tmp\stderr.txt

:show_stderr_end
echo.
echo Launch unsuccessful. Exiting.
goto :endofscript

:endofscript
pause
