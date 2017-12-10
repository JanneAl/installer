class steamcmd (
  $ensure = 'present', # Making sure steamcmd is installed, if not it will be installed.
  $app_id = '570', # app id of the game you want to install 570 is Dota2.
  $steamcmd_path = 'C:/programdata/chocolatey/bin/', # Where steamcmd games goes.
  $install_dir = "C:/Program Files (x86)/Steam/steamapps/common/${title}", # Installed games.
  $username = undef, # Steam user name here.
  $password = undef, # Steam user password here.
  $anonymous_login = false, # keep false to use your account.
) { 'Dota2': # Title.

# Determine login method.
  if $anonymous_login == true { 
    $login = 'anonymous'
  } else {
    if ($username == undef) or ($password == undef) {
      fail("When disabling anonymous login, username and password must be specified")
    } else {
      $login = "$username $password"
    }
  }

  if $ensure == 'present' { #normally on. Installs app specified in $app_id = ''.
    exec { "Installing ${title} via SteamCMD":
      command => "steamcmd.exe +login ${login} +force_install_dir \"${install_dir}\" +app_update ${app_id} +quit",
      unless  => "cmd.exe /c if /I not exist \"${install_dir}/steamapps/temp\" exit 1",
      path    => [$steamcmd_path, 'C:/Windows/System32'],
      timeout => 0,
    }
  } elsif $ensure == 'absent' { #IF you want to delete app.
    exec { "Removing ${title} via SteamCMD":
      command => "steamcmd.exe +login ${login} +app_uninstall ${app_id} +quit",
      unless  => "cmd.exe /c if /I exist \"${install_dir}\" exit 1",
      path    => [$steamcmd_path, 'C:/Windows/System32'],
    }
  }
}
