class teamspeak3 (
  $version            = '3.0.10.3',
  $basedir            = '/opt',
  $user               = 'tspeak3',
  $default_voice_port = 9987,
  $voice_ip           = '0.0.0.0',
  $filetransfer_port  = 30033,
  $filetransfer_ip    = '0.0.0.0',
  $query_port         = 10011,
  $query_ip           = '0.0.0.0',
  $logpath            = 'logs',
  $dbtype             = $teamspeak3::params::dbtype,
  $dbplugin           = $teamspeak3::params::dbplugin,
  $dbpluginparameter  = $teamspeak3::params::dbpluginparameter,
  $dbsqlpath          = 'sql/',
  $dbsqlcreatepath    = $teamspeak3::params::dbsqlcreatepath,
  $licensepath        = undef,
  $inifile            = 'ts3server.ini',
  $whitelist          = ['127.0.0.1'],
  $blacklist          = [],
  $dbclientkeepdays   = 90,
  $dblogkeepdays      = 90,
  $dbconnections      = 10,
  $dbparams           = {},
) inherits teamspeak3::params {

  # validate parameters here

  class { 'teamspeak3::install': } ->
  class { 'teamspeak3::config': } ~>
  class { 'teamspeak3::service': } ->
  Class['teamspeak3']
}
