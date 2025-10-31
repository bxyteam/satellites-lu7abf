cd c:\it
echo Se bajan Keplerianos desde celestrak
downloader.exe -download http://localhost/amsat.org.ar/kepsupdate.asp
erase kepsup*.htm
it.exe /F d:\webs\amsat.org.ar\text\nasa.all
echo Archivo nasa.all actualizado copiado en directorio IT
copy d:\webs\amsat.org.ar\text\nasa.all nasa.all
echo Keplerianos actualizados en IT

copy itba.qth it.qth
cambzona timezone = LUT3
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe B.Aires, Arg.;ba
copy pasos.htm d:\webs\amsat.org.ar\pasosba.htm

copy itbb.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe B.Blanca Arg.;bb
copy pasos.htm d:\webs\amsat.org.ar\pasosbb.htm

copy itco.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Cordoba, Arg.;co
copy pasos.htm d:\webs\amsat.org.ar\pasosco.htm

copy itig.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe C.Iguazu Arg.;ig
copy pasos.htm d:\webs\amsat.org.ar\pasosig.htm

copy itju.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe S.S.Jujuy Arg;ju
copy pasos.htm d:\webs\amsat.org.ar\pasosju.htm

copy itme.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Mendoza, Arg.;me
copy pasos.htm d:\webs\amsat.org.ar\pasosme.htm

copy itst.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe S.M. Tucuman.;st
copy pasos.htm d:\webs\amsat.org.ar\pasosst.htm

copy itcr.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Com.Rivadavia;cr
copy pasos.htm d:\webs\amsat.org.ar\pasoscr.htm

copy itrg.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Rio Gallegos.;rg
copy pasos.htm d:\webs\amsat.org.ar\pasosrg.htm

copy itmp.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe M. del Plata.;mp
copy pasos.htm d:\webs\amsat.org.ar\pasosmp.htm

copy itnq.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Neuquen, Arg.;nq
copy pasos.htm d:\webs\amsat.org.ar\pasosnq.htm

copy itre.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Resistencia..;re
copy pasos.htm d:\webs\amsat.org.ar\pasosre.htm

copy itsc.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe S.C.Bariloche;sc
copy pasos.htm d:\webs\amsat.org.ar\pasossc.htm

copy itsf.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Santa Fe Arg.;sf
copy pasos.htm d:\webs\amsat.org.ar\pasossf.htm

copy itsr.qth it.qth
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Santa Rosa LP;sr
copy pasos.htm d:\webs\amsat.org.ar\pasossr.htm

copy itbupori.qth it.qth

cambzona timezone = PST8PDT
itpass -g a -n 23 -z -o 60 -s Vancouver > pasos.txt
paseshtm.exe Vancouver CAN;va
copy pasos.htm d:\webs\amsat.org.ar\pasosva.htm

cambzona timezone = EST6EDT
itpass -g a -n 23 -z -o 60 -s Chicago  > pasos.txt
paseshtm.exe Chicago Illin;ch
copy pasos.htm d:\webs\amsat.org.ar\pasosch.htm

cambzona timezone = EST5EDT
itpass -g a -n 23 -z -o 60 -s Montreal > pasos.txt
paseshtm.exe Montreal. CAN;mo
copy pasos.htm d:\webs\amsat.org.ar\pasosmo.htm

cambzona timezone = PST8PDT
itpass -g a -n 23 -z -o 60 -s SFrancisco > pasos.txt
paseshtm.exe San Francisco;fr
copy pasos.htm d:\webs\amsat.org.ar\pasosfr.htm

cambzona timezone = PST8PDT
itpass -g a -n 23 -z -o 60 -s LAngeles > pasos.txt
paseshtm.exe Los Angeles.-;la
copy pasos.htm d:\webs\amsat.org.ar\pasosla.htm

cambzona timezone = PST8PDT
itpass -g a -n 23 -z -o 60 -s Phoenix > pasos.txt
paseshtm.exe Phoenix. ARIZ;ph
copy pasos.htm d:\webs\amsat.org.ar\pasosph.htm

cambzona timezone = CST6CDT
itpass -g a -n 23 -z -o 60 -s Houston > pasos.txt
paseshtm.exe Houston Texas;ho
copy pasos.htm d:\webs\amsat.org.ar\pasosho.htm

cambzona timezone = EST5EDT
itpass -g a -n 23 -z -o 60 -s Atlanta > pasos.txt
paseshtm.exe Atlanta Georg;at
copy pasos.htm d:\webs\amsat.org.ar\pasosat.htm

