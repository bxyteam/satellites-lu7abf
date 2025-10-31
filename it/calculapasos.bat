cd c:\it
echo Se bajan Keplerianos desde celestrak
downloader.exe -download http://lu7aa.org.ar/kepsupdate.asp
erase kepsup*.htm
echo Se copia text/pehuen.js de lu7aa.org.ar a directorio it
downloader.exe -download http://lu7aa.org.ar/text/pehuen.js pehuen.js
erase d:\webs\amsat.otg.ar\text\pehuen.js
copy pehuen.js d:\webs\amsat.org.ar\text\pehuen.js
echo Se ponen los keps en nasa.all
erase nasa.all
downloader.exe -download http://lu7aa.org.ar/text/nasa.txt nasa.all
downloader.exe -download http://lu7aa.org.ar/text/keps.txt d:/webs/amsat.org.ar/text/keps.txt
downloader.exe -download http://lu7aa.org.ar/text/keps.txt d:/webs/lu7aa.org.ar/text/keps.txt
echo Se actualiza el it.exe con nuevos keplerianos
it.exe /F nasa.all
echo Archivo nasa.all se copia en directorio de la web local
copy /Y nasa.all d:\webs\amsat.org.ar\text\nasa.all
copy /Y d:\webs\lu7aa.org.ar\text\keps.txt d:\webs\amsat.org.ar\text\keps.txt

cambzona timezone = LUT3

copy /Y itba.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscba.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe B.Aires, Arg.;ba
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosba.htm
copy /Y pasoscba.txt d:\webs\lu7aa.org.ar\pasos\pasoscba.txt

copy /Y itmp.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscmp.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe M. del Plata.;mp
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosmp.htm
copy /Y pasoscmp.txt d:\webs\lu7aa.org.ar\pasos\pasoscmp.txt

copy /Y itbb.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscbb.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe B.Blanca Arg.;bb
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosbb.htm
copy /Y pasoscbb.txt d:\webs\lu7aa.org.ar\pasos\pasoscbb.txt

copy /Y itsf.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscsf.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Santa Fe Arg.;sf
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossf.htm
copy /Y pasoscsf.txt d:\webs\lu7aa.org.ar\pasos\pasoscsf.txt

copy /Y itre.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscre.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Resistencia..;re
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosre.htm
copy /Y pasoscre.txt d:\webs\lu7aa.org.ar\pasos\pasoscre.txt

copy /Y itig.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscig.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe C.Iguazu Arg.;ig
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosig.htm
copy /Y pasoscig.txt d:\webs\lu7aa.org.ar\pasos\pasoscig.txt

copy /Y itst.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscst.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe S.M. Tucuman.;st
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosst.htm
copy /Y pasoscst.txt d:\webs\lu7aa.org.ar\pasos\pasoscst.txt

copy /Y itco.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscco.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Cordoba, Arg.;co
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosco.htm
copy /Y pasoscco.txt d:\webs\lu7aa.org.ar\pasos\pasoscco.txt

copy /Y itju.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscju.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe S.S.Jujuy Arg;ju
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosju.htm
copy /Y pasoscju.txt d:\webs\lu7aa.org.ar\pasos\pasoscju.txt

copy /Y itme.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscme.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Mendoza, Arg.;me
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosme.htm
copy /Y pasoscme.txt d:\webs\lu7aa.org.ar\pasos\pasoscme.txt

copy /Y itcr.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasosccr.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Com.Rivadavia;cr
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoscr.htm
copy /Y pasosccr.txt d:\webs\lu7aa.org.ar\pasos\pasosccr.txt

copy /Y itrg.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscrg.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Rio Gallegos.;rg
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosrg.htm
copy /Y pasoscrg.txt d:\webs\lu7aa.org.ar\pasos\pasoscrg.txt

copy /Y itnq.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscnq.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Neuquen, Arg.;nq
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosnq.htm
copy /Y pasoscnq.txt d:\webs\lu7aa.org.ar\pasos\pasoscnq.txt

copy /Y itsc.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscsc.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe S.C.Bariloche;sc
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossc.htm
copy /Y pasoscsc.txt d:\webs\lu7aa.org.ar\pasos\pasoscsc.txt

copy /Y itsr.qth it.qth
itpass -g c -z -o 99 -n 99 -d -e 2 > pasoscsr.txt
itpass -g a -n 23 -z -o 60> pasos.txt
pasoshtm.exe Santa Rosa LP;sr
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossr.htm
copy /Y pasoscsr.txt d:\webs\lu7aa.org.ar\pasos\pasoscsr.txt

