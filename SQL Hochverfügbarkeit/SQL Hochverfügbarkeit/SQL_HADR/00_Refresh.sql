/*

Was ist "Recoverymodel"

Regelt, wieviel im Log tats protkolliert wird und ob TX 
aus dem Log automat entfernt werden

Keine HADR Lösung kann mit "Einfach" arbeiten

Aber jede mit "VOLLSTÄNDIG"


VOLL BACKUP
sichert auch Dateinamen, Pfade, User..und restored dies auch 

SystemDB 
Einträge in SystemDBs werden bei fast allen HADR Lösungen nicht mitgesynct


Servicekonten
SQL arbeit lokal immer mit NT Servicekonten

Remotezurgiffe ausserhalb SQL Services mit Computerkonto oder Dienstdomönenkonto


