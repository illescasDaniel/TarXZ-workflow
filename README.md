# TarXZ-workflow

Instructions:
------------
*  Decompress the workflow file and double click to install
*  Copy the sound file (Compress.aiff) to ~/Library/Sounds (create the folder if necessary)

The workflow was made using a shell script in bash, you can take a look at it on the "Shell-script" folder.

Features:
--------

*  Compress any file/ folder to 'tar.xz'
*  Decompress any 'tar.xz' file
*  High compression rate (really similar to 7z)
*  No need to download any extra tool (on macOS)

**Bug:** when you compress multiple files into one and then you try to decompress the file, you get a  few folders and inside them the compress files, instead of just the compressed files/ folders.

Main commands:
------------

Compress to  tar.xz with max. compression and without mac resource forks:
```bash
COPYFILE_DISABLE=true XZ_OPT=-9e tar --exclude='.DS_Store' --exclude='__MACOSX' -cJf file.tar.xz fileToCompress
```
Decompress tar.xz file:
```bash
tar -xJf file.tar.xz
```

Motivation:
---------
Currently if somebody want to upload files and share it with non-mac users the .zip file will contain unnecessary files such as .DS_Store and __MACOSX, moreover  the compression ratio of 'zip' is low compared to other formats like '7z' or 'tar.xz'.
