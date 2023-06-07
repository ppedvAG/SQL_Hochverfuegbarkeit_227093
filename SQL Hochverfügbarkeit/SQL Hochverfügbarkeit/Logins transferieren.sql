
--AUF S1


---Logintransfer.sql
sqlcmd -i 

!!sqlcmd -Q"exec sp_help_revlogin" -dmaster -oc:\logins2.sql -Usa -Pppedv2019!

--AUF S2
!!sqlcmd -SSQLvPC\DEV -dmaster -ic:\logins2.sql -Usa -Pppedv2019!