copy /Y itmore.qth it.qth
cambzona timezone = CST-2CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Helsinki > pasosche.txt
itpass -g a -n 23 -z -o 60 -s Helsinki > pasos.txt
paseshtm.exe Helsinki, FIN;he
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoshe.htm
copy /Y pasosche.txt d:\webs\lu7aa.org.ar\pasos\pasosche.txt

cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Cuba > pasosccu.txt
itpass -g a -n 23 -z -o 60 -s Cuba > pasos.txt
pasoshtm.exe Habana, CUBA;cu
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoscu.htm
copy /Y pasosccu.txt d:\webs\lu7aa.org.ar\pasos\pasosccu.txt

cambzona timezone = ICT-7
itpass -g c -z -o 99 -n 99 -d -e 2 -s Bangkok > pasoscbk.txt
itpass -g a -n 23 -z -o 60 -s Bangkok > pasos.txt
paseshtm.exe Bangkok, TH;cu
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosbk.htm
copy /Y pasoscbk.txt d:\webs\lu7aa.org.ar\pasos\pasoscbk.txt

cambzona timezone = MST7MDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Edmonton > pasosced.txt
itpass -g a -n 23 -z -o 60 -s Edmonton > pasos.txt
paseshtm.exe Edmonton, CA;ed
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosed.htm
copy /Y pasosced.txt d:\webs\lu7aa.org.ar\pasos\pasosced.txt

cambzona timezone = CST0CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Tenerife > pasosctn.txt
itpass -g a -n 23 -z -o 60 -s Tenerife > pasos.txt
pasoshtm.exe Tenerife, ES;tn
copy /Y pasos.htm d:\webs\amsat.org.ar\pasostn.htm
copy /Y pasosctn.txt d:\webs\lu7aa.org.ar\pasos\pasosctn.txt

cambzona timezone = IST-2DST
itpass -g c -z -o 99 -n 99 -d -e 2 -s Tel-Aviv > pasoscta.txt
itpass -g a -n 23 -z -o 60 -s Tel-Aviv > pasos.txt
paseshtm.exe Tel-Aviv, IS;ta
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosta.htm
copy /Y pasoscta.txt d:\webs\lu7aa.org.ar\pasos\pasoscta.txt

cambzona timezone = CET-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Copenhagen > pasosccg.txt
itpass -g a -n 23 -z -o 60 -s Copenhagen > pasos.txt
paseshtm.exe Copenhagen;cg
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoscg.htm
copy /Y pasosccg.txt d:\webs\lu7aa.org.ar\pasos\pasosccg.txt

cambzona timezone = -19800
itpass -g c -z -o 99 -n 99 -d -e 2 -s Chennai > pasosccn.txt
itpass -g a -n 23 -z -o 60 -s Chennai > pasos.txt
paseshtm.exe Chennai, In;cn
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoscn.htm
copy /Y pasosccn.txt d:\webs\lu7aa.org.ar\pasos\pasosccn.txt

cambzona timezone = CET-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Amsterdam > pasoscam.txt
itpass -g a -n 23 -z -o 60 -s Amsterdam > pasos.txt
paseshtm.exe Amsterdam;am
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosam.htm
copy /Y pasoscam.txt d:\webs\lu7aa.org.ar\pasos\pasoscam.txt

cambzona timezone = EST-8
itpass -g c -z -o 99 -n 99 -d -e 2 -s Shanghai > pasoscsh.txt
itpass -g a -n 23 -z -o 60 -s Shanghai > pasos.txt
paseshtm.exe Shanghai;sh
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossh.htm
copy /Y pasoscsh.txt d:\webs\lu7aa.org.ar\pasos\pasoscsh.txt

cambzona timezone = CST0CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Lisboa > pasosclb.txt
itpass -g a -n 23 -z -o 60 -s Lisboa > pasos.txt
pasoshtm.exe Lisboa, Port.;lb
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoslb.htm
copy /Y pasosclb.txt d:\webs\lu7aa.org.ar\pasos\pasosclb.txt

cambzona timezone = GMT3CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Asuncion > pasoscas.txt
itpass -g a -n 23 -z -o 60 -s Asuncion > pasos.txt
pasoshtm.exe Asuncion,Par.;as
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosas.htm
copy /Y pasoscas.txt d:\webs\lu7aa.org.ar\pasos\pasoscas.txt

