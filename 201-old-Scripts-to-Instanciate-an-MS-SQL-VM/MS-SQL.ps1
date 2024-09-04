




sshpass -p "nJ0:DHze7@}kf=V" ssh ed_fraser@34.39.19.192 -Yes

<#
sqlcmd Allows 


#>


#Check if user login name 'sa' is enabled. If is_disable equals '1' it is disabled
sqlcmd -S localhost -E -Q "SELECT name, is_disabled FROM sys.sql_logins WHERE name = 'sa'"

# Enable 'sa' user name with the script below
sqlcmd -S localhost -E -Q "ALTER LOGIN sa ENABLE"

# Now 'sa' : 'is_disable' shouid  equal '0' it is disabled. Use this script again to check
sqlcmd -S localhost -E -Q "SELECT name, is_disabled FROM sys.sql_logins WHERE name = 'sa'"


sqlcmd -S localhost -E -Q "ALTER LOGIN sa WITH PASSWORD = 'mZ6=hnPh'"



sshpass -p "nJ0:DHze7@}kf=V" ssh ed_fraser@34.39.19.192 -y


sqlcmd -S localhost -E







sqlcmd -S localhost -E -Q "DECLARE @LoginMode INT; EXEC xp_instance_regread N'HKEY_LOCAL_MACHINE',N'Software\Microsoft\MSSQLServer\MSSQLServer',N'LoginMode', @LoginMode OUTPUT;SELECT CASE @LoginMode WHEN 1 THEN 'Windows Authentication' WHEN 2 THEN 'SQL Server and Windows Authentication' ELSE 'Unknown' END AS 'Authentication Mode';"



#Lastly you may need to eable SQL cert 
sqlcmd -S localhost -E -Q "EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE',N'Software\Microsoft\MSSQLServer\MSSQLServer',N'LoginMode', REG_DWORD, 1;"



