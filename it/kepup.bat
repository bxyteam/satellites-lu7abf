cd c:\it
echo Se bajan Keplerianos desde celestrak
downloader.exe -download http://lu7aa.org.ar/kepsupdate.asp
erase kepsup*.htm
echo Se copia text/pehuen.js de lu7aa.org.ar a directorio it
downloader.exe -download http://lu7aa.org.ar/text/pehuen.js pehuen.js
erase d:\webs\amsat.otg.ar\text\pehuen.js
copy pehuen.js d:\webs\amsat.org.ar\text\pehuen.js
echo Se ponen los keps en nasa.all
erase nasa.all
downloader.exe -download http://lu7aa.org.ar/text/nasa.txt nasa.all
echo Se actualiza el it.exe con nuevos keplerianos
it.exe /F nasa.all
echo Archivo nasa.all se copia en directorio de la web local
copy /Y nasa.all d:\webs\amsat.org.ar\text\nasa.all
copy /Y it.qth itbup.qth