cambzona timezone = GMT4
itpass -g c -z -o 99 -n 99 -d -e 2 -s LaPaz > pasosclp.txt
itpass -g a -n 23 -z -o 60 -s LaPaz > pasos.txt
pasoshtm.exe La Paz, Boliv;lp
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoslp.htm
copy /Y pasosclp.txt d:\webs\lu7aa.org.ar\pasos\pasosclp.txt

cambzona timezone = GMT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Antartida > pasoscan.txt
itpass -g a -n 23 -z -o 60 -s Antartida > pasos.txt
pasoshtm.exe Antartida,Arg;an
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosan.htm
copy /Y pasoscan.txt d:\webs\lu7aa.org.ar\pasos\pasoscan.txt

cambzona timezone = GMT5
itpass -g c -z -o 99 -n 99 -d -e 2 -s Quito > pasoscqu.txt
itpass -g a -n 23 -z -o 60 -s Quito > pasos.txt
pasoshtm.exe Quito,Ecuador;qu
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosqu.htm
copy /Y pasoscqu.txt d:\webs\lu7aa.org.ar\pasos\pasoscqu.txt

cambzona timezone = MST7MDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Denver > pasoscdn.txt
itpass -g a -n 23 -z -o 60 -s Denver > pasos.txt
paseshtm.exe Denver, CO;dn
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosdn.htm
copy /Y pasoscdn.txt d:\webs\lu7aa.org.ar\pasos\pasoscdn.txt

cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Charlotte > pasoscct.txt
itpass -g a -n 23 -z -o 60 -s Charlotte > pasos.txt
paseshtm.exe Charlotte, NC;ct
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosct.htm
copy /Y pasoscct.txt d:\webs\lu7aa.org.ar\pasos\pasoscct.txt

cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Seattle > pasoscse.txt
itpass -g a -n 23 -z -o 60 -s Seattle > pasos.txt
paseshtm.exe Seattle, WA;se
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosse.htm
copy /Y pasoscdn.txt d:\webs\lu7aa.org.ar\pasos\pasoscdn.txt

cambzona timezone = AST9ADT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Anchorage > pasoscac.txt
itpass -g a -n 23 -z -o 60 -s Anchorage > pasos.txt
paseshtm.exe Anchorage, AK;ac
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosac.htm
copy /Y pasoscac.txt d:\webs\lu7aa.org.ar\pasos\pasoscac.txt

cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Oklahoma > pasoscok.txt
itpass -g a -n 23 -z -o 60 -s Oklahoma > pasos.txt
paseshtm.exe Oklahoma, OK;ok
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosok.htm
copy /Y pasoscok.txt d:\webs\lu7aa.org.ar\pasos\pasoscok.txt

cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Memphis > pasoscmn.txt
itpass -g a -n 23 -z -o 60 -s Memphis > pasos.txt
paseshtm.exe Memphis, TN;mn
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosmn.htm
copy /Y pasoscmn.txt d:\webs\lu7aa.org.ar\pasos\pasoscmn.txt

cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Minneapolis > pasoscms.txt
itpass -g a -n 23 -z -o 60 -s Minneapolis > pasos.txt
paseshtm.exe Minneapolis;ms
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosms.htm
copy /Y pasoscms.txt d:\webs\lu7aa.org.ar\pasos\pasoscms.txt

cambzona timezone = MST7MDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Albuquerque > pasoscal.txt
itpass -g a -n 23 -z -o 60 -s Albuquerque > pasos.txt
paseshtm.exe Albuquerque;al
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosal.htm
copy /Y pasoscal.txt d:\webs\lu7aa.org.ar\pasos\pasoscal.txt

cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Whitehorse > pasoscwh.txt
itpass -g a -n 23 -z -o 60 -s Whitehorse > pasos.txt
paseshtm.exe Whitehorse,CAN;wh
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoswh.htm
copy /Y pasoscwh.txt d:\webs\lu7aa.org.ar\pasos\pasoscwh.txt

cambzona timezone = GMT7DST
itpass -g c -z -o 99 -n 99 -d -e 2 -s Boise > pasoscbi.txt
itpass -g a -n 23 -z -o 60 -s Boise > pasos.txt
paseshtm.exe Boise, ID;bi
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosbi.htm
copy /Y pasoscbi.txt d:\webs\lu7aa.org.ar\pasos\pasoscbi.txt

