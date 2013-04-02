 /opt/local/var/macports
 /opt/local/bin

 mate ~/.bash_login

 install macports for mountain lions http://www.macports.org/install.php

sudo port -v selfupdate


To upgrade all outdated ports:
sudo port upgrade outdated

change database name privileges
===============================
cd /opt/local/var/db/mysql5
chown sudo chown -R mysql:mysql test_project/
chmod 777 test_project

# sample 
=========
port search wget
sudo port install wget // very nice cli tool for downloading stuff

wget

check if its running
====================
ps ax | grep mysqld
ps aux | grep -i ssh

commented Listen to work for mysql
#Listen localhost:3306

search uses 3306 
================
netstat -nat | grep 3306
lsof -i TCP:3306


unload mysql server
===================

sudo port unload mysql5-server

installation
=============
url: http://www.dinke.net/blog/en/2011/10/15/installing-apache-and-php-with-macports/

sudo port install apache2

sudo port install php5 +apache2 +mysql5


cd /opt/local/apache2/modules
sudo /opt/local/apache2/bin/apxs -a -e -n “php5″ libphp5.so



edit /opt/local/apache2/conf/httpd.conf


creating a my.cnf with a permission of _mysql and admin 
 cd /opt/local/var/run/mysql5
 sudo -u mysql touch my.cnf


changing permission from _mysql to admin
	cd /opt/local/var/run/
	sudo chown _mysql:admin mysql5


find socket
mysql_config5 --socket


LoadModule php5_module modules/libphp5.so
AddType application/x-httpd-php .php
AddType application/x-httpd-php-source .phps



sudo cp /opt/local/etc/php5/php.ini-development /opt/local/etc/php.ini

sudo /opt/local/apache2/bin/apachectl start




i have fixed setting for php in op/local/bin , i got some error i dont know 


cd /opt/local/bin
sudo ln -s /Applications/MAMP/bin/php5/bin/php


 # php location
	/opt/local/etc/php5/php.ini
# end


