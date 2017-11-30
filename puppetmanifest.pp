
/*Verify is the package installed
dpkg-query -W -f='${Status} ${Version}\n' name_pckg
*/

/*----------------------CREATING THE USER AND THE GROUP---------------*/
group { 'etudiants':
	ensure => 'present',
	gid    => '1002', 	#groupe id
     }
     

user { 'etudiant':
 	ensure	=> 'present',
	gid	=> '1002',
	home	=> '/home/etudiant', 	#home directory
	password	=> '$1$M54HUtGk$plbRbhKZ8Ni4qgmBgxPMY.', #sha-1 for chaprot, generated with command "openssl passwd -1  "
	password_max_age	=> '30',	# The max number of days a password will live
	password_min_age	=> '0',		# The minimum number of days a password must be used before it may be changed.
	shell	=> '/bin/bash',	
	uid	=> '1001', 	#The user ID; must be specified numerically.  We will give for users Id starting from 500
	expiry	=> '2021-09-01'	# The expiry date for this user. YYYY-MM-DD 	3 Ans de licence a aprtie de septembre 2018 
     }

/*------------------------COMMON-----------------------------------*/

# installation of  'sudo','gzip'

/* ALSO NEEDED*/


# !!puppet
# Notepad++
# apache
# SSH

/*
$enhancers= ['sudo', 'gzip', 'emacs', 'vim']
package { $enhancers: 
	ensure => 'installed',
	}
	*/


package {'vim':
	ensure => 'installed',
}

/*------------------------PART FOR PROGRAMMER----------------------*/


# installation of 'git', 'gcc', 'g++'.
# text editor - geany
# memory check- valgrind


$enhancers_prog = ['git', 'gcc', 'g++', 'geany', 'valgrind']
package { $enhancers_prog:
	ensure => 'installed',
	}


/*
package {'git':
	ensure => 'installed',
}*/

     

/*-----------------------PART FOR SYS ADMIN------------------------*/
 #'filezilla' - licensed FTP client and Server.
 # 'netcat' - network utility
 
 /*	NEEDED ALSO*/
 /*
 VMware or VBox
 
 */
 
 
$enhancers_sys = ['wireshark', 'filezilla', 'netcat', ]   
package { $enhancers_sys:
	ensure => 'installed',
	}
	

/*--------------------DELETE INSTALLED PACKAGES-------*/
#it is necessary to comment the previous lines qnd uncomment these


/*
$enhancers_del = ['wireshark', 'filezilla', 'netcat', 'vim', 'gcc', 'g++', 'valgrind' ]   
package { $enhancers_del:
	ensure => 'absent',
	}
	
*/
