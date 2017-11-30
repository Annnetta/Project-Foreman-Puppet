
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


/*------------------------PART FOR PROGRAMMER-------------------------*/

# installation of git, sudo, 'gcc', 'g++', 'gzip'.

$enhancers = ['git', 'sudo', 'gcc', 'g++', 'gzip']
package { $enhancers: ensure => 'installed' }


/*
package {'git':
	ensure => 'installed',
}*/

     


     
     


