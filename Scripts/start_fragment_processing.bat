
@start start_event_detector1.bat
@start start_event_detector2.bat

@rem обратное копирование для имитации непрерывного режима

:loop
@move /Y "f:\outgoing1\*.mp4" "f:\incoming1\"
@move /Y "f:\outgoing1\*.xml" "f:\incoming1\"
@move /Y "f:\outgoing2\*.mp4" "f:\incoming2\"
@move /Y "f:\outgoing2\*.xml" "f:\incoming2\"

@timeout 5
@goto :loop