cambzona timezone = EST5EDT
itpass -g a -n 23 -z -o 60 -s NewYork > pasos.txt
paseshtm.exe New York - NY;ny
copy pasos.htm d:\webs\amsat.org.ar\pasosny.htm

cambzona timezone = EST5EDT
itpass -g a -n 23 -z -o 60 -s Miami > pasos.txt
paseshtm.exe Miami Florida;mi
copy pasos.htm d:\webs\amsat.org.ar\pasosmi.htm

cambzona timezone = CST6CDT
itpass -g a -n 23 -z -o 60 -s Mexico > pasos.txt
pasoshtm.exe Mexico Mex-DF;mx
copy pasos.htm d:\webs\amsat.org.ar\pasosmx.htm

cambzona timezone = EST5
itpass -g a -n 23 -z -o 60 -s Bogota > pasos.txt
pasoshtm.exe Bogota Colomb;bo
copy pasos.htm d:\webs\amsat.org.ar\pasosbo.htm

cambzona timezone = EST4
itpass -g a -n 23 -z -o 60 -s Caracas > pasos.txt
pasoshtm.exe Caracas Venez;ca
copy pasos.htm d:\webs\amsat.org.ar\pasosca.htm

cambzona timezone = EST5
itpass -g a -n 23 -z -o 60 -s Lima > pasos.txt
pasoshtm.exe Lima -  Peru;li
copy pasos.htm d:\webs\amsat.org.ar\pasosli.htm

cambzona timezone = EST3
itpass -g a -n 23 -z -o 60 -s Rio > pasos.txt
pasoshtm.exe Rio de Jan BR;ri
copy pasos.htm d:\webs\amsat.org.ar\pasosri.htm

cambzona timezone = CST-1CDT
itpass -g a -n 23 -z -o 60 -s Madrid > pasos.txt
pasoshtm.exe Madrid Espa¤a;ma
copy pasos.htm d:\webs\amsat.org.ar\pasosma.htm

cambzona timezone = CST0CDT
itpass -g a -n 23 -z -o 60 -s Londres > pasos.txt
paseshtm.exe London GBrit.;lo
copy pasos.htm d:\webs\amsat.org.ar\pasoslo.htm

cambzona timezone = CST-1CDT
itpass -g a -n 23 -z -o 60 -s Paris > pasos.txt
paseshtm.exe Paris, France;pa
copy pasos.htm d:\webs\amsat.org.ar\pasospa.htm

cambzona timezone = CST-1CDT
itpass -g a -n 23 -z -o 60 -s Roma > pasos.txt
paseshtm.exe Rome - Italia;ro
copy pasos.htm d:\webs\amsat.org.ar\pasosro.htm

cambzona timezone = PST8PDT
itpass -g a -n 23 -z -o 60 -s Vancouver > pasos.txt
paseshtm.exe Vancouver CAN;va
copy pasos.htm d:\webs\amsat.org.ar\pasosva.htm

cambzona timezone = CST-1CDT
itpass -g a -n 23 -z -o 60 -s Stockholm > pasos.txt
paseshtm.exe Stockholm  SW;sk
copy pasos.htm d:\webs\amsat.org.ar\pasossk.htm

cambzona timezone = CST-1CDT
itpass -g a -n 23 -z -o 60 -s Stutgart > pasos.txt
paseshtm.exe Stuttgart GER;su
copy pasos.htm d:\webs\amsat.org.ar\pasossu.htm

cambzona timezone = CST-3CDT
itpass -g a -n 23 -z -o 60 -s SPetersburg > pasos.txt
paseshtm.exe SPetesburg RU;sp
copy pasos.htm d:\webs\amsat.org.ar\pasossp.htm

cambzona timezone = CST-2CDT
itpass -g a -n 23 -z -o 60 -s Istambul > pasos.txt
paseshtm.exe Istambul Arab;is
copy pasos.htm d:\webs\amsat.org.ar\pasosis.htm

cambzona timezone = CST-3CDT
itpass -g a -n 23 -z -o 60 -s Moscow > pasos.txt
paseshtm.exe Moscow Russia;mw
copy pasos.htm d:\webs\amsat.org.ar\pasosmw.htm

cambzona timezone = EST-1
itpass -g a -n 23 -z -o 60 -s Lagos > pasos.txt
paseshtm.exe Lagos Nigeria;lg
copy pasos.htm d:\webs\amsat.org.ar\pasoslg.htm

