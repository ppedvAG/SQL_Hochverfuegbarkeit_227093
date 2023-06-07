---Umgebung...


/*
Netzlaufwerk... muss auf einem anderem Server sein, als einer der Knoten

Wichtig ist:

Vorher Ressourcen festlegen

Netzwerk für Serverkommunikation
Netzwerk für ServerClientKommunikation

Tipp: auch die Netzwerkressource HDD auf das reine Servernetzwerk legen


HDDs.. 

Trenne Daten von Logs pro DB

E:
F:


Z:


Controller

SQLA A SQLB P		SQLA P  SQLB A
Knoten1			Knoten2
16 Kerne	  16 Kerne
256 GB RAM    256 GB RAM



Clustered Shared Volumes

E:  --> C:\CLusterStorage\Volume1 (Verknüpfung



TempDB auch lokal sein

der Pfad muss auch auf beiden Servern identisch angelegt sein...



select * from sysdatabases


SQLCLUST\PPEDV


Hotfixes und CUs 4 Knoten
ABCD

A läuft-->FO -->B aktiv
auf A CUs einspielen



SQL CL --SPIEGELN-->   SQLA  ?


SQL CL --SPIEGELN-->   SQLA  JA
SQL CL --LS-->   SQLA  ..JA

SQLA  --> SQL CL

SQL CLA  --LS-->       SQL CLB
SQL CLA  --Spiegeln--> SQL CLB
B-->C FO, dann CU auf B
C-->D  CU
D-->A  CU

wenn die Mehrheit durch ist.. 

SQL 2016 mit SP1 > SQL 2016

select @@microsoftversion




















*/