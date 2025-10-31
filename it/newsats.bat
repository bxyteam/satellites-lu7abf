copy /Y itmore.qth it.qth
cambzona timezone = CST-2CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Helsinki > pasosche.txt
itpass -g a -n 23 -z -o 60 -s Helsinki > pasos.txt
paseshtm.exe Helsinki, FIN;he
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoshe.htm
copy /Y pasosche.txt d:\webs\lu7aa.org.ar\pasos\pasosche.txt

cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Cuba > pasosccu.txt
itpass -g a -n 23 -z -o 60 -s Cuba > pasos.txt
pasoshtm.exe Habana, CUBA;cu
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoscu.htm
copy /Y pasosccu.txt d:\webs\lu7aa.org.ar\pasos\pasosccu.txt

cambzona timezone = ICT-7
itpass -g c -z -o 99 -n 99 -d -e 2 -s Bangkok > pasoscbk.txt
itpass -g a -n 23 -z -o 60 -s Bangkok > pasos.txt
paseshtm.exe Bangkok, TH;cu
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosbk.htm
copy /Y pasoscbk.txt d:\webs\lu7aa.org.ar\pasos\pasoscbk.txt

copy /Y itbupori.qth it.qth