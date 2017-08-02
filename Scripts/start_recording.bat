rem start /high vlc -I none dshow:// :dshow-vdev="USB2.0 UVC 1.3M WebCam" :dshow-adev=none :dshow-size=320x240 :live-caching=300 :sout=#transcode{vcodec=theo,vb=800,acodec=vorb,ab=128,channels=2,samplerate=44100}:http{mux=ogg,dst=:8082/} :sout-keep
rem timeout 20
rem start /high VideoFragmentManifestMaker "http://localhost:8082" "C:\Users\Dmitry\Desktop\Records\Tmp" 30 "C:\Users\Dmitry\Desktop\Records\Results"

rem Direct recording from the USB-device.
rem start /high VideoFragmentManifestMaker "USB2.0 UVC 1.3M WebCam" "C:\Users\Dmitry\Desktop\Records\Tmp" 3600 "C:\Users\Dmitry\Desktop\Records\Results"
start /high VideoFragmentManifestMaker "Logitech HD Webcam C270" "C:\Users\Dmitry\Desktop\Records\Tmp" 3600 "C:\Users\Dmitry\Desktop\Records\Results"




