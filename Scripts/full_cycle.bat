@echo off
@rem ==========================================================================
@rem Реальные названия папок назначаются здесь.
@rem ==========================================================================

@rem ==========================================================================
@rem Запуск программы загрузки фрагментов на YouTube.
@rem ==========================================================================

@rem удаляются все запущенные ранее процессы
@taskkill /F /IM YouTubeUploader.exe

@echo launching of YouTube uploading application (YouTubeUploader)
@start YouTubeUploader f:\outgoing1

@rem ==========================================================================
@rem Запуск дектора событий.
@rem ==========================================================================

@rem удаляются все запущенные ранее процессы
@taskkill /F /IM EventDetector.exe

@echo launching of processing application (EventDetector)
@start EventDetector f:\incoming1 f:\outgoing1 --invisible

@rem ==========================================================================
@rem Запуск  видео-прокси.
@rem ==========================================================================

@rem удаляются все запущенные ранее процессы
@taskkill /F /IM vlc.exe

@echo launching of video proxy (VLC)
@start vlc -I none "http://fiteasily.com:8081" :network-caching=1000 :sout=#transcode{vcodec=mp2v,vb=800,scale=1,acodec=mpga,ab=128,channels=2,samplerate=44100}:http{mux=ts,dst=:8080/} :sout-keep

@rem ==========================================================================
@rem Ожидание запуска прокси.
@rem ==========================================================================

@echo waiting for launch...
@rem set filename=vlc.exe

:WAIT_LOOP
@rem for /f %%a in ('tasklist /nh /fi "imagename eq %filename%" ^| find /c "%filename%"') do set /a quantity=%%a
@rem Если запущена 1 и более копий процесса
@rem if %quantity% geq 1 goto ALREADY_RUN

@rem echo waiting and checking again
@timeout 20
@rem goto WAIT_LOOP

:ALREADY_RUN
@rem ==========================================================================
@rem Запуск утилиты записи фрагментов.
@rem ==========================================================================

@rem удаляются все запущенные ранее процессы
@taskkill /F /IM VideoFragmentManifestMaker.exe

@echo launching of fragments recording
@VideoFragmentManifestMaker http://localhost:8080 f:\recording 20 f:\incoming1