cambzona timezone = EST-2CDT
itpass -g a -n 23 -z -o 60 -s ElCairo > pasos.txt
paseshtm.exe El Cairo Egpt;aq
copy pasos.htm d:\webs\amsat.org.ar\pasosaq.htm

cambzona timezone = EST-2
itpass -g a -n 23 -z -o 60 -s Johanesburg > pasos.txt
paseshtm.exe Johanesbrg SA;jo
copy pasos.htm d:\webs\amsat.org.ar\pasosjo.htm

cambzona time_offset_seconds = -12600
itpass -g a -n 23 -z -o 60 -s Teheran > pasos.txt
paseshtm.exe Teheran Arab.;te
copy pasos.htm d:\webs\amsat.org.ar\pasoste.htm

cambzona time_offset_seconds = -19800
itpass -g a -n 23 -z -o 60 -s Delhi > pasos.txt
paseshtm.exe New Delhi IND;de
copy pasos.htm d:\webs\amsat.org.ar\pasosde.htm

cambzona time_offset_seconds = -19800
itpass -g a -n 23 -z -o 60 -s Bombay > pasos.txt
paseshtm.exe Bombay, India;by
copy pasos.htm d:\webs\amsat.org.ar\pasosby.htm

cambzona timezone = EST-8
itpass -g a -n 23 -z -o 60 -s HongKong > pasos.txt
paseshtm.exe Hong Kong Chi;hk
copy pasos.htm d:\webs\amsat.org.ar\pasoshk.htm

cambzona timezone = EST-7
itpass -g a -n 23 -z -o 60 -s Jakarta > pasos.txt
paseshtm.exe Jakarta Indon;ja
copy pasos.htm d:\webs\amsat.org.ar\pasosja.htm

cambzona timezone = EST-8
itpass -g a -n 23 -z -o 60 -s Beijing > pasos.txt
paseshtm.exe Beijing China;bj
copy pasos.htm d:\webs\amsat.org.ar\pasosbj.htm

cambzona timezone = EST-9
itpass -g a -n 23 -z -o 60 -s Seoul > pasos.txt
paseshtm.exe Seoul - Corea;sl
copy pasos.htm d:\webs\amsat.org.ar\pasossl.htm

cambzona timezone = EST-9
itpass -g a -n 23 -z -o 60 -s Tokio > pasos.txt
paseshtm.exe Tokio - Japan;tk
copy pasos.htm d:\webs\amsat.org.ar\pasostk.htm

cambzona timezone = EST-8
itpass -g a -n 23 -z -o 60 -s Manila > pasos.txt
paseshtm.exe Manila, Phill;ml
copy pasos.htm d:\webs\amsat.org.ar\pasosml.htm

cambzona timezone = EST-8
itpass -g a -n 23 -z -o 60 -s Perth > pasos.txt
paseshtm.exe Perth Austral;pt
copy pasos.htm d:\webs\amsat.org.ar\pasospt.htm

cambzona timezone = EST-10EDT
itpass -g a -n 23 -z -o 60 -s Melbourne > pasos.txt
paseshtm.exe Melbourne, AU;mb
copy pasos.htm d:\webs\amsat.org.ar\pasosmb.htm

cambzona timezone = EST-10EDT
itpass -g a -n 23 -z -o 60 -s Sydney > pasos.txt
paseshtm.exe Sydney Austr.;sd
copy pasos.htm d:\webs\amsat.org.ar\pasossd.htm

cambzona timezone = EST-12EDT
itpass -g a -n 23 -z -o 60 -s Wellington > pasos.txt
paseshtm.exe Wellington NZ;we
copy pasos.htm d:\webs\amsat.org.ar\pasoswe.htm

cambzona timezone = EST-3
itpass -g a -n 23 -z -o 60 -s Riyadh > pasos.txt
paseshtm.exe Riyadh SArab.;ry
copy pasos.htm d:\webs\amsat.org.ar\pasosry.htm

cambzona timezone = EST4EDT
itpass -g a -n 23 -z -o 60 -s Santiago > pasos.txt
pasoshtm.exe Sgo. de Chile;sg
copy pasos.htm d:\webs\amsat.org.ar\pasossg.htm

cambzona timezone = CXT3
itpass -g a -n 23 -z -o 60 -s Montevideo > pasos.txt
pasoshtm.exe Montevideo U.;mv
copy pasos.htm d:\webs\amsat.org.ar\pasosmv.htm

copy itini.bup it.ini