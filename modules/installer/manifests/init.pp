class installer{
	$enhancers = [ 'gimp','wget', 'vlc', 'tree' ]
	package{$enhancers:
		ensure => 'installed',
	}
	exec{'steamdownload':
		command => "/usr/bin/wget -q http://media.steampowered.com/client/installer/steam.deb -O /opt/steam",
		creates => "/opt/steam",
        }
	file{'/opt/steam':
		mode => 0755,
		require => Exec ["steamdownload"],
	}
	exec{'teamspeakinstall':
		command => "/usr/bin/wget -q http://dl.4players.de/ts/releases/3.1.6/TeamSpeak3-Client-linux_amd64-3.1.6.run  -O /opt/teamspeak3",
                creates => "/opt/teamspeak3",
	}
	file{'/home//teamspeak3':
		mode => 0755,
		require => Exec ["teamspeakinstall"],
	}
}
