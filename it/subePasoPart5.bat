@echo off
cambzona timezone = BST2BDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Belohorizonte > pasoscbh.txt
itpass -g a -n 23 -z -o 60 -s Belohorizonte > pasos.txt

pasoshtm.exe Belo Horizonte;bh

COPY PASOS.HTM+PASOSHD.HTM pasosbh.htm /A
                                                
cambzona timezone = BST2BDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Portoalegre > pasoscpo.txt
itpass -g a -n 23 -z -o 60 -s Portoalegre > pasos.txt

pasoshtm.exe Porto Alegre;po

COPY PASOS.HTM+PASOSHD.HTM pasospo.htm /A
                                                
cambzona timezone = BRT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Salvador > pasoscsa.txt
itpass -g a -n 23 -z -o 60 -s Salvador > pasos.txt

pasoshtm.exe Salvador, Br;sa

COPY PASOS.HTM+PASOSHD.HTM pasossa.htm /A
                                                
cambzona timezone = BRT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Fortaleza > pasoscfo.txt
itpass -g a -n 23 -z -o 60 -s Fortaleza > pasos.txt

pasoshtm.exe Fortaleza, Br;fo

COPY PASOS.HTM+PASOSHD.HTM pasosfo.htm /A
                                                
cambzona timezone = BRT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Belem > pasoscbe.txt
itpass -g a -n 23 -z -o 60 -s Belem > pasos.txt

pasoshtm.exe Belem, Brazil;be

COPY PASOS.HTM+PASOSHD.HTM pasosbe.htm /A
                                                
cambzona timezone = BRT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Recife > pasoscrc.txt
itpass -g a -n 23 -z -o 60 -s Recife > pasos.txt

pasoshtm.exe Recife, Brazil;rc

COPY PASOS.HTM+PASOSHD.HTM pasosrc.htm /A
                                                
copy /Y itbupori.qth it.qth
                                                
cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2  -s Vancouver > pasoscva.txt
itpass -g a -n 23 -z -o 60 -s Vancouver > pasos.txt

pasoshtm.exe Vancouver CAN;va

COPY PASOS.HTM+PASOSHD.HTM pasosva.htm /A
                                                
cambzona timezone = CST6EDT
itpass -g c -z -o 99 -n 99 -d -e 2  -s Winnipeg > pasoscwi.txt
itpass -g a -n 23 -z -o 60 -s Winnipeg > pasos.txt

pasoshtm.exe Winnipeg CAN;wi

COPY PASOS.HTM+PASOSHD.HTM pasoswi.htm /A
                                                
cambzona timezone = EST6EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Chicago > pasoscch.txt
itpass -g a -n 23 -z -o 60 -s Chicago > pasos.txt

pasoshtm.exe Chicago Illin;ch

COPY PASOS.HTM+PASOSHD.HTM pasosch.htm /A
                                                
cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Montreal > pasoscmo.txt
itpass -g a -n 23 -z -o 60 -s Montreal > pasos.txt

pasoshtm.exe Montreal. CAN;mo

COPY PASOS.HTM+PASOSHD.HTM pasosmo.htm /A


exit