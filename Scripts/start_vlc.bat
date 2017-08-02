@echo off

@rem удаляются все запущенные ранее процессы
@taskkill /F /IM vlc.exe

:loop
@set vlc_var=%date%
@set vlc_time=%time%
@set vlc_day=%vlc_var:~7,2%
@set vlc_month=%vlc_var:~4,2%
@set vlc_year=%vlc_var:~12,2%

@rem set vlc_day=%vlc_var:~0,2%
@rem set vlc_month=%vlc_var:~3,2%
@rem set vlc_year=%vlc_var:~8,2%

@rem формат ~позиция,длина
@set vlc_hour=%vlc_time:~0,2%
@set vlc_min=%vlc_time:~3,2%
@set vlc_sec=%vlc_time:~6,2%
@set backuproot=working
@if %vlc_hour% lss 10 (set vlc_hour=0%vlc_time:~1,1%)

@rem собирается имя файла
@set outfile=%vlc_year%.%vlc_month%.%vlc_day%.%vlc_hour%.%vlc_min%.%vlc_sec%

@rem start /B vlc -I dummy udp://@:1234 :sout=#file{dst="C:\\temp\\%outfile%.mp4"} :sout-keep 
@rem start vlc udp://@:1234 :sout=#file{dst="C:\\temp\\%outfile%.mp4"} :sout-keep 
@start vlc udp://@:6060 :sout=#file{dst="C:\\temp\\%outfile%.mp4"} :sout-keep 

@rem sleep 60
@timeout 60

@taskkill /IM vlc.exe && goto :loop

@rem очистка переменных
@set comment=
@set vlc_var=
@set vlc_time=
@set vlc_day=
@set vlc_month=
@set vlc_year=
@set vlc_hour=
@set vlc_min=
@set vlc_sec=
@set backuproot=
@set vlc_folder=