cambzona timezone = BST2BDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Belohorizonte > pasoscbh.txt
itpass -g a -n 23 -z -o 60 -s Belohorizonte > pasos.txt
pasoshtm.exe Belo Horizonte;bh
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosbh.htm
copy /Y pasoscbh.txt d:\webs\lu7aa.org.ar\pasos\pasoscbh.txt

cambzona timezone = BST2BDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Portoalegre > pasoscpo.txt
itpass -g a -n 23 -z -o 60 -s Portoalegre > pasos.txt
pasoshtm.exe Porto Alegre;po
copy /Y pasos.htm d:\webs\amsat.org.ar\pasospo.htm
copy /Y pasoscpo.txt d:\webs\lu7aa.org.ar\pasos\pasoscpo.txt

cambzona timezone = BRT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Salvador > pasoscsa.txt
itpass -g a -n 23 -z -o 60 -s Salvador > pasos.txt
pasoshtm.exe Salvador, Br;sa
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossa.htm
copy /Y pasoscsa.txt d:\webs\lu7aa.org.ar\pasos\pasoscsa.txt

cambzona timezone = BRT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Fortaleza > pasoscfo.txt
itpass -g a -n 23 -z -o 60 -s Fortaleza > pasos.txt
pasoshtm.exe Fortaleza, Br;fo
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosfo.htm
copy /Y pasoscfo.txt d:\webs\lu7aa.org.ar\pasos\pasoscfo.txt

cambzona timezone = BRT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Belem > pasoscbe.txt
itpass -g a -n 23 -z -o 60 -s Belem > pasos.txt
pasoshtm.exe Belem, Brazil;be
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosbe.htm
copy /Y pasoscbe.txt d:\webs\lu7aa.org.ar\pasos\pasoscbe.txt

cambzona timezone = BRT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Recife > pasoscrc.txt
itpass -g a -n 23 -z -o 60 -s Recife > pasos.txt
pasoshtm.exe Recife, Brazil;rc
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosrc.htm
copy /Y pasoscrc.txt d:\webs\lu7aa.org.ar\pasos\pasoscrc.txt

copy /Y itbupori.qth it.qth

cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2  -s Vancouver > pasoscva.txt
itpass -g a -n 23 -z -o 60 -s Vancouver > pasos.txt
paseshtm.exe Vancouver CAN;va
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosva.htm
copy /Y pasoscva.txt d:\webs\lu7aa.org.ar\pasos\pasoscva.txt

cambzona timezone = CST6EDT
itpass -g c -z -o 99 -n 99 -d -e 2  -s Winnipeg > pasoscwi.txt
itpass -g a -n 23 -z -o 60 -s Winnipeg > pasos.txt
paseshtm.exe Winnipeg CAN;va
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoswi.htm
copy /Y pasoscva.txt d:\webs\lu7aa.org.ar\pasos\pasoscwi.txt

cambzona timezone = EST6EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Chicago > pasoscch.txt
itpass -g a -n 23 -z -o 60 -s Chicago > pasos.txt
paseshtm.exe Chicago Illin;ch
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosch.htm
copy /Y pasoscch.txt d:\webs\lu7aa.org.ar\pasos\pasoscch.txt

cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Montreal > pasoscmo.txt
itpass -g a -n 23 -z -o 60 -s Montreal > pasos.txt
paseshtm.exe Montreal. CAN;mo
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosmo.htm
copy /Y pasoscmo.txt d:\webs\lu7aa.org.ar\pasos\pasoscmo.txt

cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Toronto > pasoscto.txt
itpass -g a -n 23 -z -o 60 -s Toronto > pasos.txt
paseshtm.exe Toronto. CAN;to
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosto.htm
copy /Y pasoscto.txt d:\webs\lu7aa.org.ar\pasos\pasoscto.txt

cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s SFrancisco > pasoscfr.txt
itpass -g a -n 23 -z -o 60 -s SFrancisco > pasos.txt
paseshtm.exe San Francisco;fr
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosfr.htm
copy /Y pasoscfr.txt d:\webs\lu7aa.org.ar\pasos\pasoscfr.txt

cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s LAngeles > pasoscla.txt
itpass -g a -n 23 -z -o 60 -s LAngeles > pasos.txt
paseshtm.exe Los Angeles.-;la
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosla.htm
copy /Y pasoscla.txt d:\webs\lu7aa.org.ar\pasos\pasoscla.txt

cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Austin > pasoscau.txt
itpass -g a -n 23 -z -o 60 -s Austin > pasos.txt
paseshtm.exe Austin;au
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosau.htm
copy /Y pasoscau.txt d:\webs\lu7aa.org.ar\pasos\pasoscau.txt

cambzona timezone = MST7
itpass -g c -z -o 99 -n 99 -d -e 2 -s Phoenix > pasoscph.txt
itpass -g a -n 23 -z -o 60 -s Phoenix > pasos.txt
paseshtm.exe Phoenix. ARIZ;ph
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosph.htm
copy /Y pasoscph.txt d:\webs\lu7aa.org.ar\pasos\pasoscph.txt

cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Houston > pasoscho.txt
itpass -g a -n 23 -z -o 60 -s Houston > pasos.txt
paseshtm.exe Houston Texas;ho
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosho.htm
copy /Y pasoscho.txt d:\webs\lu7aa.org.ar\pasos\pasoscho.txt

cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Atlanta > pasoscat.txt
itpass -g a -n 23 -z -o 60 -s Atlanta > pasos.txt
paseshtm.exe Atlanta Georg;at
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosat.htm
copy /Y pasoscat.txt d:\webs\lu7aa.org.ar\pasos\pasoscat.txt

cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s NewYork > pasoscny.txt
itpass -g a -n 23 -z -o 60 -s NewYork > pasos.txt
paseshtm.exe New York - NY;ny
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosny.htm
copy /Y pasoscny.txt d:\webs\lu7aa.org.ar\pasos\pasoscny.txt

cambzona timezone = EST5EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Miami > pasoscmi.txt
itpass -g a -n 23 -z -o 60 -s Miami > pasos.txt
paseshtm.exe Miami Florida;mi
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosmi.htm
copy /Y pasoscmi.txt d:\webs\lu7aa.org.ar\pasos\pasoscmi.txt

cambzona timezone = EST10
itpass -g c -z -o 99 -n 99 -d -e 2 -s Hawaii > pasoschi.txt
itpass -g a -n 23 -z -o 60 -s Hawaii > pasos.txt
paseshtm.exe Hawaii;hi
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoshi.htm
copy /Y pasoschi.txt d:\webs\lu7aa.org.ar\pasos\pasoschi.txt

cambzona timezone = CST6CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Mexico > pasoscmx.txt
itpass -g a -n 23 -z -o 60 -s Mexico > pasos.txt
pasoshtm.exe Mexico Mex-DF;mx
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosmx.htm
copy /Y pasoscmx.txt d:\webs\lu7aa.org.ar\pasos\pasoscmx.txt

cambzona timezone = EST5
itpass -g c -z -o 99 -n 99 -d -e 2 -s Bogota > pasoscbo.txt
itpass -g a -n 23 -z -o 60 -s Bogota > pasos.txt
pasoshtm.exe Bogota Colomb;bo
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosbo.htm
copy /Y pasoscbo.txt d:\webs\lu7aa.org.ar\pasos\pasoscbo.txt

cambzona time_offset_seconds = 16200
itpass -g c -z -o 99 -n 99 -d -e 2 -s Caracas > pasoscca.txt
itpass -g a -n 23 -z -o 60 -s Caracas > pasos.txt
pasoshtm.exe Caracas Venez;ca
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosca.htm
copy /Y pasoscca.txt d:\webs\lu7aa.org.ar\pasos\pasoscca.txt

cambzona timezone = EST4
itpass -g c -z -o 99 -n 99 -d -e 2 -s Barbados > pasoscbr.txt
itpass -g a -n 23 -z -o 60 -s Barbados > pasos.txt
paseshtm.exe Barbados;ca
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosbr.htm
copy /Y pasoscbr.txt d:\webs\lu7aa.org.ar\pasos\pasoscbr.txt

cambzona timezone = EST5
itpass -g c -z -o 99 -n 99 -d -e 2 -s Lima > pasoscli.txt
itpass -g a -n 23 -z -o 60 -s Lima > pasos.txt
pasoshtm.exe Lima -  Peru;li
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosli.htm
copy /Y pasoscli.txt d:\webs\lu7aa.org.ar\pasos\pasoscli.txt

cambzona timezone = BST2BDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Rio > pasoscri.txt
itpass -g a -n 23 -z -o 60 -s Rio > pasos.txt
pasoshtm.exe Rio de Jan BR;ri
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosri.htm
copy /Y pasoscri.txt d:\webs\lu7aa.org.ar\pasos\pasoscri.txt

