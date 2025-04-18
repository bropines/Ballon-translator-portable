@echo off

:: Navigate to the directory where the script is located
cd /d %~dp0

:: Set temporary directories for environment variables (if needed)
set APPDATA=tmp
set USERPROFILE=tmp
set TEMP=tmp

:: Set the path for PaddleOCR and PyTorch libraries
set "PADDLE_PATH=%~dp0venv\Lib\site-packages\torch\lib"
set "PATH=%PADDLE_PATH%;%PATH%"
echo "Added torch\lib to PATH: %PADDLE_PATH%"

:: Check for updates using Git (if necessary)
set "GIT=git\cmd\git.exe"
set "PATH=git\cmd;%PATH%"
git pull
timeout /t 3

:: OLD
:: Activate the virtual environment
:: call venv\Scripts\activate.bat
:: echo "Ya zapustil venv"

:: Launch Python and check pip
set "PYTHON=python\python.exe"
mkdir tmp 2>NUL
%PYTHON% -c "" >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :check_pip
echo Couldn't launch python
goto :show_stdout_stderr

:check_pip
%PYTHON% -mpip --help >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :launch
if "%PIP_INSTALLER_LOCATION%" == "" goto :show_stdout_stderr
%PYTHON% "%PIP_INSTALLER_LOCATION%" >tmp/stdout.txt 2>tmp/stderr.txt
if %ERRORLEVEL% == 0 goto :launch
echo Couldn't install pip
goto :show_stdout_stderr

:launch
start /b "" cmd /c "%PYTHON% launch.py --debug %* & timeout /t 5 & exit"

exit /b

:show_stdout_stderr
echo.
echo exit code: %errorlevel%
for /f %%i in ("tmp\\stdout.txt") do set size=%%~zi
if %size% equ 0 goto :show_stderr
echo.
echo stdout:
type tmp\\stdout.txt

:show_stderr
for /f %%i in ("tmp\\stderr.txt") do set size=%%~zi
if %size% equ 0 goto :show_stderr
echo.
echo stderr:
type tmp\\stderr.txt

:endofscript
echo.
echo Launch unsuccessful. Exiting.
pause
