@echo off
cambzona timezone = IST-2DST
itpass -g c -z -o 99 -n 99 -d -e 2 -s Tel-Aviv > pasoscta.txt
itpass -g a -n 23 -z -o 60 -s Tel-Aviv > pasos.txt

pasoshtm.exe Tel-Aviv, IS;ta

COPY PASOS.HTM+PASOSHD.HTM pasosta.htm /A
                                                
cambzona timezone = CET-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Copenhagen > pasosccg.txt
itpass -g a -n 23 -z -o 60 -s Copenhagen > pasos.txt

pasoshtm.exe Copenhagen;cg

COPY PASOS.HTM+PASOSHD.HTM pasoscg.htm /A
                                                
cambzona timezone = -19800
itpass -g c -z -o 99 -n 99 -d -e 2 -s Chennai > pasosccn.txt
itpass -g a -n 23 -z -o 60 -s Chennai > pasos.txt

pasoshtm.exe Chennai, In;cn

COPY PASOS.HTM+PASOSHD.HTM pasoscn.htm /A
                                                
cambzona timezone = CET-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Amsterdam > pasoscam.txt
itpass -g a -n 23 -z -o 60 -s Amsterdam > pasos.txt

pasoshtm.exe Amsterdam;am

COPY PASOS.HTM+PASOSHD.HTM pasosam.htm /A
                                                
cambzona timezone = EST-8
itpass -g c -z -o 99 -n 99 -d -e 2 -s Shanghai > pasoscsh.txt

itpass -g a -n 23 -z -o 60 -s Shanghai > pasos.txt

pasoshtm.exe Shanghai;sh

COPY PASOS.HTM+PASOSHD.HTM pasossh.htm /A
                                                
cambzona timezone = CST0CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Lisboa > pasosclb.txt
itpass -g a -n 23 -z -o 60 -s Lisboa > pasos.txt

pasoshtm.exe Lisboa, Port.;lb

COPY PASOS.HTM+PASOSHD.HTM pasoslb.htm /A
                                                
cambzona timezone = GMT3CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Asuncion > pasoscas.txt
itpass -g a -n 23 -z -o 60 -s Asuncion > pasos.txt

pasoshtm.exe Asuncion,Par.;as

COPY PASOS.HTM+PASOSHD.HTM pasosas.htm
                                                
cambzona timezone = GMT4
itpass -g c -z -o 99 -n 99 -d -e 2 -s LaPaz > pasosclp.txt
itpass -g a -n 23 -z -o 60 -s LaPaz > pasos.txt

pasoshtm.exe La Paz, Boliv;lp

COPY PASOS.HTM+PASOSHD.HTM pasoslp.htm /A
                                                
cambzona timezone = GMT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Antartida > pasoscan.txt
itpass -g a -n 23 -z -o 60 -s Antartida > pasos.txt

pasoshtm.exe Antartida,Arg;an

COPY PASOS.HTM+PASOSHD.HTM pasosan.htm /A
                                                
cambzona timezone = GMT5
itpass -g c -z -o 99 -n 99 -d -e 2 -s Quito > pasoscqu.txt
itpass -g a -n 23 -z -o 60 -s Quito > pasos.txt

pasoshtm.exe Quito,Ecuador;qu

COPY PASOS.HTM+PASOSHD.HTM pasosqu.htm /A


exit