
echo "Attention! Database objects will be recreated!"
@pause

del sqllist.txt
dir /B *.sql >> sqllist.txt
for /F %%s in (sqllist.txt) do (sqlcmd -d Oonze -S .\SQLEXPRESS -i %%s)
del sqllist.txt
@rem pause

