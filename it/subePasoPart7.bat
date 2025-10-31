@echo off
cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Mexico > pasoscmx.txt
itpass -g a -n 23 -z -o 60 -s Mexico > pasos.txt

pasoshtm.exe Mexico Mex-DF;mx

COPY PASOS.HTM+PASOSHD.HTM pasosmx.htm /A
                                                
cambzona timezone = EST5
itpass -g c -z -o 99 -n 99 -d -e 2 -s Bogota > pasoscbo.txt
itpass -g a -n 23 -z -o 60 -s Bogota > pasos.txt

pasoshtm.exe Bogota Colomb;bo

COPY PASOS.HTM+PASOSHD.HTM pasosbo.htm /A
                                                
cambzona time_offset_seconds = 16200
itpass -g c -z -o 99 -n 99 -d -e 2 -s Caracas > pasoscca.txt
itpass -g a -n 23 -z -o 60 -s Caracas > pasos.txt

pasoshtm.exe Caracas Venez;ca

COPY PASOS.HTM+PASOSHD.HTM pasosca.htm /A
                                                
cambzona timezone = EST4
itpass -g c -z -o 99 -n 99 -d -e 2 -s Barbados > pasoscbr.txt
itpass -g a -n 23 -z -o 60 -s Barbados > pasos.txt

pasoshtm.exe Barbados;br

COPY PASOS.HTM+PASOSHD.HTM pasosbr.htm /A
                                                
cambzona timezone = EST5
itpass -g c -z -o 99 -n 99 -d -e 2 -s Lima > pasoscli.txt
itpass -g a -n 23 -z -o 60 -s Lima > pasos.txt

pasoshtm.exe Lima -  Peru;li

COPY PASOS.HTM+PASOSHD.HTM pasosli.htm /A
                                                
cambzona timezone = BST2BDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Rio > pasoscri.txt
itpass -g a -n 23 -z -o 60 -s Rio > pasos.txt

pasoshtm.exe Rio de Jan BR;ri

COPY PASOS.HTM+PASOSHD.HTM pasosri.htm /A
                                                
cambzona timezone = EST4EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Brasilia > pasoscbz.txt
itpass -g a -n 23 -z -o 60 -s Brasilia > pasos.txt

pasoshtm.exe Brasilia BR;bz

COPY PASOS.HTM+PASOSHD.HTM pasosbz.htm /A
                                                
cambzona timezone = CST-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Madrid > pasoscma.txt
itpass -g a -n 23 -z -o 60 -s Madrid > pasos.txt

pasoshtm.exe Madrid Espa�a;ma

COPY PASOS.HTM+PASOSHD.HTM pasosma.htm /A
                                                
cambzona timezone = CST0CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Londres > pasosclo.txt
itpass -g a -n 23 -z -o 60 -s Londres > pasos.txt

pasoshtm.exe London GBrit.;lo

COPY PASOS.HTM+PASOSHD.HTM pasoslo.htm /A
                                                
cambzona timezone = CST-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Paris > pasoscpa.txt
itpass -g a -n 23 -z -o 60 -s Paris > pasos.txt

pasoshtm.exe Paris, France;pa

COPY PASOS.HTM+PASOSHD.HTM pasospa.htm /A

exit