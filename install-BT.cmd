@echo off
echo Unpacking Git and Python... & mkdir tmp & start /wait git_python.exe -s2 

set path=git\cmd
git init .
git remote add origin https://github.com/dmMaze/BallonsTranslator.git
git pull origin dev

call install_venv.bat
