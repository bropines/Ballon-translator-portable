@echo off
del README.md
del LICENSE
echo Unpacking Git and Python... & mkdir tmp & start /wait git_python.part01.exe & del git_python.part01.exe & del git_python.part*.rar

set path=git\cmd
git init .
git remote add origin https://github.com/dmMaze/BallonsTranslator.git
git pull origin dev

:: call install_venv.bat
