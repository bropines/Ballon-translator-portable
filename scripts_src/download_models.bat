@echo off
set "APPDATA=tmp"
set "USERPROFILE=tmp"
set "TEMP=tmp"
set "PYTHON=python\python.exe"
set "GIT=git\cmd\git.exe"
set "PATH=git\cmd;aria2c;%PATH%"
set "VENV_DIR=venv"

mkdir "./data/models"
echo Downloading Models...
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/mit48pxctc_ocr.ckpt -d ./data/models -o mit48pxctc_ocr.ckpt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/aot_inpainter.ckpt -d ./data/models -o aot_inpainter.ckpt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/comictextdetector.pt -d ./data/models -o comictextdetector.pt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/comictextdetector.pt.onnx -d ./data/models -o comictextdetector.pt.onnx
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/lama_mpe.ckpt -d ./data/models -o lama_mpe.ckpt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/mit32px_ocr.ckpt -d ./data/models -o mit32px_ocr.ckpt 

mkdir "./data/models/manga-ocr-base"
echo Downloading manga-ocr-base...
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/manga-ocr-base/.gitattributes -d ./data/models/manga-ocr-base -o .gitattributes
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/manga-ocr-base/README.md -d ./data/models/manga-ocr-base -o README.md
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/manga-ocr-base/alphabet-all-v5.txt -d ./data/models/manga-ocr-base -o alphabet-all-v5.txt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/manga-ocr-base/config.json -d ./data/models/manga-ocr-base -o config.json 
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/manga-ocr-base/ocr-ctc.ckpt -d ./data/models/manga-ocr-base -o ocr-ctc.ckpt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/manga-ocr-base/preprocessor_config.json -d ./data/models/manga-ocr-base -o preprocessor_config.json
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/manga-ocr-base/pytorch_model.bin -d ./data/models/manga-ocr-base -o pytorch_model.bin
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/manga-ocr-base/special_tokens_map.json -d ./data/models/manga-ocr-base -o special_tokens_map.json
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/manga-ocr-base/tokenizer_config.json -d ./data/models/manga-ocr-base -o tokenizer_config.json
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/models/manga-ocr-base/vocab.txt -d ./data/models/manga-ocr-base -o vocab.txt


mkdir "./data/libs"
echo Downloading Libs...
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/libs/opencv_world455.dll -d ./data/libs -o opencv_world455.dll
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/libs/patchmatch_inpaint.dll -d ./data/libs -o patchmatch_inpaint.dll

echo "./config"
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/bropines/ballon-translator-models/resolve/main/config.json -d ./config -o config.json

call launch_win_venv.bat