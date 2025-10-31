@echo off
cambzona timezone = EST-3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Riyadh > pasoscry.txt
itpass -g a -n 23 -z -o 60 -s Riyadh > pasos.txt
pasoshtm.exe Riyadh SArab.;ry
COPY PASOS.HTM+PASOSHD.HTM pasosry.htm /A
                                                
cambzona timezone = EST4EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Santiago > pasoscsg.txt
itpass -g a -n 23 -z -o 60 -s Santiago > pasos.txt

pasoshtm.exe Sgo. de Chile;sg

COPY PASOS.HTM+PASOSHD.HTM pasossg.htm /A
                                                
cambzona timezone = CXT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Montevideo > pasoscmv.txt
itpass -g a -n 23 -z -o 60 -s Montevideo > pasos.txt

pasoshtm.exe Montevideo U.;mv

COPY PASOS.HTM+PASOSHD.HTM pasosmv.htm /A
                                                
cambzona time_offset_seconds = -12600
itpass -g c -z -o 99 -n 99 -d -e 2 -s Teheran > pasoscte.txt
itpass -g a -n 23 -z -o 60 -s Teheran > pasos.txt

pasoshtm.exe Teheran Arab.;te

COPY PASOS.HTM+PASOSHD.HTM pasoste.htm /A
                                                
cambzona time_offset_seconds = -19800
itpass -g c -z -o 99 -n 99 -d -e 2 -s Delhi > pasoscde.txt
itpass -g a -n 23 -z -o 60 -s Delhi > pasos.txt

pasoshtm.exe New Delhi IND;de

COPY PASOS.HTM+PASOSHD.HTM pasosde.htm /A
                                                
cambzona time_offset_seconds = -19800
itpass -g c -z -o 99 -n 99 -d -e 2 -s Bombay > pasoscby.txt
itpass -g a -n 23 -z -o 60 -s Bombay > pasos.txt

pasoshtm.exe Bombay, India;by

COPY PASOS.HTM+PASOSHD.HTM pasosby.htm /A


exit