@echo off
del README.md 2>NUL
del LICENSE 2>NUL

:: Delete the scripts_src folder at the very beginning
echo Deleting scripts_src directory...
rmdir /S /Q scripts_src 2>NUL

echo Unpacking Git and Python... & mkdir tmp 2>NUL & start /wait git_python.part01.exe & del git_python.part01.exe 2>NUL & del git_python.part*.rar 2>NUL

set path=git\cmd
git init .
git remote add origin https://github.com/dmMaze/BallonsTranslator.git 2>NUL
git pull origin dev

:: call install_venv.bat