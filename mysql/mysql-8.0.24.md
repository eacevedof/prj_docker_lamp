si se incluye:
    echo "skip-grant-tables" >> /etc/mysql/my.cnf lanza error: 
    Can not read response from server. Expected to read 4 bytes, read 0 bytes before connection was unexpectedly lost.
    mipidiendo que cualquier cliente de mysql se conecte

si no se incluye:
    echo "disable-log-bin=1" >> /etc/mysql/my.cnf lanza error:
    ERROR 14 (HY000) at line 187: Can't change size of file (OS errno 2 - No such file or directory) Operation failed with exitcode 1