@echo off
cambzona timezone = MST7MDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Denver > pasoscdn.txt
itpass -g a -n 23 -z -o 60 -s Denver > pasos.txt

pasoshtm.exe Denver, CO;dn

COPY PASOS.HTM+PASOSHD.HTM pasosdn.htm /A
                                                
cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Charlotte > pasoscct.txt
itpass -g a -n 23 -z -o 60 -s Charlotte > pasos.txt

pasoshtm.exe Charlotte, NC;ct

COPY PASOS.HTM+PASOSHD.HTM pasosct.htm /A
                                                
cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Seattle > pasoscse.txt
itpass -g a -n 23 -z -o 60 -s Seattle > pasos.txt

pasoshtm.exe Seattle, WA;se

COPY PASOS.HTM+PASOSHD.HTM pasosse.htm /A
                                                
cambzona timezone = AST9ADT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Anchorage > pasoscac.txt
itpass -g a -n 23 -z -o 60 -s Anchorage > pasos.txt

pasoshtm.exe Anchorage, AK;ac

COPY PASOS.HTM+PASOSHD.HTM pasosac.htm /A
                                                
cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Oklahoma > pasoscok.txt
itpass -g a -n 23 -z -o 60 -s Oklahoma > pasos.txt

pasoshtm.exe Oklahoma, OK;ok

COPY PASOS.HTM+PASOSHD.HTM pasosok.htm /A
                                                
cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Memphis > pasoscmn.txt
itpass -g a -n 23 -z -o 60 -s Memphis > pasos.txt

pasoshtm.exe Memphis, TN;mn

COPY PASOS.HTM+PASOSHD.HTM pasosmn.htm /A
                                                
cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Minneapolis > pasoscms.txt
itpass -g a -n 23 -z -o 60 -s Minneapolis > pasos.txt

pasoshtm.exe Minneapolis;ms

COPY PASOS.HTM+PASOSHD.HTM pasosms.htm /A
                                                
cambzona timezone = MST7MDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Albuquerque > pasoscal.txt
itpass -g a -n 23 -z -o 60 -s Albuquerque > pasos.txt

pasoshtm.exe Albuquerque;al

COPY PASOS.HTM+PASOSHD.HTM pasosal.htm /A
                                                
cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Whitehorse > pasoscwh.txt
itpass -g a -n 23 -z -o 60 -s Whitehorse > pasos.txt

pasoshtm.exe Whitehorse,CAN;wh

COPY PASOS.HTM+PASOSHD.HTM pasoswh.htm /A
                                                
cambzona timezone = GMT7DST
itpass -g c -z -o 99 -n 99 -d -e 2 -s Boise > pasoscbi.txt
itpass -g a -n 23 -z -o 60 -s Boise > pasos.txt

pasoshtm.exe Boise, ID;bi

COPY PASOS.HTM+PASOSHD.HTM pasosbi.htm /A


exit