cambzona timezone = EST4EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Brasilia > pasoscbz.txt
itpass -g a -n 23 -z -o 60 -s Brasilia > pasos.txt
pasoshtm.exe Brasilia BR;bz
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosbz.htm
copy /Y pasoscbz.txt d:\webs\lu7aa.org.ar\pasos\pasoscbz.txt

cambzona timezone = CST-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Madrid > pasoscma.txt
itpass -g a -n 23 -z -o 60 -s Madrid > pasos.txt
pasoshtm.exe Madrid Espa¤a;ma
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosma.htm
copy /Y pasoscma.txt d:\webs\lu7aa.org.ar\pasos\pasoscma.txt

cambzona timezone = CST0CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Londres > pasosclo.txt
itpass -g a -n 23 -z -o 60 -s Londres > pasos.txt
paseshtm.exe London GBrit.;lo
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoslo.htm
copy /Y pasosclo.txt d:\webs\lu7aa.org.ar\pasos\pasosclo.txt

cambzona timezone = CST-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Paris > pasoscpa.txt
itpass -g a -n 23 -z -o 60 -s Paris > pasos.txt
paseshtm.exe Paris, France;pa
copy /Y pasos.htm d:\webs\amsat.org.ar\pasospa.htm
copy /Y pasoscpa.txt d:\webs\lu7aa.org.ar\pasos\pasoscpa.txt

cambzona timezone = CST-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Roma > pasoscro.txt
itpass -g a -n 23 -z -o 60 -s Roma > pasos.txt
paseshtm.exe Rome - Italia;ro
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosro.htm
copy /Y pasoscro.txt d:\webs\lu7aa.org.ar\pasos\pasoscro.txt

cambzona timezone = PST8PDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Vancouver > pasoscva.txt
itpass -g a -n 23 -z -o 60 -s Vancouver > pasos.txt
paseshtm.exe Vancouver CAN;va
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosva.htm
copy /Y pasoscva.txt d:\webs\lu7aa.org.ar\pasos\pasoscva.txt

cambzona timezone = CST-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Stockholm > pasoscsk.txt
itpass -g a -n 23 -z -o 60 -s Stockholm > pasos.txt
paseshtm.exe Stockholm  SW;sk
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossk.htm
copy /Y pasoscsk.txt d:\webs\lu7aa.org.ar\pasos\pasoscsk.txt

cambzona timezone = CST-1CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Stutgart > pasoscsu.txt
itpass -g a -n 23 -z -o 60 -s Stutgart > pasos.txt
paseshtm.exe Stuttgart GER;su
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossu.htm
copy /Y pasoscsu.txt d:\webs\lu7aa.org.ar\pasos\pasoscsu.txt

cambzona timezone = CST-3CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s SPetersburg > pasoscsp.txt
itpass -g a -n 23 -z -o 60 -s SPetersburg > pasos.txt
paseshtm.exe SPetesburg RU;sp
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossp.htm
copy /Y pasoscsp.txt d:\webs\lu7aa.org.ar\pasos\pasoscsp.txt

cambzona timezone = CST-2CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Istambul > pasoscis.txt
itpass -g a -n 23 -z -o 60 -s Istambul > pasos.txt
paseshtm.exe Istambul Arab;is
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosis.htm
copy /Y pasoscis.txt d:\webs\lu7aa.org.ar\pasos\pasoscis.txt

cambzona timezone = CST-3CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Moscow > pasoscmw.txt
itpass -g a -n 23 -z -o 60 -s Moscow > pasos.txt
paseshtm.exe Moscow Russia;mw
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosmw.htm
copy /Y pasoscmw.txt d:\webs\lu7aa.org.ar\pasos\pasoscmw.txt

cambzona timezone = EST-1
itpass -g c -z -o 99 -n 99 -d -e 2 -s Lagos > pasosclg.txt
itpass -g a -n 23 -z -o 60 -s Lagos > pasos.txt
paseshtm.exe Lagos Nigeria;lg
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoslg.htm
copy /Y pasosclg.txt d:\webs\lu7aa.org.ar\pasos\pasosclg.txt

cambzona timezone = EST-2CDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s ElCairo > pasoscaq.txt
itpass -g a -n 23 -z -o 60 -s ElCairo > pasos.txt
paseshtm.exe El Cairo Egpt;aq
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosaq.htm
copy /Y pasoscaq.txt d:\webs\lu7aa.org.ar\pasos\pasoscaq.txt

