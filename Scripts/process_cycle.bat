@set pd=%1
@set rd=%2

:loop
@for /f %%a in ('dir /B %rd%\*.mp4') do @(start /WAIT process_video_fragment.bat %%a %pd% %rd%)

@rem ����� �������� �������� ��, ����� ��� ������
@timeout 1

@rem ��� ����� ������ ���� � ':', ����� ���� ���� �� ��������!
@goto :loop

@set pd=
@set rd=

