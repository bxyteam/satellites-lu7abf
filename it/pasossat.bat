echo Este proceso se corre a las 3:30 AM
echo Se calculan y generan archivos para el sat.htm
echo Ahora se copian pasos a c:\webs\amsat.org.ar y a c:\webs\lu7aa.org.ar\text
cd c:\it
copy /Y pasos*.htm c:\webs\amsat.org.ar\
copy /Y pasos*.txt c:\webs\lu7aa.org.ar\pasos\
echo Se suben pasos anteriormente calculados a http://amsat.org.ar y a http://lu7aa.org.ar/pasos y a ams.org.ar
* WS_FTP95 -q -p lu7aa -d lu7abf:/jnos/www/ -s local:C:\webs\amsat.org.ar\pasos*.htm
* WS_FTP95 -q -p lu7aa -d lu7abf:/var/www/amsat/ -s local:C:\webs\amsat.org.ar\pasos*.htm
WS_FTP95 -q -p amsat -s local:C:\webs\amsat.org.ar\pasos*.htm -d amsat:/var/www/amsat/amsat.org.ar/
WS_FTP95 -q -p amsat -s local:C:\webs\amsat.org.ar\pasos*.htm -d tucuroot:
WS_FTP95 -q -p lu7aa -s local:C:\webs\lu7aa.org.ar\pasos\pasosc*.txt -d lu7aa:/pasos/
echo Ahora se calculan nuevos pasos
cd \Program Files (x86)\DOSBox-0.74-2\
DOSBOX -c "cycles=150000" -c "mount c c:\IT" -c "c:" -c "subepaso.bat" -c "exit"