cambzona timezone = EST-2
itpass -g c -z -o 99 -n 99 -d -e 2 -s Johanesburg > pasoscjo.txt
itpass -g a -n 23 -z -o 60 -s Johanesburg > pasos.txt
paseshtm.exe Johanesbrg SA;jo
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosjo.htm
copy /Y pasoscjo.txt d:\webs\lu7aa.org.ar\pasos\pasoscjo.txt

cambzona timezone = EST-8
itpass -g c -z -o 99 -n 99 -d -e 2 -s HongKong > pasoschk.txt
itpass -g a -n 23 -z -o 60 -s HongKong > pasos.txt
paseshtm.exe Hong Kong Chi;hk
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoshk.htm
copy /Y pasoschk.txt d:\webs\lu7aa.org.ar\pasos\pasoschk.txt

cambzona timezone = EST-7
itpass -g c -z -o 99 -n 99 -d -e 2 -s Jakarta > pasoscja.txt
itpass -g a -n 23 -z -o 60 -s Jakarta > pasos.txt
paseshtm.exe Jakarta Indon;ja
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosja.htm
copy /Y pasoscja.txt d:\webs\lu7aa.org.ar\pasos\pasoscja.txt

cambzona timezone = EST-8
itpass -g c -z -o 99 -n 99 -d -e 2 -s Beijing > pasoscbj.txt
itpass -g a -n 23 -z -o 60 -s Beijing > pasos.txt
paseshtm.exe Beijing China;bj
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosbj.htm
copy /Y pasoscbj.txt d:\webs\lu7aa.org.ar\pasos\pasoscbj.txt

cambzona timezone = EST-9
itpass -g c -z -o 99 -n 99 -d -e 2 -s Seoul > pasoscsl.txt
itpass -g a -n 23 -z -o 60 -s Seoul > pasos.txt
paseshtm.exe Seoul - Corea;sl
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossl.htm
copy /Y pasoscsl.txt d:\webs\lu7aa.org.ar\pasos\pasoscsl.txt

cambzona timezone = EST-9
itpass -g c -z -o 99 -n 99 -d -e 2 -s Tokio > pasosctk.txt
itpass -g a -n 23 -z -o 60 -s Tokio > pasos.txt
paseshtm.exe Tokio - Japan;tk
copy /Y pasos.htm d:\webs\amsat.org.ar\pasostk.htm
copy /Y pasosctk.txt d:\webs\lu7aa.org.ar\pasos\pasosctk.txt

cambzona timezone = EST-8
itpass -g c -z -o 99 -n 99 -d -e 2 -s Manila > pasoscml.txt
itpass -g a -n 23 -z -o 60 -s Manila > pasos.txt
paseshtm.exe Manila, Phill;ml
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosml.htm
copy /Y pasoscml.txt d:\webs\lu7aa.org.ar\pasos\pasoscml.txt

cambzona timezone = EST-8
itpass -g c -z -o 99 -n 99 -d -e 2 -s Perth > pasoscpt.txt
itpass -g a -n 23 -z -o 60 -s Perth > pasos.txt
paseshtm.exe Perth Austral;pt
copy /Y pasos.htm d:\webs\amsat.org.ar\pasospt.htm
copy /Y pasoscpt.txt d:\webs\lu7aa.org.ar\pasos\pasoscpt.txt

cambzona timezone = EST-10EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Melbourne > pasoscmb.txt
itpass -g a -n 23 -z -o 60 -s Melbourne > pasos.txt
paseshtm.exe Melbourne, AU;mb
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosmb.htm
copy /Y pasoscmb.txt d:\webs\lu7aa.org.ar\pasos\pasoscmb.txt

cambzona timezone = EST-10EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Sydney > pasoscsd.txt
itpass -g a -n 23 -z -o 60 -s Sydney > pasos.txt
paseshtm.exe Sydney Austr.;sd
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossd.htm
copy /Y pasoscsd.txt d:\webs\lu7aa.org.ar\pasos\pasoscsd.txt

cambzona timezone = EST-12EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Wellington > pasoscwe.txt
itpass -g a -n 23 -z -o 60 -s Wellington > pasos.txt
paseshtm.exe Wellington NZ;we
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoswe.htm
copy /Y pasoscwe.txt d:\webs\lu7aa.org.ar\pasos\pasoscwe.txt

