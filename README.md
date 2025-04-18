
Ballon-Translator dev branch auto-installer

# Ballon-translator-portable
This is a portable version based on the [Ballontranslator](https://github.com/dmMaze/BallonsTranslator) version

----

## Running on Windows
1. Download [Ballon-translator-portable](https://github.com/bropines/Ballon-translator-portable/archive/refs/heads/main.zip)
2. Unzip the `Ballon-translator-portable-main` folder anywhere you want</br>
 Root directory preferred, and path shouldn't have spaces and Cyrillic</br>
 Example: `D:\Ballon-translator-portable-main`</br>
3. Run `install-BT.cmd` and wait for a couple seconds


~*I added a script for auto-downloading models and config (for some reason, the program does not work without it)*~

4. For subsequent launches of the program, JUST open `launch_win_venv.bat`

*For update original repo open update_git.bat*

*P.S. Due to Windows specifics, any attempt to block network access may crash the install/update processes, so you will have to rerun .bat again.*

A similar script was used as a reference to install [Stable-Diffusion](https://github.com/serpotapov/stable-diffusion-portable)
