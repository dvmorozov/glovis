@set pd=%1
@set rd=%2

:loop
@for /f %%a in ('dir /B %rd%\*.mp4') do @(start /WAIT process_video_fragment.bat %%a %pd% %rd%)

@rem чтобы избежать загрузки ЦП, когда нет файлов
@timeout 1

@rem имя метки должно быть с ':', иначе этот цикл не работает!
@goto :loop

@set pd=
@set rd=

