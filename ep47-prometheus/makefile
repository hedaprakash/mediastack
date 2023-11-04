mkdir C:\mediast\updatestack\mountpoints\prom
mkdir C:\mediast\updatestack\mountpoints\grafana
mkdir C:\mediast\updatestack\mountpoints\sqlserver

cd C:\mediast\updatestack\ep47-prometheus
docker network create mynetwork

10.10.50.161
sa
Password1Test#

setup grafana sql connection:
10.10.50.161:1433
sa
Password1Test#

setup grafana prometheus connection:
10.10.50.161:9090

setup grafana postgresql connection:
10.10.50.161:5432
postgres
postgres
mysecretpassword


docker-compose up
docker-compose up -d
# The -d flag is for running your containers in detached mode, which means they'll run in the background.
docker-compose up -d --build
# rebuild the images 
# docker-compose down

docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"

# Use Get-Acl in PowerShell to check permissions
Get-Acl C:\mediast\updatestack\mountpoints\sqlserver | Format-List
# This gives full control to everyone for the directory - use with caution
icacls "C:\mediast\updatestack\mountpoints\sqlserver" /grant "Everyone:(F)" /t

docker logs postgres

docker logs sql1

docker exec -t sql1 cat /var/opt/mssql/log/errorlog | grep connection

docker exec -t sql1 ls /var/opt/mssql   
docker exec -t sql1 ls /var/opt/mssql/log   
docker exec -t sql1 cat /var/opt/mssql/log/core.sqlservr.11_04_2023_19_22_04.9.txt

docker exec -it sql1 "bash"

/opt/mssql-tools/bin/sqlcmd -S localhost  -W -h-1 -U SA -P "Password1Test#"  -Q "SELECT @@SERVERNAME as Host,
    SERVERPROPERTY('ComputerNamePhysicalNetBIOS') as ComputerNamePhysicalNetBIOS,
    SERVERPROPERTY('MachineName') as MachineName,
    SERVERPROPERTY('ServerName') as ServerName;
"

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password1Test#"  -Q "create database testdb"

# execute on SSMS
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password1Test#"  -Q "
CREATE TABLE DEPARTMENT
(
   DEPTCODE   INT,
   DeptName   varCHAR(30),
   LOCATION   VARCHAR(33)
)"

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password1Test#"  -Q "
CREATE TABLE EMPLOYEE
(
   EmpCode      INT,
   EmpFName     VARCHAR(15),
   EmpLName     VARCHAR(15),
   Job          VARCHAR(45),
   Manager      CHAR(4),
   HireDate     DATE,
   Salary       INT,
   Commission   INT,
   DEPTCODE     INT
);

INSERT INTO DEPARTMENT VALUES (10, 'FINANCE', 'EDINBURGH'),
                              (20,'SOFTWARE','PADDINGTON'),
                              (30, 'SALES', 'MAIDSTONE'),
                              (40,'MARKETING', 'DARLINGTON'),
                              (50,'ADMIN', 'BIRMINGHAM');

INSERT INTO EMPLOYEE  
VALUES (9369, 'TONY', 'STARK', 'SOFTWARE ENGINEER', 7902, '1980-12-17', 2800,0,20),
       (9499, 'TIM', 'ADOLF', 'SALESMAN', 7698, '1981-02-20', 1600, 300,30),    
       (9566, 'KIM', 'JARVIS', 'MANAGER', 7839, '1981-04-02', 3570,0,20),
       (9654, 'SAM', 'MILES', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
       (9782, 'KEVIN', 'HILL', 'MANAGER', 7839, '1981-06-09', 2940,0,10),
       (9788, 'CONNIE', 'SMITH', 'ANALYST', 7566, '1982-12-09', 3000,0,20),
       (9839, 'ALFRED', 'KINSLEY', 'PRESIDENT', 7566, '1981-11-17', 5000,0, 10),
       (9844, 'PAUL', 'TIMOTHY', 'SALESMAN', 7698, '1981-09-08', 1500,0,30),
       (9876, 'JOHN', 'ASGHAR', 'SOFTWARE ENGINEER', 7788, '1983-01-12',3100,0,20),
       (9900, 'ROSE', 'SUMMERS', 'TECHNICAL LEAD', 7698, '1981-12-03', 2950,0, 20),
       (9902, 'ANDREW', 'FAULKNER', 'ANAYLYST', 7566, '1981-12-03', 3000,0, 10),
       (9934, 'KAREN', 'MATTHEWS', 'SOFTWARE ENGINEER', 7782, '1982-01-23', 3300,0,20),
       (9591, 'WENDY', 'SHAWN', 'SALESMAN', 7698, '1981-02-22', 500,0,30),
       (9698, 'BELLA', 'SWAN', 'MANAGER', 7839, '1981-05-01', 3420, 0,30),
       (9777, 'MADII', 'HIMBURY', 'ANALYST', 7839, '1981-05-01', 2000, 200, NULL),
       (9860, 'ATHENA', 'WILSON', 'ANALYST', 7839, '1992-06-21', 7000, 100, 50),
       (9861, 'JENNIFER', 'HUETTE', 'ANALYST', 7839, '1996-07-01', 5000, 100, 50);

"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password1Test#"  -Q "
SELECT E.EMPFNAME, E.EMPLNAME, E.DEPTCODE,
       D.DEPTNAME, D.LOCATION
       FROM EMPLOYEE E, DEPARTMENT D
       WHERE E.DEPTCODE = D.DEPTCODE
       ORDER BY E.EMPFNAME, D.LOCATION;
"

exit




docker exec -it postgres "bash"
su postgres
psql 
\l
\c postgres
CREATE TABLE tbl1(	
	col1 char(20) NOT NULL,
	col2 int NOT NULL
);

insert into tbl1 values('value1',1);
insert into tbl1 values('value2',4);
insert into tbl1 values('value4',3);

select * from tbl1;

\q

exit 
exit 

