@echo off
cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Toronto > pasoscto.txt
itpass -g a -n 23 -z -o 60 -s Toronto > pasos.txt

pasoshtm.exe Toronto. CAN;to

COPY PASOS.HTM+PASOSHD.HTM pasosto.htm /A
                                                
cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s SFrancisco > pasoscfr.txt
itpass -g a -n 23 -z -o 60 -s SFrancisco > pasos.txt

pasoshtm.exe San Francisco;fr

COPY PASOS.HTM+PASOSHD.HTM pasosfr.htm /A
                                                
cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s LAngeles > pasoscla.txt
itpass -g a -n 23 -z -o 60 -s LAngeles > pasos.txt

pasoshtm.exe Los Angeles.-;la

COPY PASOS.HTM+PASOSHD.HTM pasosla.htm /A
                                                
cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Austin > pasoscau.txt
itpass -g a -n 23 -z -o 60 -s Austin > pasos.txt

pasoshtm.exe Austin;au

COPY PASOS.HTM+PASOSHD.HTM pasosau.htm /A
                                                
cambzona timezone = MST7
itpass -g c -z -o 99 -n 99 -d -e 2 -s Phoenix > pasoscph.txt
itpass -g a -n 23 -z -o 60 -s Phoenix > pasos.txt

pasoshtm.exe Phoenix. ARIZ;ph

COPY PASOS.HTM+PASOSHD.HTM pasosph.htm /A
                                                
cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Houston > pasoscho.txt
itpass -g a -n 23 -z -o 60 -s Houston > pasos.txt
pasoshtm.exe Houston Texas;ho

REM FIXME
REM copy /Y pasos.htm C:\webs\amsat.org.ar\pasosho.htm

COPY PASOS.HTM+PASOSHD.HTM pasosho.htm /A
                                                
cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Atlanta > pasoscat.txt
itpass -g a -n 23 -z -o 60 -s Atlanta > pasos.tx

pasoshtm.exe Atlanta Georg;at

COPY PASOS.HTM+PASOSHD.HTM pasosat.htm /A
                                                
cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s NewYork > pasoscny.txt
itpass -g a -n 23 -z -o 60 -s NewYork > pasos.txt

pasoshtm.exe New York - NY;ny

COPY PASOS.HTM+PASOSHD.HTM pasosny.htm /A
                                                
cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Miami > pasoscmi.txt
itpass -g a -n 23 -z -o 60 -s Miami > pasos.txt

pasoshtm.exe Miami Florida;mi

COPY PASOS.HTM+PASOSHD.HTM pasosmi.htm /A
                                                
cambzona timezone = EST10
itpass -g c -z -o 99 -n 99 -d -e 2 -s Hawaii > pasoschi.txt
itpass -g a -n 23 -z -o 60 -s Hawaii > pasos.txt

pasoshtm.exe Hawaii;hi

COPY PASOS.HTM+PASOSHD.HTM pasoshi.htm /A


exit