   DIM MON$(12)
   ARGUM$ = COMMAND$
   ARGU$=ARGUM$
   FIL$=""
   FOR I=1 TO LEN(ARGU$)
       IF MID$(ARGUM$,I,1)=";" THEN
         ARGU$=LEFT$(ARGUM$,I-1)
         FIL$="&F="+LCASE$(RIGHT$(ARGUM$,LEN(ARGUM$)-I))
       END IF
   NEXT I
   OPEN "PASOS.TXT" FOR INPUT AS #1
   OPEN "PASOS.HTM" FOR OUTPUT AS #3
   M$=LEFT$(DATE$,2)
   IF M$="01" THEN MON$="Jan"
   IF M$="02" THEN MON$="Feb"
   IF M$="03" THEN MON$="Mar"
   IF M$="04" THEN MON$="Apr"
   IF M$="05" THEN MON$="May"
   IF M$="06" THEN MON$="Jun"
   IF M$="07" THEN MON$="Jul"
   IF M$="08" THEN MON$="Aug"
   IF M$="09" THEN MON$="Sep"
   IF M$="10" THEN MON$="Oct"
   IF M$="11" THEN MON$="Nov"
   IF M$="12" THEN MON$="Dec"
   LDT$=MID$(DATE$,4,2)+" "+MON$+" "+LEFT$(TIME$,2)+":"+MID$(TIME$,4,2)+" "
   C=0
   D=0
   W=0
   IF EOF(1) THEN GOTO FINARCH
   LINE INPUT #1,A$
   IF EOF(1) THEN GOTO FINARCH
   LINE INPUT #1,A$
   IF EOF(1) THEN GOTO FINARCH
   LINE INPUT #1,A$
   IF EOF(1) THEN GOTO FINARCH
   LINE INPUT #1,A$
   IF EOF(1) THEN GOTO FINARCH
   LINE INPUT #1,A$
   IF EOF(1) THEN GOTO FINARCH
   LINE INPUT #1,A$
   IF EOF(1) THEN GOTO FINARCH


