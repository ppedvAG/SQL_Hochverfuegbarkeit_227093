/*

Was ist "Recoverymodel"

Regelt, wieviel im Log tats protkolliert wird und ob TX 
aus dem Log automat entfernt werden

Keine HADR L�sung kann mit "Einfach" arbeiten

Aber jede mit "VOLLST�NDIG"


VOLL BACKUP
sichert auch Dateinamen, Pfade, User..und restored dies auch 

SystemDB 
Eintr�ge in SystemDBs werden bei fast allen HADR L�sungen nicht mitgesynct


Servicekonten
SQL arbeit lokal immer mit NT Servicekonten

Remotezurgiffe ausserhalb SQL Services mit Computerkonto oder Dienstdom�nenkonto


