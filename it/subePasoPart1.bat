@echo off
cambzona timezone = LUT3
copy /Y itba.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscba.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe B.Aires, Arg.;ba

COPY PASOS.HTM+PASOSHD.HTM pasosba.htm /A

copy /Y itmp.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscmp.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe M. del Plata.;mp

COPY PASOS.HTM+PASOSHD.HTM pasosmp.htm /A

copy /Y itbb.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscbb.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe B.Blanca Arg.;bb

COPY PASOS.HTM+PASOSHD.HTM pasosbb.htm /A
                                                
copy /Y itsf.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscsf.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe Santa Fe Arg.;sf

COPY PASOS.HTM+PASOSHD.HTM pasossf.htm /A
                                                
copy /Y itre.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscre.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe Resistencia.;re

COPY PASOS.HTM+PASOSHD.HTM pasosre.htm /A
                                                
copy /Y itig.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscig.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe C.Iguazu Arg.;ig

COPY PASOS.HTM+PASOSHD.HTM pasosig.htm /A
                                                
copy /Y itst.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscst.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe S.M. Tucuman.;st

COPY PASOS.HTM+PASOSHD.HTM pasosst.htm /A
                                                
copy /Y itco.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscco.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe Cordoba, Arg.;co

COPY PASOS.HTM+PASOSHD.HTM pasosco.htm /A
                                                
copy /Y itju.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscju.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe S.S.Jujuy Arg;ju

COPY PASOS.HTM+PASOSHD.HTM pasosju.htm /A
                                                
copy /Y itme.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscme.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe Mendoza, Arg.;me

COPY PASOS.HTM+PASOSHD.HTM pasosme.htm /A

exit