FINARCH:
   PRINT #3,"<DIV ID=RESU NAME=RESU></DIV>"
   PRINT #3,"<script language=javascript>"
   PRINT #3,"tmr=setInterval("+chr$(34)+"hilite()"+chr$(34)+",60000);"
   PRINT #3,"var pd=new Array();var pdt=new Array();var pdi=0;var montharray=new Array('','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');"
   PRINT #3,"function setred(cual) {if(cual=='ao-071'){cual='ao-71'};document.getElementById(cual).style.background ='#00ff00';}"
   PRINT #3,"function setmag(cual) {if(cual=='ao-071'){cual='ao-71'};document.getElementById(cual).style.background ='#00ffff';}"
   PRINT #3,"function setyel(cual) {if(cual=='ao-071'){cual='ao-71'};document.getElementById(cual).style.background ='#ffff00';}"
   PRINT #3,"function setwht(cual) {if(cual=='ao-071'){cual='ao-71'};document.getElementById(cual).style.background ='#f4f4f4';}"
   PRINT #3,"hilite();"
   PRINT #3,"function rst(){clearInterval(tmr);"
   PRINT #3,"for (k=0;k<="+W$+";k++){setwht("+chr$(34)+"x"+chr$(34)+"+k);"
   PRINT #3,"linea=document.getElementById("+chr$(34)+"x"+chr$(34)+"+k).innerHTML ;"
   PRINT #3,"linea=linea.replace(/&nbsp;/g, "+chr$(34)+" "+chr$(34)+");"
   PRINT #3,"var msat=linea.substr(0,5).replace(/ /g,'').replace(/ /g,'').toLowerCase();if (msat.substr(0,3)=='iss') {msat = 'iss';};msat=msat+'1';"
   PRINT #3,"setwht(msat);}"
   PRINT #3,"hilite();tmr=setInterval("+chr$(34)+"hilite()"+chr$(34)+",60000);}"
   PRINT #3,"var mdi;var mdf;var mdl;"
   PRINT #3,"function hilite() {
   PRINT #3,"mydate=new Date();var mdl=Date.parse(mydate);var k;pdi=0;"
   PRINT #3,"lh=mydate.getHours();if(lh<10){lh='0'+lh};lm=mydate.getMinutes();if(lm<10){lm='0'+lm};"
   PRINT #3,"ldt='Hora en tu PC: '+mydate.getDate()+' '+montharray[mydate.getUTCMonth()+1]+' '+lh+':'+lm;"
   PRINT #3,"document.getElementById("+CHR$(34)+"LT"+CHR$(34)+").innerHTML=ldt;"
   PRINT #3,"lti=lh+"+chr$(34)+":"+chr$(34)+"+lm ;"
   PRINT #3,"document.getElementById("+CHR$(34)+"RESU"+CHR$(34)+").innerHTML="+chr$(34)+"<hr size=3><br><DIV ID=PX NAME=PX><font class=titg> Pasos a las "+chr$(34)+"+lti+"+chr$(34)+"</font><br><br></DIV>"+chr$(34)+";"
   PRINT #3,"document.getElementById("+CHR$(34)+"RESU"+CHR$(34)+").innerHTML=document.getElementById("+CHR$(34)+"RESU"+CHR$(34)+").innerHTML+"+chr$(34)+" <font class=red1> Pass </font>  <font class=mag1> Atenc </font>  " + chr$(34) + ";"
   PRINT #3,"document.getElementById("+CHR$(34)+"RESU"+CHR$(34)+").innerHTML=document.getElementById("+CHR$(34)+"RESU"+CHR$(34)+").innerHTML+"+chr$(34)+" <font class=yel1> Prox </font><br><br>" + L1$+L2$+chr$(34) + ";"
   PRINT #3,"for (k=0;k<="+W$+";k++){"
   PRINT #3,"linea=document.getElementById("+chr$(34)+"x"+chr$(34)+"+k).innerHTML ;"
   PRINT #3,"linea=linea.replace(/&nbsp;/g, "+chr$(34)+" "+chr$(34)+");"
   PRINT #3,"for (t=1;t<13;t++){"
   PRINT #3,"if (montharray[t]==linea.substr(9,3)){m=t;mname=montharray[t];}};var diai;var diaj"
   PRINT #3,"if (linea.substr(6,2)!="+chr$(34)+"  "+chr$(34)+"){diai=linea.substr(6,2);diaj=diai;if (diai.substr(0,1)==' '){diaj=diai.substr(1,1);}}"
   PRINT #3,"mdi=Date.parse(mydate.getFullYear()+"+chr$(34)+" "+chr$(34)+"+montharray[m]+"+chr$(34)+" "+chr$(34)+"+diaj+"+chr$(34)+" "+chr$(34)+"+linea.substr(13,5));"
   PRINT #3,"mdf=Date.parse(mydate.getFullYear()+"+chr$(34)+" "+chr$(34)+"+montharray[m]+"+chr$(34)+" "+chr$(34)+"+diaj+"+chr$(34)+" "+chr$(34)+"+linea.substr(19,5));"
   PRINT #3,"if (linea.substr(19,2)<linea.substr(13,2)){mdf=mdf+86400000};"
   PRINT #3,"var msat=linea.substr(0,5).replace(/ /g,'').replace(/ /g,'').toLowerCase();if (msat.substr(0,3)=='iss') {msat = 'iss';};msat=msat+'1';"
   PRINT #3,"if (msat=='ao-071'){msat='ao-71'};"
   PRINT #3,"if ((mdl > mdf) && ((mdl-mdf) < 180000)) {setwht("+chr$(34)+"x"+chr$(34)+"+k); setwht(msat);}"
   PRINT #3,"if ((mdi-mdl)< 1800000 && (mdi-mdl) > 599000) {setyel("+chr$(34)+"x"+chr$(34)+"+k); setyel(msat);bot(msat,mname,diai,mdi,linea,'yel');}"
   PRINT #3,"if ((mdi-mdl)< 600000 && (mdi-mdl) > 1000) {setmag("+chr$(34)+"x"+chr$(34)+"+k); setmag(msat);bot(msat,mname,diai,mdi,linea,'mag');}"
   PRINT #3,"if ((mdl>=mdi) && (mdl<=mdf)) {setred("+chr$(34)+"x"+chr$(34)+"+k); setred(msat);bot(msat,mname,diai,mdi,linea,'red');}"
   PRINT #3,"}sortpasos();}"
   PRINT #3,"function bot(msat,mname,diai,mdi,linea,color) {"
   PRINT #3,"if (msat=='ao-071'){msat='ao-71'};"
   PRINT #3,"var linmod=linea.substr(0,6)+diai+"+chr$(34)+" "+chr$(34)+"+mname+"+chr$(34)+" "+chr$(34)+"+linea.substr(13,18);"
   PRINT #3,"pdt[pdi]=mdi;pd[pdi]="+chr$(34)+"<A HREF=#PX onclick=ver('"+chr$(34)+"+msat.substr(0,msat.length-1).toLowerCase()+"+chr$(34)+"')><font class="+chr$(34)+"+color+"+chr$(34)+"1>"+chr$(34)+"+linmod+"+chr$(34)+"</a>"+chr$(34)+";"
   PRINT #3,"pdi=pdi+1;"
   PRINT #3,"}"
   PRINT #3,"function sortpasos(){
   PRINT #3,"pdi=pdi-1;for (s=0;s<pdi;s++) {for (t=(s+1);t<=pdi;t++){"
   PRINT #3,"if (pdt[s]>pdt[t]){pdsave=pd[s];pd[s]=pd[t];pd[t]=pdsave;ptsave=pdt[s];pdt[s]=pdt[t];pdt[t]=ptsave;}
   PRINT #3,"}"
   PRINT #3,"}var chg='';"
   PRINT #3,"for (s=0;s<=pdi;s++){"
   PRINT #3,"if (pd[s].substr(pd[s].length-36,6)==chg) {pd[s]=pd[s].substr(0,pd[s].length-37)+"+chr$(34)+"       "+chr$(34)+"+pd[s].substr(pd[s].length-30,20);} else {chg=pd[s].substr(pd[s].length-36,6);}"
   PRINT #3,"document.getElementById("+CHR$(34)+"RESU"+CHR$(34)+").innerHTML=document.getElementById("+CHR$(34)+"RESU"+CHR$(34)+").innerHTML+pd[s];}"
   PRINT #3,"}"
   PRINT #3,"function favorito(){window.external.addFavorite(window.location.href,'Pasos Satelites')};"
   PRINT #3,"</script>"

