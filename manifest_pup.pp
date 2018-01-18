/*
dpkg-query -W -f='${Status} ${Version}\n' name_pckg

*/


/*----------------------CREATING THE USER AND THE GROUP------------*/
/*-----------------------------------------------------------------*/
	
class forall{
	group { 'etudiants':
	ensure => 'present',
	gid => '1002', #groupe id
	}
	
	
	user { 'etudiant':
	ensure => 'present',
	gid => '1002',
	home => '/home/etudiant', #home directory
	password => '$1$M54HUtGk$plbRbhKZ8Ni4qgmBgxPMY.', #sha-1 for chaprot, generated with command "openssl passwd -1 "
	password_max_age => '30', # The max number of days a password will live
	password_min_age => '0', # The minimum number of days a password must be used before it may be changed.
	shell => '/bin/bash',
	uid => '1001', #The user ID; must be specified numerically. We will give for users Id starting from 500
	expiry => '2021-09-01' # The expiry date for this user. YYYY-MM-DD 3 Ans de licence a aprtie de septembre 2018
	}
	
	/*------------------------COMMON-----------------------------------*/
	/*-----------------------------------------------------------------*/
	
	# installation of 'sudo','gzip','emacs', 'vim'
	
	$enhancers= ['sudo', 'gzip', 'emacs', 'vim']
	package { $enhancers:
		ensure => 'installed',
	}
}	
	
	
	/*------------------------PART FOR PROGRAMMER----------------------*/
	/*-----------------------------------------------------------------*/
	
class programmer{
	# installation of 'git', 'gcc', 'g++'.
	# text editor - geany
	# memory check- valgrind
	# Netbeans for Java
	
	
	$enhancers_prog = ['git', 'gcc', 'g++', 'geany', 'valgrind']
	package { $enhancers_prog:
		ensure => 'installed',
	}

	
	
}	

class netbeans_installation{
	#NetBeans for Java
	# wget http://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-javase-linux.sh

	#mod 'leonardothibes-wget', '1.0.4'


	exec{"wgNB":
		command => '/bin/bash -c "wget http://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-javase-linux.sh"',
	}


	exec { "chmd":
		command => '/bin/bash -c "chmod 777 ~/netbeans-8.2-javase-linux.sh"',
		require => Exec["wgNB"],
		timeout =>1800,
	}

	exec {"executable":
		command => '/bin/bash -c "./netbeans-8.2-javase-linux.sh --silent"',
		require => Exec["chmd"],
		timeout => 1800,
	}

}

	/*-----------------------PART FOR SYS ADMIN------------------------*/
	/*-----------------------------------------------------------------*/
class sysadmin{
	#'filezilla' - licensed FTP client and Server.
	# 'netcat' - network utility
	
	
	$enhancers_sys = ['wireshark', 'filezilla', 'netcat', ]
	package { $enhancers_sys:
		ensure => 'installed',
	}
	
}	
	/*--------------------DELETE INSTALLED PACKAGES-------*/
	#it is necessary to comment the previous lines qnd uncomment these
	
	
class delete_installed{	
	$enhancers_del = ['wireshark', 'filezilla', 'netcat', 'vim', 'gcc', 'g++', 'valgrind' ]
	package { $enhancers_del:
		ensure => 'absent',
	}
	
}
