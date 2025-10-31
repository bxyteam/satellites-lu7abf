@echo off
copy /Y itcr.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasosccr.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe Com.Rivadavia;cr

COPY PASOS.HTM+PASOSHD.HTM pasoscr.htm /A
                                                
copy /Y itrg.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscrg.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe Rio Gallegos.;rg

COPY PASOS.HTM+PASOSHD.HTM pasosrg.htm /A
                                                
copy /Y itnq.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscnq.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe Neuquen, Arg.;nq

COPY PASOS.HTM+PASOSHD.HTM pasosnq.htm /A
                                                
copy /Y itsc.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscsc.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe S.C.Bariloche;sc

COPY PASOS.HTM+PASOSHD.HTM pasossc.htm /A
                                                
copy /Y itsr.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscsr.txt
itpass -g a -n 23 -z -o 60> pasos.txt

pasoshtm.exe Santa Rosa LP;sr

COPY PASOS.HTM+PASOSHD.HTM pasossr.htm /A
                                                
copy /Y itmore.qth it.qth
cambzona timezone = CST-2CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Helsinki > pasosche.txt
itpass -g a -n 23 -z -o 60 -s Helsinki > pasos.txt

pasoshtm.exe Helsinki, FIN;he

COPY PASOS.HTM+PASOSHD.HTM pasoshe.htm /A
                                                
cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Cuba > pasosccu.txt
itpass -g a -n 23 -z -o 60 -s Cuba > pasos.txt

pasoshtm.exe Habana, CUBA;cu

COPY PASOS.HTM+PASOSHD.HTM pasoscu.htm /A
                                                
cambzona timezone = ICT-7
itpass -g c -z -o 99 -n 99 -d -e 2 -s Bangkok > pasoscbk.txt
itpass -g a -n 23 -z -o 60 -s Bangkok > pasos.txt

pasoshtm.exe Bangkok, TH;bk

COPY PASOS.HTM+PASOSHD.HTM pasosbk.htm /A
                                                
cambzona timezone = MST7MDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Edmonton > pasosced.txt
itpass -g a -n 23 -z -o 60 -s Edmonton > pasos.txt

pasoshtm.exe Edmonton, CA;ed

COPY PASOS.HTM+PASOSHD.HTM pasosed.htm /A
                                                
cambzona timezone = CST0CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Tenerife > pasosctn.txt
itpass -g a -n 23 -z -o 60 -s Tenerife > pasos.txt

pasoshtm.exe Tenerife, ES;tn

COPY PASOS.HTM+PASOSHD.HTM pasostn.htm /A

exit