R1:
   LINE INPUT #1,A$
       IF LCASE$(LEFT$(A$,5))="somet" GOTO R1
   IF LEFT$(A$,3) <> "iss" THEN GOTO R1
   PRINT #3,"<head><META HTTP-EQUIV='EXPIRES' CONTENT='+4 days'><META HTTP-EQUIV='Pragma' CONTENT='no-cache'><META HTTP-EQUIV='Cache-Control' CONTENT='no-cache'>"
   PRINT #3,"<style type='text/css'>.txt {font-family:Courier New,Courier;font-size:12;font-weight:bold;line-height:13px;}"
   PRINT #3,"A:visited {color:#000000}A:link{color:#000000}A:hover{color:#ff0000}A:active{color:#000000}"
   PRINT #3,".yel1 {font-family:Courier New,Courier;font-size:12;font-weight:bold;line-height:13px;background:#ffff00;}"
   PRINT #3,".mag1 {font-family:Courier New,Courier;font-size:12;font-weight:bold;line-height:13px;background:#00ffff;}"
   PRINT #3,".red1 {font-family:Courier New,Courier;font-size:12;font-weight:bold;line-height:13px;background:#00ff00;}"
   PRINT #3,".titg {font-family:Courier New,Courier;font-size:17;font-weight:bold;line-height:17px;color:#ffffff;background:#6789bc;}"
   PRINT #3,".txt {margin-left:3;margin-right:1;margin-top:1;left-margin:3;right-margin:1;border:0;}"
   PRINT #3,".pnk1 {font-family:Courier New,Courier;font-size:12;font-weight:bold;line-height:13px;background:#ffe5c0;}</style>"
   PRINT #3,"<title>Pasos Satelites Amsat Argentina</title>"
   PRINT #3,"<script language=javascript>"
   PRINT #3,"var ayuda='       Asegura que este bien\n       el dia y hora en tu PC\n\n  Estos pasos funcionan aunque\n  no estes conectado a Internet\n\nAMSAT Argentina agradece tu visita y\nte desea buenos contactos satelitales!';"
   PRINT #3,"function mouseDown(e){"
   PRINT #3,"if (parseInt(navigator.appVersion)>3) {var clickType=1;"
   PRINT #3,"if (navigator.appName=='Netscape') clickType=e.which;"
   PRINT #3,"else clickType=event.button;
   PRINT #3,"if (clickType!=1){alert(ayuda);return false;}}return true;}"
   PRINT #3,"if (parseInt(navigator.appVersion)>3){document.onmousedown=mouseDown;"
   PRINT #3,"if (navigator.appName=='Netscape') document.captureEvents(Event.MOUSEDOWN);}"
   PRINT #3,"var pwin;var swin;var owin;function ver(sat){if (pwin != null) {pwin.close();}"
   PRINT #3,"var ira="+chr$(34)+"http://www.amsat.org.ar/sat"+chr$(34)+"+sat+"+chr$(34)+".htm"+chr$(34)+";"
   PRINT #3,"preferences = "+chr$(34)+"toolbar=no,width=440,height=360,center,margintop=0,marginleft=0,marginright=0,top=0,left=300,status=no,scrollbars=yes,resizable=yes,dependent=yes,z-lock=yes"+CHR$(34)+" ;"
   PRINT #3,"pwin = window.open (ira,"+chr$(34)+"pasoswin"+chr$(34)+",preferences) ;"
   PRINT #3,"if (owin != null) {owin.close();}"
   PRINT #3,"preferences = "+chr$(34)+"toolbar=no,width=162,height=162,center,margintop=0,marginleft=0,marginright=0,top=404,left=494,status=no,scrollbars=no,resizable=no,dependent=yes,z-lock=yes"+CHR$(34)+" ;"
   PRINT #3,"owin = window.open ("+chr$(34)+"http://lu7aa.org.ar/sp.asp?l=e"+FIL$+"&s="+chr$(34)+"+sat,"+chr$(34)+"orbwin"+chr$(34)+",preferences) ;"
   PRINT #3,"}</script>"
   PRINT #3,"</head><body BACKGROUND=fondo1.gif onUnload='pwin.close();owin.close();swin.close();self.close();' class=txt "
   if left$(ARGU$,3)="B.A" then PRINT #3," onselectstart='return false' ondragstart='return false'"
   A$ = "><DIV ID=top NAME=top>Pasos satelites amateur por</DIV>"
   PRINT #3,A$
   A$ = ARGU$+" en hora local"+"<br>"
   PRINT #3,A$
   PRINT #3,"<DIV NAME=LT ID=LT>&nbsp;</DIV>"
   PRINT #3," <font class=red1> <u><A HREF=#PX>Pass</A></u> </font>  <font class=mag1> <u><A HREF=#PX>Atenc</A></u> </font>  <font class=yel1> <u><A HREF=#PX>Prox</A></u> </font> <A HREF=# title=' refresh ' onclick='rst()' class=pnk1>@@</A><br><br>"
   L1$="&nbsp;Sat&nbsp;&nbsp;DiaMes  Sale  Cae  El"+"<br>"
   L2$="===== ====== ===== ===== =="+"<br>"
   PRINT #3,"<DIV ID=iss NAME=iss><A HREF=#top class=pnk1>UP</A>"+MID$(L1$,7,3)+RIGHT$(L1$,LEN(L1$)-15)+"</DIV>"
   PRINT #3,L2$
   L1$ = "<A HREF=#top class=pnk1>UP</A>Sat"+RIGHT$(L1$,LEN(L1$)-15)


