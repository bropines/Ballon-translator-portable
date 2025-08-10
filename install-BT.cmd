@echo off
setlocal

del README.md 2>NUL
del LICENSE 2>NUL

echo Deleting scripts_src directory...
rmdir /S /Q scripts_src 2>NUL

echo Unpacking Git and Python...
mkdir tmp 2>NUL
start /wait git_python.part01.exe
del git_python.part01.exe 2>NUL
del git_python.part*.rar 2>NUL

if not exist "git\cmd\git.exe" (
    echo.
    echo ERROR: Git was not unpacked correctly. git\cmd\git.exe not found.
    pause
    exit /b
)

set path=%cd%\git\cmd;%path%

echo Initializing repository and fetching from remote...

git init

git remote add origin https://github.com/dmMaze/BallonsTranslator.git

git fetch origin

git checkout -t origin/dev

if errorlevel 1 (
    echo.
    echo ERROR: Failed to checkout dev branch. Check the error messages.
    pause
    exit /b
)

echo.
echo Repository is ready. The 'dev' branch is now tracking the remote branch.
echo Launch the program using the main startup script.
pause

endlocal