NameVirtualHost 127.0.0.1:80
NameVirtualHost 192.168.1.92:80
Include /Applications/MAMP/conf/apache/vhosts/*.conf


User Jonathan
Group #-1


php5-intl installation placing to MAMP server
http://blog.geertvd.be/2011/05/18/installing-the-intl-extension-on-mamp/

sudo port install php5-intl


copy intl.so to php5.3

cp /opt/local/lib/php/extensions/no-debug-non-zts-20090626/intl.so /Applications/MAMP/bin/php5.3/lib/php/extensions/no-debug-non-zts-20090626/



when error appear

(48)Address already in use: make_sock: could not bind to address [::]:80
(48)Address already in use: make_sock: could not bind to address 0.0.0.0:80


	=> sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist


 #Mysql  port location
/opt/local/lib/mysql5/bin/



uncomment all extensions

extension=php_bz2.dll
extension=php_curl.dll
extension=php_fileinfo.dll
extension=php_gd2.dll
extension=php_gettext.dll
extension=php_gmp.dll
extension=php_intl.dll
extension=php_imap.dll
extension=php_interbase.dll
extension=php_ldap.dll
extension=php_mbstring.dll
extension=php_exif.dll      ; Must be after mbstring as it depends on it
extension=php_mysql.dll
extension=php_mysqli.dll
extension=php_oci8.dll      ; Use with Oracle 10gR2 Instant Client
extension=php_oci8_11g.dll  ; Use with Oracle 11gR2 Instant Client
extension=php_openssl.dll
extension=php_pdo_firebird.dll
extension=php_pdo_mssql.dll
extension=php_pdo_mysql.dll
extension=php_pdo_oci.dll
extension=php_pdo_odbc.dll
extension=php_pdo_pgsql.dll
extension=php_pdo_sqlite.dll
extension=php_pgsql.dll
extension=php_pspell.dll
extension=php_shmop.dll








5.0. Install phpMyAdmin:

The port is not updated regularly, and installation is ridiculously easy for phpMyAdmin, so:

Go to phpMyAdmin > Downloads | MySQL Database Administration Tool | www.phpmyadmin.net and download it.

Next, untar the downloaded file. Rename the directory to "phpMyAdmin" and place it in your document root (/Library/WebServer/Documents if you have preserved the old Apache directories).

Create a php file called config.inc.php and place it in the root of the phpMyAdmin folder. This file will overwrite settings defined by phpMyAdmin/libraries/config.default.php. The following is my config.inc.php file. Some of the lines are not completely necessary, but I like readability and consistency:


log mysql error 
sudo tail -n 20 /opt/local/var/db/mysql5/*.err 


find *.cnf from mysql
port contents mysql5 | grep cnf


Code:

<?php
$cfg['blowfish_secret'] = '[A passphrase for internal use]';

$i = 0;
$i++;

$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['connect_type']  = 'tcp';
$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['user'] = '';
$cfg['Servers'][$i]['password'] = '';
?>
That's it! You should now be able to access it at http://your-server/phpMyAdmin. You can log in as root, add more users, create databases, etc. 

---


What is MacPorts?



MacPorts provides an infrastructure for building, installing, and packaging open source software. It is designed to match the functionality of the FreeBSD Ports system and to be extensible for future enhancements.


System Requirements:

This disk image contains a Universal installer for Mac OS X 10.8.x and requires valid Tcl, cURL and OpenSSL installations to function - all present by default on Mac OS X. Also required is the installation of Apple's Xcode programing suite, available as a separate installation from your OS X CDs or DVD, or preferably the latest version from Apple's Developer site: http://developer.apple.com/tools/xcode/index.html.


Install Location:

The MacPorts installer copies MacPorts to the target directory /opt/local. If you wish to install to any path other than that, you must install MacPorts via its source code. See Installing MacPorts on the MacPorts webpage for instructions on installation alternatives.


What is Installed:

Aside from a few MacPorts executable commands in /opt/local/bin, most MacPorts files are installed in /opt/local/var/macports. Within these directories you will find a "sources" directory containing the Portfiles that hold the necessary instructions to install individual ports, and also the source code for MacPorts itself. Both are kept up to date by using the port selfupdate command as shown below. Please read the port(1) man page for more information.


Shell Environment:

A file named ~/.profile is created for the "bash" shell (default on Mac OS X 10.3 and newer) during the MacPorts installation. It contains the necessary statements to append MacPorts' binary paths within /opt/local/ to your shell environment, so MacPorts is available to you on subsequent terminal sessions. You may have to quit and restart your terminal application for this change to take effect.


Basic Usage:

The main user interface to MacPorts is the port command and the various facilities it provides for installing ports. The first thing you should do after you install MacPorts is to make sure it is fully up to date by pulling the latest revisions to the Portfiles and any updated MacPorts base code from our rsync server, all accomplished simply by running the port selfupdate command as the Unix superuser:

	sudo port selfupdate 

Running this command on a regular basis is recommended -- it ensures your MacPorts installation is always up to date. Afterwards, you may search for ports to install:

	port search <portname>

where <portname> is the name of the port you are searching for, or a partial name. To install a port you've chosen, you need to run the port install command as the Unix superuser:

	sudo port install <portname> 

where now <portname> maps to an exact port name in the ports tree, such as those returned by the port search command. Please consult the port(1) man page for complete documentation for this command and the software installation process.


Documentation:

The MacPorts Wiki is available at: https://trac.macports.org and should be consulted for further documentation and support. Also provided are man pages for port, macports.conf, portfile, portgroup, portstyle, and porthier. These can be invoked by typing: "man" followed by the name of the command or file (e.g. "man port" or "man macports.conf").


Creating New Ports:

If you are interested in developing your own ports for private usage, or would like to submit your ports for inclusion within the MacPorts software repository, please consult the documentation provided on our website. The MacPorts project depends on a community of active participants and we are always open to welcoming new volunteers and their contributions!

Thank you for your interest in MacPorts!