LECTURA:
   OLDDATE$ = MID$(A$,21,7)
   IF EOF(1) THEN GOTO FINARCH
NR:
   LINE INPUT #1,A$
       IF LCASE$(LEFT$(A$,5))="somet" THEN GOTO NR
NL:
   IF LEN(A$) < 10 THEN
   ELSE
   IF LEFT$(A$,3)="iss" THEN
    B$="iss  "
   ELSE
       IF UCASE$(LEFT$(A$,4))="NOAA" THEN
           B$ = "NA"+MID$(A$,5,3)
       ELSE
           B$=LEFT$(A$,5)
       END IF
   END IF
    B$=B$+" "
    IF OLDDATE$=MID$(A$,21,7) THEN
     IF MID$(A$,21,2) <> "Up" THEN B$=B$+"       "
    ELSE
       IF MID$(A$,21,7)="Up Now!" THEN
         B$=B$+LDT$
         OLDDATE$=LEFT$(LDT$,7)
       ELSE
         B$=B$+MID$(A$,21,7)
         OLDDATE$=MID$(A$,21,7)
       END IF
    END IF
    if MID$(A$,21,2) <> "Up" THEN B$=B$+MID$(A$,31,5)+" "
    if MID$(A$,21,2) = "Up" AND RIGHT$(B$,1) = " " THEN B$ = LEFT$(B$,LEN(B$)-1)
    if RIGHT$(B$,1)=":" THEN B$=LEFT$(B$,LEN(B$)-1)+" "
    B$=B$+MID$(A$,51,5)
    B$=B$+MID$(A$,62,3)+"<br>"
    C$ = ""
    FOR I = 1 TO LEN(B$)
        IF MID$(B$,I,1) = " " THEN
             C$=C$+" "
        ELSE
             C$=C$+MID$(B$,I,1)
        END IF
    NEXT I
    W$=STR$(W):W$=RIGHT$(W$,LEN(W$)-1)
    PRINT #3,"<DIV ID=x"+W$+" NAME=x"+W$+">"+C$+"</DIV>"
    W = W + 1
   END IF
   IF LEN(A$) < 10 THEN
    PRINT #3,"</A><br>"
 R2:
    LINE INPUT #1,A$
       IF LCASE$(LEFT$(A$,5))="somet" THEN GOTO R2
    IF UCASE$(LEFT$(A$,4))="NOAA" THEN G$="NA"+UCASE$(MID$(A$,5,3))+""+MID$(A$,6,100):A$=G$
    PRINT #3,"<DIV ID="+LCASE$(LEFT$(A$,5))+" NAME="+LCASE$(LEFT$(A$,5))+">"+L1$+"</DIV>"
    PRINT #3,L2$
      IF C < 3 THEN
         IF C=0 THEN V$(D)=""
         C=C+1
         SN$=UCASE$(LEFT$(B$,5))
         IF MID$(SN$,4,1)=" " THEN SN$=SN$+" "
         IF LEFT$(SN$,3) = "ISS" THEN
            V$(D)=V$(D)+"<A ID='"+LCASE$(LEFT$(SN$,3))+"1' NAME='"+LCASE$(LEFT$(SN$,3))+"1' onclick=ver('"+LCASE$(LEFT$(SN$,3))+"') HREF=#"+LCASE$(SN$)+">"+SN$+"</A>  "
         ELSE
         IF LEFT$(B$,5) = "AO-07" THEN
                SSS$="ao-7"
         ELSE
                SSS$=LCASE$(LEFT$(B$,5))
         END IF
                IF RIGHT$(SSS$,1)=" " THEN SSS$=LEFT$(SSS$,4)
                IF RIGHT$(SSS$,1)=" " THEN SSS$=LEFT$(SSS$,4)
            V$(D)=V$(D)+"<A ID='"+LCASE$(SSS$)+"1' NAME='"+LCASE$(SSS$)+"1' onclick=ver('"+SSS$+"') HREF=#"+LCASE$(SN$)+">"+SN$+"</A>  "
         END IF
      ELSE
         IF LEFT$(B$,5) = "AO-07" THEN
                SSS$="ao-7"
         ELSE
                SSS$=LCASE$(LEFT$(B$,5))
         END IF
         IF UCASE$(LEFT$(B$,4))="NOAA" THEN SSS$ = "na"+MID$(A$,5,3)
         IF RIGHT$(SSS$,1)=" " THEN SSS$=LEFT$(SSS$,4)
         IF RIGHT$(SSS$,1)=" " THEN SSS$=LEFT$(SSS$,4)
         SSS$=LCASE$(SSS$)
         V$(D)=V$(D)+"<A ID='"+SSS$+"1' NAME='"+SSS$+"1' onclick=ver('"+SSS$+"') HREF=#"+SSS$+">"+UCASE$(LEFT$(B$,5))+"</A>"
         D=D+1:C=0
      END IF
     GOTO NL
   END IF
   GOTO LECTURA


   FOR I = 0 TO D-1
        PRINT #3,V$(I)+"<BR>"
   NEXT I
        IF UCASE$(LEFT$(A$,5))="NOAA" THEN NN$="NA"+MID$(A$,6,2) ELSE NN$=LEFT$(B$,5)
        IF RIGHT$(NN$,1)=" " THEN NN$=LEFT$(NN$,4)
        IF RIGHT$(NN$,1)=" " THEN NN$=LEFT$(NN$,3)
        PRINT #3,V$(D)+"<A ID='"+LCASE$(NN$)+"1' NAME='"+LCASE$(NN$)+"1' onclick=ver('"+LCASE$(NN$)+"') HREF=#"+LCASE$(NN$)+">"+UCASE$(NN$)+"</A><BR><BR>"
   PRINT #3,"KB5MU itpass + LU7ABF wwasp<br>"
   PRINT #3,"&copy; AMSAT Argentina&nbsp;<a href='javascript:favorito()' class=mag1 title='Al salvar podra seguir los pasos sin estar conectado'> SALVE </a></body></html>"
   CLOSE 1,3
   STOP
