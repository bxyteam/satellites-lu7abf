@echo off
cambzona timezone = EST-8
itpass -g c -z -o 99 -n 99 -d -e 2 -s HongKong > pasoschk.txt
itpass -g a -n 23 -z -o 60 -s HongKong > pasos.txt

pasoshtm.exe Hong Kong Chi;hk

COPY PASOS.HTM+PASOSHD.HTM pasoshk.htm /A
                                                
cambzona timezone = EST-7
itpass -g c -z -o 99 -n 99 -d -e 2 -s Jakarta > pasoscja.txt
itpass -g a -n 23 -z -o 60 -s Jakarta > pasos.txt

pasoshtm.exe Jakarta Indon;ja

COPY PASOS.HTM+PASOSHD.HTM pasosja.htm /A
                                                
cambzona timezone = EST-8
itpass -g c -z -o 99 -n 99 -d -e 2 -s Beijing > pasoscbj.txt
itpass -g a -n 23 -z -o 60 -s Beijing > pasos.txt

pasoshtm.exe Beijing China;bj

COPY PASOS.HTM+PASOSHD.HTM pasosbj.htm /A
                                                
cambzona timezone = EST-9
itpass -g c -z -o 99 -n 99 -d -e 2 -s Seoul > pasoscsl.txt
itpass -g a -n 23 -z -o 60 -s Seoul > pasos.txt

pasoshtm.exe Seoul - Corea;sl

COPY PASOS.HTM+PASOSHD.HTM pasossl.htm /A
                                                
cambzona timezone = EST-9
itpass -g c -z -o 99 -n 99 -d -e 2 -s Tokio > pasosctk.txt
itpass -g a -n 23 -z -o 60 -s Tokio > pasos.txt

pasoshtm.exe Tokio - Japan;tk

COPY PASOS.HTM+PASOSHD.HTM pasostk.htm /A
                                                
cambzona timezone = EST-8
itpass -g c -z -o 99 -n 99 -d -e 2 -s Manila > pasoscml.txt
itpass -g a -n 23 -z -o 60 -s Manila > pasos.txt 

pasoshtm.exe Manila, Phill;ml

COPY PASOS.HTM+PASOSHD.HTM pasosml.htm /A
                                                
cambzona timezone = EST-8
itpass -g c -z -o 99 -n 99 -d -e 2 -s Perth > pasoscpt.txt
itpass -g a -n 23 -z -o 60 -s Perth > pasos.txt

pasoshtm.exe Perth Austral;pt

COPY PASOS.HTM+PASOSHD.HTM pasospt.htm /A
                                                
cambzona timezone = EST-10EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Melbourne > pasoscmb.txt
itpass -g a -n 23 -z -o 60 -s Melbourne > pasos.txt

pasoshtm.exe Melbourne, AU;mb

COPY PASOS.HTM+PASOSHD.HTM pasosmb.htm /A
                                                
cambzona timezone = EST-10EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Sydney > pasoscsd.txt
itpass -g a -n 23 -z -o 60 -s Sydney > pasos.tx

pasoshtm.exe Sydney Austr.;sd

COPY PASOS.HTM+PASOSHD.HTM pasossd.htm /A
                                                
cambzona timezone = EST-12EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Wellington > pasoscwe.txt
itpass -g a -n 23 -z -o 60 -s Wellington > pasos.txt

pasoshtm.exe Wellington NZ;we

COPY PASOS.HTM+PASOSHD.HTM pasoswe.htm /A


exit