cambzona timezone = EST-3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Riyadh > pasoscry.txt
itpass -g a -n 23 -z -o 60 -s Riyadh > pasos.txt
paseshtm.exe Riyadh SArab.;ry
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosry.htm
copy /Y pasoscry.txt d:\webs\lu7aa.org.ar\pasos\pasoscry.txt

cambzona timezone = EST4EDT
itpass -g c -z -o 99 -n 99 -d -e 2 -s Santiago > pasoscsg.txt
itpass -g a -n 23 -z -o 60 -s Santiago > pasos.txt
pasoshtm.exe Sgo. de Chile;sg
copy /Y pasos.htm d:\webs\amsat.org.ar\pasossg.htm
copy /Y pasoscsg.txt d:\webs\lu7aa.org.ar\pasos\pasoscsg.txt

cambzona timezone = CXT3
itpass -g c -z -o 99 -n 99 -d -e 2 -s Montevideo > pasoscmv.txt
itpass -g a -n 23 -z -o 60 -s Montevideo > pasos.txt
pasoshtm.exe Montevideo U.;mv
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosmv.htm
copy /Y pasoscmv.txt d:\webs\lu7aa.org.ar\pasos\pasoscmv.txt

cambzona time_offset_seconds = -12600
itpass -g c -z -o 99 -n 99 -d -e 2 -s Teheran > pasoscte.txt
itpass -g a -n 23 -z -o 60 -s Teheran > pasos.txt
paseshtm.exe Teheran Arab.;te
copy /Y pasos.htm d:\webs\amsat.org.ar\pasoste.htm
copy /Y pasoscte.txt d:\webs\lu7aa.org.ar\pasos\pasoscte.txt

cambzona time_offset_seconds = -19800
itpass -g c -z -o 99 -n 99 -d -e 2 -s Delhi > pasoscde.txt
itpass -g a -n 23 -z -o 60 -s Delhi > pasos.txt
paseshtm.exe New Delhi IND;de
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosde.htm
copy /Y pasoscde.txt d:\webs\lu7aa.org.ar\pasos\pasoscde.txt

cambzona time_offset_seconds = -19800
itpass -g c -z -o 99 -n 99 -d -e 2 -s Bombay > pasoscby.txt
itpass -g a -n 23 -z -o 60 -s Bombay > pasos.txt
paseshtm.exe Bombay, India;by
copy /Y pasos.htm d:\webs\amsat.org.ar\pasosby.htm
copy /Y pasoscby.txt d:\webs\lu7aa.org.ar\pasos\pasoscby.txt

copy /Y itbup.qth it.qth

copy /Y itini.bup it.ini

cd c:\it
echo Se bajan Keplerianos desde celestrak
downloader.exe -download http://lu7aa.org.ar/kepsupdate.asp
erase kepsup*.htm
echo Se copia text/pehuen.js de lu7aa.org.ar a directorio it
downloader.exe -download http://lu7aa.org.ar/text/pehuen.js pehuen.js
erase d:\webs\amsat.otg.ar\text\pehuen.js
copy pehuen.js d:\webs\amsat.org.ar\text\pehuen.js
echo Se ponen los keps en nasa.all
erase nasa.all
downloader.exe -download http://lu7aa.org.ar/text/nasa.txt nasa.all
downloader.exe -download http://amsat.org.ar/text/nasa.txt nasa.all
downloader.exe -download http://lu7aa.org.ar/text/keps.txt d:/webs/amsat.org.ar/text/keps.txt
downloader.exe -download http://lu7aa.org.ar/text/keps.txt d:/webs/lu7aa.org.ar/text/keps.txt
WS_FTP95 -q -p lu7aa -s local:D:\webs\lu7aa.org.ar\text\keps.txt -d amsat:/var/www/amsat/amsat.org.ar/text/keps.txt
WS_FTP95 -q -p lu7aa -s local:D:\webs\lu7aa.org.ar\text\keps.txt -d amsat:/var/www/amsat/amsat.org.ar/text/
echo Se actualiza el it.exe con nuevos keplerianos
it.exe /F nasa.all
echo Archivo nasa.all se copia en directorio de la web local
copy /Y nasa.all d:\webs\amsat.org.ar\text\nasa.all
copy /Y d:\webs\lu7aa.org.ar\text\keps.txt d:\webs\amsat.org.ar\text\keps.txt
copy /Y it.qth itbup.qth