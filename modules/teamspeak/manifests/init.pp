class teamspeak {
  version      => '3.0.11.3',
  arch         => 'x86',
  user         => 'teamspeak',
  group        => 'teamspeak',
  init         => 'init',
  home         => '/opt/teamspeak',
  service      => 'teamspeak'
}
