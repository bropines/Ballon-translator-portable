@echo off
set "APPDATA=tmp"
set "USERPROFILE=tmp"
set "TEMP=tmp"
set "PYTHON=python\python.exe"
set "GIT=git\cmd\git.exe"
set "PATH=git\cmd;%PATH%"
set "VENV_DIR=venv"

call git pull
